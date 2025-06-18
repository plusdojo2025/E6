<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>新規登録画面 | Arico</title>
  <link rel="stylesheet" href="<c:url value='/css/common.css' />">
  <link rel="stylesheet" href="<c:url value='/css/regist_data.css' />">
  <style>
/* 入力間違えたら赤くなるよ */
.error {
  border: 2px solid red;
}
.error-message {
  color: red;
  font-size: 0.85em;
  margin-top: 4px;
}

/* 全体の中央配置 */
.wrapper {
  display: flex;
  justify-content: center;
  align-items: center;
  min-height: 100vh;
  padding: 50px;
  box-sizing: border-box;
}

/* カード風全体 */
.card {
  background-color: #ffffff;
  padding: 40px;
  border-radius: 20px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 500px;
  box-sizing: border-box;
  text-align: center;
}

/* フォームタイトル */
.form-title {
  margin-bottom: 20px;
  font-size: 24px;
  color: #333;
  text-align: center;
}

/* テーブル調整 */
.form-table {
  width: 100%;
  border-collapse: collapse;
  margin: 0 auto;
}
.form-table th,
.form-table td {
  padding: 10px 0;
}

/* テキストボックス（共通） */
input[type="text"],
input[type="email"],
input[type="password"] {
  width: 100%;
  max-width: 300px;
  padding: 10px;
  font-size: 16px;
  border-radius: 6px;
  border: 1px solid #ccc;
  box-sizing: border-box;
  display: block;
  margin: 0 auto;
  text-align: left;
}

/* ボタン共通 */
input[type="submit"],
input[type="button"] {
  display: inline-block;
  font-weight: bold;
  border: none;
  border-radius: 8px;
  padding: 10px 20px;
  cursor: pointer;
}

/* 登録ボタン */
input[type="submit"] {
  background-color: #ee827c;
  color: white;
}
input[type="submit"]:hover {
  background-color: #ed665f;
}

/* 戻るボタン */
input[type="button"] {
  background-color: #38b48b;
  color: white;
  margin-left: 10px;
}
input[type="button"]:hover {
  background-color: #2f9976;
}

/* 注意文も中央に */
.form-table td p {
  margin: 0;
  padding: 0;
  text-align: center;
}
.form-table small {
  display: inline-block;
  text-align: center;
}

/* スマホ対応 */
@media screen and (max-width: 480px) {
  .card {
    padding: 20px;
  }
  input[type="text"],
  input[type="email"],
  input[type="password"] {
    font-size: 16px;
  }
}
  </style>
</head>
<body>
<div class="wrapper">
  <div class="card">
    <h2 class="form-title">新規登録</h2>
    <form id="regist_form" action="RegistServlet" method="post">
      <div class="form-group">
        <label for="company">会社名</label>
        <input type="text" name="company" id="company" placeholder="会社名">
        <div id="companyError" class="error-message"></div>
      </div>

      <div class="form-group">
        <label for="name">氏名</label>
        <input type="text" name="name" id="name" placeholder="氏名">
        <div id="nameError" class="error-message"></div>
      </div>

      <div class="form-group">
        <label for="mail">メールアドレス</label>
        <input type="email" name="mail" id="mail" placeholder="メールアドレス">
        <div id="mailError" class="error-message"></div>
      </div>

      <div class="form-group">
        <label for="password">パスワード</label>
        <input type="password" name="password" id="password" placeholder="パスワード" maxlength="20" minlength="8" pattern="^[a-zA-Z0-9]+$">
        <div id="passwordError" class="error-message"></div>
      </div>

      <div class="form-group">
        <label for="password2">パスワード再入力</label>
        <input type="password" name="password2" id="password2" placeholder="パスワード再入力" pattern="^[a-zA-Z0-9]+$">
        <div id="password2Error" class="error-message"></div>
      </div>

      <div class="note">
        <small>※8~20文字以内の半角英数字の組み合わせでパスワードを設定してください。</small>
      </div>

      <div class="form-actions">
        <input type="submit" id="regist" name="submit" value="登録">
        <input type="button" value="前のページに戻る" onclick="location.href='/e6/LoginServlet'">
      </div>
    </form>
  </div>
</div>
<script src="<c:url value='/js/common.js' />"></script>
<script src="<c:url value='/js/regist_data.js' />"></script>
</body>
</html>