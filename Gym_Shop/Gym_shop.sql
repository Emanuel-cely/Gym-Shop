CREATE DATABASE  IF NOT EXISTS `gym_shop` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `gym_shop`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: gym_shop
-- ------------------------------------------------------
-- Server version	8.0.38

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
-- Table structure for table `compras`
--

DROP TABLE IF EXISTS `compras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compras` (
  `id` bigint unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `direccion` varchar(255) NOT NULL,
  `forma_pago` varchar(50) NOT NULL,
  `total` decimal(10,2) NOT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compras`
--

LOCK TABLES `compras` WRITE;
/*!40000 ALTER TABLE `compras` DISABLE KEYS */;
INSERT INTO `compras` VALUES (1,'Cristian David Fuentes Caina','ccaina@uniempresarial.edu.co','carrera 87 B #73 a 58 sur','efectivo',59.98,'2024-09-26 17:43:50'),(2,'Emanuel','Ecely@uniempresarial.edu.co','vive en suba','paypal',194.96,'2024-09-26 18:02:41'),(3,'Cristian David Fuentes Caina ','cristiancaina@gmail.com','carrera 87 B #73 a 58 sur','efectivo',49.98,'2024-09-26 18:28:31'),(4,'Cristian David Fuentes Caina ','cristiancaina@gmail.com','carrera 87 B #73 a 58 sur','tarjeta',54.98,'2024-09-26 18:36:19');
/*!40000 ALTER TABLE `compras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `contacto`
--

DROP TABLE IF EXISTS `contacto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contacto` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `correo_electronico` varchar(100) NOT NULL,
  `mensaje` text NOT NULL,
  `latitud` decimal(10,8) DEFAULT NULL,
  `longitud` decimal(11,8) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contacto`
--

LOCK TABLES `contacto` WRITE;
/*!40000 ALTER TABLE `contacto` DISABLE KEYS */;
INSERT INTO `contacto` VALUES (1,'CRISTIÁN DAVID FUENTES CAINA','cristiancaina@gmail.com','el pepe',4.62129100,-74.19228100,'2024-09-26 00:07:31');
/*!40000 ALTER TABLE `contacto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `producto_id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `descripcion` text,
  `precio` decimal(10,2) NOT NULL,
  `stock` int NOT NULL,
  `imagen_url` varchar(999) DEFAULT NULL,
  PRIMARY KEY (`producto_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,'Proteína Whey Isolate','Proteína de suero aislada para deportistas',39.99,100,'https://www.optimumnutrition.com.co/wp-content/uploads/2023/08/gold-isolate-5-lb-vanilla.jpg '),(2,'Proteína Caseína','Proteína de digestión lenta ideal para la noche',34.99,50,'https://nutrafitcolombia.com/wp-content/uploads/2024/07/elite-casein-4-libras-vainilla.webp '),(3,'Multivitamínico Complejo','Vitaminas esenciales para la salud diaria',19.99,150,'https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/msc/msc61017/y/24.jpg '),(4,'Vitamina C 1000mg','Suplemento para mejorar el sistema inmune',9.99,200,'https://media.harkercentropediatrico.com/tienda/250-large_default/vitamina-c-masticable-sobre-x-10.jpg '),(5,'BCAA','Aminoácidos esenciales para la recuperación muscular',24.99,120,'https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/opn/opn02036/y/48.jpg '),(6,'Glutamina','Aminoácido que favorece la recuperación post-entreno',14.99,80,'https://cloudinary.images-iherb.com/image/upload/f_auto,q_auto:eco/images/opn/opn02281/y/46.jpg'),(7,'Pre-entreno con cafeína','Suplemento energético para mejorar el rendimiento',29.99,60,'https://cdnx.jumpseller.com/mis-vitaminas/image/40169546/resize/1200/1200?1695655790'),(8,'Bebida energética natural','Bebida para aumentar la energía de forma natural',19.99,100,'https://licoresmedellin.com/cdn/shop/files/BEBIDA_ENERGIZANTE_REDBULL_GRANDE_355ML.jpg?v=1718984424&width=1024'),(9,'Testosterona Enantato','Esteroide para el aumento de masa muscular',79.99,30,'https://dojiw2m9tvv09.cloudfront.net/76774/product/enantato3508.gif'),(10,'Dianabol','Esteroide oral para crecimiento muscular rápido',99.99,15,'https://cdn11.bigcommerce.com/s-2wcupekyn6/images/stencil/1280x1280/products/3274/27472/Dianabol_60Ct_Bottle_New__89634.1704737159.png?c=1'),(11,'Creatina Monohidratada','Suplemento para mejorar la fuerza y resistencia',19.99,150,'https://alphamakerco.com/wp-content/uploads/2023/11/creatina-platinum-muscletech.png'),(12,'Creatina Micronizada','Creatina de rápida absorción para mejor rendimiento',24.99,120,'https://www.optimumnutrition.com.co/wp-content/uploads/2023/08/creatine-optimum-300-gr.jpg');
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_productos_update` AFTER UPDATE ON `productos` FOR EACH ROW BEGIN
    -- Verifica si hubo cambios en el precio o el stock
    IF OLD.precio != NEW.precio OR OLD.stock != NEW.stock THEN
        INSERT INTO productos_audit (producto_id, accion, old_precio, new_precio, old_stock, new_stock)
        VALUES (NEW.producto_id, 'UPDATE', OLD.precio, NEW.precio, OLD.stock, NEW.stock);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `trigger_productos_delete` BEFORE DELETE ON `productos` FOR EACH ROW BEGIN
    INSERT INTO productos_audit (producto_id, nombre, descripcion, precio, stock, imagen_url, accion)
    VALUES (OLD.producto_id, OLD.nombre, OLD.descripcion, OLD.precio, OLD.stock, OLD.imagen_url, 'DELETE');
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `productos_audit`
--

DROP TABLE IF EXISTS `productos_audit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos_audit` (
  `audit_id` int NOT NULL AUTO_INCREMENT,
  `producto_id` int DEFAULT NULL,
  `nombre` varchar(255) DEFAULT NULL,
  `descripcion` text,
  `precio` decimal(10,2) DEFAULT NULL,
  `stock` int DEFAULT NULL,
  `imagen_url` varchar(255) DEFAULT NULL,
  `accion` varchar(50) DEFAULT NULL,
  `fecha` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`audit_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_audit`
--

LOCK TABLES `productos_audit` WRITE;
/*!40000 ALTER TABLE `productos_audit` DISABLE KEYS */;
INSERT INTO `productos_audit` VALUES (1,13,'dasdsad','dasdasd',4654.00,54,'dsdstafdhtgasfhtasft','DELETE','2024-09-26 18:20:28');
/*!40000 ALTER TABLE `productos_audit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `recomendaciones`
--

