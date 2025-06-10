/*データベース作成*/
CREATE DATABASE e6;

/*usersテーブル作成*/
CREATE TABLE users (
    regist_number INT PRIMARY KEY AUTO_INCREMENT,
    mail VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100),
    company VARCHAR(100)
);

/*coinテーブル作成*/
CREATE TABLE coin (
    regist_number INT PRIMARY KEY,
    hold_coin INT DEFAULT 50,
    recive_coin INT DEFAULT 0,
    ranking_coin INT DEFAULT 0,
    FOREIGN KEY (regist_number) REFERENCES users(regist_number)
);

/*sendテーブル作成*/
CREATE TABLE send (
    id INT PRIMARY KEY AUTO_INCREMENT,
    regist_number INT NOT NULL,
    send_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    comment VARCHAR(200),
    send_coin INT DEFAULT 0,
    receiver_number INT NOT NULL,
    FOREIGN KEY (regist_number) REFERENCES users(regist_number)
);

/*usersに入った登録番号をcoinにも入れるトリガー*/
DELIMITER $$

CREATE TRIGGER after_user_insert
AFTER INSERT ON users
FOR EACH ROW
BEGIN
  INSERT INTO coin (regist_number) VALUES (NEW.regist_number);
END $$

DELIMITER ;