
-- A. TRIGGERS: ACTUALIZAR POPULARIDAD 

DROP TRIGGER IF EXISTS tr_valoraciones_after_insert$$
CREATE TRIGGER tr_valoraciones_after_insert
AFTER INSERT ON valoraciones
FOR EACH ROW
BEGIN
  UPDATE obras
    SET nivel_popularidad = (
      SELECT IFNULL(AVG(puntaje),0)
      FROM valoraciones
      WHERE id_obra = NEW.id_obra
    )
  WHERE id_obra = NEW.id_obra;
END$$

DROP TRIGGER IF EXISTS tr_valoraciones_after_update$$
CREATE TRIGGER tr_valoraciones_after_update
AFTER UPDATE ON valoraciones
FOR EACH ROW
BEGIN
  IF OLD.id_obra IS NOT NULL THEN
    UPDATE obras
      SET nivel_popularidad = (
        SELECT IFNULL(AVG(puntaje),0)
        FROM valoraciones
        WHERE id_obra = OLD.id_obra
      )
    WHERE id_obra = OLD.id_obra;
  END IF;
  
  IF NEW.id_obra IS NOT NULL THEN
    UPDATE obras
      SET nivel_popularidad = (
        SELECT IFNULL(AVG(puntaje),0)
        FROM valoraciones
        WHERE id_obra = NEW.id_obra
      )
    WHERE id_obra = NEW.id_obra;
  END IF;
END$$

DROP TRIGGER IF EXISTS tr_valoraciones_after_delete$$
CREATE TRIGGER tr_valoraciones_after_delete
AFTER DELETE ON valoraciones
FOR EACH ROW
BEGIN
  UPDATE obras
    SET nivel_popularidad = (
      SELECT IFNULL(AVG(puntaje),0)
      FROM valoraciones
      WHERE id_obra = OLD.id_obra
    )
  WHERE id_obra = OLD.id_obra;
END$$


-- B. TRIGGER: DISPONIBILIDAD 

DROP TRIGGER IF EXISTS tr_tickets_before_insert$$
CREATE TRIGGER tr_tickets_before_insert
BEFORE INSERT ON tickets
FOR EACH ROW
BEGIN
  DECLARE v_capacidad INT DEFAULT 0;
  DECLARE v_actual INT DEFAULT 0;
  DECLARE v_msg VARCHAR(255);

  SELECT capacidad INTO v_capacidad 
  FROM informacion_museo 
  WHERE id_info = NEW.id_info;

  IF v_capacidad IS NULL THEN
     SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = 'Error: Información del museo no encontrada.';
  END IF;
  
  SELECT IFNULL(SUM(cantidad_personas),0) INTO v_actual
    FROM tickets
    WHERE id_info = NEW.id_info
      AND fecha_reserva = NEW.fecha_reserva
      AND hora_reserva = NEW.hora_reserva
      AND estado = 'activa';

  IF (v_actual + NEW.cantidad_personas) > v_capacidad THEN
    SET v_msg = CONCAT('Capacidad insuficiente. Total: ', v_capacidad, '. Ocupado: ', v_actual);
    SIGNAL SQLSTATE '45000' SET MESSAGE_TEXT = v_msg;
  END IF;
END$$

-- C. PROCEDIMIENTO: TOP 10 OBRAS

DROP PROCEDURE IF EXISTS sp_top10_obras_por_rango$$
CREATE PROCEDURE sp_top10_obras_por_rango(
  IN p_fecha_inicio DATE,
  IN p_fecha_fin DATE
)
BEGIN
  SELECT o.id_obra, o.nombre,
         ROUND(AVG(v.puntaje),2) AS puntaje_promedio,
         COUNT(v.id_valoracion) AS cantidad_valoraciones
  FROM obras o
  JOIN valoraciones v ON v.id_obra = o.id_obra
  WHERE v.fecha BETWEEN p_fecha_inicio AND p_fecha_fin
  GROUP BY o.id_obra, o.nombre
  HAVING COUNT(v.id_valoracion) > 0
  ORDER BY puntaje_promedio DESC
  LIMIT 10;
END$$

-- D. PROCEDIMIENTO: PROMEDIO POR MEMBRESIA

DROP PROCEDURE IF EXISTS sp_promedio_valoraciones_por_membresia$$
CREATE PROCEDURE sp_promedio_valoraciones_por_membresia()
BEGIN
  SELECT m.tipo AS tipo_membresia,
         ROUND(AVG(v.puntaje),2) AS promedio_puntaje,
         COUNT(v.id_valoracion) AS cantidad_valoraciones
  FROM valoraciones v
  JOIN usuarios u ON u.id_usuario = v.id_usuario
  JOIN membresias m ON m.id_membresia = u.id_membresia
  GROUP BY m.tipo
  ORDER BY promedio_puntaje DESC;
END$$

-- E. EVENTO: INVALIDAR TICKETS

SET GLOBAL event_scheduler = ON$$

DROP EVENT IF EXISTS ev_invalida_tickets_vencidos_midnight$$
CREATE EVENT ev_invalida_tickets_vencidos_midnight
ON SCHEDULE EVERY 1 DAY
STARTS (CURRENT_DATE + INTERVAL 1 DAY) 
DO
BEGIN
 
  UPDATE tickets
    SET estado = 'cancelada'
    WHERE fecha_reserva < CURRENT_DATE()
      AND estado = 'activa';
END$$

-- F. EVENTO: RECORDATORIOS 

DROP EVENT IF EXISTS ev_insertar_recordatorios_6am$$
CREATE EVENT ev_insertar_recordatorios_6am
ON SCHEDULE EVERY 1 DAY
STARTS (CURRENT_DATE + INTERVAL 1 DAY + INTERVAL 6 HOUR) 
DO
BEGIN
  INSERT INTO notificaciones (id_usuario, mensaje, fecha_creacion)
  SELECT 
         t.id_usuario,
         CONCAT('Recordatorio: Tenés una reserva hoy (', DATE_FORMAT(t.fecha_reserva, '%Y-%m-%d'), 
                ') a las ', DATE_FORMAT(t.hora_reserva, '%H:%i'), 
                '. Cantidad personas: ', t.cantidad_personas),
         NOW()
  FROM tickets t
  WHERE t.fecha_reserva = CURRENT_DATE()
    AND t.estado = 'activa'
    AND NOT EXISTS (
      SELECT 1 FROM notificaciones n
      WHERE n.id_usuario = t.id_usuario
        AND DATE(n.fecha_creacion) = CURRENT_DATE()
        AND n.mensaje LIKE 'Recordatorio: Tenés una reserva hoy%'
    );
END$$

DELIMITER ;
