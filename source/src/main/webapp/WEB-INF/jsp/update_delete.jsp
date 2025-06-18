<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>アカウント情報画面 | Arico</title>

<!-- 共通CSS -->
<link rel="stylesheet" href="<c:url value='/css/common.css' />">
<!-- この画面用CSS -->
<link rel="stylesheet" href="<c:url value='/css/updata_delete.css' />">

<!-- モーダルのスタイル（ここに残す） -->
<style>

/* モーダル背景 */
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: none; /* 初期は非表示 */
  justify-content: center;
  align-items: center;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 999;
}

/* モーダル本体 */
.modal-content {
  background-color: #fff;
  padding: 30px;
  border-radius: 10px;
  width: 90%;
  max-width: 400px;
  text-align: left;
}

/* モーダルボタン */
.modal-buttons {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
}

/* 削除ボタン特化（赤） */
.modal-buttons button[type="submit"][value="削除"] {
  background-color: #f66;
  color: white;
  border: none;
  border-radius: 6px;
  padding: 10px 20px;
  cursor: pointer;
}

/* 戻るボタン */
.return-button {
  background-color: #f66;
  color: white;
  font-size: 16px;
  padding: 10px 20px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  margin-top: 20px;
  display: inline-block;
}

.return-button:hover {
  background-color: #883821;
}

/* モーダル内フォームのinput */
.modal-content input[type="text"],
.modal-content input[type="email"] {
  width: 100%;
  padding: 8px;
  font-size: 14px;
  margin-bottom: 10px;
  border: 1px solid #ccc;
  border-radius: 6px;
}

body {
  margin-top: 140px; /* ヘッダー分の高さ + 余白 */
}
/* タイトル中央寄せ */
h2 {
  text-align: center;
  margin-top: 30px;
  font-family: "メイリオ", Meiryo, sans-serif;
}

/* アカウント情報カードを中央に配置するコンテナ */
.account-container {
  display: flex;
  justify-content: center;
  margin-top: 20px;
}

/* アカウント情報をカード風に装飾 */
.account-card {
  background-color: #ffffff;
  padding: 30px;
  border-radius: 16px;
  box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
  width: 100%;
  max-width: 500px;
  font-family: "メイリオ", Meiryo, sans-serif;
}

/* 各情報の行 */
.info-row {
  margin: 15px 0;
  font-size: 16px;
}

/* ボタン共通デザイン */
.green-button {
  background-color: #28a745;
  color: white;
  font-size: 16px;
  padding: 10px 20px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  transition: background-color 0.3s ease;
  margin-top: 20px;
  display: inline-block;
}

.green-button:hover {
  background-color: #218838;
}

/* ヘッダーの固定 */
#nav {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 120px; /* 少し高さを広げる */
  background-color: #EDD7D5;
  display: flex;
  align-items: center;
  justify-content: space-between;
  padding: 0 10px;
  box-shadow: 0 2px 6px rgba(0,0,0,0.1);
  z-index: 9999;
  box-sizing: border-box;
}

.logo img {
  height: 150px; /* 高さ制限を入れる */
  width: auto;
}

.nav-links {
  display: flex;
  gap: 30px;
  list-style: none;
  margin: 0;
  padding: 0;
}

</style>
</head>
<body>

<nav id="nav">
  <div class="logo">
   <a href="<c:url value='/MenuServlet' />"> <img src="<c:url value='/img/arico_logo2.png'/>" alt="Arico"></a>
  </div>
  <ul class="nav-links">
    <li><a href="<c:url value='/MenuServlet' />">メニュー</a></li>
    <li><a href="<c:url value='/CoinSendServlet' />">送信</a></li>
    <li><a href="<c:url value='/CoinReceiveServlet' />">受信履歴</a></li>
    <li><a href="<c:url value='/RankingServlet' />">ランキング</a></li>
    <li><a href="<c:url value='/UpdateDeleteServlet' />">アカウント情報</a></li>
    <li><a href="<c:url value='/LogoutServlet' />"  class="logout-button">ログアウト</a></li>
  </ul>
</nav>

<h2>アカウント情報</h2>

<div class="account-container">
  <div class="account-card">
    <div class="info-row"><strong>氏名：</strong> ${user.name}</div>
    <div class="info-row"><strong>会社名：</strong> ${user.company}</div>
    <div class="info-row"><strong>メールアドレス：</strong> ${user.mail}</div>

    <div style="text-align: center;">
      <button class="green-button" id="editButton">編集</button>
    </div>
  </div>
</div>

<!-- 編集モーダル -->
<div id="editModal" class="modal-overlay">
  <div class="modal-content">
    <h3>アカウント編集</h3>
    <form action="${pageContext.request.contextPath}/UpdateDeleteServlet" method="post">
      <input type="hidden" name="regist_number" value="${user.regist_number}">

      <label for="name">氏名：</label>
      <input type="text" id="name" name="name" value="${user.name}" required><br><br>

      <label for="company">会社名：</label>
      <input type="text" id="company" name="company" value="${user.company}" required><br><br>

      <label for="mail">メール：</label>
      <input type="email" id="mail" name="mail" value="${user.mail}" required><br><br>

      <input type="hidden" name="password" value="${user.password}">

      <div class="modal-buttons">
        <button type="button" id="cancelEdit" class="return-button">戻る</button>
        <button type="submit" name="submit" value="更新" class="green-button">更新</button>
      </div>
    </form>
  </div>
</div>

<!-- 削除モーダル -->
<div id="deleteModal" class="modal-overlay">
  <div class="modal-content">
    <h3>アカウント削除確認</h3>
    <p>本当にアカウントを削除しますか？この操作は元に戻せません。</p>
    <form action="${pageContext.request.contextPath}/UpdateDeleteServlet" method="post">
      <input type="hidden" name="regist_number" value="${user.regist_number}">
      <input type="hidden" name="mail" value="${user.mail}">
      <input type="hidden" name="password" value="${user.password}">
      <input type="hidden" name="name" value="${user.name}">
      <input type="hidden" name="company" value="${user.company}">
      <div class="modal-buttons">
        <button type="button" id="cancelDelete">キャンセル</button>
        <button type="submit" name="submit" value="削除" style="background-color: #f66; color: white;">削除</button>
      </div>
    </form>
  </div>
</div>

<!-- JavaScript -->
<script src="<c:url value='/js/common.js' />"></script>
<script src="<c:url value='/js/update_delete.js' />"></script>

</body>
</html>