<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アカウント情報画面</title>

<!-- 共通CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<!-- この画面用CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/updata_delete.css">

<!-- モーダルのスタイル（ここに残す） -->
<style>

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
</style>
</head>
<body>

<header>
  <a href="menu.jsp">
    <img src="${pageContext.request.contextPath}/img/arico_logo2.png" width="300" height="150" alt="Arico">
  </a>
  <ul>
    <li><a href="${pageContext.request.contextPath}/MenuServlet">メニュー</a></li>
    <li><a href="${pageContext.request.contextPath}/CoinSendServlet">送信</a></li>
    <li><a href="${pageContext.request.contextPath}/CoinReceiveServlet">受信履歴</a></li>
    <li><a href="${pageContext.request.contextPath}/RankingServlet">ランキング</a></li>
    <li><a href="${pageContext.request.contextPath}/LogoutServlet">ログアウト</a></li>
  </ul>
</header>

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
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/update_delete.js"></script>

</body>
</html>