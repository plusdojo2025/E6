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

-- テーブル e6.coin: ~8 rows (約) のデータをダンプしています
REPLACE INTO `coin` (`regist_number`, `hold_coin`, `receive_coin`, `ranking_coin`) VALUES
	(1, 50, 73, 0),
	(2, 50, 15, 0),
	(3, -23, 0, 0),
	(6, 50, 0, 0),
	(7, 50, 0, 0),
	(8, 50, 0, 0),
	(9, 50, 0, 0),
	(10, -14, 0, 0);

--  テーブル e6.send の構造をダンプしています
CREATE TABLE IF NOT EXISTS `send` (
  `id` int NOT NULL AUTO_INCREMENT,
  `regist_number` int NOT NULL,
  `send_date` datetime DEFAULT CURRENT_TIMESTAMP,
  `comment` varchar(3000) DEFAULT NULL,
  `send_coin` int DEFAULT '0',
  `receiver_number` int NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- テーブル e6.send: ~28 rows (約) のデータをダンプしています
REPLACE INTO `send` (`id`, `regist_number`, `send_date`, `comment`, `send_coin`, `receiver_number`) VALUES
	(1, 1, '2025-06-13 13:21:24', '7', 7, 1),
	(2, 3, '2025-06-13 14:52:03', 'a', 1, 1),
	(3, 3, '2025-06-13 14:52:14', 'aqdcc', 7, 1),
	(4, 3, '2025-06-13 14:52:27', '', 8, 1),
	(5, 3, '2025-06-13 14:52:31', '', 9, 1),
	(6, 3, '2025-06-13 14:52:33', '', 8, 1),
	(7, 3, '2025-06-13 14:52:35', '', 1, 1),
	(8, 3, '2025-06-13 14:52:35', '', 1, 1),
	(9, 3, '2025-06-13 14:52:35', '', 1, 1),
	(10, 3, '2025-06-13 14:52:35', '', 1, 1),
	(11, 3, '2025-06-13 14:52:36', '', 1, 1),
	(12, 3, '2025-06-13 14:52:36', '', 1, 1),
	(13, 3, '2025-06-13 14:52:37', '', 1, 1),
	(14, 3, '2025-06-13 14:52:37', '', 1, 1),
	(15, 3, '2025-06-13 14:53:08', '', 1, 1),
	(16, 3, '2025-06-13 16:03:56', 'kannsha', 5, 1),
	(17, 3, '2025-06-13 16:26:53', '', 5, 1),
	(18, 3, '2025-06-13 16:26:57', '', 7, 1),
	(19, 3, '2025-06-13 16:27:01', '', 8, 1),
	(20, 3, '2025-06-13 16:27:03', '', 1, 1),
	(21, 3, '2025-06-13 16:27:03', '', 1, 1),
	(22, 3, '2025-06-13 16:27:04', '', 1, 1),
	(23, 3, '2025-06-13 16:27:04', '', 1, 1),
	(24, 3, '2025-06-13 16:27:04', '', 1, 1),
	(25, 3, '2025-06-13 16:27:04', '', 1, 1),
	(26, 10, '2025-06-17 10:36:55', '', 4, 2),
	(27, 10, '2025-06-17 10:37:00', '', 4, 2),
	(28, 10, '2025-06-17 10:37:04', '', 7, 2);

--  テーブル e6.users の構造をダンプしています
CREATE TABLE IF NOT EXISTS `users` (
  `regist_number` int NOT NULL AUTO_INCREMENT,
  `mail` varchar(100) NOT NULL,
  `password` varchar(255) NOT NULL,
  `name` varchar(100) NOT NULL,
  `company` varchar(100) NOT NULL,
  PRIMARY KEY (`regist_number`),
  UNIQUE KEY `mail` (`mail`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

-- テーブル e6.users: ~8 rows (約) のデータをダンプしています
REPLACE INTO `users` (`regist_number`, `mail`, `password`, `name`, `company`) VALUES
	(1, 'taro@example.com', 'password123', '山田 太郎', '株式会社テスト'),
	(2, 'a', 'a', '福山雅治', '株式会社SEプラス'),
	(3, '123', '123', '永吉嵐', '株式会社テスト'),
	(6, 'b@b', 'bbbbbbbb', '千代田千代美', '株式会社SEプラス'),
	(7, '', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', '山田一郎', '株式会社テスト'),
	(8, 'aaa@aaaa', '5e884898da28047151d0e56f8dc6292773603d0d6aabbdd62a11ef721d1542d8', '永吉嵐', '株式会社SEプラス'),
	(9, 'hisao@yazawa', 'e3b0c44298fc1c149afbf4c8996fb92427ae41e4649b934ca495991b7852b855', '矢沢久雄', '株式会社SEプラス'),
	(10, 'yazawa@kamikousi', '368002a2b4be72c95059fa9a4302e3c6a4c2403ff3247af409299b82fc5d7fe3', '矢沢久雄', '株式会社SEプラス');

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
