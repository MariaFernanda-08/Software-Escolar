-- --------------------------------------------------------
-- Servidor:                     127.0.0.1
-- Versão do servidor:           10.4.32-MariaDB - mariadb.org binary distribution
-- OS do Servidor:               Win64
-- HeidiSQL Versão:              12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Copiando estrutura do banco de dados para software_escolar
CREATE DATABASE IF NOT EXISTS `software_escolar` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `software_escolar`;

-- Copiando estrutura para tabela software_escolar.log_login
CREATE TABLE IF NOT EXISTS `log_login` (
  `id_log` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(100) NOT NULL,
  `ip` varchar(45) NOT NULL,
  `sql_executado` text NOT NULL,
  `parametros` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `resultado` varchar(10) NOT NULL,
  `data_hora` datetime NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`id_log`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela software_escolar.log_login: ~4 rows (aproximadamente)
INSERT INTO `log_login` (`id_log`, `usuario`, `ip`, `sql_executado`, `parametros`, `resultado`, `data_hora`) VALUES
	(1, 'Julia', '::ffff:127.0.0.1', 'SELECT * FROM usuarios WHERE usuario = ? and senha = ? LIMIT 1;', '{"usuario":"Julia","senha":"0412"}', 'sucesso', '2025-11-06 15:28:05'),
	(2, 'Fer', '::ffff:127.0.0.1', 'SELECT * FROM usuarios WHERE usuario = ? and senha = ? LIMIT 1;', '{"usuario":"Fer","senha":"0908"}', 'falha', '2025-11-06 15:28:48'),
	(3, 'Fer', '::ffff:127.0.0.1', 'SELECT * FROM usuarios WHERE usuario = ? and senha = ? LIMIT 1;', '{"usuario":"Fer","senha":"0908"}', 'falha', '2025-11-06 15:49:02'),
	(4, 'Eric', '::ffff:127.0.0.1', 'SELECT * FROM usuarios WHERE usuario = ? and senha = ? LIMIT 1;', '{"usuario":"Eric","senha":"rex"}', 'sucesso', '2025-11-06 15:49:15');

-- Copiando estrutura para tabela software_escolar.usuarios
CREATE TABLE IF NOT EXISTS `usuarios` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `usuario` varchar(50) NOT NULL,
  `senha` varchar(50) NOT NULL,
  `data_hora` datetime NOT NULL,
  PRIMARY KEY (`id_usuario`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Copiando dados para a tabela software_escolar.usuarios: ~2 rows (aproximadamente)
INSERT INTO `usuarios` (`id_usuario`, `usuario`, `senha`, `data_hora`) VALUES
	(1, 'Julia', '0412', '2025-11-06 14:14:33'),
	(2, 'Eric', 'rex', '2025-11-06 14:17:11');

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
