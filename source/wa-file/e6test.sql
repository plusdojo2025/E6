-- --------------------------------------------------------
-- ホスト:                          127.0.0.1
-- サーバーのバージョン:                   8.0.26 - MySQL Community Server - GPL
-- サーバー OS:                      Win64
-- HeidiSQL バージョン:               12.11.0.7065
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- e6 のデータベース構造をダンプしています
CREATE DATABASE IF NOT EXISTS `e6` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `e6`;

--  テーブル e6.coin の構造をダンプしています
CREATE TABLE IF NOT EXISTS `coin` (
  `regist_number` int NOT NULL,
  `hold_coin` int DEFAULT '50',
  `receive_coin` int DEFAULT '0',
  `ranking_coin` int DEFAULT '0',
  PRIMARY KEY (`regist_number`),
  CONSTRAINT `coin_ibfk_1` FOREIGN KEY (`regist_number`) REFERENCES `users` (`regist_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- エクスポートするデータが選択されていません

--  テーブル e6.monthly_reset_log の構造をダンプしています
CREATE TABLE IF NOT EXISTS `monthly_reset_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reset_year` int NOT NULL,
  `reset_month` int NOT NULL,
  `reset_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- エクスポートするデータが選択されていません

--  テーブル e6.send の構造をダンプしています
CREATE TABLE IF NOT EXISTS `send` (
  `id` int NOT NULL AUTO_INCREMENT,
  `regist_number` int NOT NULL,
  `send_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(3000) DEFAULT NULL,
  `send_coin` int DEFAULT '0',
  `receiver_number` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- エクスポートするデータが選択されていません

--  テーブル e6.users の構造をダンプしています
CREATE TABLE IF NOT EXISTS `users` (
  `regist_number` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  PRIMARY KEY (`regist_number`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- エクスポートするデータが選択されていません

--  トリガー e6.after_user_insert の構造をダンプしています
SET @OLDTMP_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
DELIMITER //
CREATE TRIGGER `after_user_insert` AFTER INSERT ON `users` FOR EACH ROW BEGIN
  INSERT INTO coin (regist_number) VALUES (NEW.regist_number);
END//
DELIMITER ;
SET SQL_MODE=@OLDTMP_SQL_MODE;

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;
