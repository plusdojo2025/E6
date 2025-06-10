/*データベース作成*/
CREATE DATABASE e6;
use e6;

/*usersテーブル作成*/
CREATE TABLE users (
    regist_number INT PRIMARY KEY AUTO_INCREMENT,
    mail VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    name VARCHAR(100) NOT NULL,
    company VARCHAR(100)NOT NULL
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
    send_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    comment VARCHAR(3000),
    send_coin INT DEFAULT 0,
    receiver_number INT NOT NULL
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

/*ログイン判定*/
SELECT count(*) FROM users WHERE mail=? AND pw=?;

/*新規登録*/
INSERT INTO users VALUES (0, ?, ?, ?, ?);

/*パスワード登録*/
INSERT INTO users VALUES　(0, ?, ?, ?, ?);

/*メニュー画面の新着受信履歴*/
SELECT id, send_data, name FROM send WHERE receiver_number=? ORDER BY DESC;

/*ユーザー情報の表示*/
SELECT company, name, mail FROM users WHERE regist_number=?;

/*ユーザー情報の登録*/
UPDATE SET users SET company=?, name=?, mail=? WHERE regist_number=?;

/*ユーザー情報の削除*/
DELETE FROM users WHERE regist_number=?;

/*コインの送信*/
SELECT name FROM users WHERE regist_number=?;
INSERT INTO send VALUES (0, ?, ?, ?, ?, ?);

/*コインの受信履歴*/
SELECT name FROM users WHERE regist_number=?;
SELECT name FROM users WHERE regist_number=?;
SELECT id, comment, send_coin, send_date FROM send WHERE receive_number=? ORDER BY DESC;

/*ランキング表示*/
SELECT name, ranking_coin

/*
 * 
 * 
 * 会社でまとめるの忘れるな！！！！！！！！！！！！！！！
 * 
 * 
 * 
 */*/