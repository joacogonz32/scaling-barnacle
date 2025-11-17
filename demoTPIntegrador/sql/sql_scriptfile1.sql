-- -
-- TRIGGERS (A)
DELIMITER $$
DROP TRIGGER IF EXISTS tr_valoraciones_after_insert$$
CREATE TRIGGER tr_valoraciones_after_insert
	AFTER INSERT ON valoraciones
	FOR EACH ROW
	BEGIN
		UPDATE obras
		SET nivel_popularidad = COALESCE((SELECT AVG(puntaje) FROM valoraciones WHERE id_obra = NEW.id_obra), 0)
		WHERE id_obra = NEW.id_obra;
END$$
DROP TRIGGER IF EXISTS tr_valoraciones_after_update$$
CREATE TRIGGER tr_valoraciones_after_update
	AFTER UPDATE ON valoraciones
	FOR EACH ROW
	BEGIN
		UPDATE obras
		SET nivel_popularidad = COALESCE((SELECT AVG(puntaje) FROM valoraciones WHERE id_obra = NEW.id_obra), 0)
		WHERE id_obra = NEW.id_obra;
END$$
DROP TRIGGER IF EXISTS tr_valoraciones_after_delete$$
CREATE TRIGGER tr_valoraciones_after_delete
	AFTER DELETE ON valoraciones
	FOR EACH ROW
	BEGIN
		UPDATE obras
		SET nivel_popularidad = COALESCE((SELECT AVG(puntaje) FROM valoraciones WHERE id_obra = OLD.id_obra), 0)
		WHERE id_obra = OLD.id_obra;
END$$

-- TRIGGERS (B)
DROP TRIGGER IF EXISTS tr_tickets_before_insert$$
CREATE TRIGGER tr_tickets_before_insert
	BEFORE INSERT ON tickets
	FOR EACH ROW
	BEGIN
		DECLARE capacidad_evento INT;
		DECLARE total_reservado INT;

	IF NEW.id_evento IS NOT NULL THEN
		SELECT capacidad INTO capacidad_evento FROM eventos WHERE id_evento = NEW.id_evento FOR UPDATE;
		IF capacidad_evento IS NULL THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Evento no encontrado para la reserva.';
		END IF;
		IF NOT (NEW.fecha_reserva BETWEEN (SELECT DATE(fecha_inicio) FROM eventos WHERE id_evento = NEW.id_evento) AND (SELECT DATE(fecha_fin) FROM eventos WHERE id_evento = NEW.id_evento)) THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Fecha de reserva fuera del rango del evento.';
		END IF;
		SELECT COALESCE(SUM(cantidad_personas),0) INTO total_reservado
		FROM tickets
		WHERE id_evento = NEW.id_evento AND fecha_reserva = NEW.fecha_reserva AND estado = 'activa';
		IF (total_reservado + COALESCE(NEW.cantidad_personas,1)) > capacidad_evento THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay disponibilidad para la fecha seleccionada.';
		END IF;
	END IF;
END$$

DROP TRIGGER IF EXISTS tr_tickets_before_update$$
CREATE TRIGGER tr_tickets_before_update
	BEFORE UPDATE ON tickets
	FOR EACH ROW
	BEGIN
	DECLARE capacidad_evento INT;
	DECLARE total_reservado INT;
    
	IF NEW.id_evento IS NOT NULL AND NEW.estado = 'activa' THEN
		SELECT capacidad INTO capacidad_evento FROM eventos WHERE id_evento = NEW.id_evento FOR UPDATE;
		IF capacidad_evento IS NULL THEN
		SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Evento no encontrado para la reserva (update).';
		END IF;
		SELECT COALESCE(SUM(cantidad_personas),0) INTO total_reservado
		FROM tickets
		WHERE id_evento = NEW.id_evento AND fecha_reserva = NEW.fecha_reserva AND estado = 'activa' AND id_ticket <> OLD.id_ticket;
		IF (total_reservado + COALESCE(NEW.cantidad_personas,1)) > capacidad_evento THEN
			SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'No hay disponibilidad para la fecha seleccionada (update).';
		END IF;
	END IF;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- PROCEDIMIENTOS (A)
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_top10_obras_por_rango;
CREATE PROCEDURE sp_top10_obras_por_rango(IN p_fecha_inicio DATE, IN p_fecha_fin DATE)
BEGIN
	SELECT o.id_obra, o.nombre, ROUND(AVG(v.puntaje),2) AS promedio_puntaje, COUNT(*) AS cantidad_valoraciones
	FROM obras o
	JOIN valoraciones v ON v.id_obra = o.id_obra
	WHERE v.fecha BETWEEN p_fecha_inicio AND p_fecha_fin
	GROUP BY o.id_obra, o.nombre
	HAVING COUNT(*) > 0
	ORDER BY promedio_puntaje DESC, cantidad_valoraciones DESC
	LIMIT 10;
END$$
DELIMITER ;

-- PROCEDIMIENTOS (B)
DELIMITER $$
DROP PROCEDURE IF EXISTS sp_promedio_valoraciones_por_membresia;
CREATE PROCEDURE sp_promedio_valoraciones_por_membresia(IN p_fecha_inicio DATE, IN p_fecha_fin DATE)
BEGIN
	SELECT m.tipo AS tipo_membresia,
	DATE_FORMAT(v.fecha, '%Y-%m') AS periodo,
	ROUND(AVG(v.puntaje),2) AS promedio_puntaje,
	COUNT(*) AS cantidad_valoraciones
	FROM valoraciones v
	JOIN usuarios u ON v.id_usuario = u.id_usuario
	LEFT JOIN membresias m ON u.id_membresia = m.id_membresia
	WHERE v.fecha BETWEEN p_fecha_inicio AND p_fecha_fin
	GROUP BY m.tipo, DATE_FORMAT(v.fecha, '%Y-%m')
	ORDER BY m.tipo, periodo;
END$$
DELIMITER ;

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------
-- EVENTS (A)
DELIMITER $$
DROP EVENT IF EXISTS ev_invalidate_tickets$$
CREATE EVENT ev_invalidate_tickets
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP
ON COMPLETION PRESERVE
DO
BEGIN
	UPDATE tickets
	SET estado = 'vencido'
	WHERE fecha_reserva < CURDATE() AND estado = 'activa' AND usado = 0;
END$$
DELIMITER ;

DELIMITER $$
DROP EVENT IF EXISTS ev_daily_reservation_reminders$$
CREATE EVENT ev_daily_reservation_reminders
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP + INTERVAL 1 HOUR
ON COMPLETION PRESERVE
DO
BEGIN
	INSERT INTO notificaciones (id_usuario, mensaje, fecha_creacion)
	SELECT t.id_usuario,
	CONCAT('Recordatorio: tiene una reserva para hoy (', DATE_FORMAT(t.fecha_reserva,'%Y-%m-%d'), ')',
	CASE WHEN t.id_evento IS NOT NULL THEN CONCAT(' -- Evento ID: ', t.id_evento) ELSE '' END)
    AS mensaje,
	NOW()
	FROM tickets t
	WHERE t.fecha_reserva = CURDATE() AND t.estado = 'activa';
END$$
DELIMITER ;