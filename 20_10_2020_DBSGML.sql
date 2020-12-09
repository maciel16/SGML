-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Server version:               10.4.13-MariaDB - mariadb.org binary distribution
-- Server OS:                    Win64
-- HeidiSQL Version:             11.0.0.5919
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


-- Dumping database structure for sgml
CREATE DATABASE IF NOT EXISTS `sgml` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `sgml`;

-- Dumping structure for table sgml.aula
CREATE TABLE IF NOT EXISTS `aula` (
  `A_ID` int(11) NOT NULL AUTO_INCREMENT,
  `A_WDAY` varchar(50) NOT NULL,
  `A_HORA` varchar(50) NOT NULL,
  `LAB_ID` int(11) NOT NULL,
  `P_ID` varchar(50) NOT NULL,
  `D_ID` varchar(50) NOT NULL,
  `C_ID` varchar(50) NOT NULL,
  `A_SEMESTRE` varchar(50) NOT NULL,
  `A_TURMA` int(11) NOT NULL,
  `A_ANO` year(4) NOT NULL,
  `A_STATUS` varchar(50) NOT NULL,
  `A_REGDATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `A_LASTUPDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`A_WDAY`,`A_HORA`,`LAB_ID`,`A_ID`) USING BTREE,
  KEY `FK_C` (`C_ID`) USING BTREE,
  KEY `FK_D` (`D_ID`) USING BTREE,
  KEY `FK_L` (`LAB_ID`) USING BTREE,
  KEY `FK_P` (`P_ID`) USING BTREE,
  KEY `R_ID` (`A_ID`) USING BTREE,
  CONSTRAINT `FK_C` FOREIGN KEY (`C_ID`) REFERENCES `curso` (`C_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_D` FOREIGN KEY (`D_ID`) REFERENCES `disciplina` (`D_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_L` FOREIGN KEY (`LAB_ID`) REFERENCES `laboratorios` (`LAB_ID`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_P` FOREIGN KEY (`P_ID`) REFERENCES `professor` (`P_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table sgml.aula: ~3 rows (approximately)
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` (`A_ID`, `A_WDAY`, `A_HORA`, `LAB_ID`, `P_ID`, `D_ID`, `C_ID`, `A_SEMESTRE`, `A_TURMA`, `A_ANO`, `A_STATUS`, `A_REGDATE`, `A_LASTUPDATE`) VALUES
	(2, 'Segundas-Feiras', '07:40 - 09:20', 1, '0001', 'MMD001', '048', '1', 1, '2020', 'Ativo', '2020-10-13 00:21:21', '2020-10-13 00:21:21'),
	(1, 'Terças-Feiras', '09:30 - 11:10', 1, '0001', 'MMD001', '048', '1', 2, '2020', 'Em Andamento', '2020-10-08 15:03:03', '2020-10-13 00:21:38'),
	(3, 'Terças-Feiras', '19:00 - 20:40', 2, '0001', 'LIN200', '048', '2', 2, '2020', 'Em Andamento', '2020-10-20 11:22:36', '2020-10-20 15:44:02');
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;

-- Dumping structure for table sgml.computadores
CREATE TABLE IF NOT EXISTS `computadores` (
  `PC_CODPATRIMONIO` varchar(100) NOT NULL,
  `LAB_ID` int(11) NOT NULL,
  `PC_IDSISTEMA` varchar(255) NOT NULL,
  `PC_IPADRESS` varchar(255) NOT NULL,
  `PC_STATUS` varchar(255) NOT NULL,
  `PC_INFO_SO` varchar(255) NOT NULL,
  `PC_INFO_HDD` varchar(255) NOT NULL,
  `PC_INFO_RAM` varchar(255) NOT NULL,
  `PC_INFO_PROCESSOR` varchar(255) NOT NULL,
  `PC_REGDATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `PC_LASTUPDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`PC_CODPATRIMONIO`),
  KEY `FK_LAB_PC` (`LAB_ID`),
  CONSTRAINT `FK_LAB_PC` FOREIGN KEY (`LAB_ID`) REFERENCES `laboratorios` (`LAB_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table sgml.computadores: ~9 rows (approximately)
/*!40000 ALTER TABLE `computadores` DISABLE KEYS */;
INSERT INTO `computadores` (`PC_CODPATRIMONIO`, `LAB_ID`, `PC_IDSISTEMA`, `PC_IPADRESS`, `PC_STATUS`, `PC_INFO_SO`, `PC_INFO_HDD`, `PC_INFO_RAM`, `PC_INFO_PROCESSOR`, `PC_REGDATE`, `PC_LASTUPDATE`) VALUES
	('0001', 1, 'PC0101', '192.168.0.31', 'Ativo', 'Windows 10 x64 Build1909', '256 GB SSD', '8 GB', 'I5 7Gen', '2020-10-13 12:39:51', '2020-10-13 12:39:51'),
	('0002', 1, 'PC0102', '192.168.0.32', 'Ativo', 'Windows 10 x64 Build1909', '256 GB SSD', '8 GB', 'I5 7Gen', '2020-10-13 12:40:43', '2020-10-19 22:53:22'),
	('0003', 1, 'PC0103', '192.168.0.33', 'Ativo', 'Windows 10 x64 Build1909', '256 GB SSD', '8 GB', 'I5 7Gen', '2020-10-13 12:40:53', '2020-10-13 12:40:53'),
	('0004', 1, 'PC0104', '192.168.0.34', 'Em Manutenção', 'Windows 10 x64 Build1909', '256 GB SSD', '8 GB', 'I5 7Gen', '2020-10-13 12:41:04', '2020-10-13 12:45:04'),
	('0005', 1, 'PC0105', '192.168.0.35', 'Em Manutenção', 'Windows 10 x64 Build1909', '256 GB SSD', '8 GB', 'I5 7Gen', '2020-10-13 12:41:19', '2020-10-13 12:45:07'),
	('0006', 2, 'PC0201', '192.168.0.41', 'Ativo', 'Windows 10 x64 Build1909', '256 GB SSD', '8 GB', 'I5 7Gen', '2020-10-13 12:41:19', '2020-10-13 12:53:32'),
	('0007', 2, 'PC0202', '192.168.0.42', 'Ativo', 'Windows 10 x64 Build1909', '256 GB SSD', '8 GB', 'I5 7Gen', '2020-10-13 12:41:19', '2020-10-13 12:53:34'),
	('00075', 1, 'PC0104', '192.168.0.75', 'Em Manutenção', 'Windows 10', '256 GB', '8 GB', 'I5', '2020-10-20 15:34:49', '2020-10-20 15:39:09'),
	('0008', 2, 'PC0203', '192.168.0.43', 'Ativo', 'Windows 10 x64 Build1909', '256 GB SSD', '8 GB', 'I5 7Gen', '2020-10-13 12:41:19', '2020-10-13 12:53:40'),
	('0009', 3, 'PC0301', '192.168.0.51', 'Ativo', 'Windows 10 x64 Build1909', '256 GB SSD', '8 GB', 'I5 7Gen', '2020-10-13 12:41:19', '2020-10-13 12:58:48'),
	('0010', 3, 'PC0302', '192.168.0.52', 'Desabilitado', 'Windows 10 x64 Build1909', '256 GB SSD', '8 GB', 'I5 7Gen', '2020-10-13 12:41:19', '2020-10-13 15:08:57'),
	('0011', 1, 'PC0106', '192.168.0.36', 'Ativo', 'Windows 10 x64 Build1909', '256 GB SSD', '8 GB', 'I5 7Gen', '2020-10-13 12:41:19', '2020-10-13 13:02:47');
/*!40000 ALTER TABLE `computadores` ENABLE KEYS */;

-- Dumping structure for table sgml.curso
CREATE TABLE IF NOT EXISTS `curso` (
  `C_ID` varchar(50) NOT NULL,
  `C_NOME` varchar(255) NOT NULL,
  `C_COORDENADOR` varchar(100) NOT NULL,
  `C_STATUS` varchar(100) NOT NULL,
  `C_REGDATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `C_LASTUPDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`C_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table sgml.curso: ~3 rows (approximately)
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` (`C_ID`, `C_NOME`, `C_COORDENADOR`, `C_STATUS`, `C_REGDATE`, `C_LASTUPDATE`) VALUES
	('048', 'Análise e Desenvolvimento de Sistemas', 'Clerivaldo José Roccia', 'Ativo', '2020-10-08 15:00:54', '2020-10-13 00:16:40'),
	('074', 'Logística', ' Nelson Luís de Souza Corrêa', 'Ativo', '2020-10-13 00:20:21', '2020-10-13 00:20:21'),
	('097', 'Segurança da Informação', 'Rogério Freitas', 'Ativo', '2020-10-13 00:19:26', '2020-10-13 00:19:36');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;

-- Dumping structure for table sgml.disciplina
CREATE TABLE IF NOT EXISTS `disciplina` (
  `D_ID` varchar(50) NOT NULL,
  `D_NOME` varchar(100) NOT NULL,
  `D_AC` varchar(100) NOT NULL,
  `D_STATUS` varchar(100) NOT NULL,
  `D_REGDATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `D_LASTUPDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`D_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table sgml.disciplina: ~4 rows (approximately)
/*!40000 ALTER TABLE `disciplina` DISABLE KEYS */;
INSERT INTO `disciplina` (`D_ID`, `D_NOME`, `D_AC`, `D_STATUS`, `D_REGDATE`, `D_LASTUPDATE`) VALUES
	('IAL002', 'Algoritmos e Lógica de Programação', 'Ciências Exatas', 'Ativa', '2020-10-20 11:17:53', '2020-10-20 11:17:53'),
	('LIN100', 'Inglês I', 'Ciências Humanas', 'Ativa', '2020-10-20 11:18:36', '2020-10-20 11:18:36'),
	('LIN200', 'Inglês II', 'Ciências Humanas', 'Ativa', '2020-10-20 11:18:51', '2020-10-20 11:18:51'),
	('MMD001', 'Matemática Discreta', 'Ciências Exatas', 'Ativa', '2020-10-08 15:01:21', '2020-10-08 15:01:21');
/*!40000 ALTER TABLE `disciplina` ENABLE KEYS */;

-- Dumping structure for table sgml.laboratorios
CREATE TABLE IF NOT EXISTS `laboratorios` (
  `LAB_ID` int(11) NOT NULL,
  `LAB_NAME` varchar(100) NOT NULL,
  `LAB_STATUS` varchar(100) NOT NULL,
  `LAB_INFO_SOFTWARES` varchar(255) NOT NULL,
  `LAB_REGDATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `LAB_LASTUPDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`LAB_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table sgml.laboratorios: ~8 rows (approximately)
/*!40000 ALTER TABLE `laboratorios` DISABLE KEYS */;
INSERT INTO `laboratorios` (`LAB_ID`, `LAB_NAME`, `LAB_STATUS`, `LAB_INFO_SOFTWARES`, `LAB_REGDATE`, `LAB_LASTUPDATE`) VALUES
	(1, 'Laboratório 01', 'Ativo', 'Visual Studio 2019, Visual Studio Code, HeidSQL, SQLServer Managment Studio, Virtual Box, Chrome, Microsoft Edge, Pacote Office, NetBeans', '2020-10-08 14:11:29', '2020-10-13 13:02:47'),
	(2, 'Laboratório 02', 'Ativo', 'Visual Studio 2019, Visual Studio Code, HeidSQL, SQLServer Managment Studio, Virtual Box, Chrome, Microsoft Edge, Pacote Office, NetBeans', '2020-10-08 14:11:29', '2020-10-13 12:59:25'),
	(3, 'Laboratório 03', 'Ativo', 'Visual Studio 2019, Visual Studio Code, HeidSQL, SQLServer Managment Studio, Virtual Box, Chrome, Microsoft Edge, Pacote Office, NetBeans', '2020-10-13 12:48:55', '2020-10-13 12:59:27'),
	(4, 'Laboratório 04', 'Ativo', 'Visual Studio 2019, Visual Studio Code, HeidSQL, SQLServer Managment Studio, Virtual Box, Chrome, Microsoft Edge, Pacote Office, NetBeans', '2020-10-13 12:48:55', '2020-10-13 12:49:35'),
	(5, 'Laboratório 05', 'Ativo', 'Visual Studio 2019, Visual Studio Code, HeidSQL, SQLServer Managment Studio, Virtual Box, Chrome, Microsoft Edge, Pacote Office, NetBeans', '2020-10-13 12:48:55', '2020-10-13 12:49:35'),
	(6, 'Laboratório 06', 'Ativo', 'Visual Studio 2019, Visual Studio Code, HeidSQL, SQLServer Managment Studio, Virtual Box, Chrome, Microsoft Edge, Pacote Office, NetBeans', '2020-10-13 12:48:55', '2020-10-13 12:49:35'),
	(7, 'Laboratório 07', 'Ativo', 'Visual Studio 2019, Visual Studio Code, HeidSQL, SQLServer Managment Studio, Virtual Box, Chrome, Microsoft Edge, Pacote Office, NetBeans', '2020-10-13 12:48:55', '2020-10-13 12:49:35'),
	(8, 'Laboratório 08', 'Ativo', 'Visual Studio 2019, Visual Studio Code, HeidSQL, SQLServer Managment Studio, Virtual Box, Chrome, Microsoft Edge, Pacote Office, NetBeans', '2020-10-13 12:48:55', '2020-10-13 12:49:35');
/*!40000 ALTER TABLE `laboratorios` ENABLE KEYS */;

-- Dumping structure for table sgml.log_sistema
CREATE TABLE IF NOT EXISTS `log_sistema` (
  `L_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) NOT NULL,
  `L_TIPO` varchar(100) NOT NULL,
  `L_DESCRICAO` varchar(255) NOT NULL,
  `L_REGDATE` timestamp NOT NULL DEFAULT current_timestamp(),
  PRIMARY KEY (`L_ID`,`USER_ID`),
  KEY `FK_LU` (`USER_ID`),
  CONSTRAINT `FK_LOGUSER` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table sgml.log_sistema: ~109 rows (approximately)
/*!40000 ALTER TABLE `log_sistema` DISABLE KEYS */;
INSERT INTO `log_sistema` (`L_ID`, `USER_ID`, `L_TIPO`, `L_DESCRICAO`, `L_REGDATE`) VALUES
	(1, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-08 14:08:45'),
	(2, 1, 'Create / Laboratório', 'Adicionou o Laboratório 01 ao Sistema', '2020-10-08 14:11:29'),
	(3, 1, 'Update / Laboratório', 'Desabilitou o Laboratório 01', '2020-10-08 14:12:25'),
	(4, 1, 'Update / Laboratório', 'Reativou o Laboratório 01', '2020-10-08 14:13:07'),
	(5, 1, 'Create / Computadores', 'Vinculou o Computador: 0001 e Identificação Zabbix: PC0101 ao Laboratório 1', '2020-10-08 14:40:15'),
	(6, 1, 'Update / Computadores', 'Desabilitou o Computador: 0001 e Identificação Zabbix: PC0101', '2020-10-08 14:40:49'),
	(7, 1, 'Update / Computadores', 'Alterou o Status do Computador: 0001 e Identificação Zabbix: PC0101 para Em Manutenção', '2020-10-08 14:41:55'),
	(8, 1, 'Create / Computadores - Manutenção', 'A Manutenção do Computador com código de Patrimônio: 0001 e Identificação de Manutenção: 1 foi Finalizada com falha', '2020-10-08 14:42:55'),
	(9, 1, 'Update / Computadores', 'Alterou o Status do Computador: 0001 e Identificação Zabbix: PC0101 para Em Manutenção', '2020-10-08 14:43:49'),
	(10, 1, 'Update / Computadores - Manutenção', 'Finalizou a Manuteção  do Computador com código de Patrimônio: 0001 e Identificação de Manutenção: 2', '2020-10-08 14:44:08'),
	(11, 1, 'Create / Curso', 'Cadastrou o Curso: ADS', '2020-10-08 15:00:54'),
	(12, 1, 'Create / Disciplina', 'Cadastrou a Disciplina: Matemática Discreta', '2020-10-08 15:01:21'),
	(13, 1, 'Create / Professor', 'Cadastrou o Professor: João Pedro Maciel', '2020-10-08 15:02:02'),
	(14, 1, 'Create / Aula', 'Vinculou a Disciplina: MMD001 ao Laboratório: 1 as(aos) Terças-Feiras entre 09:30 - 11:10', '2020-10-08 15:03:03'),
	(15, 1, 'Update / Aula', 'Iniciou a aula Matemática Discreta nas Terças-Feiras entre 09:30 - 11:10 do(a) Professor(a) João Pedro Maciel e Alterou seu Status para Em Andamento', '2020-10-08 15:03:31'),
	(16, 1, 'Update / Aula', 'Finalizou a aula Matemática Discreta nas Terças-Feiras entre 09:30 - 11:10 do(a) Professor(a) João Pedro Maciel e Alterou seu Status para Ativa', '2020-10-08 15:04:00'),
	(17, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-09 11:44:15'),
	(18, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-13 00:14:08'),
	(19, 1, 'Create / Curso', 'Cadastrou o Curso: Segurança da Informação', '2020-10-13 00:19:27'),
	(20, 1, 'Create / Curso', 'Cadastrou o Curso: Logística', '2020-10-13 00:20:21'),
	(21, 1, 'Create / Aula', 'Vinculou a Disciplina: MMD001 ao Laboratório: 1 as(aos) Segundas-Feiras entre 07:40 - 09:20', '2020-10-13 00:21:21'),
	(22, 1, 'Update / Aula', 'Iniciou a aula Matemática Discreta nas Terças-Feiras entre 09:30 - 11:10 do(a) Professor(a) João Pedro Maciel e Alterou seu Status para Em Andamento', '2020-10-13 00:21:38'),
	(23, 1, 'Create / Temporário', 'Adicionou uma nova utilização do Laboratório: 1 em: 2020-10-13 entre 07:40 - 09:20 pelo usuário: Luigi Pantarotto ', '2020-10-13 00:23:40'),
	(24, 1, 'Update / Temporário', 'Finalizou a utilização em do Laboratório 01 no dia 2020-10-13 entre 07:40 - 09:20, utilizado por Luigi Pantarotto ', '2020-10-13 00:23:50'),
	(25, 1, 'Create / Temporário', 'Adicionou uma nova utilização do Laboratório: 1 em: 2020-10-14 entre 07:40 - 09:20 pelo usuário: Luigi Pantarotto ', '2020-10-13 00:26:25'),
	(26, 1, 'Create / Temporário', 'Adicionou uma nova utilização do Laboratório: 1 em: 2020-10-14 entre 09:30 - 11:10 pelo usuário: Luigi Pantarotto ', '2020-10-13 00:26:31'),
	(27, 1, 'Update / Temporário', 'Finalizou a utilização em do Laboratório 01 no dia 2020-10-14 entre 09:30 - 11:10, utilizado por Luigi Pantarotto ', '2020-10-13 00:28:11'),
	(28, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-13 12:26:38'),
	(29, 1, 'Update / Computadores', 'Desabilitou o Computador: 0001 e Identificação Zabbix: PC0101', '2020-10-13 12:27:12'),
	(30, 1, 'Delete / Computadores', 'Removeu o Computador com código de Patrimônio: 0001 e Identificação Zabbix: PC0101', '2020-10-13 12:27:22'),
	(31, 1, 'Create / Computadores', 'Vinculou o Computador: 0001 e Identificação Zabbix: PC0101 ao Laboratório 1', '2020-10-13 12:28:30'),
	(32, 1, 'Create / Computadores', 'Vinculou o Computador: 0001 e Identificação Zabbix: PC0101 ao Laboratório 1', '2020-10-13 12:30:07'),
	(33, 1, 'Create / Computadores', 'Vinculou o Computador: 0001 e Identificação Zabbix: PC0101 ao Laboratório 1', '2020-10-13 12:31:47'),
	(34, 1, 'Create / Computadores', 'Vinculou o Computador: 0001 e Identificação Zabbix: PC0101 ao Laboratório 1', '2020-10-13 12:33:55'),
	(35, 1, 'Create / Computadores', 'Vinculou o Computador: 0001 e Identificação Zabbix: PC0101 ao Laboratório 1', '2020-10-13 12:39:51'),
	(36, 1, 'Create / Computadores', 'Vinculou o Computador: 0002 e Identificação Zabbix: PC0102 ao Laboratório 1', '2020-10-13 12:40:43'),
	(37, 1, 'Create / Computadores', 'Vinculou o Computador: 0003 e Identificação Zabbix: PC0103 ao Laboratório 1', '2020-10-13 12:40:53'),
	(38, 1, 'Create / Computadores', 'Vinculou o Computador: 0004 e Identificação Zabbix: PC0104 ao Laboratório 1', '2020-10-13 12:41:04'),
	(39, 1, 'Create / Computadores', 'Vinculou o Computador: 0005 e Identificação Zabbix: PC0105 ao Laboratório 1', '2020-10-13 12:41:19'),
	(40, 1, 'Create / Computadores', 'Vinculou o Computador: 0006 e Identificação Zabbix: PC0106 ao Laboratório 1', '2020-10-13 12:41:33'),
	(41, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-13 14:20:03'),
	(42, 1, 'Update / Computadores', 'Desabilitou o Computador: 0010 e Identificação Zabbix: PC0302', '2020-10-13 15:08:57'),
	(43, 1, 'Update / Computadores', 'Alterou o Status do Computador: 0002 e Identificação Zabbix: PC0102 para Em Manutenção', '2020-10-13 15:21:32'),
	(44, 1, 'Update / Computadores', 'Alterou o Status do Computador: 0002 e Identificação Zabbix: PC0102 para Em Manutenção', '2020-10-13 15:24:11'),
	(45, 1, 'Update / Computadores - Manutenção', 'Finalizou a Manuteção  do Computador com código de Patrimônio: 0002 e Identificação de Manutenção: 158', '2020-10-13 15:36:41'),
	(46, 1, 'Create / Computadores - Manutenção', 'A Manutenção do Computador com código de Patrimônio: 0002 e Identificação de Manutenção: 158 foi Retomada', '2020-10-13 15:53:25'),
	(47, 1, 'Create / Computadores - Manutenção', 'A Manutenção do Computador com código de Patrimônio: 0002 e Identificação de Manutenção: 158 foi Pausada', '2020-10-13 15:55:53'),
	(48, 1, 'Create / Computadores - Manutenção', 'A Manutenção do Computador com código de Patrimônio: 0002 e Identificação de Manutenção: 158 foi Retomada', '2020-10-13 16:04:01'),
	(49, 1, 'Update / Computadores - Manutenção', 'Finalizou a Manuteção  do Computador com código de Patrimônio: 0002 e Identificação de Manutenção: 158', '2020-10-13 16:04:28'),
	(50, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-14 11:34:09'),
	(51, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-15 10:09:38'),
	(52, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-19 12:21:54'),
	(53, 1, 'Logoff', 'O usuário Administrador saiu do sistema', '2020-10-19 12:23:47'),
	(54, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-19 12:28:04'),
	(55, 1, 'Logoff', 'O usuário Administrador saiu do sistema', '2020-10-19 12:30:07'),
	(56, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-19 12:32:14'),
	(57, 1, 'Logoff', 'O usuário Administrador saiu do sistema', '2020-10-19 12:33:19'),
	(58, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-19 12:43:47'),
	(59, 1, 'Logoff', 'O usuário Administrador saiu do sistema', '2020-10-19 12:43:59'),
	(60, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-19 12:53:05'),
	(61, 1, 'Logoff', 'O usuário Administrador saiu do sistema', '2020-10-19 12:54:42'),
	(62, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-19 12:55:09'),
	(63, 1, 'Logoff', 'O usuário Administrador saiu do sistema', '2020-10-19 13:06:26'),
	(64, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-19 13:11:59'),
	(65, 1, 'Logoff', 'O usuário Administrador saiu do sistema', '2020-10-19 13:12:07'),
	(66, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-19 13:12:11'),
	(67, 1, 'Logoff', 'O usuário Administrador saiu do sistema', '2020-10-19 13:12:59'),
	(68, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-19 13:13:05'),
	(69, 1, 'Logoff', 'O usuário Administrador saiu do sistema', '2020-10-19 13:14:00'),
	(70, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-19 13:16:24'),
	(71, 1, 'Logoff', 'O usuário Administrador saiu do sistema', '2020-10-19 14:22:29'),
	(72, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-19 14:22:49'),
	(73, 1, 'Logoff', 'O usuário Administrador saiu do sistema', '2020-10-19 22:31:45'),
	(74, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-19 22:32:18'),
	(75, 1, 'Logoff', 'O usuário Administrador saiu do sistema', '2020-10-19 22:41:28'),
	(76, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-19 22:41:31'),
	(77, 1, 'Update / Computadores', 'Desabilitou o Computador: 0002 e Identificação Zabbix: PC0102', '2020-10-19 22:49:41'),
	(78, 1, 'Update / Computadores', 'Alterou o Status do Computador: 0002 e Identificação Zabbix: PC0102 para Em Manutenção', '2020-10-19 22:50:37'),
	(79, 1, 'Create / Computadores - Manutenção', 'A Manutenção do Computador com código de Patrimônio: 0002 e Identificação de Manutenção: 184 foi Pausada', '2020-10-19 22:51:53'),
	(80, 1, 'Create / Computadores - Manutenção', 'A Manutenção do Computador com código de Patrimônio: 0002 e Identificação de Manutenção: 184 foi Retomada', '2020-10-19 22:52:21'),
	(81, 1, 'Update / Computadores - Manutenção', 'Finalizou a Manuteção  do Computador com código de Patrimônio: 0002 e Identificação de Manutenção: 184', '2020-10-19 22:53:22'),
	(82, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-20 11:14:12'),
	(83, 1, 'Create / Disciplina', 'Cadastrou a Disciplina: Algoritmos e Lógica de Programação', '2020-10-20 11:17:53'),
	(84, 1, 'Create / Disciplina', 'Cadastrou a Disciplina: Inglês I', '2020-10-20 11:18:36'),
	(85, 1, 'Create / Disciplina', 'Cadastrou a Disciplina: Inglês II', '2020-10-20 11:18:51'),
	(86, 1, 'Create / Professor', 'Cadastrou o Professor: Mariana Godoy Vazquez Miano', '2020-10-20 11:20:30'),
	(87, 1, 'Create / Aula', 'Vinculou a Disciplina: LIN200 ao Laboratório: 2 as(aos) Terças-Feiras entre 19:00 - 20:40', '2020-10-20 11:22:36'),
	(88, 1, 'Logoff', 'O usuário Administrador saiu do sistema', '2020-10-20 11:29:03'),
	(89, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-20 11:29:44'),
	(90, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-20 14:31:50'),
	(91, 1, 'Create / User', 'Adicionou o usuário Richard Kawan', '2020-10-20 14:36:23'),
	(92, 1, 'Logoff', 'O usuário Administrador saiu do sistema', '2020-10-20 14:36:30'),
	(93, 3, 'Login', 'O usuário Richard acessou o sistema.', '2020-10-20 14:36:39'),
	(94, 3, 'Logoff', 'O usuário Richard saiu do sistema', '2020-10-20 14:37:01'),
	(95, 2, 'Login', 'O usuário Operador acessou o sistema.', '2020-10-20 14:38:55'),
	(96, 2, 'Logoff', 'O usuário Operador saiu do sistema', '2020-10-20 14:39:07'),
	(97, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-20 14:39:13'),
	(98, 1, 'Alteração de Dados - Usuários', 'Alterou a senha do usuário Richard Kawan', '2020-10-20 14:39:52'),
	(99, 1, 'Alteração de Dados - Usuários', 'Alterou a senha do usuário Richard Kawan', '2020-10-20 14:40:43'),
	(100, 1, 'Logoff', 'O usuário Administrador saiu do sistema', '2020-10-20 14:41:25'),
	(101, 2, 'Login', 'O usuário Operador acessou o sistema.', '2020-10-20 14:41:31'),
	(102, 2, 'Logoff', 'O usuário Operador saiu do sistema', '2020-10-20 15:18:15'),
	(103, 1, 'Login', 'O usuário Administrador acessou o sistema.', '2020-10-20 15:32:09'),
	(104, 1, 'Create / Computadores', 'Vinculou o Computador: 00075 e Identificação Zabbix: PC0104 ao Laboratório 1', '2020-10-20 15:34:49'),
	(105, 1, 'Update / Computadores', 'Desabilitou o Computador: 00075 e Identificação Zabbix: PC0104', '2020-10-20 15:36:35'),
	(106, 1, 'Update / Computadores', 'Alterou o Status do Computador: 00075 e Identificação Zabbix: PC0104 para Em Manutenção', '2020-10-20 15:37:30'),
	(107, 1, 'Create / Computadores - Manutenção', 'A Manutenção do Computador com código de Patrimônio: 00075 e Identificação de Manutenção: 185 foi Pausada', '2020-10-20 15:38:49'),
	(108, 1, 'Create / Computadores - Manutenção', 'A Manutenção do Computador com código de Patrimônio: 00075 e Identificação de Manutenção: 185 foi Retomada', '2020-10-20 15:39:09'),
	(109, 1, 'Update / Aula', 'Iniciou a aula Inglês II nas Terças-Feiras entre 19:00 - 20:40 do(a) Professor(a) João Pedro Maciel e Alterou seu Status para Em Andamento', '2020-10-20 15:44:02');
/*!40000 ALTER TABLE `log_sistema` ENABLE KEYS */;

-- Dumping structure for table sgml.manutencao
CREATE TABLE IF NOT EXISTS `manutencao` (
  `M_ID` int(11) NOT NULL AUTO_INCREMENT,
  `PC_CODPATRIMONIO` varchar(100) NOT NULL,
  `M_NOTIFICADOR` varchar(100) NOT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `M_TYPE` varchar(50) DEFAULT NULL,
  `M_DESCRICAO` varchar(255) NOT NULL,
  `M_SOLUCAO` varchar(255) DEFAULT NULL,
  `M_STATUS` varchar(255) NOT NULL,
  `M_REGDATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `M_LASTUPDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`M_ID`,`PC_CODPATRIMONIO`),
  KEY `FK_PC` (`PC_CODPATRIMONIO`),
  KEY `FK_manutencao_users` (`USER_ID`),
  CONSTRAINT `FK_CODPATRIMONIO` FOREIGN KEY (`PC_CODPATRIMONIO`) REFERENCES `computadores` (`PC_CODPATRIMONIO`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `FK_manutencao_users` FOREIGN KEY (`USER_ID`) REFERENCES `users` (`USER_ID`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=186 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table sgml.manutencao: ~16 rows (approximately)
/*!40000 ALTER TABLE `manutencao` DISABLE KEYS */;
INSERT INTO `manutencao` (`M_ID`, `PC_CODPATRIMONIO`, `M_NOTIFICADOR`, `USER_ID`, `M_TYPE`, `M_DESCRICAO`, `M_SOLUCAO`, `M_STATUS`, `M_REGDATE`, `M_LASTUPDATE`) VALUES
	(158, '0002', 'Aluno: Richard Kawan Fragoso', 1, 'Dispositivos de Saída', 'O monitor não exibe imagem', 'O monitor foi trocado', 'Finalizada', '2020-10-13 15:24:11', '2020-10-13 16:04:28'),
	(161, '0002', 'Aluno: Richard Kawan Fragoso', 1, 'Dispositivos de Entrada', 'Problema no Teclado', 'O teclado foi trocado', 'Finalizada', '2020-10-13 15:24:11', '2020-10-13 16:50:10'),
	(162, '0003', 'Aluno: Richard Kawan Fragoso', 1, 'Dispositivos de Entrada', 'Problema no Mouse', 'O mouse foi trocado', 'Finalizada', '2020-10-13 15:24:11', '2020-10-13 16:50:15'),
	(163, '0006', 'Aluno: Richard Kawan Fragoso', 1, 'Dispositivos de Entrada', 'Problema no Mouse', 'O mouse foi trocado', 'Finalizada', '2020-10-13 15:24:11', '2020-10-13 16:50:15'),
	(165, '0001', 'Aluno: Richard Kawan Fragoso', 1, 'Dispositivos de Entrada', 'Problema no Mouse', 'Aguardando compra de Equipamento', 'Parada', '2020-10-13 15:24:11', '2020-10-13 17:31:25'),
	(169, '0010', 'Aluno: Richard Kawan Fragoso', 1, 'Hardware', 'Problema na Memória RAM', 'A memória ram foi trocada', 'Finalizada', '2020-10-13 15:24:11', '2020-10-13 16:50:15'),
	(170, '0005', 'Aluno: Richard Kawan Fragoso', 1, 'Hardware', 'Problema no HD', 'O cabo SATA foi colocado corretamente', 'Finalizada', '2020-10-13 15:24:11', '2020-10-13 16:50:15'),
	(171, '0004', 'Aluno: Richard Kawan Fragoso', 1, 'Rede', 'O computador não reconhece a Rede', 'Foi trocada a placa de rede', 'Finalizada', '2020-10-13 15:24:11', '2020-10-13 16:50:15'),
	(173, '0008', 'Aluno: Richard Kawan Fragoso', 1, 'Rede', 'O computador não reconhece a Rede', 'Foi trocada a placa de rede', 'Finalizada', '2020-10-13 15:24:11', '2020-10-13 16:50:15'),
	(174, '0009', 'Aluno: Richard Kawan Fragoso', 1, 'Rede', 'O computador não reconhece a Rede', 'Foi trocada a placa de rede', 'Finalizada', '2020-10-13 15:24:11', '2020-10-13 16:50:15'),
	(175, '0001', 'Aluno: Richard Kawan Fragoso', 1, 'Software', 'O SO não inicia', 'Foi reinstalada a Imagem do SO', 'Finalizada', '2020-10-13 15:24:11', '2020-10-13 16:50:15'),
	(177, '0007', 'Aluno: Richard Kawan Fragoso', 1, 'Software', 'O SO não inicia', 'Foi reinstalada a Imagem do SO', 'Finalizada', '2020-10-13 15:24:11', '2020-10-13 16:50:15'),
	(178, '0008', 'Aluno: Richard Kawan Fragoso', 1, 'Software', 'O SO não inicia', 'Foi reinstalada a Imagem do SO', 'Finalizada', '2020-10-13 15:24:11', '2020-10-13 16:50:15'),
	(181, '0005', 'Aluno: Richard Kawan Fragoso', 1, 'Dispositivos de Entrada', 'Problema no Teclado', 'O teclado foi trocado', 'Finalizada', '2020-10-13 15:24:11', '2020-10-13 16:50:10'),
	(182, '0008', 'Aluno: Richard Kawan Fragoso', 1, 'Dispositivos de Entrada', 'Problema no Teclado', 'O teclado foi trocado', 'Finalizada', '2020-10-13 15:24:11', '2020-10-13 17:01:46'),
	(183, '0001', 'Aluno: Richard Kawan Fragoso', 1, 'Software', 'O SO não inicia', 'Foi reinstalada a Imagem do SO', 'Finalizada', '2019-10-13 15:24:11', '2020-10-13 16:50:15'),
	(184, '0002', 'Aluno: Rodrigo Sampaio', 1, 'Rede', 'O computador não acessa a Internet', 'Foi trocada a placa de rede', 'Finalizada', '2020-10-19 22:50:37', '2020-10-19 22:53:22'),
	(185, '00075', 'Aluno: João ', 1, 'Dispositivos de Entrada', 'O monitor não liga', 'Motivo para Desativação: Necessita comprar um novo monitor', 'Em Andamento', '2020-10-20 15:37:30', '2020-10-20 15:39:09');
/*!40000 ALTER TABLE `manutencao` ENABLE KEYS */;

-- Dumping structure for table sgml.professor
CREATE TABLE IF NOT EXISTS `professor` (
  `P_ID` varchar(50) NOT NULL,
  `P_NOME` varchar(100) NOT NULL,
  `P_EMAIL` varchar(100) NOT NULL,
  `P_STATUS` varchar(100) NOT NULL,
  `P_REGDATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `P_LASTUPDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`P_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- Dumping data for table sgml.professor: ~2 rows (approximately)
/*!40000 ALTER TABLE `professor` DISABLE KEYS */;
INSERT INTO `professor` (`P_ID`, `P_NOME`, `P_EMAIL`, `P_STATUS`, `P_REGDATE`, `P_LASTUPDATE`) VALUES
	('0001', 'João Pedro Maciel', 'joaomaciel3@fatec.sp.gov.br', 'Ativo', '2020-10-08 15:02:02', '2020-10-20 11:21:15'),
	('0002', 'Mariana Godoy Vazquez Miano', 'mariana.godoy@fatec.sp.gov.br', 'Ativo', '2020-10-20 11:20:30', '2020-10-20 11:20:30');
/*!40000 ALTER TABLE `professor` ENABLE KEYS */;

-- Dumping structure for table sgml.temporario
CREATE TABLE IF NOT EXISTS `temporario` (
  `T_ID` int(11) NOT NULL AUTO_INCREMENT,
  `LAB_ID` int(11) NOT NULL,
  `T_DATA` date NOT NULL,
  `T_HORA` varchar(50) NOT NULL DEFAULT '',
  `T_NOME` varchar(50) NOT NULL,
  `T_CODID` varchar(50) NOT NULL,
  `T_EMAIL` varchar(50) NOT NULL,
  `T_STATUS` varchar(50) NOT NULL,
  `T_REGDATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `T_LASTUPDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`T_ID`) USING BTREE,
  KEY `FK_LAB` (`LAB_ID`),
  CONSTRAINT `FK_LAB` FOREIGN KEY (`LAB_ID`) REFERENCES `laboratorios` (`LAB_ID`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table sgml.temporario: ~2 rows (approximately)
/*!40000 ALTER TABLE `temporario` DISABLE KEYS */;
INSERT INTO `temporario` (`T_ID`, `LAB_ID`, `T_DATA`, `T_HORA`, `T_NOME`, `T_CODID`, `T_EMAIL`, `T_STATUS`, `T_REGDATE`, `T_LASTUPDATE`) VALUES
	(1, 1, '2020-10-13', '07:40 - 09:20', 'Luigi Pantarotto ', '0040741911006', 'luigi.pantarotto@fatec.sp.gov.br', 'Finalizada', '2020-10-13 00:23:40', '2020-10-13 00:23:50'),
	(2, 1, '2020-10-14', '07:40 - 09:20', 'Luigi Pantarotto ', '0040741911006', 'luigi.pantarotto@fatec.sp.gov.br', 'Ativo', '2020-10-13 00:26:25', '2020-10-13 00:26:25'),
	(3, 1, '2020-10-14', '09:30 - 11:10', 'Luigi Pantarotto ', '0040741911006', 'luigi.pantarotto@fatec.sp.gov.br', 'Finalizada', '2020-10-13 00:26:31', '2020-10-13 00:28:11');
/*!40000 ALTER TABLE `temporario` ENABLE KEYS */;

-- Dumping structure for table sgml.users
CREATE TABLE IF NOT EXISTS `users` (
  `USER_ID` int(11) NOT NULL AUTO_INCREMENT,
  `USER_FNAME` varchar(100) NOT NULL,
  `USER_LNAME` varchar(100) NOT NULL,
  `USER_MAIL` varchar(255) NOT NULL,
  `USER_PASSWORD` varchar(255) NOT NULL,
  `USER_FUNCTION` varchar(255) NOT NULL,
  `USER_STATUS` varchar(255) NOT NULL,
  `USER_REGDATE` timestamp NOT NULL DEFAULT current_timestamp(),
  `USER_LASTUPDATE` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`USER_ID`,`USER_MAIL`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

-- Dumping data for table sgml.users: ~3 rows (approximately)
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` (`USER_ID`, `USER_FNAME`, `USER_LNAME`, `USER_MAIL`, `USER_PASSWORD`, `USER_FUNCTION`, `USER_STATUS`, `USER_REGDATE`, `USER_LASTUPDATE`) VALUES
	(1, 'Administrador', '', 'admin', '8c6976e5b5410415bde908bd4dee15dfb167a9c873fc4bb8a81f6f2ab448a918', 'Administrador', 'Ativo', '2020-10-07 15:14:57', '2020-10-07 15:16:15'),
	(2, 'Operador', '', 'operador', 'e257b110509437aaceddbd342bc63d05e74221d6bac056ed279d752ff8d3afcb', 'Operador', 'Ativo', '2020-10-20 14:34:53', '2020-10-20 14:40:21'),
	(3, 'Richard', 'Kawan', 'richard@gmail.com', '61bffea9215f65164ad18b45aff1436c0c165d0d5dd2087ef61b4232ba6d2c1a', 'Operador', 'Ativo', '2020-10-20 14:36:23', '2020-10-20 14:40:43');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IF(@OLD_FOREIGN_KEY_CHECKS IS NULL, 1, @OLD_FOREIGN_KEY_CHECKS) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
