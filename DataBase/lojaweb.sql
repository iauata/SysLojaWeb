-- MySQL dump 10.13  Distrib 5.7.17, for Win64 (x86_64)
--
-- Host: localhost    Database: lojaweb
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.8-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tab_categorias`
--

DROP TABLE IF EXISTS `tab_categorias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab_categorias` (
  `id_categoria` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ds_categoria` varchar(45) NOT NULL,
  PRIMARY KEY (`id_categoria`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab_categorias`
--

LOCK TABLES `tab_categorias` WRITE;
/*!40000 ALTER TABLE `tab_categorias` DISABLE KEYS */;
/*!40000 ALTER TABLE `tab_categorias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab_produtos`
--

DROP TABLE IF EXISTS `tab_produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab_produtos` (
  `id_produto` int(11) NOT NULL,
  `ds_produto` varchar(45) NOT NULL,
  `dthr_cadastro` datetime NOT NULL,
  `usuario_cadastro` int(10) unsigned NOT NULL,
  `preco_venda` decimal(8,2) NOT NULL,
  `foto` blob,
  `id_categoria` int(10) unsigned NOT NULL,
  `status` tinyint(4) NOT NULL COMMENT '1-Ativo e 2-Inativo',
  PRIMARY KEY (`id_produto`),
  KEY `fk_tab_produtos_tab_usuario1_idx` (`usuario_cadastro`),
  KEY `fk_tab_produtos_tab_categorias1_idx` (`id_categoria`),
  CONSTRAINT `fk_tab_produtos_tab_categorias` FOREIGN KEY (`id_categoria`) REFERENCES `tab_categorias` (`id_categoria`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_tab_produtos_tab_usuario1` FOREIGN KEY (`usuario_cadastro`) REFERENCES `tab_usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab_produtos`
--

LOCK TABLES `tab_produtos` WRITE;
/*!40000 ALTER TABLE `tab_produtos` DISABLE KEYS */;
/*!40000 ALTER TABLE `tab_produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab_tipo_usuario`
--

DROP TABLE IF EXISTS `tab_tipo_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab_tipo_usuario` (
  `id_tipo_usuario` tinyint(3) unsigned NOT NULL AUTO_INCREMENT,
  `ds_tipo_usuario` varchar(45) NOT NULL,
  PRIMARY KEY (`id_tipo_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab_tipo_usuario`
--

LOCK TABLES `tab_tipo_usuario` WRITE;
/*!40000 ALTER TABLE `tab_tipo_usuario` DISABLE KEYS */;
INSERT INTO `tab_tipo_usuario` VALUES (1,'Administrador'),(2,'Operador');
/*!40000 ALTER TABLE `tab_tipo_usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tab_usuario`
--

DROP TABLE IF EXISTS `tab_usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tab_usuario` (
  `id_usuario` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nm_usuario` varchar(45) NOT NULL,
  `login` varchar(45) NOT NULL,
  `senha` varchar(45) NOT NULL,
  `email` varchar(80) NOT NULL,
  `id_tipo_usuario` tinyint(3) unsigned NOT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `idx_tab_usuario_01` (`id_tipo_usuario`),
  CONSTRAINT `fk_tab_usuario_tab_tipo_usuario` FOREIGN KEY (`id_tipo_usuario`) REFERENCES `tab_tipo_usuario` (`id_tipo_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tab_usuario`
--

LOCK TABLES `tab_usuario` WRITE;
/*!40000 ALTER TABLE `tab_usuario` DISABLE KEYS */;
INSERT INTO `tab_usuario` VALUES (1,'Administrador','ADMIN','lojaweb','iauata@hotmail.com',1);
/*!40000 ALTER TABLE `tab_usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_tab_user_BI` BEFORE INSERT ON `tab_usuario` FOR EACH ROW BEGIN
       SET NEW.senha = fct_crypt_str(NEW.senha);
       SET NEW.login = UPPER(NEW.login);
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
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `tg_tab_user_BU` BEFORE UPDATE ON `tab_usuario` FOR EACH ROW BEGIN
       IF NEW.senha <> OLD.senha THEN
         SET NEW.senha = fct_crypt_str(NEW.senha);         
       END IF;
       IF NEW.login <> OLD.login THEN
         SET NEW.login = UPPER(NEW.login);
       END IF;       
    END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Dumping events for database 'lojaweb'
--

--
-- Dumping routines for database 'lojaweb'
--
/*!50003 DROP FUNCTION IF EXISTS `fct_crypt_str` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fct_crypt_str`(p_str VARCHAR(15)) RETURNS varchar(40) CHARSET latin1
BEGIN    
                        
     RETURN SHA1(p_str);  
     
 END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `fct_ValidaUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `fct_ValidaUsuario`(v_login VARCHAR(45), v_senha VARCHAR(45)) RETURNS int(11)
BEGIN
   
   DECLARE vid_usuario INT;
   
   SELECT id_usuario
     INTO vid_usuario
     FROM tab_usuario
    WHERE login = UPPER(v_login)
      AND senha = fct_crypt_str(v_senha);
   
   RETURN IFNULL(vid_usuario,0);

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_InsereUsuario` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_InsereUsuario`(in v_nmusu  VARCHAR(45), in v_login VARCHAR(45), 
                                  in v_senha VARCHAR(45), in v_email VARCHAR(80), in v_tipouser tinyint(3), out iduser int)
BEGIN
	IF ( (v_nmusu != '') && (v_login != '') && (v_senha != '') && (v_email != '') && (IFNULL(v_tipouser, 0) > 0) ) THEN
	    
        INSERT INTO tab_usuario (nm_usuario, login,   senha,   email,   id_tipo_usuario)
						 VALUES (v_nome,     v_login, v_senha, v_email, v_tipouser );
		
        SELECT LAST_INSERT_ID() as iduser;
        
    ELSE
        SELECT 'Há campos vazios!' AS Msg;
    END IF; 
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

-- Dump completed on 2018-07-02  2:47:40
