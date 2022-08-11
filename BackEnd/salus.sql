-- --------------------------------------------------------
-- 호스트:                          127.0.0.1
-- 서버 버전:                        10.8.3-MariaDB - mariadb.org binary distribution
-- 서버 OS:                        Win64
-- HeidiSQL 버전:                  11.3.0.6295
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- salus 데이터베이스 구조 내보내기
CREATE DATABASE IF NOT EXISTS `salus` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;
USE `salus`;

-- 테이블 salus.attendance 구조 내보내기
CREATE TABLE IF NOT EXISTS `attendance` (
  `rfidKey` bigint(20) NOT NULL,
  `dailyExcerciseStart` datetime DEFAULT NULL,
  `dailyExcerciseEnd` datetime DEFAULT NULL,
  `attendanceCheck` tinyint(1) unsigned zerofill DEFAULT NULL,
  `excerciseDay` date DEFAULT NULL,
  `firstRegist` datetime DEFAULT current_timestamp(),
  `updateRegist` datetime DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  KEY `rfidKey` (`rfidKey`),
  CONSTRAINT `fk_rfidkey` FOREIGN KEY (`rfidKey`) REFERENCES `user` (`rfidKey`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 salus.attendance:~10 rows (대략적) 내보내기
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
INSERT INTO `attendance` (`rfidKey`, `dailyExcerciseStart`, `dailyExcerciseEnd`, `attendanceCheck`, `excerciseDay`, `firstRegist`, `updateRegist`) VALUES
	(977237223725, '2022-08-04 14:00:00', '2022-08-04 16:00:00', 0, '2022-08-04', '2022-08-04 14:40:23', '2022-08-09 15:24:11'),
	(977237223725, '2022-08-05 14:00:00', '2022-08-05 16:00:00', 0, '2022-08-05', '2022-08-05 13:53:46', '2022-08-09 15:26:32'),
	(977237223725, '2022-08-08 10:00:00', '2022-08-08 14:00:00', 0, '2022-08-08', '2022-08-08 09:48:20', '2022-08-09 23:32:20'),
	(977237223725, '2022-08-09 10:00:00', '2022-08-09 18:19:57', 0, '2022-08-09', '2022-08-09 01:54:18', '2022-08-09 23:32:15'),
	(977237223725, '2022-08-06 14:00:00', '2022-08-06 16:00:00', 0, '2022-08-06', '2022-08-06 14:54:45', '2022-08-09 15:26:37'),
	(977237223725, '2022-08-07 14:00:00', '2022-08-07 16:00:00', 0, '2022-08-07', '2022-08-09 14:58:22', '2022-08-09 15:26:42'),
	(11111111, '2022-08-09 15:15:31', '2022-08-09 15:28:49', 0, '2022-08-09', '2022-08-09 15:15:41', '2022-08-09 15:28:49'),
	(977237223725, '2022-08-10 11:00:00', '2022-08-10 13:23:35', 0, '2022-08-10', '2022-08-10 23:45:43', '2022-08-10 13:23:35'),
	(11111111, '2022-08-10 10:00:00', '2022-08-10 14:00:00', 0, '2022-08-10', '2022-08-09 23:46:02', '2022-08-09 23:47:10'),
	(977237223725, '2022-08-11 15:12:44', NULL, 1, '2022-08-11', '2022-08-11 15:12:44', '2022-08-11 15:12:44');
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;

-- 테이블 salus.daily_excercise 구조 내보내기
CREATE TABLE IF NOT EXISTS `daily_excercise` (
  `dailyExcerciseId` int(11) NOT NULL AUTO_INCREMENT,
  `equipmentName` varchar(30) NOT NULL,
  `startTime` datetime DEFAULT NULL,
  `endTime` datetime DEFAULT NULL,
  `weightNow` int(11) DEFAULT 0,
  `countNow` int(11) DEFAULT 0,
  `excerciseDay` date NOT NULL DEFAULT current_timestamp(),
  `firstRegist` datetime NOT NULL DEFAULT current_timestamp(),
  `updateRegist` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `rfidKey` bigint(20) NOT NULL,
  PRIMARY KEY (`dailyExcerciseId`),
  KEY `FK2_equipmentName` (`equipmentName`),
  KEY `FK_daily_excercise_user` (`rfidKey`),
  CONSTRAINT `FK_daily_excercise_user` FOREIGN KEY (`rfidKey`) REFERENCES `user` (`rfidKey`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 salus.daily_excercise:~55 rows (대략적) 내보내기
/*!40000 ALTER TABLE `daily_excercise` DISABLE KEYS */;
INSERT INTO `daily_excercise` (`dailyExcerciseId`, `equipmentName`, `startTime`, `endTime`, `weightNow`, `countNow`, `excerciseDay`, `firstRegist`, `updateRegist`, `rfidKey`) VALUES
	(1, '숄더프레스 머신', '2022-08-08 14:52:09', '2022-08-08 15:12:10', 90, 20, '2022-08-08', '2022-08-07 14:52:08', '2022-08-09 23:31:50', 977237223725),
	(2, '레그 컬 머신', '2022-08-05 14:52:52', '2022-08-05 15:12:53', 10, 30, '2022-08-05', '2022-08-04 14:52:50', '2022-08-09 23:29:59', 977237223725),
	(3, '레그 컬 머신', '2022-08-06 14:08:13', '2022-08-06 14:24:14', 20, 25, '2022-08-06', '2022-08-05 14:08:21', '2022-08-09 23:29:53', 977237223725),
	(14, '레그 컬 머신', '2022-08-06 15:53:00', '2022-08-06 16:13:00', 30, 40, '2022-08-06', '2022-08-08 09:28:30', '2022-08-09 23:29:45', 977237223725),
	(15, '숄더프레스 머신', '2022-08-09 11:23:05', '2022-08-09 11:40:05', 100, 25, '2022-08-09', '2022-08-09 11:23:17', '2022-08-09 23:31:06', 977237223725),
	(17, '렛 풀다운 머신', '2022-08-08 12:06:25', '2022-08-08 12:26:25', 100, 10, '2022-08-08', '2022-08-08 12:06:36', '2022-08-09 23:30:06', 977237223725),
	(18, '레그 컬 머신', '2022-08-08 13:37:37', '2022-08-08 13:50:37', 35, 40, '2022-08-08', '2022-08-08 13:37:49', '2022-08-09 23:29:36', 977237223725),
	(19, '런닝머신', '2022-08-09 13:35:33', '2022-08-09 14:35:33', 0, 0, '2022-08-09', '2022-08-09 13:35:43', '2022-08-11 16:26:14', 977237223725),
	(20, '토탈 힙', '2022-08-07 14:36:15', '2022-08-07 14:51:23', 30, 20, '2022-08-07', '2022-08-09 14:36:37', '2022-08-09 23:31:45', 977237223725),
	(21, '체스트 프레스 머신', '2022-08-09 14:38:13', '2022-08-09 15:00:13', 55, 50, '2022-08-09', '2022-08-09 14:38:21', '2022-08-09 23:31:40', 977237223725),
	(22, '런닝머신', '2022-04-01 11:00:00', '2022-04-01 11:30:00', 0, 0, '2022-04-01', '2022-04-01 16:46:45', '2022-08-11 16:26:26', 977237223725),
	(23, '런닝머신', '2022-04-03 11:00:00', '2022-04-03 11:30:00', 0, 0, '2022-04-03', '2022-04-03 16:47:19', '2022-08-11 16:26:24', 977237223725),
	(24, '버터플라이 머신', '2022-04-01 11:30:00', '2022-04-01 12:00:00', 40, 80, '2022-04-01', '2022-04-01 16:56:53', '2022-08-09 16:57:45', 977237223725),
	(25, '숄더프레스 머신', '2022-04-01 11:30:00', '2022-04-01 12:00:00', 10, 50, '2022-04-01', '2022-04-01 17:18:45', '2022-08-09 18:01:20', 977237223725),
	(26, '숄더프레스 머신', '2022-04-03 11:30:00', '2022-04-03 12:00:00', 20, 40, '2022-04-03', '2022-04-03 17:58:33', '2022-08-09 17:58:35', 977237223725),
	(27, '숄더프레스 머신', '2022-05-01 11:30:00', '2022-05-01 12:00:00', 40, 50, '2022-05-01', '2022-05-01 17:59:35', '2022-08-09 18:00:34', 977237223725),
	(28, '숄더프레스 머신', '2022-05-03 11:30:00', '2022-05-03 12:00:00', 50, 40, '2022-05-03', '2022-05-03 18:00:17', '2022-08-09 18:00:22', 977237223725),
	(29, '숄더프레스 머신', '2022-06-01 11:30:00', '2022-06-01 12:00:00', 50, 40, '2022-06-01', '2022-06-01 18:03:23', '2022-08-09 18:03:24', 977237223725),
	(30, '숄더프레스 머신', '2022-06-03 11:30:00', '2022-06-03 12:00:00', 60, 40, '2022-06-03', '2022-06-03 18:04:22', '2022-08-09 18:04:24', 977237223725),
	(31, '숄더프레스 머신', '2022-07-01 11:30:00', '2022-07-01 12:00:00', 70, 30, '2022-07-01', '2022-07-01 18:05:20', '2022-08-09 18:05:24', 977237223725),
	(32, '숄더프레스 머신', '2022-07-03 11:30:00', '2022-07-03 12:00:00', 80, 20, '2022-07-03', '2022-07-03 18:06:28', '2022-08-09 18:06:31', 977237223725),
	(33, '런닝머신', '2022-05-01 11:00:00', '2022-05-01 11:30:00', 0, 0, '2022-05-01', '2022-05-01 18:07:35', '2022-08-11 16:26:23', 977237223725),
	(34, '런닝머신', '2022-05-03 10:00:00', '2022-05-03 10:45:00', 0, 0, '2022-05-03', '2022-05-03 18:08:05', '2022-08-11 16:26:19', 977237223725),
	(35, '런닝머신', '2022-06-01 10:00:00', '2022-06-01 11:00:03', 0, 0, '2022-06-01', '2022-06-01 18:08:32', '2022-08-11 16:26:20', 977237223725),
	(36, '런닝머신', '2022-06-03 10:00:00', '2022-06-03 11:00:00', 0, 0, '2022-06-03', '2022-06-03 18:08:58', '2022-08-11 16:26:22', 977237223725),
	(37, '런닝머신', '2022-07-01 10:00:00', '2022-07-01 12:00:00', 0, 0, '2022-07-01', '2022-06-01 18:09:25', '2022-08-11 16:26:18', 977237223725),
	(38, '런닝머신', '2022-07-03 10:00:00', '2022-07-03 11:45:00', 0, 0, '2022-07-03', '2022-07-03 18:09:53', '2022-08-11 16:26:16', 977237223725),
	(39, '런닝머신', '2022-08-07 10:00:00', '2022-08-07 11:00:00', 0, 0, '2022-08-07', '2022-08-07 18:10:34', '2022-08-11 16:26:16', 977237223725),
	(40, '체스트 프레스 머신', '2022-04-02 11:00:06', '2022-04-02 11:20:00', 20, 50, '2022-04-02', '2022-04-02 22:51:11', '2022-08-09 22:51:19', 977237223725),
	(41, '체스트 프레스 머신', '2022-04-04 11:00:00', '2022-04-04 11:20:00', 25, 40, '2022-04-04', '2022-04-04 22:53:17', '2022-08-09 22:53:23', 977237223725),
	(42, '체스트 프레스 머신', '2022-05-02 11:00:00', '2022-05-02 11:20:00', 30, 40, '2022-05-02', '2022-05-02 11:00:00', '2022-08-09 22:56:41', 977237223725),
	(43, '체스트 프레스 머신', '2022-05-04 11:00:00', '2022-05-04 11:20:00', 35, 40, '2022-05-04', '2022-05-04 11:00:00', '2022-08-09 22:57:06', 977237223725),
	(44, '체스트 프레스 머신', '2022-06-02 11:00:00', '2022-06-02 11:25:00', 40, 50, '2022-06-02', '2022-06-02 11:00:00', '2022-08-09 22:58:19', 977237223725),
	(45, '체스트 프레스 머신', '2022-06-04 11:00:00', '2022-06-04 11:25:00', 40, 60, '2022-06-04', '2022-06-04 11:00:00', '2022-08-09 23:00:01', 977237223725),
	(46, '체스트 프레스 머신', '2022-07-02 11:00:00', '2022-07-02 11:30:00', 50, 50, '2022-07-02', '2022-07-02 11:00:00', '2022-08-09 23:07:58', 977237223725),
	(47, '체스트 프레스 머신', '2022-07-04 11:00:00', '2022-07-04 11:30:00', 50, 70, '2022-07-04', '2022-07-04 11:00:00', '2022-08-09 23:04:03', 977237223725),
	(48, '체스트 프레스 머신', '2022-08-10 11:00:00', '2022-08-10 11:30:00', 60, 45, '2022-08-10', '2022-08-10 11:00:00', '2022-08-09 23:08:34', 977237223725),
	(49, '레그 컬 머신', '2022-08-10 11:35:00', '2022-08-10 12:00:00', 50, 50, '2022-08-10', '2022-08-10 11:35:00', '2022-08-09 23:09:35', 977237223725),
	(50, '토탈 힙', '2022-08-10 12:00:00', '2022-08-10 12:15:00', 35, 30, '2022-08-10', '2022-08-10 12:00:00', '2022-08-09 23:11:04', 977237223725),
	(51, '토탈 힙', '2022-04-05 11:00:00', '2022-04-05 11:20:00', 5, 30, '2022-04-05', '2022-04-05 11:00:00', '2022-08-09 23:12:18', 977237223725),
	(52, '토탈 힙', '2022-04-07 11:00:00', '2022-04-07 11:20:00', 10, 30, '2022-04-07', '2022-04-07 11:00:00', '2022-08-09 23:17:23', 977237223725),
	(53, '토탈 힙', '2022-05-05 11:00:00', '2022-05-05 11:20:00', 15, 25, '2022-05-05', '2022-05-05 11:00:00', '2022-08-09 23:26:04', 977237223725),
	(54, '토탈 힙', '2022-05-07 11:00:00', '2022-05-07 11:20:00', 15, 40, '2022-05-07', '2022-05-07 11:00:00', '2022-08-11 16:32:35', 977237223725),
	(55, '토탈 힙', '2022-06-05 11:00:00', '2022-06-05 11:15:00', 20, 25, '2022-06-05', '2022-06-05 11:00:00', '2022-08-09 23:27:23', 977237223725),
	(56, '토탈 힙', '2022-06-07 11:00:00', '2022-06-07 11:15:00', 25, 25, '2022-06-07', '2022-06-07 11:00:00', '2022-08-09 23:27:58', 977237223725),
	(57, '토탈 힙', '2022-07-05 11:00:00', '2022-07-05 11:15:00', 30, 25, '2022-07-05', '2022-07-05 11:00:00', '2022-08-09 23:29:19', 977237223725),
	(58, '토탈 힙', '2022-07-07 11:00:00', '2022-07-07 11:15:00', 35, 20, '2022-07-07', '2022-07-07 11:00:00', '2022-08-09 23:29:14', 977237223725),
	(59, '숄더프레스 머신', '2022-08-10 13:00:00', '2022-08-10 13:30:00', 100, 40, '2022-08-10', '2022-08-10 13:00:00', '2022-08-10 13:15:23', 11111111),
	(60, '토탈 힙', '2022-08-10 13:30:00', '2022-08-10 14:00:00', 40, 40, '2022-08-10', '2022-08-10 13:30:00', '2022-08-09 23:35:15', 11111111),
	(61, '체스트 프레스 머신', '2022-08-10 14:00:00', '2022-08-10 14:30:00', 60, 40, '2022-08-10', '2022-08-10 14:00:00', '2022-08-10 23:35:35', 11111111),
	(62, '레그 컬 머신', '2022-08-10 14:30:00', '2022-08-10 15:00:00', 60, 40, '2022-08-10', '2022-08-10 14:30:00', '2022-08-10 23:36:45', 11111111),
	(63, '런닝머신', '2022-08-10 15:00:00', '2022-08-10 16:00:00', 0, 0, '2022-08-10', '2022-08-10 15:00:00', '2022-08-11 16:26:12', 11111111),
	(64, '런닝머신', '2022-08-10 12:15:00', '2022-08-10 13:15:00', 0, 0, '2022-08-10', '2022-08-10 12:15:00', '2022-08-11 16:26:12', 977237223725),
	(66, '숄더프레스 머신', '2022-08-10 13:15:00', '2022-08-10 13:30:00', 100, 20, '2022-08-10', '2022-08-10 13:19:15', '2022-08-10 13:19:16', 977237223725),
	(67, '레그 컬 머신', '2022-08-10 13:30:00', '2022-08-10 13:45:00', 40, 40, '2022-08-10', '2022-08-10 13:19:43', '2022-08-10 13:19:43', 977237223725),
	(68, '숄더프레스 머신', '2022-08-11 11:42:45', '2022-08-11 11:52:45', 100, 10, '2022-08-11', '2022-08-11 11:43:09', '2022-08-11 11:43:10', 977237223725),
	(69, '숄더프레스 머신', '2022-08-11 11:53:00', '2022-08-11 12:03:59', 110, 10, '2022-08-11', '2022-08-11 11:43:31', '2022-08-11 14:02:11', 977237223725),
	(70, '레그 컬 머신', '2022-08-11 12:05:00', '2022-08-11 12:15:00', 60, 30, '2022-08-11', '2022-08-11 15:18:56', '2022-08-11 15:19:28', 977237223725),
	(71, '레그 컬 머신', '2022-08-11 12:16:00', '2022-08-11 12:26:00', 70, 20, '2022-08-11', '2022-08-11 15:19:14', '2022-08-11 15:19:30', 977237223725);
/*!40000 ALTER TABLE `daily_excercise` ENABLE KEYS */;

-- 테이블 salus.fitness_equipment 구조 내보내기
CREATE TABLE IF NOT EXISTS `fitness_equipment` (
  `equipmentId` int(11) NOT NULL AUTO_INCREMENT,
  `equipmentName` varchar(64) NOT NULL,
  `equipmentEnglishName` varchar(64) NOT NULL,
  `equipmentCategory` varchar(20) DEFAULT NULL,
  `equipmentImage` varchar(64) DEFAULT NULL,
  `equipmentStimulate` varchar(50) DEFAULT NULL,
  `equipmentEnglishStimulate` varchar(50) DEFAULT NULL,
  `equipmentDescription` text DEFAULT NULL,
  `firstRegist` datetime NOT NULL DEFAULT current_timestamp(),
  `updateRegist` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `isStarted` tinyint(4) DEFAULT 0,
  PRIMARY KEY (`equipmentId`) USING BTREE,
  KEY `equipmentCategory` (`equipmentCategory`) USING BTREE,
  KEY `equipmentName` (`equipmentName`) USING BTREE,
  KEY `eqipmentEnglishName` (`equipmentEnglishName`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 salus.fitness_equipment:~26 rows (대략적) 내보내기
/*!40000 ALTER TABLE `fitness_equipment` DISABLE KEYS */;
INSERT INTO `fitness_equipment` (`equipmentId`, `equipmentName`, `equipmentEnglishName`, `equipmentCategory`, `equipmentImage`, `equipmentStimulate`, `equipmentEnglishStimulate`, `equipmentDescription`, `firstRegist`, `updateRegist`, `isStarted`) VALUES
	(1, '런닝머신', 'Treadmill', '유산소', NULL, '', '', '야외에서 달리는 것처럼 제자리뛰기를 할 수 있게 해준다.', '2022-07-27 17:24:52', '2022-08-10 13:53:02', 0),
	(2, '로잉 머신', 'Rowing Machine', '전신', NULL, '', '', '로잉 머신(Rowing machine)은 조정(스포츠) 선수들이 실내에서 운동 할 때 쓰는 기구이고 전신에 자극을 줄 수 있다는 것과 자비 없는 운동량으로 유명하다.', '2022-07-27 17:42:10', '2022-07-27 17:42:10', 0),
	(3, '숄더프레스 머신', 'Sholder Press Machine', '상체', NULL, '어깨', 'shoulders', '어깨 근육(삼각근)의 전면과 측면 부위의 근매스를 올리기 좋은 대표적인 운동입니다.', '2022-07-27 17:57:37', '2022-07-27 17:57:37', 0),
	(4, '체스트 프레스 머신', 'Chest Press Machine', '상체', NULL, '가슴', 'pecs', '', '2022-07-27 22:59:58', '2022-07-27 22:59:58', 0),
	(5, '버터플라이 머신', 'Butterfly Machine', '상체', NULL, '가슴, 어깨, 복근', 'pecs, shoulders, obliques', '', '2022-07-27 23:01:33', '2022-07-27 23:01:33', 0),
	(6, '펙덱 플라이 머신', 'Fly - Pec Dec Machine', '상체', NULL, '가슴', 'pecs', '', '2022-07-27 23:02:11', '2022-07-27 23:02:11', 0),
	(7, '업도미널 머신', 'Abdominal Machine', '상체', NULL, '복근', 'obliques', '', '2022-07-27 23:02:49', '2022-07-27 23:02:49', 0),
	(8, '컬 머신', 'Curl Machine', '상체', NULL, '이두근', 'biceps', '', '2022-07-27 23:03:36', '2022-07-27 23:03:36', 0),
	(9, '리어델트 머신', 'Rear Delt Machine', '상체', NULL, '어깨', 'shoulders', '', '2022-07-27 23:04:02', '2022-07-27 23:04:02', 0),
	(10, '렛 풀다운 머신', 'Lat Pull Down Machine', '상체', NULL, '광배근, 삼두근', 'lats, triceps', '', '2022-07-27 23:04:58', '2022-07-28 00:29:23', 0),
	(11, '인클라인 벤치 프레스 머신', 'Incline Bench Press Machine', '상체', NULL, '가슴', 'pecs', '', '2022-07-27 23:05:38', '2022-07-27 23:07:19', 0),
	(12, '레터럴 레이즈 머신', 'Lateral Raise Machine', '상체', NULL, '어깨', 'shoulders', '', '2022-07-27 23:05:55', '2022-07-27 23:07:27', 0),
	(13, '티 바 로우 머신', 'Tbar-row Machine', '상체', NULL, '광배근', 'lats', '', '2022-07-27 23:06:16', '2022-07-27 23:06:16', 0),
	(14, '시티드 로우 머신', 'Seated Row Machine', '상체', NULL, '광배근, 승모근', 'lats, traps', '', '2022-07-27 23:06:30', '2022-07-28 00:27:04', 0),
	(15, '어시스트 풀업 머신', 'Assisted Pullup Machine', '상체', NULL, '광배근', 'lats', '', '2022-07-27 23:06:52', '2022-07-27 23:06:52', 0),
	(16, '레그 컬 머신', 'Leg Curl Machine', '하체', NULL, '허벅지, 종아리', 'quads, calves', '', '2022-07-27 23:08:13', '2022-07-28 00:22:46', 0),
	(17, '레그 익스텐션 머신', 'Leg Extension Machine', '하체', NULL, '허벅지', 'quads', '', '2022-07-27 23:09:36', '2022-07-27 23:10:17', 0),
	(18, '힙 어덕터', 'Hip Adductor', '하체', NULL, '허벅지', 'quads', '', '2022-07-27 23:10:07', '2022-07-27 23:12:01', 0),
	(19, '핵 스쿼트 머신', 'Hack-squat Machine', '하체', NULL, '허벅지, 햄스트링, 둔근', 'quads, hamstrings, glutes', '', '2022-07-27 23:11:59', '2022-07-27 23:11:59', 0),
	(20, '브이 스쿼트 머신', 'V-squat Machine', '하체', NULL, '허벅지, 둔근', 'quads, glutes', '', '2022-07-27 23:13:58', '2022-07-27 23:14:08', 0),
	(21, '파워 레그프레스 머신', 'Power Leg Press Machine', '하체', NULL, '허벅지, 둔근', 'quads, glutes', '', '2022-07-27 23:14:36', '2022-07-27 23:14:36', 0),
	(22, '이너사이 머신', 'Inner Thigh Machine', '하체', NULL, '허벅지', 'quads', '', '2022-07-27 23:15:02', '2022-07-27 23:15:02', 0),
	(23, '라잉 레그 컬', 'Lying Leg Curl', '하체', NULL, '허벅지', 'quads', '', '2022-07-27 23:15:26', '2022-07-27 23:15:26', 0),
	(24, '시티드 레그 프레스 머신', 'Seated Leg Press Machine', '하체', NULL, '허벅지, 엉덩이', 'quads, glutes', '', '2022-07-27 23:15:52', '2022-07-27 23:15:52', 0),
	(25, '토탈 힙', 'Total Hip machine', '하체', NULL, '허벅지, 엉덩이', 'quads, glutes', '', '2022-07-27 23:16:11', '2022-07-27 23:16:11', 0),
	(26, '크런치 머신', 'Crunch machine', '상체', NULL, '복근', 'obliques', '', '2022-07-27 23:17:36', '2022-07-27 23:17:36', 0);
/*!40000 ALTER TABLE `fitness_equipment` ENABLE KEYS */;

-- 테이블 salus.manager 구조 내보내기
CREATE TABLE IF NOT EXISTS `manager` (
  `managerId` int(11) NOT NULL AUTO_INCREMENT,
  `managerLastName` varchar(20) NOT NULL,
  `managerFirstname` varchar(20) NOT NULL,
  `adminPassword` varchar(30) NOT NULL,
  `adminEmail` varchar(40) NOT NULL DEFAULT '',
  `gymId` int(11) DEFAULT NULL,
  `firstRegist` datetime NOT NULL DEFAULT current_timestamp(),
  `updateRegist` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  PRIMARY KEY (`managerId`),
  UNIQUE KEY `adminEmail` (`adminEmail`),
  KEY `FK_manager_gym` (`gymId`),
  CONSTRAINT `FK_manager_gym` FOREIGN KEY (`gymId`) REFERENCES `gym` (`gymId`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 salus.manager:~0 rows (대략적) 내보내기
/*!40000 ALTER TABLE `manager` DISABLE KEYS */;
/*!40000 ALTER TABLE `manager` ENABLE KEYS */;

-- 테이블 salus.user 구조 내보내기
CREATE TABLE IF NOT EXISTS `user` (
  `rfidKey` bigint(20) NOT NULL,
  `email` varchar(40) NOT NULL DEFAULT '',
  `name` varchar(20) NOT NULL DEFAULT '',
  `password` varchar(30) DEFAULT '',
  `phone` varchar(20) DEFAULT '',
  `birthDay` date DEFAULT NULL,
  `gender` varchar(10) DEFAULT '',
  `targetTime` time DEFAULT '00:00:00',
  `targetVolume` int(11) DEFAULT 0,
  `firstRegist` datetime NOT NULL DEFAULT current_timestamp(),
  `updateRegist` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `weight` int(11) DEFAULT 0,
  PRIMARY KEY (`rfidKey`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- 테이블 데이터 salus.user:~2 rows (대략적) 내보내기
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`rfidKey`, `email`, `name`, `password`, `phone`, `birthDay`, `gender`, `targetTime`, `targetVolume`, `firstRegist`, `updateRegist`, `weight`) VALUES
	(11111111, 'tset@gmail.com', '테스트', '1234', '', NULL, '', NULL, NULL, '2022-08-05 14:08:46', '2022-08-05 14:08:48', 0),
	(977237223725, 'sbpark0402@gmail.com', '박성배', '1234', '01020649961', '1995-11-05', '1', '16:00:00', 60000, '2022-08-04 14:21:10', '2022-08-11 17:01:09', 68);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;

/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
