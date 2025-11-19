-- MySQL dump 10.13  Distrib 8.0.43, for Linux (x86_64)
--
-- Host: 127.0.0.1    Database: PoliMet
-- ------------------------------------------------------
-- Server version	8.0.43-0ubuntu0.24.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `artistas`
--

DROP TABLE IF EXISTS `artistas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `artistas` (
  `id_artista` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `pais` varchar(100) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_artista`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `artistas`
--

LOCK TABLES `artistas` WRITE;
/*!40000 ALTER TABLE `artistas` DISABLE KEYS */;
INSERT INTO `artistas` VALUES (1,'Leonardo da Vinci','Italia','Polimata del Renacimiento, ingeniero e inventor.'),(2,'Frida Kahlo','Mexico','Pintora iconica, famosa por sus autorretratos surrealistas.'),(3,'Vincent van Gogh','Holanda','Maestro del Post-Impresionismo.'),(4,'Claude Monet','Francia','Fundador clave del movimiento Impresionista.'),(5,'Pablo Picasso','España','Cofundador del Cubismo y maestro del arte moderno.'),(6,'Andy Warhol','EE. UU.','Figura central del Pop Art.'),(7,'Jackson Pollock','EE. UU.','Pintor influyente del Expresionismo Abstracto.'),(8,'Diego Rivera','Mexico','Muralista de renombre y activista social.'),(9,'Auguste Rodin','Francia','Escultor pionero de la escultura moderna.'),(10,'Tamara de Lempicka','Polonia','Pintora Art Deco de retratos elegantes.'),(11,'Tarsila do Amaral','Brasil','Figura central del modernismo brasileño.'),(12,'Salvador Dali','España','Maestro del Surrealismo y sus simbolos oniricos.'),(13,'Georgia O’Keeffe','EE. UU.','Pintora de flores y paisajes del suroeste.'),(14,'Rembrandt van Rijn','Holanda','Maestro de la pintura barroca.'),(15,'Michelangelo','Italia','Escultor, pintor y arquitecto del Renacimiento.'),(16,'Keith Haring','EE. UU.','Artista de arte pop y graffiti.'),(17,'Gustav Klimt','Austria','Pintor simbolista, famoso por sus obras doradas.'),(18,'Edvard Munch','Noruega','Pintor expresionista, autor de \"El Grito\".'),(19,'René Magritte','Belgica','Pintor surrealista conocido por sus imagenes ingeniosas.'),(20,'Banksy','Reino Unido','Artista de graffiti anonimo y activista.'),(21,'Jeff Koons','EE. UU.','Artista contemporaneo conocido por sus esculturas gigantes.'),(22,'Yayoi Kusama','Japon','Artista con enfoque en arte conceptual y minimalismo.'),(23,'Marina Abramović','Serbia','Artista de performance y arte corporal.'),(24,'Anish Kapoor','India/RU','Escultor famoso por sus instalaciones monumentales.'),(25,'Franca Delle Donne','Italia','Artista digital y conceptual.'),(26,'Kenji Tanaka','Japon','Maestro de la caligrafia moderna.'),(27,'Silvia Vega','Chile','Pintora muralista contemporanea.'),(28,'Alex Chen','China','Artista de videoarte y realidad virtual.'),(29,'Maria Sempere','España','Escultora en materiales reciclados.'),(30,'Benito Flores','Mexico','Pintor de retratos realistas.');
/*!40000 ALTER TABLE `artistas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eventos`
--

DROP TABLE IF EXISTS `eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `eventos` (
  `id_evento` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `fecha_inicio` datetime DEFAULT NULL,
  `fecha_fin` datetime DEFAULT NULL,
  `capacidad` int DEFAULT NULL,
  PRIMARY KEY (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eventos`
--

LOCK TABLES `eventos` WRITE;
/*!40000 ALTER TABLE `eventos` DISABLE KEYS */;
INSERT INTO `eventos` VALUES (1,'Noche en el Museo','Tour nocturno, coctel y performance en vivo.','2025-12-01 20:00:00','2025-12-01 23:00:00',150),(2,'Taller de Meme-Arte','Crea tu propia obra inspirada en trends virales.','2025-12-05 15:00:00','2025-12-05 18:00:00',30),(3,'Gala Anual PoliMet','Cena de gala para patrocinadores y miembros Exclusive.','2025-12-15 19:00:00','2025-12-15 23:30:00',80),(4,'Conferencia IA y Arte','Charla sobre el futuro del arte digital y generativo.','2026-01-10 10:00:00','2026-01-10 12:00:00',200),(5,'Estreno Documental Cubismo','Proyeccion de documental sobre el Cubismo.','2026-01-20 18:00:00','2026-01-20 20:00:00',100),(6,'Visita Guiada Clásica','Recorrido centrado en las obras del Primer Piso.','2026-02-01 11:00:00','2026-02-01 13:00:00',25),(7,'Semana de Vanguardias','Exposiciones y charlas sobre el arte de principios del s. XX.','2026-03-01 09:00:00','2026-03-07 18:00:00',500),(8,'Brunch de Arte Pop','Desayuno tematico y recorrido por la Sala Pop Art.','2026-03-15 10:00:00','2026-03-15 12:00:00',40),(9,'Clase de Dibujo Urbano','Taller de dibujo al aire libre en el patio interior.','2026-04-05 14:00:00','2026-04-05 17:00:00',20),(10,'Subasta Benefica','Venta de arte para recaudacion de fondos (solo Exclusive).','2026-04-20 17:00:00','2026-04-20 21:00:00',60),(11,'Encuentro de Curadores','Reunion profesional (solo Exclusive e invitados).','2026-05-10 16:00:00','2026-05-10 18:00:00',20),(12,'Exposicion Flash Nocturna','Muestra de una sola noche con DJ set y bebidas.','2026-05-25 21:00:00','2026-05-25 00:00:00',120),(13,'Taller de Escultura 3D','Introduccion a la modelacion de escultura digital.','2026-06-05 16:00:00','2026-06-05 19:00:00',15),(14,'Charla sobre Realismo Mágico','Analisis de la pintura latinoamericana.','2026-06-15 18:30:00','2026-06-15 20:00:00',50),(15,'Cata de Vinos y Arte Barroco','Evento Premium para miembros.','2026-07-01 19:00:00','2026-07-01 22:00:00',70),(16,'Festival de Videoarte','Proyeccion de cortometrajes experimentales.','2026-07-15 20:00:00','2026-07-15 23:00:00',150),(17,'Seminario de Historia del Arte','Clase intensiva sobre el Renacimiento.','2026-08-01 09:00:00','2026-08-01 17:00:00',35),(18,'Desayuno con Artista Local','Encuentro con Silvia Vega (muralista).','2026-08-10 10:00:00','2026-08-10 12:00:00',20),(19,'Tour de la Bóveda','Acceso restringido a la coleccion de obras raras (Exclusive).','2026-09-01 14:00:00','2026-09-01 16:00:00',10),(20,'Maraton de Pintura','Competencia de pintura en vivo para aficionados.','2026-09-15 10:00:00','2026-09-15 18:00:00',50),(21,'Taller de Fotografia con Movil','Aprende a capturar arte con tu smartphone.','2026-10-01 15:00:00','2026-10-01 17:00:00',45),(22,'Cena Temática Gótica','Experiencia culinaria inspirada en el arte gotico.','2026-10-20 20:00:00','2026-10-20 23:00:00',60),(23,'Presentación de Libro','Autor discute la influencia de Dali en la cultura pop.','2026-11-05 19:00:00','2026-11-05 21:00:00',80),(24,'Tour Interactivo VR','Visita guiada usando dispositivos de realidad virtual.','2026-11-20 10:00:00','2026-11-20 12:00:00',30),(25,'Clase de Modelado con Arcilla','Taller práctico de escultura para principiantes.','2026-12-05 14:00:00','2026-12-05 16:00:00',25),(26,'Concierto de Musica Minimalista','Actuacion en la Sala de Experimentos Sonoros.','2026-12-15 20:00:00','2026-12-15 22:00:00',100),(27,'Exhibición Navideña','Muestra temporal de arte con tematica festiva.','2026-12-24 11:00:00','2026-12-24 18:00:00',400),(28,'Charla de Conservación','Expertos discuten la restauracion de obras clasicas.','2027-01-10 15:00:00','2027-01-10 17:00:00',50),(29,'Taller de Acuarelas','Clase enfocada en la tecnica de la acuarela.','2027-01-25 10:00:00','2027-01-25 12:00:00',20),(30,'Cierre de Gala','Celebracion de fin de temporada de exposiciones.','2027-02-15 19:30:00','2027-02-15 23:00:00',75);
/*!40000 ALTER TABLE `eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `informacion_museo`
--

DROP TABLE IF EXISTS `informacion_museo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `informacion_museo` (
  `id_info` int NOT NULL AUTO_INCREMENT,
  `descripcion` text NOT NULL,
  `horarios` text NOT NULL,
  `fotos` text,
  `evento_destacado` int DEFAULT NULL,
  `capacidad` int NOT NULL,
  PRIMARY KEY (`id_info`),
  KEY `evento_destacado` (`evento_destacado`),
  CONSTRAINT `informacion_museo_ibfk_1` FOREIGN KEY (`evento_destacado`) REFERENCES `eventos` (`id_evento`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `informacion_museo`
--

LOCK TABLES `informacion_museo` WRITE;
/*!40000 ALTER TABLE `informacion_museo` DISABLE KEYS */;
INSERT INTO `informacion_museo` VALUES (1,'El Museo Polimet combina arte histórico con elementos modernos, ofreciendo experiencias interactivas para visitantes de todas las edades.','Lunes a Viernes: 10:00 - 18:00\nSábados y Domingos: 11:00 - 20:00\nFeriados: 12:00 - 18:00','https://midominio.com/imagenes/museo_principal.jpg',1,500);
/*!40000 ALTER TABLE `informacion_museo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `membresias`
--

DROP TABLE IF EXISTS `membresias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `membresias` (
  `id_membresia` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('Estandar','Premium','Exclusive') DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_membresia`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `membresias`
--

LOCK TABLES `membresias` WRITE;
/*!40000 ALTER TABLE `membresias` DISABLE KEYS */;
INSERT INTO `membresias` VALUES (1,'Estandar','Acceso basico a coleccion permanente y zonas comunes.'),(2,'Premium','Acceso a colecciones y exposiciones temporales.'),(3,'Exclusive','Acceso ilimitado a todas las areas, eventos VIP y archivos.');
/*!40000 ALTER TABLE `membresias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notificaciones`
--

DROP TABLE IF EXISTS `notificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `notificaciones` (
  `id_notificacion` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `mensaje` text,
  `fecha_creacion` datetime DEFAULT NULL,
  PRIMARY KEY (`id_notificacion`),
  KEY `id_usuario` (`id_usuario`),
  CONSTRAINT `notificaciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notificaciones`
--

LOCK TABLES `notificaciones` WRITE;
/*!40000 ALTER TABLE `notificaciones` DISABLE KEYS */;
INSERT INTO `notificaciones` VALUES (1,3,'Su membresia Estandar vence pronto. Renueve hoy!','2025-11-10 09:00:00'),(2,2,'Recordatorio: tiene una reserva de ticket para manana, 25/11.','2025-11-24 06:00:00'),(3,1,'Nueva exposicion exclusiva disponible en el Segundo Piso.','2025-11-15 14:00:00'),(4,5,'No olvide su evento Brunch de Arte Pop el 15/03/2026.','2026-03-01 10:00:00'),(5,4,'Su ticket de reserva para el 10/11 ha pasado a estado \"vencida\".','2025-11-11 00:00:01'),(6,8,'Invitacion formal a la Gala Anual PoliMet. Confirme su asistencia.','2025-12-01 10:00:00'),(7,10,'La obra La Gioconda (Filtro Viral) ha subido de popularidad.','2025-11-30 09:00:00'),(8,12,'Recordatorio de su evento Encuentro de Curadores para manana.','2026-05-09 06:00:00'),(9,11,'Hemos anadido nuevas obras en la Galeria del Renacimiento.','2025-11-21 12:00:00'),(10,6,'Recordatorio: tiene una reserva de ticket para manana, 28/11.','2025-11-27 06:00:00'),(11,7,'Beneficio exclusivo de pre-visualizacion activado: Sala de Vanguardias.','2025-12-05 10:00:00'),(12,9,'Descuento especial del 20% en la Tienda del Museo.','2025-11-20 15:00:00'),(13,13,'Su taller de Escultura 3D es el 05/06/2026.','2026-05-25 10:00:00'),(14,14,'El evento Charla sobre Realismo Mágico ha cambiado de hora.','2026-06-10 11:00:00'),(15,15,'Recordatorio: Cena Temática Gótica el 20/10/2026.','2026-10-15 12:00:00'),(16,16,'Acceso exclusivo al Tour de la Bóveda activado.','2026-08-25 13:00:00'),(17,17,'Su puntuación en la obra El Beso (Gold Edition) fue de 5 estrellas.','2025-12-07 14:00:00'),(18,18,'El Semanario de Historia del Arte ha comenzado su inscripcion.','2026-07-20 15:00:00'),(19,19,'La Exhibición Navideña ya esta disponible para la venta de tickets.','2026-12-01 16:00:00'),(20,20,'Votacion abierta para la Obra del Mes.','2025-12-30 17:00:00'),(21,21,'Felicitaciones! Ha sido seleccionado para un descuento VIP.','2026-01-05 10:30:00'),(22,22,'La Galeria Gótica ha sido restaurada y reabierta.','2026-02-10 11:30:00'),(23,23,'Se ha anadido un nuevo mural del artista Benito Flores.','2026-03-15 12:30:00'),(24,24,'Tu membresia Premium te da acceso a la Sala de Pintura.','2026-04-20 13:30:00'),(25,25,'Recordatorio: Subasta Benefica (solo Exclusive) en 5 dias.','2026-04-15 14:30:00'),(26,26,'Concierto de Musica Minimalista agotado. Su ticket esta confirmado.','2026-12-01 15:30:00'),(27,27,'Hemos detectado arte de Corea. Puedes filtrarlo ahora!','2026-06-10 16:30:00'),(28,28,'Tu valoracion en El Ciber-Sueño ha sido de las mas altas.','2025-12-20 17:30:00'),(29,29,'El evento Cierre de Gala es solo para miembros Exclusive y Premium.','2027-02-01 10:00:00'),(30,30,'Tu ticket de entrada al museo ya esta listo.','2025-12-18 11:00:00');
/*!40000 ALTER TABLE `notificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `obras`
--

DROP TABLE IF EXISTS `obras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `obras` (
  `id_obra` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `epoca` varchar(100) DEFAULT NULL,
  `nivel_popularidad` float DEFAULT '0',
  `id_artista` int DEFAULT NULL,
  `id_sala` int DEFAULT NULL,
  `id_tipo_obra` int DEFAULT NULL,
  PRIMARY KEY (`id_obra`),
  KEY `id_artista` (`id_artista`),
  KEY `id_sala` (`id_sala`),
  KEY `id_tipo_obra` (`id_tipo_obra`),
  CONSTRAINT `obras_ibfk_1` FOREIGN KEY (`id_artista`) REFERENCES `artistas` (`id_artista`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `obras_ibfk_2` FOREIGN KEY (`id_sala`) REFERENCES `salas` (`id_sala`) ON DELETE SET NULL ON UPDATE CASCADE,
  CONSTRAINT `obras_ibfk_3` FOREIGN KEY (`id_tipo_obra`) REFERENCES `tipos_obra` (`id_tipo_obra`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `obras`
--

LOCK TABLES `obras` WRITE;
/*!40000 ALTER TABLE `obras` DISABLE KEYS */;
INSERT INTO `obras` VALUES (1,'La Gioconda (Filtro Viral)','Retrato clasico con retoques de realidad aumentada.','Clásico',4.8,1,2,3),(2,'Autorretrato con Hashtag','Autorretrato doble con corazones expuestos.','Contemporáneo',4.5,2,8,1),(3,'Noche Estrellada (Pixel Art)','Representacion de la obra original en estilo pixelado.','Moderno',4.9,3,14,3),(4,'Impresion, Sol Naciente','Vista clasica del puerto de Le Havre.','Moderno',4.2,4,14,1),(5,'Guernica vs. Memes','La tragedia de Guernica reinterpretada con estetica viral.','Contemporáneo',3.9,5,1,1),(6,'Lata de Sopa NFT','Reproduccion de la lata de sopa en formato token.','Contemporáneo',4.1,6,13,3),(7,'Numero 1A (Goteo Digital)','Goteo sobre lienzo, documentado en time-lapse 4K.','Moderno',3.5,7,6,4),(8,'El Hombre Controlador','Mural satirico sobre la vigilancia global.','Contemporáneo',4.6,8,10,1),(9,'El Pensador (Realidad Aumentada)','Escultura de bronce con capa de AR interactiva.','Clásico',4.8,9,5,2),(10,'Autoretrato en Bugatti (Filtro)','Retrato Art Deco con un efecto de cromo pulido.','Moderno',4.3,10,8,1),(11,'Abaporu 3D','La figura modernista recreada como un render 3D.','Moderno',4.7,11,12,3),(12,'La Persistencia (Emoji)','Los relojes derritiendose, ahora con iconos de emoji.','Moderno',5,12,3,1),(13,'Flor Gigante (VR)','Instalacion de flor en realidad virtual inmersiva.','Contemporáneo',4,13,9,3),(14,'La Ronda Nocturna (Remix)','Remezcla digital de la obra de Rembrandt.','Clásico',4.4,14,2,3),(15,'David (Selfie Stick)','Escultura de David con un accesorio moderno.','Clásico',4.9,15,17,2),(16,'Hombre Llorando (TikTok)','Video performance de un personaje de Lichtenstein.','Contemporáneo',3.8,16,16,4),(17,'El Beso (Gold Edition)','Recreacion del beso de Klimt con IA generativa.','Moderno',4.7,17,23,3),(18,'El Grito (en Live Stream)','Performance del grito en un entorno de streaming.','Moderno',4.6,18,16,4),(19,'Ceci n’est pas un GIF','Reinterpretacion de La Traicion de las Imagenes.','Moderno',4.5,19,3,3),(20,'Niña con Globo (Reclamo)','Mural digital sobre la caida del globo.','Contemporáneo',4.9,20,10,1),(21,'Perro Globo XXL','Escultura gigante de perro globo en colores acidos.','Contemporáneo',4.2,21,28,2),(22,'Sala de Espejos Infinitos','Instalacion inmersiva de lunares y espejos.','Contemporáneo',4.7,22,27,2),(23,'La Artista Está Ausente','Video de una performance de larga duracion.','Contemporáneo',4.1,23,16,4),(24,'Espejo Cóncavo','Escultura de acero pulido y reflejante.','Contemporáneo',4.3,24,5,2),(25,'El Caos del Codigo','Pintura hecha con datos y algoritmos.','Contemporáneo',4,25,6,1),(26,'Caligrafia Digital','Obra de tinta tradicional capturada en 8K.','Clásico',4.5,26,19,3),(27,'Mural de la Consciencia','Mural que mezcla grafiti y realidad aumentada.','Contemporáneo',4.8,27,10,1),(28,'El Ciber-Sueño','Videoarte con narrativas oniricas y tecnologia.','Contemporáneo',4.9,28,7,4),(29,'Estructura de Desechos','Escultura ensamblada con residuos electronicos.','Contemporáneo',4.6,29,29,2),(30,'Retrato de la IA','Pintura hiperrealista de una figura algoritmica.','Contemporáneo',4.7,30,8,1);
/*!40000 ALTER TABLE `obras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pisos`
--

DROP TABLE IF EXISTS `pisos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pisos` (
  `id_piso` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(25) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_piso`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pisos`
--

LOCK TABLES `pisos` WRITE;
/*!40000 ALTER TABLE `pisos` DISABLE KEYS */;
INSERT INTO `pisos` VALUES (1,'Planta Baja','Area principal de recepcion y exposiciones de bienvenida.'),(2,'Primer piso','Galeria de Arte Clásico, Renacentista y Barroco.'),(3,'Segundo piso','Exposiciones de Arte Moderno, Digital y Conceptual.');
/*!40000 ALTER TABLE `pisos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pisos_has_membresias`
--

DROP TABLE IF EXISTS `pisos_has_membresias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pisos_has_membresias` (
  `pisos_id_piso` int NOT NULL,
  `membresias_id_membresia` int NOT NULL,
  PRIMARY KEY (`pisos_id_piso`,`membresias_id_membresia`),
  KEY `fk_pisos_has_membresias_membresias1_idx` (`membresias_id_membresia`),
  KEY `fk_pisos_has_membresias_pisos1_idx` (`pisos_id_piso`),
  CONSTRAINT `fk_pisos_has_membresias_membresias1` FOREIGN KEY (`membresias_id_membresia`) REFERENCES `membresias` (`id_membresia`),
  CONSTRAINT `fk_pisos_has_membresias_pisos1` FOREIGN KEY (`pisos_id_piso`) REFERENCES `pisos` (`id_piso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pisos_has_membresias`
--

LOCK TABLES `pisos_has_membresias` WRITE;
/*!40000 ALTER TABLE `pisos_has_membresias` DISABLE KEYS */;
INSERT INTO `pisos_has_membresias` VALUES (1,1),(1,2),(2,2),(1,3),(2,3),(3,3);
/*!40000 ALTER TABLE `pisos_has_membresias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `salas`
--

DROP TABLE IF EXISTS `salas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `salas` (
  `id_sala` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text,
  `id_piso` int DEFAULT NULL,
  PRIMARY KEY (`id_sala`),
  KEY `id_piso` (`id_piso`),
  CONSTRAINT `salas_ibfk_1` FOREIGN KEY (`id_piso`) REFERENCES `pisos` (`id_piso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `salas`
--

LOCK TABLES `salas` WRITE;
/*!40000 ALTER TABLE `salas` DISABLE KEYS */;
INSERT INTO `salas` VALUES (1,'Sala Vanguardias Digitales','Exposicion temporal de arte futurista.',1),(2,'Galeria del Renacimiento','Obras de arte del siglo XV y XVI.',2),(3,'Arte en Redes Sociales','Exposicion de arte inspirado en memes y trends.',3),(4,'Sala de Acuarelas Modernas','Coleccion de obras en papel y tinta.',1),(5,'Esculturas Griegas','Obras de la antiguedad clasica en marmol y bronce.',2),(6,'Pintura Abstracta Contemporanea','Obras sin representacion figurativa.',3),(7,'Cine-Arte Documental','Sala de proyecciones para documentales y videoarte.',1),(8,'Salon de Retratos Barrocos','Retratos de diferentes epocas y estilos.',2),(9,'Instalaciones VR','Arte conceptual interactivo con realidad virtual.',3),(10,'Muralismo Latinoamericano','Obras de gran formato con tematica contemporanea.',1),(11,'Galeria Barroca Flamenca','Pinturas de la escuela flamenca y holandesa.',2),(12,'Exhibicion de Arte con IA','Obras creadas con inteligencia artificial.',3),(13,'Fotografia Digital','Muestra de arte fotografico.',1),(14,'Impresionismo y Post-Impresionismo','Obras de Monet, Van Gogh y contemporaneos.',2),(15,'Arte Conceptual Minimalista','Obras que enfatizan la idea sobre la estetica.',3),(16,'Sala de Performance','Espacio dedicado a obras de arte en vivo y grabadas.',1),(17,'Esculturas Clásicas','Obras de Miguel Angel y Rodin.',2),(18,'Diseño Gráfico Viral','Exposicion sobre el arte del diseño en la web.',3),(19,'Sala de Bocetos','Coleccion de dibujos preparatorios y estudios.',1),(20,'Retratos del Siglo de Oro','Obras de Velazquez y maestros espanoles.',2),(21,'Video-Instalaciones','Arte inmersivo con multiples pantallas.',3),(22,'Realismo Mágico','Obras influenciadas por el realismo latinoamericano.',1),(23,'Arte Moderno del Este','Pintura y escultura de Europa del Este.',2),(24,'NFT y Blockchain Art','Obras de arte tokenizadas y coleccionables.',3),(25,'Sala de Textiles','Obras de arte con fibras y tejidos.',1),(26,'Galeria Gótica','Arte de la Edad Media tardia.',2),(27,'Experimentos Sonoros','Instalaciones que usan el sonido como medio.',3),(28,'Pop Art Iconico','Obras de Warhol y el arte popular.',1),(29,'Arte del Surrealismo','Obras de Dali y Magritte.',2),(30,'Espacio de Realidad Mixta','Obras que mezclan lo fisico y lo virtual.',3);
/*!40000 ALTER TABLE `salas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secciones`
--

DROP TABLE IF EXISTS `secciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `secciones` (
  `id_seccion` int NOT NULL AUTO_INCREMENT,
  `ubicacion` varchar(100) DEFAULT NULL,
  `epoca` varchar(100) DEFAULT NULL,
  `nombre` varchar(100) DEFAULT NULL,
  `nivel_popularidad` float DEFAULT NULL,
  `id_piso` int DEFAULT NULL,
  PRIMARY KEY (`id_seccion`),
  KEY `id_piso` (`id_piso`),
  CONSTRAINT `secciones_ibfk_1` FOREIGN KEY (`id_piso`) REFERENCES `pisos` (`id_piso`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secciones`
--

LOCK TABLES `secciones` WRITE;
/*!40000 ALTER TABLE `secciones` DISABLE KEYS */;
INSERT INTO `secciones` VALUES (1,'Muro Norte','2000-Presente','Memes y Virales',4.3,1),(2,'Vitrinas Centrales','Antiguedad','Obras Griegas y Romanas',4.6,2),(3,'Salon Principal','1950-Presente','Tendencias Digitales',4.1,3),(4,'Pasillo Principal','Renacimiento','Maestros Italianos',4.7,2),(5,'Rincon de Curadores','2010-Presente','Arte IA',4,3),(6,'Acceso Cafe','1850-1900','Post-Impresionismo',4.5,1),(7,'Area Interactiva','2000-Presente','Esculturas con Realidad Aumentada',4.2,3),(8,'Pasillo Este','Barroco','Retratos de Corte',4.4,2),(9,'Pared Exterior','Arte Urbano','Murales y Graffiti',3.8,1),(10,'Galeria Lateral','Siglo XX','Surrealismo y Cubismo',4.9,3),(11,'Boveda','Prehistoria','Arte Rupestre Digital',3.5,2),(12,'Sector Familiar','Modernismo','Arte Brasileño',4.1,1),(13,'Sala de la Luz','1900-1950','Impresionismo y Color',4.6,2),(14,'Area de Proyecciones','2020-Presente','Cine y Narrativa',4.3,3),(15,'Muro Sur','1960-1980','Pop Art',4.5,1),(16,'Sala Central','Clasico','Mitologia en Escultura',4.8,2),(17,'Rincon Minimalista','1990-2010','Arte Conceptual',4.1,3),(18,'Pasillo Oeste','Barroco','Bodegones y Paisajes',4.2,2),(19,'Acceso Principal','Edad Media','Iconografía Religiosa',4,1),(20,'Sala de Exposiciones 1','Contemporáneo','Instalaciones de Textil',4.5,3),(21,'Galería 360','Moderno','Expresionismo Abstracto',4.3,2),(22,'Espacio Abierto','2015-Presente','Video Performance',4.7,1),(23,'Puente Vidriado','Barroco','Influencia Flamenca',4.4,2),(24,'Salón Multimedia','Contemporáneo','Arte con Drones',4.9,3),(25,'Sala de Pintura','Renacimiento','Retratos Famosos',4.6,1),(26,'Galeria Norte','Moderno','Surrealismo Europeo',4.7,2),(27,'Pared Curva','Contemporáneo','Graffiti de Autor',4.2,3),(28,'Sector de Entrada','1800-1900','Romanticismo',3.9,1),(29,'Galería Sur','Clásico','Esculturas Romanas',4.5,2),(30,'Terraza de Arte','Contemporáneo','Escultura al Aire Libre',4.8,3);
/*!40000 ALTER TABLE `secciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tickets`
--

DROP TABLE IF EXISTS `tickets`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tickets` (
  `id_ticket` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `fecha_reserva` date DEFAULT NULL,
  `hora_reserva` time DEFAULT NULL,
  `cantidad_personas` int DEFAULT NULL,
  `estado` enum('activa','cancelada') DEFAULT NULL,
  `id_info` int DEFAULT NULL,
  PRIMARY KEY (`id_ticket`),
  KEY `id_usuario` (`id_usuario`),
  KEY `fk_ticket_info` (`id_info`),
  CONSTRAINT `fk_ticket_info` FOREIGN KEY (`id_info`) REFERENCES `informacion_museo` (`id_info`),
  CONSTRAINT `tickets_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tickets`
--

LOCK TABLES `tickets` WRITE;
/*!40000 ALTER TABLE `tickets` DISABLE KEYS */;
INSERT INTO `tickets` VALUES (1,3,'2025-11-20','10:00:00',2,'activa',1),(2,2,'2025-11-25','14:30:00',1,'activa',1),(3,1,'2025-11-20','11:00:00',4,'activa',1),(4,4,'2025-11-10','16:00:00',1,'cancelada',1),(5,5,'2025-12-01','09:00:00',5,'activa',1),(6,6,'2025-11-28','12:00:00',3,'activa',1),(7,10,'2025-11-15','17:00:00',2,'activa',1),(8,8,'2025-11-22','10:30:00',1,'activa',1),(9,9,'2025-12-05','11:30:00',2,'activa',1),(10,7,'2025-11-30','15:00:00',1,'activa',1),(11,12,'2025-12-01','10:00:00',2,'activa',1),(12,11,'2025-11-20','14:00:00',3,'activa',1),(13,13,'2025-12-02','10:00:00',1,'activa',1),(14,14,'2025-12-03','11:00:00',2,'activa',1),(15,15,'2025-12-04','12:00:00',3,'activa',1),(16,16,'2025-12-05','13:00:00',4,'activa',1),(17,17,'2025-12-06','14:00:00',1,'activa',1),(18,18,'2025-12-07','15:00:00',2,'activa',1),(19,19,'2025-12-08','16:00:00',3,'activa',1),(20,20,'2025-12-09','17:00:00',1,'activa',1),(21,21,'2025-12-10','10:30:00',2,'activa',1),(22,22,'2025-12-11','11:30:00',3,'activa',1),(23,23,'2025-12-12','12:30:00',4,'activa',1),(24,24,'2025-12-13','13:30:00',1,'activa',1),(25,25,'2025-12-14','14:30:00',2,'activa',1),(26,26,'2025-12-15','15:30:00',3,'activa',1),(27,27,'2025-12-16','16:30:00',1,'activa',1),(28,28,'2025-12-17','17:30:00',2,'activa',1),(29,29,'2025-12-18','10:00:00',3,'activa',1),(30,30,'2025-12-19','11:00:00',1,'activa',1);
/*!40000 ALTER TABLE `tickets` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipos_obra`
--

DROP TABLE IF EXISTS `tipos_obra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipos_obra` (
  `id_tipo_obra` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) DEFAULT NULL,
  `descripcion` text,
  PRIMARY KEY (`id_tipo_obra`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipos_obra`
--

LOCK TABLES `tipos_obra` WRITE;
/*!40000 ALTER TABLE `tipos_obra` DISABLE KEYS */;
INSERT INTO `tipos_obra` VALUES (1,'Pintura/Mural','Obra bidimensional realizada sobre lienzo, tabla o pared.'),(2,'Escultura','Obra tridimensional realizada en marmol, bronce o materiales mixtos.'),(3,'Arte Digital','Obra creada o procesada mediante herramientas digitales (IA, VR, NFT).'),(4,'Video/Performance','Obras artisticas basadas en tiempo: videoarte, cine o grabacion de performance.');
/*!40000 ALTER TABLE `tipos_obra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios`
--

DROP TABLE IF EXISTS `usuarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios` (
  `id_usuario` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(15) DEFAULT NULL,
  `email` varchar(25) DEFAULT NULL,
  `pais` varchar(20) DEFAULT NULL,
  `telefono` bigint DEFAULT NULL,
  `fecha_nacimiento` date DEFAULT NULL,
  `id_membresia` int DEFAULT NULL,
  `password` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  UNIQUE KEY `email` (`email`),
  KEY `id_membresia` (`id_membresia`),
  CONSTRAINT `usuarios_ibfk_1` FOREIGN KEY (`id_membresia`) REFERENCES `membresias` (`id_membresia`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=152 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios`
--

LOCK TABLES `usuarios` WRITE;
/*!40000 ALTER TABLE `usuarios` DISABLE KEYS */;
INSERT INTO `usuarios` VALUES (1,'Sofia','sofia@mail.com','Chile',987654321,'1990-05-15',1,'Sofi@932x!'),(2,'Javier','javier@mail.com','Mexico',912345678,'1985-11-20',2,'Javi_85mx#'),(3,'Maria','maria@mail.com','Espana',955554444,'1998-01-01',1,'MariA99*es'),(4,'Carlos','carlos@mail.com','Argentina',966667777,'2001-07-25',1,'CarL07!ar'),(5,'Elena','elena@mail.com','Colombia',900011122,'1970-03-10',2,'Elen@col88'),(6,'Luis','luis@mail.com','Peru',933445566,'1995-12-05',1,'Lu1s_92pe!'),(7,'Ana','ana@mail.com','Chile',977889900,'1982-08-18',3,'Ana#ch77_'),(8,'Roberto','roberto@mail.com','Mexico',911223344,'1960-02-28',2,'Robe_mx91*'),(9,'Paula','paula@mail.com','Espana',944556677,'2003-04-12',1,'PauEs04@'),(10,'Fernando','fernan@mail.com','Argentina',988776655,'1975-09-30',2,'FernArg75!'),(11,'Juan','juan@mail.com','Brasil',910293847,'1988-06-22',1,'JuanBr98#'),(12,'Valentina','vale@mail.com','Ecuador',948372615,'1993-01-09',3,'Vale_ec93$'),(13,'Daniel','dani@mail.com','EE. UU.',954321098,'1978-04-20',1,'Dani_us95*'),(14,'Laura','laura@mail.com','Canada',987098709,'1992-10-05',2,'Lau_ca87!'),(15,'Ricardo','ricardo@mail.com','Portugal',919283746,'1965-07-17',1,'Rica_pt91@'),(16,'Isabel','isa@mail.com','Alemania',938475621,'2000-02-29',3,'Isab_de00#'),(17,'Pedro','pedro@mail.com','Francia',927364581,'1980-12-12',2,'Ped_fr80!'),(18,'Monica','monica@mail.com','Japon',946573829,'1996-06-06',1,'Mon_jp96*'),(19,'Andres','andres@mail.com','Australia',959483726,'1972-01-30',1,'And_au97$'),(20,'Natalia','nati@mail.com','Sudafrica',968754123,'1989-11-11',2,'Nati_sa89!'),(21,'Felipe','feli@mail.com','Italia',971829374,'1994-08-03',1,'Tom_cl90#'),(22,'Gabriela','gabi@mail.com','Corea',982736451,'1968-05-25',3,'Luci_mx84@'),(23,'Benja','benja@mail.com','Suecia',993847562,'2002-09-19',2,'Die_es02!'),(24,'Olivia','olivia@mail.com','Noruega',904758639,'1976-03-08',1,'Cami_ar01*'),(25,'Ignacio','igna@mail.com','Irlanda',915869742,'1991-12-01',1,'Est_co94@'),(26,'Martina','martina@mail.com','Rusia',926970853,'1984-07-27',3,'Rosa_pe83$'),(27,'Diego','diego@mail.com','China',937081964,'1999-04-14',1,'Pabl_ch91!'),(28,'Camila','cami@mail.com','India',948192075,'1973-10-29',2,'Mart_mx93*'),(29,'Elias','elias@mail.com','Egipto',959203186,'1987-01-05',3,'Serg_es88!'),(30,'Josefina','josefina@mail.com','Israel',960314297,'1997-06-16',1,'Juli_ar99#'),(31,'JuanpiB','juanpi@mail.com','argentina',48680605,NULL,NULL,'ju21@gna'),(114,'Milagros','mila@mail.com','Chile',56988221234,'1998-07-21',1,'Sd6QkJn8'),(115,'Esteban','esteban@mail.com','Argentina',1160987712,'1987-12-03',1,'Wq3ZpTp2'),(116,'Luciana','luci@mail.com','Argentina',1133221177,'1992-09-30',1,'Gt1HpXc4'),(117,'Tomas','tomi@mail.com','Argentina',1134439001,'1996-11-11',1,'Vb7KsMn1'),(119,'Matias','mati@mail.com','Argentina',1122127654,'1993-01-19',1,'Xp2NgWs9'),(120,'Florencia','flo@mail.com','Argentina',1143210988,'1999-06-02',1,'Kd5TbYn4'),(121,'Alejandro','ale@mail.com','Argentina',1138302211,'1988-03-13',1,'Ty3LpVk8'),(122,'Noelia','noe@mail.com','Paraguay',59599341234,'1995-12-22',1,'Wn9HtPc2'),(123,'Ramiro','rami@mail.com','Chile',56999341102,'1991-02-11',1,'Ps6ZxLw5'),(124,'Sofia','sofi@mail.com','Argentina',1129028844,'1997-09-09',1,'Qd4VjMn7'),(126,'Agustina','agus@mail.com','Argentina',1178976600,'1990-08-27',1,'Hn7QpXz3'),(127,'Martin','martin@mail.com','Uruguay',59824441190,'1994-11-05',1,'Cv9BpQw4'),(128,'Evelyn','eve@mail.com','Argentina',1134098221,'1998-04-15',1,'Fx4LpJm2'),(129,'Kevin','kevin@mail.com','Argentina',1188031122,'1992-07-01',1,'Dr6SsKp8'),(130,'Abril','abril@mail.com','Argentina',1142298877,'1996-10-24',1,'Bg3YtQw1'),(131,'Hernan','hernan@mail.com','Argentina',1132907765,'1987-01-18',1,'Np5KsDx4'),(133,'Lisandro','lisa@mail.com','Argentina',1132224880,'1993-09-23',1,'Rt6PvBn7'),(135,'Joaquin','joaqui@mail.com','Argentina',1176320911,'1990-03-04',1,'Mx2KdHw8'),(136,'Melina','meli@mail.com','Argentina',1148781122,'1988-12-20',1,'Sp6YvLn3'),(137,'Ezequiel','eze@mail.com','Argentina',1129023311,'1994-06-28',1,'Qw5NrTx1'),(138,'Carla','carla@mail.com','Argentina',1137800231,'1997-10-02',1,'Hp8YcLs3'),(139,'Nicolas','nico@mail.com','Uruguay',59823341220,'1992-08-19',1,'Dr6FtPw4'),(140,'Ailen','ailen@mail.com','Argentina',1163321100,'1998-12-12',1,'Ks7BnQc2'),(141,'Rodrigo','rodo@mail.com','Argentina',1145667783,'1991-03-21',2,'Lx3GjWp9'),(142,'Magali','maga@mail.com','Chile',56988321098,'1996-07-14',2,'Pt5SwNz8'),(143,'Federico','fede@mail.com','Argentina',1130029988,'1989-11-25',2,'Vq1KfCs6'),(144,'Luana','luana@mail.com','Argentina',1135822244,'1995-06-08',2,'Tp9FwKs2'),(145,'Bruno','bruno@mail.com','Argentina',1155327711,'1990-09-30',2,'Gj4MnBs7'),(146,'Delfina','delfi@mail.com','Peru',51992348761,'1997-02-02',2,'Zn6XcLp5'),(147,'Gero','gero@mail.com','Argentina',1145654490,'1985-05-05',3,'Qc7PzLt2'),(148,'Valeria','val@mail.com','Uruguay',59824459871,'1993-10-15',3,'Hd4SnQx9'),(149,'Ulises','uli@mail.com','Chile',56988341109,'1990-01-09',3,'Mp2VkFr8'),(150,'Bianca','bian@mail.com','Argentina',1138422001,'1998-04-27',3,'Tf5XqZn6'),(151,'Marcos','marcos@mail.com','Argentina',1166543988,'1987-07-19',3,'Wr8NjQp7');
/*!40000 ALTER TABLE `usuarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuarios_eventos`
--

DROP TABLE IF EXISTS `usuarios_eventos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuarios_eventos` (
  `id_usuario` int NOT NULL,
  `id_evento` int NOT NULL,
  PRIMARY KEY (`id_usuario`,`id_evento`),
  KEY `id_evento` (`id_evento`),
  CONSTRAINT `usuarios_eventos_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `usuarios_eventos_ibfk_2` FOREIGN KEY (`id_evento`) REFERENCES `eventos` (`id_evento`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuarios_eventos`
--

LOCK TABLES `usuarios_eventos` WRITE;
/*!40000 ALTER TABLE `usuarios_eventos` DISABLE KEYS */;
INSERT INTO `usuarios_eventos` VALUES (2,1),(6,1),(4,2),(9,2),(1,3),(8,3),(11,4),(3,6),(10,6),(5,8),(7,10),(12,11),(13,13),(14,14),(15,15),(16,16),(17,17),(18,18),(19,19),(20,20),(21,21),(22,22),(23,23),(24,24),(25,25),(26,26),(27,27),(28,28),(29,29),(30,30);
/*!40000 ALTER TABLE `usuarios_eventos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `valoraciones`
--

DROP TABLE IF EXISTS `valoraciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `valoraciones` (
  `id_valoracion` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_obra` int DEFAULT NULL,
  `puntaje` int DEFAULT NULL,
  `comentario` text,
  `fecha` date DEFAULT NULL,
  PRIMARY KEY (`id_valoracion`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_obra` (`id_obra`),
  CONSTRAINT `valoraciones_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `valoraciones_ibfk_2` FOREIGN KEY (`id_obra`) REFERENCES `obras` (`id_obra`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `valoraciones_chk_1` CHECK ((`puntaje` between 1 and 5))
) ENGINE=InnoDB AUTO_INCREMENT=130 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `valoraciones`
--

LOCK TABLES `valoraciones` WRITE;
/*!40000 ALTER TABLE `valoraciones` DISABLE KEYS */;
INSERT INTO `valoraciones` VALUES (1,3,1,5,'Obra clasica muy bien actualizada!','2025-11-20'),(2,2,3,5,'La mejor, la version pixelada es genial.','2025-11-25'),(3,1,12,5,'Una obra maestra, siempre actual.','2025-11-20'),(4,4,6,4,'El Pop Art nunca pasa de moda.','2025-11-21'),(5,5,9,5,'La experiencia de Realidad Aumentada es increible.','2025-12-01'),(6,6,5,3,'Interesante, pero demasiado cargada de simbolos.','2025-11-28'),(7,10,1,4,'Le quito un punto por el uso del meme en el fondo.','2025-11-29'),(8,8,2,5,'Frida siempre impactante, gran uso del digital.','2025-11-22'),(9,9,10,4,'Art Deco moderno, me encanto el filtro de cromo.','2025-12-05'),(10,7,3,5,'La amo, simple y genial.','2025-11-30'),(11,12,14,4,'Escultura muy detallada.','2025-12-01'),(12,11,15,4,'La performance de Monet es muy original.','2025-11-20'),(13,13,7,3,'El goteo digital es un concepto interesante.','2025-12-02'),(14,14,8,5,'Mural impresionante y muy actual.','2025-12-03'),(15,15,11,4,'El render 3D de Abaporu es genial.','2025-12-04'),(16,16,13,5,'La instalacion de la flor en VR es inmersiva.','2025-12-05'),(17,17,16,4,'Buena representacion del Pop Art.','2025-12-06'),(18,18,17,5,'El trabajo con IA en el beso de Klimt es magico.','2025-12-07'),(19,19,18,4,'El performance de El Grito fue impactante.','2025-12-08'),(20,20,19,3,'La meta-referencia de Ceci n’est pas un GIF me confunde.','2025-12-09'),(21,21,20,5,'El mural de Banksy siempre toca temas sensibles.','2025-12-10'),(22,22,21,4,'El perro globo gigante es divertido, aunque no es arte profundo.','2025-12-11'),(23,23,22,5,'La sala de espejos de Kusama es mi favorita.','2025-12-12'),(24,24,23,4,'La performance de Abramović fue larga, pero muy conceptual.','2025-12-13'),(25,25,24,5,'La escultura de acero pulido de Kapoor es fascinante.','2025-12-14'),(26,26,25,3,'Me parecio demasiado abstracto.','2025-12-15'),(27,27,26,4,'La caligrafia 8K es una gran fusion de lo clasico y lo digital.','2025-12-16'),(28,28,27,5,'El mural con realidad aumentada es el futuro.','2025-12-17'),(29,29,28,4,'El videoarte es bueno, pero un poco largo.','2025-12-18'),(30,30,29,5,'Me gusta el mensaje de la escultura de desechos.','2025-12-19'),(100,3,1,4,'La obra mantiene su esencia, muy disfrutable.','2025-12-15'),(101,5,4,5,'Una pieza increíble, cada detalle sorprende.','2025-12-15'),(102,2,5,3,'Interesante, pero esperaba algo más llamativo.','2025-12-16'),(103,7,12,5,'Una experiencia visual extraordinaria.','2025-12-16'),(104,10,6,4,'Gran obra, aunque la iluminación afecta un poco.','2025-12-17'),(105,3,6,2,'No terminó de convencerme.','2025-12-17'),(106,5,9,1,'No me gustó, demasiado confusa.','2025-12-18'),(107,7,5,5,'Una obra que siempre quiero volver a ver.','2025-12-18'),(108,9,1,3,'Correcta, pero sin demasiada sorpresa.','2025-12-19'),(109,4,10,4,'Muy equilibrada, transmite mucho.','2025-12-19'),(110,2,4,2,'No conecté con esta obra.','2025-12-20'),(111,6,12,5,'Una verdadera joya del museo.','2025-12-20'),(112,3,5,1,'Esperaba algo mucho mejor.','2025-12-21'),(113,10,7,4,'Buena técnica y composición.','2025-12-21'),(114,4,3,3,'Está bien, aunque nada nuevo.','2025-12-22'),(115,3,9,5,'Sorprendente y profunda, excelente.','2025-12-22'),(116,8,6,4,'Muy prolija, me gustó.','2025-12-23'),(117,7,10,2,'Demasiado simple para mi gusto.','2025-12-23'),(118,3,12,5,'Una de las mejores piezas, sin duda.','2025-12-24'),(119,5,7,3,'Correcta, sin destacar demasiado.','2025-12-24'),(120,2,1,5,'Una obra clásica que siempre destaca.','2025-12-25'),(121,9,5,4,'Muy buena, transmite mucha emoción.','2025-12-25'),(122,6,3,2,'No me terminó de cerrar.','2025-12-26'),(123,7,6,5,'Excelente en todos los aspectos.','2025-12-26'),(124,1,4,1,'No entendí el concepto.','2025-12-27'),(125,8,12,4,'Muy atractiva visualmente.','2025-12-27'),(126,10,9,3,'Interesante, pero le falta impacto.','2025-12-28'),(127,3,5,2,'Floja comparada con otras obras.','2025-12-28'),(128,4,7,5,'Me encantó, muy buena experiencia.','2025-12-29'),(129,6,10,4,'Bien lograda y muy equilibrada.','2025-12-29');
/*!40000 ALTER TABLE `valoraciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visitas`
--

DROP TABLE IF EXISTS `visitas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visitas` (
  `id_visita` int NOT NULL AUTO_INCREMENT,
  `id_usuario` int DEFAULT NULL,
  `id_obra` int DEFAULT NULL,
  `fecha_visita` datetime DEFAULT NULL,
  PRIMARY KEY (`id_visita`),
  KEY `id_usuario` (`id_usuario`),
  KEY `id_obra` (`id_obra`),
  CONSTRAINT `visitas_ibfk_1` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id_usuario`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `visitas_ibfk_2` FOREIGN KEY (`id_obra`) REFERENCES `obras` (`id_obra`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visitas`
--

LOCK TABLES `visitas` WRITE;
/*!40000 ALTER TABLE `visitas` DISABLE KEYS */;
INSERT INTO `visitas` VALUES (1,3,1,'2025-11-20 10:30:00'),(2,2,3,'2025-11-25 15:00:00'),(3,1,12,'2025-11-20 11:30:00'),(4,5,9,'2025-12-01 10:00:00'),(5,6,5,'2025-11-28 13:00:00'),(6,10,1,'2025-11-29 17:30:00'),(7,8,2,'2025-11-22 11:00:00'),(8,9,10,'2025-12-05 12:00:00'),(9,7,3,'2025-11-30 15:30:00'),(10,12,14,'2025-12-01 10:45:00'),(11,11,15,'2025-11-20 14:30:00'),(12,4,6,'2025-11-21 16:30:00'),(13,13,7,'2025-12-02 10:40:00'),(14,14,8,'2025-12-03 11:40:00'),(15,15,11,'2025-12-04 12:40:00'),(16,16,13,'2025-12-05 13:40:00'),(17,17,16,'2025-12-06 14:40:00'),(18,18,17,'2025-12-07 15:40:00'),(19,19,18,'2025-12-08 16:40:00'),(20,20,19,'2025-12-09 17:40:00'),(21,21,20,'2025-12-10 10:50:00'),(22,22,21,'2025-12-11 11:50:00'),(23,23,22,'2025-12-12 12:50:00'),(24,24,23,'2025-12-13 13:50:00'),(25,25,24,'2025-12-14 14:50:00'),(26,26,25,'2025-12-15 15:50:00'),(27,27,26,'2025-12-16 16:50:00'),(28,28,27,'2025-12-17 17:50:00'),(29,29,28,'2025-12-18 10:10:00'),(30,30,29,'2025-12-19 11:10:00');
/*!40000 ALTER TABLE `visitas` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-19  9:54:46
