-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: concesionaria
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `autos`
--

DROP TABLE IF EXISTS `autos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autos` (
  `id_auto` int NOT NULL AUTO_INCREMENT,
  `id_prov` int NOT NULL,
  `marca` varchar(100) NOT NULL,
  `modelo` varchar(100) NOT NULL,
  `color` varchar(100) NOT NULL,
  `fabricacion` date NOT NULL,
  `estado` varchar(100) NOT NULL,
  `stock` int NOT NULL,
  `precio` int NOT NULL,
  PRIMARY KEY (`id_auto`),
  KEY `fk_id_prov_autos` (`id_prov`),
  CONSTRAINT `fk_id_prov_autos` FOREIGN KEY (`id_prov`) REFERENCES `proveedores` (`id_prov`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autos`
--

LOCK TABLES `autos` WRITE;
/*!40000 ALTER TABLE `autos` DISABLE KEYS */;
INSERT INTO `autos` VALUES (1,12,'Honda','Civic','Negro','2019-05-16','Usado',5,555000),(2,9,'Ford','F-150','Rojo','2020-06-11','Nuevo',10,700000),(3,11,'Chevrolet ','Corvette','Rojo','2011-05-10','Usado',3,450000),(4,3,'Volkswagen ','Golf GTI','Blanco','2022-12-16','Nuevo',5,625000),(5,1,'Nissan','Sentra','Azul','2012-11-01','Usado',7,300000),(6,10,'BMW ','Serie 8','Bordo','2021-07-25','Nuevo',2,750000),(7,8,'Mercedes-Benz','Clase S','Gris Oscuro','2022-10-16','Usado',3,655000),(8,15,'Audi','A6','Verde Oscuro','2013-01-19','Usado',5,500000),(9,2,'Mazda','RX8','Naranja','2013-06-11','Usado',1,555000),(10,6,'Kia','Sportage','Gris Oscuro','2018-03-22','Usado',5,400000),(11,7,'Hyundai','Elantra','Azul','2014-05-10','Nuevo',14,555000),(12,13,'Subaru','Impreza','Azul','2019-11-22','Usado',4,655000),(13,5,'Lexus','LS','Blanco Mate','2022-04-25','Nuevo',5,600000),(14,4,'Porsche','911','Negro Mate','2020-05-05','Usado',3,800000),(15,14,'Jeep','Grand Cherokee','Azul Oscuro','2016-07-10','Nuevo',6,600000);
/*!40000 ALTER TABLE `autos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `id_cliente` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` int DEFAULT NULL,
  `dni` int NOT NULL,
  `mail` varchar(100) NOT NULL,
  PRIMARY KEY (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Ana Gonzalez',1102456933,58490261,'ana_gonzales@hotmail.com'),(2,'Carlos Ramirez',1100895446,73217890,'carlos_ramirez@hotmail.com'),(3,'Sofia Martinez',1145309856,10987654,'sofia_marinez@hotmail.com'),(4,'Luis Garcia',1149652308,24681012,'luis_garcia@hotmail.com'),(5,'Javier Vargas',1173642809,37591028,'javier_vargas@hotmail.com'),(6,'Karla Gomez',1176340897,49283746,'karla_gomez@hotmail.com'),(7,'Valentin Fernandez',1187630545,61728394,'valen_fernandez@hotmail.com'),(8,'Antonio Zamora',1100371605,85927463,'tony_zamora@hotmail.com'),(9,'Ricardo Urena',1145307309,85927463,'ricardo_urena@hotmail.com'),(10,'Maria Eugenia Mora',1182039710,10304050,'mar.euge.mora@hotmail.com'),(11,'Ana Maria',1145307316,11617384,'ana.maria@hotmail.com'),(12,'Manuel Chacon',1189037458,12941516,'manuel.chacon@hotmail.com'),(13,'Juan Manuel Rodriguez',1187563215,13579246,'juan_manuel@hotmail.com'),(14,'Lucas Velasquez',1145027309,14725839,'lucas.velasquez@hotmail.com'),(15,'Gianfranco Gutierrez',1169450325,20918756,'gian.gutierrez@hotmail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id_compra` int NOT NULL AUTO_INCREMENT,
  `fecha_compra` date NOT NULL,
  `articulos` varchar(100) NOT NULL,
  `unidades` int NOT NULL,
  `id_prov` int NOT NULL,
  `metodo_pago` varchar(100) NOT NULL,
  `monto` int NOT NULL,
  `estado` varchar(100) NOT NULL,
  PRIMARY KEY (`id_compra`),
  KEY `fk_id_prov_compras` (`id_prov`),
  CONSTRAINT `fk_id_prov_compras` FOREIGN KEY (`id_prov`) REFERENCES `proveedores` (`id_prov`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,'2013-06-24','Insumos de oficina',5,16,'Transferencia',13500,'Entrega completada'),(2,'2014-09-12','Nissan Sentra',4,1,'Cheque',1200000,'Entrega completada'),(3,'2023-05-01','Volkswagen Golf GTI',2,3,'Transferencia',1250000,'Entrega pendiente'),(4,'2016-02-03','Chevrolet Corvette',1,11,'Cheque',450000,'Entrega completada'),(5,'2017-08-27','Insumos de limpieza',8,20,'Efectivo',25000,'Entrega completada'),(6,'2019-01-18','Herramientas de mecánica automotriz',10,18,'Transferencia',50000,'Entrega completada'),(7,'2020-12-04','Ford F-150',5,9,'Cheque',3500000,'Entrega completada'),(8,'2015-07-11','Mazda RX8',2,2,'Efectivo',1100000,'Entrega completada'),(9,'2022-06-22','Mercedes-Benz Clase S',5,8,'Transferencia',3275000,'Entrega completada'),(10,'2011-12-30','Aceite de motor y filtros',30,17,'Efectivo',35000,'Entrega completada'),(11,'2018-05-09','Subaru Impreza',6,13,'Cheque',3930000,'Entrega completada'),(12,'2023-02-14','Ropa de trabajo para mecanicos',10,18,'Cheque',300000,'Entrega pendiente'),(13,'2021-11-06','Porsche 911',2,4,'Transferencia',1600000,'Entrega completada'),(14,'2023-04-01','Lexus LS',3,5,'Transferencia',1800000,'Entrega completada'),(15,'2017-04-01','Jeep Grand Cherokee',6,14,'Transferencia',3600000,'Entrega completada');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `id_depto` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `id_gerente` int NOT NULL,
  `cant_empleados` int NOT NULL,
  PRIMARY KEY (`id_depto`),
  KEY `fk_id_gerente_depto` (`id_gerente`),
  CONSTRAINT `fk_id_gerente_depto` FOREIGN KEY (`id_gerente`) REFERENCES `gerentes` (`id_gerente`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Ventas',1,7),(2,'Marketing',2,6),(3,'Taller mecanico',3,10),(4,'Administracion general',4,4),(5,'Compras',6,8),(6,'Recursos humanos',7,5),(7,'Financiamiento',8,7),(8,'Relaciones publicas',9,4),(9,'Seguros',10,9),(10,'Atencion al cliente',11,8),(11,'Contabilidad',12,7),(12,'Logistica',13,6),(13,'Servicio tecnico',14,6),(14,'Limpieza y mantenimiento',5,9),(15,'Desarrollo de negocios',15,10);
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `id_depto` int NOT NULL,
  `dni` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` int NOT NULL,
  `fech_nac` date NOT NULL,
  `puesto` varchar(100) NOT NULL,
  `sueldo` int NOT NULL,
  `alta` date NOT NULL,
  PRIMARY KEY (`id_empleado`),
  KEY `fk_id_departamento` (`id_depto`),
  CONSTRAINT `fk_id_departamento` FOREIGN KEY (`id_depto`) REFERENCES `departamentos` (`id_depto`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,1,56235987,'Juan Alarcon',1165893024,'2001-06-11','Vendedor',180000,'2022-04-15'),(2,11,89029032,'Lucia Dias',1178003719,'1990-12-01','Contador',190000,'2010-11-02'),(3,3,54893025,'Mateo Rios',1187330587,'2001-07-20','Mecanico',185000,'2023-02-25'),(4,3,98327024,'Sofia Ruiz',1145398702,'1989-09-30','Mecanico',185000,'2012-12-01'),(5,1,18493725,'Victoria Lopez',1100679452,'1982-12-01','Recepcionista',190000,'1996-09-09'),(6,3,89654123,'Camilo Gutierrez',1102306719,'1982-03-10','Mecanico',195000,'1998-03-29'),(7,6,43128965,'Martin Varella',1130698755,'2000-12-31','Asistente de recursos humanos',190000,'2019-04-22'),(8,10,24893157,'Natalia Castro',1145309688,'2001-01-30','Asistente de atencion al cliente',180000,'2020-01-25'),(9,3,90153759,'Lucas Martinez',1121740952,'1973-09-18','Mecanico',200000,'2012-08-09'),(10,6,43176902,'Valeria Lopez',1165130285,'1985-11-01','Asistente de recursos humanos',175000,'2004-10-10'),(11,2,85023756,'Matias Rodriguez',1121354602,'2000-10-07','Lider de proyectos en marketing',250000,'2023-06-17'),(12,11,30963147,'Isabella Garcia',1154023152,'1990-08-16','Asistente contable',185000,'2010-02-18'),(13,13,50159753,'Juan Perez',1180365125,'1989-07-23','Servicio tecnico Sr',200000,'2022-09-15'),(14,7,87456321,'Sofia Fernandez',1109821575,'1985-03-25','Asesor financiero',190000,'2023-01-25'),(15,8,46132798,'Gabriel Ramirez',1185160985,'1978-06-02','Asesor de relaciones institucionales',195000,'2018-04-01'),(16,15,12320978,'Camila Torres',1179821352,'1971-01-01','Analista de negocios',225000,'2001-11-15'),(17,10,82029174,'Sebastian Gonzalez',1180266574,'1997-10-07','Agente de atencion al cliente',180000,'2017-09-13'),(18,9,49528302,'Victoria Morales',1103824028,'1999-06-11','Agente de seguros',185000,'2021-12-09'),(19,1,25463910,'Alejandro Castro',1102981054,'1998-02-06','Analista de facturacion',200000,'2023-02-14'),(20,14,43320951,'Natalia Sanchez',1125820236,'2001-12-11','Personal de Limpieza y Mantenimiento',180000,'2022-06-11'),(21,1,53541798,'Rogelio Fernandez',1160257305,'1983-05-30','Vendedor',150000,'2019-08-23'),(22,12,73861149,'Sebastian Nadal',1180351687,'1990-09-16','Transporte y distribución',195000,'2018-09-12');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_update_empleados` BEFORE UPDATE ON `empleados` FOR EACH ROW BEGIN

  INSERT INTO log_empleados (accion, nombre_tabla, campo_viejo, campo_nuevo, usuario, hora_log, fecha_upd)
  VALUES ('Update', 'Empleados', OLD.sueldo , NEW.sueldo, CURRENT_USER(), CURRENT_TIME(), CURDATE());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `gerentes`
--

DROP TABLE IF EXISTS `gerentes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `gerentes` (
  `id_gerente` int NOT NULL AUTO_INCREMENT,
  `dni` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `telefono` int NOT NULL,
  `fech_nac` date NOT NULL,
  `puesto` varchar(100) NOT NULL,
  `sueldo` int NOT NULL,
  `alta` date NOT NULL,
  PRIMARY KEY (`id_gerente`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gerentes`
--

LOCK TABLES `gerentes` WRITE;
/*!40000 ALTER TABLE `gerentes` DISABLE KEYS */;
INSERT INTO `gerentes` VALUES (1,43825732,'Franco Rodriguez',1132984565,'1996-11-02','Gerente de ventas',300000,'2021-12-16'),(2,23281947,'Tomas Torres',1100286097,'1989-02-25','Gerente de marketing',300000,'2010-05-09'),(3,38579642,'Benjamin Ortiz',1198003746,'1992-01-22','Gerente de mecanicos',350000,'2022-11-05'),(4,78921543,'Martina Sanchez',1130896627,'1987-04-23','Gerente general',550000,'2007-06-23'),(5,97532168,'Rodrigo Martinez',1130689832,'1988-09-25','Gerente de limpieza y mantenimiento',300000,'2011-02-19'),(6,52436781,'Samuel Garcia',1198035937,'1996-08-01','Gerente de compras',325000,'2016-02-15'),(7,65789214,'Ramiro Cuevas',1189450222,'1980-11-11','Gerente de recursos humanos',300000,'2017-07-16'),(8,98236071,'Nicolas Romero',1185203696,'1975-05-11','Gerente de financiamiento',355000,'1999-09-17'),(9,80123987,'Juana Dominguez',1100892546,'1976-08-06','Gerente de relaciones publicas',355000,'2006-12-03'),(10,79023765,'Emiliano Martinez',1128463652,'1992-08-09','Gerente de seguros',375000,'2019-06-19'),(11,20396415,'Christian Romero',1177205627,'1998-04-27','Gerente de atencion al cliente',300000,'2018-04-25'),(12,46823654,'Lisandro Molina',1109836528,'1970-12-05','Gerente de contabilidad',325000,'1994-05-12'),(13,85369142,'Nahuel Fernandez',1180369654,'1980-06-11','Gerente de logistica',350000,'2004-08-19'),(14,23459701,'Lautaro Martinez',1155336688,'1990-02-22','Gerente de servicio tecnico',450000,'2015-12-30'),(15,34423417,'Julian Alvarez',1154035675,'1982-01-31','Gerente de desarrollo de negocios',400000,'2014-11-28'),(16,85012395,'Juan Cruz Rondon',1152018936,'1989-05-06','Gerente de servicio y postventa',400000,'2014-04-16'),(17,23017895,'Alejandra Farias',1123054789,'1994-12-19','Gerente de operaciones',350000,'2017-11-15'),(18,12503854,'Juana Lopez',1198752512,'1984-04-21','Gerente financiero',375000,'2011-07-04');
/*!40000 ALTER TABLE `gerentes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_empleados`
--

DROP TABLE IF EXISTS `log_empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_empleados` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `accion` varchar(10) DEFAULT NULL,
  `nombre_tabla` varchar(50) DEFAULT NULL,
  `campo_nuevo` varchar(100) DEFAULT NULL,
  `campo_viejo` varchar(100) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `hora_log` time DEFAULT NULL,
  `fecha_upd` date DEFAULT NULL,
  `fecha_ins` date DEFAULT NULL,
  `fecha_del` date DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_empleados`
--

LOCK TABLES `log_empleados` WRITE;
/*!40000 ALTER TABLE `log_empleados` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_empleados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log_ventas`
--

DROP TABLE IF EXISTS `log_ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `log_ventas` (
  `id_log` int NOT NULL AUTO_INCREMENT,
  `accion` varchar(10) DEFAULT NULL,
  `nombre_tabla` varchar(50) DEFAULT NULL,
  `campo_nuevo` varchar(100) DEFAULT NULL,
  `campo_viejo` varchar(100) DEFAULT NULL,
  `usuario` varchar(100) DEFAULT NULL,
  `hora_log` time DEFAULT NULL,
  `fecha_upd` date DEFAULT NULL,
  `fecha_ins` date DEFAULT NULL,
  `fecha_del` date DEFAULT NULL,
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log_ventas`
--

LOCK TABLES `log_ventas` WRITE;
/*!40000 ALTER TABLE `log_ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `log_ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `id_prov` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `telefono` int NOT NULL,
  `mail` varchar(100) NOT NULL,
  PRIMARY KEY (`id_prov`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'Proveedor 1',55551987,'proveedor1@gmail.com'),(2,'Proveedor 2',55559736,'proveedor2@gmail.com'),(3,'Proveedor 3',55558624,'proveedor3@gmail.com'),(4,'Proveedor 4',55556347,'proveedor4@gmail.com'),(5,'Proveedor 5',55559766,'proveedor5@gmail.com'),(6,'Proveedor 6',55556658,'proveedor6@gmail.com'),(7,'Proveedor 7',55553789,'proveedor7@gmail.com'),(8,'Proveedor 8',55556402,'proveedor8@gmail.com'),(9,'Proveedor 9',55557955,'proveedor9@gmail.com'),(10,'Proveedor 10',55557933,'proveedor10@gmail.com'),(11,'Proveedor 11',55555589,'proveedor11@gmail.com'),(12,'Proveedor 12',55552844,'proveedor12@gmail.com'),(13,'Proveedor 13',55555596,'proveedor13@gmail.com'),(14,'Proveedor 14',55553388,'proveedor14@gmail.com'),(15,'Proveedor 15',55557749,'proveedor15@gmail.com'),(16,'Proveedor 16',55551977,'proveedor16@gmail.com'),(17,'Proveedor 17',55550060,'proveedor17@gmail.com'),(18,'Proveedor 18',55551819,'proveedor18@gmail.com'),(19,'Proveedor 19',55551938,'proveedor19@gmail.com'),(20,'Proveedor 20',55558955,'proveedor20@gmail.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `id_service` int NOT NULL AUTO_INCREMENT,
  `id_auto` int NOT NULL,
  `id_empleado` int NOT NULL,
  `id_cliente` int NOT NULL,
  `service` varchar(300) NOT NULL,
  `fecha_service` date NOT NULL,
  PRIMARY KEY (`id_service`),
  KEY `fk_id_auto_serv` (`id_auto`),
  KEY `fk_id_empleado_serv` (`id_empleado`),
  KEY `fk_id_cliente_serv` (`id_cliente`),
  CONSTRAINT `fk_id_auto_serv` FOREIGN KEY (`id_auto`) REFERENCES `autos` (`id_auto`),
  CONSTRAINT `fk_id_cliente_serv` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`),
  CONSTRAINT `fk_id_empleado_serv` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
INSERT INTO `service` VALUES (1,13,3,5,'Cambio de aceite','2023-05-01'),(2,6,4,4,'Mantenimiento de frenos','2023-04-23'),(3,4,9,11,'Alineacion y balanceo','2023-03-03'),(4,11,6,15,'Cambio de neumaticos','2016-05-27'),(5,14,6,2,'Mantenimiento del sistema de refrigeracion','2022-05-27'),(6,8,4,14,'Mantenimiento del sistema electrico','2015-11-06'),(7,9,9,15,'Cambio de correa de distribucion','2022-05-19'),(8,5,9,7,'Cambio de filtros','2014-04-23'),(9,1,3,10,'Mantenimiento del sistema de suspension','2016-09-15'),(10,12,6,8,'Servicio de limpieza','2021-08-11'),(11,7,4,6,'Cambio de liquido de frenos','2023-04-01'),(12,14,9,3,'Inspeccion del sistema de escape','2021-09-11'),(13,2,3,4,'Mantenimiento del sistema de suspension','2022-06-23'),(14,15,6,6,'Cambio de batería','2017-04-04'),(15,15,4,12,'Cambio de bujias y cables de encendido','2018-12-05');
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `fecha_venta` date NOT NULL,
  `id_auto` int NOT NULL,
  `id_cliente` int NOT NULL,
  `monto` int NOT NULL,
  `metodo_pago` varchar(100) DEFAULT NULL,
  `metodo_entrega` varchar(100) DEFAULT NULL,
  `estado` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `fk_id_auto_ventas` (`id_auto`),
  KEY `fk_id_cli_ventas` (`id_cliente`),
  CONSTRAINT `fk_id_auto_ventas` FOREIGN KEY (`id_auto`) REFERENCES `autos` (`id_auto`),
  CONSTRAINT `fk_id_cli_ventas` FOREIGN KEY (`id_cliente`) REFERENCES `clientes` (`id_cliente`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
INSERT INTO `ventas` VALUES (1,'2022-12-22',7,6,705000,'Efectivo','Envio','Entrega completada'),(2,'2014-06-18',3,12,500000,'Cheque','Retiro','Entrega completada'),(3,'2019-02-14',2,9,750000,'Transferencia','Retiro','Entrega completada'),(4,'2021-05-01',14,2,850000,'Cheque','Retiro','Entrega completada'),(5,'2013-12-24',8,14,550000,'Efectivo','Envio','Entrega completada'),(6,'2020-07-11',12,8,705000,'Efectivo','Envio','Entrega completada'),(7,'2023-01-16',6,4,800000,'Cheque','Envio','Entrega pendiente'),(8,'2022-12-31',4,11,675000,'Transferencia','Retiro','Entrega completada'),(9,'2014-03-29',1,10,605000,'Efectivo','Envio','Entrega completada'),(10,'2023-04-30',4,3,675000,'Transferencia','Retiro','Entrega pendiente'),(11,'2013-09-30',9,15,605000,'Efectivo','Retiro','Entrega completada'),(12,'2015-10-05',5,7,350000,'Cheque','Envio','Entrega completada'),(13,'2023-01-21',13,5,650000,'Transferencia','Envio','Entrega pendiente'),(14,'2013-12-24',5,8,350000,'Efectivo','Retiro','Entrega completada'),(15,'2016-04-30',15,13,650000,'Cheque','Retiro','Entrega completada'),(16,'2018-11-30',3,1,500000,'Cheque','Envio','Entrega completada'),(17,'2014-06-11',9,11,605000,'Efectivo','Envio','Entrega completada');
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trg_insert_ventas` AFTER INSERT ON `ventas` FOR EACH ROW BEGIN

  INSERT INTO log_ventas (accion, nombre_tabla, campo_nuevo, usuario, hora_log, fecha_ins)
  VALUES ('Insert', 'Ventas', NEW.id_venta, CURRENT_USER(), CURRENT_TIME(), CURDATE());

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `vw_estado_nuevo`
--

DROP TABLE IF EXISTS `vw_estado_nuevo`;
/*!50001 DROP VIEW IF EXISTS `vw_estado_nuevo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_estado_nuevo` AS SELECT 
 1 AS `id_auto`,
 1 AS `id_prov`,
 1 AS `marca`,
 1 AS `modelo`,
 1 AS `color`,
 1 AS `fabricacion`,
 1 AS `estado`,
 1 AS `stock`,
 1 AS `precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_estado_usado`
--

DROP TABLE IF EXISTS `vw_estado_usado`;
/*!50001 DROP VIEW IF EXISTS `vw_estado_usado`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_estado_usado` AS SELECT 
 1 AS `id_auto`,
 1 AS `id_prov`,
 1 AS `marca`,
 1 AS `modelo`,
 1 AS `color`,
 1 AS `fabricacion`,
 1 AS `estado`,
 1 AS `stock`,
 1 AS `precio`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_info_departamentos`
--

DROP TABLE IF EXISTS `vw_info_departamentos`;
/*!50001 DROP VIEW IF EXISTS `vw_info_departamentos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_info_departamentos` AS SELECT 
 1 AS `departamento`,
 1 AS `cant_empleados`,
 1 AS `gerentes`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_info_service`
--

DROP TABLE IF EXISTS `vw_info_service`;
/*!50001 DROP VIEW IF EXISTS `vw_info_service`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_info_service` AS SELECT 
 1 AS `fecha_service`,
 1 AS `marca`,
 1 AS `modelo`,
 1 AS `cliente`,
 1 AS `empleado`,
 1 AS `service`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ventas_2018_2023`
--

DROP TABLE IF EXISTS `vw_ventas_2018_2023`;
/*!50001 DROP VIEW IF EXISTS `vw_ventas_2018_2023`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ventas_2018_2023` AS SELECT 
 1 AS `fecha_venta`,
 1 AS `marca`,
 1 AS `modelo`,
 1 AS `cliente`,
 1 AS `monto`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `vw_ventas_efectivo`
--

DROP TABLE IF EXISTS `vw_ventas_efectivo`;
/*!50001 DROP VIEW IF EXISTS `vw_ventas_efectivo`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vw_ventas_efectivo` AS SELECT 
 1 AS `fecha_venta`,
 1 AS `cliente`,
 1 AS `id_auto`,
 1 AS `monto`,
 1 AS `metodo_pago`*/;
SET character_set_client = @saved_cs_client;

--
-- Dumping events for database 'concesionaria'
--

--
-- Dumping routines for database 'concesionaria'
--
/*!50003 DROP FUNCTION IF EXISTS `fn_cant_empleados` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_cant_empleados`(depto_id INT) RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE cantidad_empleados INT;
  SELECT cant_empleados INTO cantidad_empleados
  FROM departamentos
  WHERE id_depto = depto_id;
  RETURN cantidad_empleados;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fn_valor_total_metodo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fn_valor_total_metodo`(metodo_pago VARCHAR (25)) RETURNS int
    DETERMINISTIC
BEGIN
  DECLARE total_metodo INT;
  SET total_metodo = (SELECT sum(monto) FROM ventas AS v WHERE v.metodo_pago = metodo_pago);
  RETURN total_metodo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_insert_delete_proveedor` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_insert_delete_proveedor`(
											 IN sp_id_prov INT,
											 IN sp_nombre VARCHAR(100),
											 IN sp_telefono INT,
											 IN sp_mail VARCHAR(100),
											 IN sp_action VARCHAR(10)
                                             )
BEGIN
  IF sp_action = 'insert' THEN
    INSERT INTO proveedores (id_prov, nombre, telefono, mail)
    VALUES (sp_id_prov, sp_nombre, sp_telefono, sp_mail);
  ELSEIF sp_action = 'delete' THEN
    DELETE FROM proveedores WHERE id_prov = sp_id_prov;
  END IF;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_ordenar_tabla` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_ordenar_tabla`(
								   IN sp_nombre_tabla VARCHAR(100),
								   IN sp_campo_orden VARCHAR(100),
								   IN sp_tipo_orden VARCHAR(10)
								   )
BEGIN
  SET @query = CONCAT('SELECT * FROM ', sp_nombre_tabla, ' ORDER BY ', sp_campo_orden, ' ', sp_tipo_orden);
  PREPARE stmt FROM @query;
  EXECUTE stmt;
  DEALLOCATE PREPARE stmt;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `vw_estado_nuevo`
--

/*!50001 DROP VIEW IF EXISTS `vw_estado_nuevo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_estado_nuevo` AS select `autos`.`id_auto` AS `id_auto`,`autos`.`id_prov` AS `id_prov`,`autos`.`marca` AS `marca`,`autos`.`modelo` AS `modelo`,`autos`.`color` AS `color`,`autos`.`fabricacion` AS `fabricacion`,`autos`.`estado` AS `estado`,`autos`.`stock` AS `stock`,`autos`.`precio` AS `precio` from `autos` where (`autos`.`estado` = 'Nuevo') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_estado_usado`
--

/*!50001 DROP VIEW IF EXISTS `vw_estado_usado`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_estado_usado` AS select `autos`.`id_auto` AS `id_auto`,`autos`.`id_prov` AS `id_prov`,`autos`.`marca` AS `marca`,`autos`.`modelo` AS `modelo`,`autos`.`color` AS `color`,`autos`.`fabricacion` AS `fabricacion`,`autos`.`estado` AS `estado`,`autos`.`stock` AS `stock`,`autos`.`precio` AS `precio` from `autos` where (`autos`.`estado` = 'Usado') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_info_departamentos`
--

/*!50001 DROP VIEW IF EXISTS `vw_info_departamentos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_info_departamentos` AS select `d`.`nombre` AS `departamento`,`d`.`cant_empleados` AS `cant_empleados`,`g`.`nombre` AS `gerentes` from (`departamentos` `d` join `gerentes` `g` on((`d`.`id_gerente` = `g`.`id_gerente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_info_service`
--

/*!50001 DROP VIEW IF EXISTS `vw_info_service`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_info_service` AS select `s`.`fecha_service` AS `fecha_service`,`a`.`marca` AS `marca`,`a`.`modelo` AS `modelo`,`c`.`nombre` AS `cliente`,`e`.`nombre` AS `empleado`,`s`.`service` AS `service` from (((`service` `s` join `autos` `a` on((`s`.`id_auto` = `a`.`id_auto`))) join `empleados` `e` on((`s`.`id_empleado` = `e`.`id_empleado`))) join `clientes` `c` on((`s`.`id_cliente` = `c`.`id_cliente`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ventas_2018_2023`
--

/*!50001 DROP VIEW IF EXISTS `vw_ventas_2018_2023`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ventas_2018_2023` AS select `v`.`fecha_venta` AS `fecha_venta`,`a`.`marca` AS `marca`,`a`.`modelo` AS `modelo`,`c`.`nombre` AS `cliente`,`v`.`monto` AS `monto` from ((`ventas` `v` join `autos` `a` on((`v`.`id_auto` = `a`.`id_auto`))) join `clientes` `c` on((`v`.`id_cliente` = `c`.`id_cliente`))) where (`v`.`fecha_venta` between '2018-01-01' and '2023-12-31') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vw_ventas_efectivo`
--

/*!50001 DROP VIEW IF EXISTS `vw_ventas_efectivo`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vw_ventas_efectivo` AS select `v`.`fecha_venta` AS `fecha_venta`,`c`.`nombre` AS `cliente`,`v`.`id_auto` AS `id_auto`,`v`.`monto` AS `monto`,`v`.`metodo_pago` AS `metodo_pago` from (`ventas` `v` join `clientes` `c` on((`v`.`id_cliente` = `c`.`id_cliente`))) where (`v`.`metodo_pago` like 'Efec%') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-06-17 16:38:24