DROP TABLE IF EXISTS `recomendaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `recomendaciones` (
  `recomendacion_id` int NOT NULL AUTO_INCREMENT,
  `razon` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`recomendacion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `recomendaciones`
--

LOCK TABLES `recomendaciones` WRITE;
/*!40000 ALTER TABLE `recomendaciones` DISABLE KEYS */;
INSERT INTO `recomendaciones` VALUES (1,'Basado en tus compras previas de anabólicos.'),(2,'Usuarios similares compraron Proteína Whey.'),(3,'Interesado en productos para pérdida de grasa.'),(4,'Mejor venta en productos anabólicos.'),(5,'Basado en tu compra de Proteínas.'),(6,'Usuarios que compraron Dianabol también compraron Testosterona.'),(7,'Basado en tus intereses en productos de fuerza.'),(8,'Productos anabólicos recomendados según tus preferencias.'),(9,'Proteínas recomendadas para complementar tu rutina.');
/*!40000 ALTER TABLE `recomendaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `testimonio`
--

DROP TABLE IF EXISTS `testimonio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `testimonio` (
  `id` int NOT NULL AUTO_INCREMENT,
  `contenido` text,
  `autor` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `testimonio`
--

LOCK TABLES `testimonio` WRITE;
/*!40000 ALTER TABLE `testimonio` DISABLE KEYS */;
INSERT INTO `testimonio` VALUES (1,'Un ambiente increíble para entrenar, me siento motivado cada día.','María L.'),(2,'Gracias a este gimnasio, he alcanzado mis metas de fitness en tiempo récord.','Juan P.'),(3,'Los entrenadores son muy atentos y siempre están dispuestos a ayudar.','Sofía G.'),(4,'Una experiencia transformadora, tanto en lo físico como en lo mental.','Andrés R.'),(5,'La variedad de clases y horarios me ha permitido adaptar el entrenamiento a mi rutina.','Carla M.'),(6,'Los suplementos que ofrecen son de alta calidad y realmente marcan la diferencia.','Diego V.'),(7,'Entrenar aquí es más que un ejercicio; es un estilo de vida que he adoptado felizmente.','Paula S.'),(8,'Desde que me uní a este gimnasio, he mejorado no solo mi físico sino también mi confianza.','Luis T.'),(9,'El equipamiento es moderno y siempre está limpio y disponible para su uso.','Natalia F.'),(10,'He probado varios gimnasios en la ciudad, pero este es el mejor por mucho.','Roberto C.'),(11,'La comunidad de miembros y entrenadores es como una gran familia.','Lorena D.'),(12,'Aquí he encontrado el apoyo que necesitaba para cambiar mi vida.','Daniel A.'),(13,'Los planes personalizados de entrenamiento realmente se adaptan a mis objetivos.','Fernanda K.'),(14,'Me encanta la energía positiva que se siente en cada rincón del gimnasio.','Sergio W.'),(15,'Los precios son justos y el valor que recibes es insuperable.','Gabriela N.');
/*!40000 ALTER TABLE `testimonio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'gym_shop'
--

--
-- Dumping routines for database 'gym_shop'
--
/*!50003 DROP PROCEDURE IF EXISTS `Insertar_Compras` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `Insertar_Compras`(
    IN p_nombre VARCHAR(255),
    IN p_email VARCHAR(255),
    IN p_direccion VARCHAR(255),
    IN p_forma_pago VARCHAR(50),
    IN p_total DECIMAL(10,2)
)
BEGIN
    INSERT INTO compras (nombre, email, direccion, forma_pago, total)
    VALUES (p_nombre, p_email, p_direccion, p_forma_pago, p_total);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-09-26 13:46:57
