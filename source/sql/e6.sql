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

    hold_coin INT DEFAULT 50,/*100にする*/

    receive_coin INT DEFAULT 0,

    ranking_coin INT DEFAULT 0,

    FOREIGN KEY (regist_number) REFERENCES users(regist_number)

);

/*初期値100にするための文*/
ALTER TABLE coin ALTER COLUMN hold_coin SET DEFAULT 100;

/*sendテーブル作成*/

CREATE TABLE send (

    id INT PRIMARY KEY AUTO_INCREMENT,

    regist_number INT NOT NULL,

    send_date DATETIME DEFAULT CURRENT_TIMESTAMP,

    comment VARCHAR(3000),

    send_coin INT DEFAULT 0,

    receiver_number INT NOT NULL

);

/*コインリセット用日時記録*/
CREATE TABLE monthly_reset_log (
    id INT PRIMARY KEY AUTO_INCREMENT,
    reset_year INT NOT NULL,
    reset_month INT NOT NULL,
    reset_time TIMESTAMP DEFAULT CURRENT_TIMESTAMP
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

/*ログイン判定(usersテーブルからメールアドレスとパスワードの項目で合う数を探す)*/

SELECT count(*) FROM users WHERE mail=? AND pw=?;

/*新規登録（usersテーブルに入力された情報を挿入する）*/

INSERT INTO users VALUES (0, ?, ?, ?, ?);

/*パスワード登録（usersテーブルに入力された情報を挿入する）*/

INSERT INTO users VALUES　(0, ?, ?, ?, ?);

/*メニュー画面の新着受信履歴（ログインしているユーザーのusers.regist_numberと一致するrecive_numberを持つsendテーブルのid,send_date,regist_numberを取得。sendテーブルとusersテーブルをregist_numberで結合し、nameを取得。降順で並び替えて取り出す）*/

SELECT 

    send.id, 

    send.send_date, 

    send.regist_number, 

    users.name

FROM 

    send

JOIN 

    users ON send.regist_number = users.regist_number

WHERE 

    send.receiver_number = ?

ORDER BY 

    send.send_date DESC;

/*ユーザー情報の表示（usersテーブルからregist_number が指定された値と一致するユーザーの「会社名」「名前」「メールアドレス」を取得する）*/

SELECT company, name, mail FROM users WHERE regist_number=?;

/*ユーザー情報の登録（usersテーブルに、入力された会社名と氏名、メールアドレスを挿入し、一意の値が自動で発番されて登録番号となる）*/

UPDATE SET users SET company=?, name=?, mail=? WHERE regist_number=?;

/*ユーザー情報の削除（usersテーブルからregist_number が指定された値と一致するユーザーの情報を削除する）*/

DELETE FROM users WHERE regist_number=?;

/*コインの送信（usersテーブルからログインしているユーザーの会社名を登録番号から指定して、その会社名と一致する登録番号と名前を取得する。sendテーブルに入力された情報を挿入する。また、オートインクリメントでidを挿入する。）*/

SELECT regist_number, name

FROM users

WHERE company = (

    SELECT company FROM users WHERE regist_number = ?

);

INSERT INTO send VALUES (0, ?, ?, ?, ?, ?);

/*コインの受信履歴（送信のid、送信者の登録番号、送信者の名前、コメント、送るコインの枚数、送信日時をsendテーブルから取得する。sendテーブルのregist_number(送信者)とusersテーブルのregist_number（登録者の名前）をJOINで結合して送信者の名前を取得する。WHEREで今ログインしているユーザーの登録番号をログイン履歴から取得し、そのユーザーが受け取ったコインの送信履歴を降順で表示する。）*/

SELECT 

    s.id, 

    s.regist_number, 

    u.name, 

    s.comment, 

    s.send_coin, 

    s.send_date

FROM 

    send s

JOIN 

    users u ON s.regist_number = u.regist_number

WHERE 

    s.receive_number = ?

ORDER BY 

    s.send_date DESC;

/*ランキング表示（ログインしているユーザーの会社名が一致する上位5名の、登録番号と受け取ったコインの総数をcoinテーブルから取得し、coinテーブルのregist_numberとusersテーブルのregist_numberをJOINで結合し、氏名を取得する。降順で取得する。）*/

SELECT TOP 5 

    c.regist_number,

    u.name,

    c.ranking_coin

FROM 

    coin c

JOIN 

    users u ON c.regist_number = u.regist_number

WHERE 

    c.company = (

        SELECT company FROM users WHERE regist_number = ?

    )

ORDER BY 

    c.ranking_coin DESC;

