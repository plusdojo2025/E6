<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>コイン送信画面 | Arico</title>
<link rel="stylesheet" href="<c:url value='/css/send.css' />">
<link rel="stylesheet" href="<c:url value='/css/common.css' />">
</head>
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

/* 共通の緑ボタン */
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

/* セレクトボックスの装飾 */
select {
  width: 100%;
  padding: 10px;
  font-size: 16px;
  border-radius: 8px; /* 丸角 */
  border: 1px solid #ccc;
  box-sizing: border-box;
}

/* テキストエリアの装飾 */
textarea {
  width: 100%;
  padding: 10px;
  font-size: 16px;
  border-radius: 8px; /* 丸角 */
  border: 1px solid #ccc;
  resize: vertical;
  box-sizing: border-box;
}

/* テーブルの中のテキストを少し余裕ある配置に */
table td {
  padding: 10px;
  vertical-align: top;
}

</style>
<body>
<nav id="nav">
  <div class="logo">
    <a href="<c:url value='/MenuServlet' />"> <img src="<c:url value='/img/arico_logo2.png'/>" width="300" height="150" alt="Arico"></a>
  </div>
  
  <!-- ▼ 追加：ハンバーガーアイコン -->
  <div class="hamburger" id="hamburger">&#9776;</div>
  
  <ul class="nav-links" id="nav-links">
    <li><a href="<c:url value='/MenuServlet' />">メニュー</a></li>
    <li><a href="<c:url value='/CoinSendServlet' />">送信</a></li>
    <li><a href="<c:url value='/CoinReceiveServlet' />">受信履歴</a></li>
    <li><a href="<c:url value='/RankingServlet' />">ランキング</a></li>
    <li><a href="<c:url value='/UpdateDeleteServlet' />">アカウント情報</a></li>
    <li><a href="<c:url value='/LogoutServlet' />" class="logout-button">ログアウト</a></li>
  </ul>
</nav>
<h2>コイン送信</h2>

<% String error = (String) request.getAttribute("error"); %>
<% String message = (String) request.getAttribute("message"); %>
<% if (error != null) { %>
    <p style="color:red;"><%= error %></p>
<% } else if (message != null) { %>
    <p style="color:green;"><%= message %></p>
<% } %>

<form method="POST" action="CoinSendServlet">
  <div class="account-container">
    <div class="account-card">
      <h3 style="text-align:center;">ありがとう送信✉</h3>
      <p style="text-align:center;">現在のあなたの所持コイン：<strong>${holdCoin}</strong> 枚</p>
      <table>
        <tr>
          <td><label>送りたい相手</label></td>
          <td>
            <select name="receiver_number" required>
              <c:forEach var="user" items="${userList}">
                <option value="${user.regist_number}">
                  ${user.regist_number}　${user.name}
                </option>
              </c:forEach>
            </select>
          </td>
        </tr>
        <tr>
          <td><label>コインの枚数</label></td>
          <td>
            <select name="send_coin" required>
              <c:forEach var="i" begin="1" end="10">
                <option value="${i}">${i}</option>
              </c:forEach>
            </select>
          </td>
        </tr>
        <tr>
          <td><label>メッセージ</label></td>
          <td>
            <textarea name="comment" rows="4" placeholder="感謝の気持ちを入力してください"></textarea>
          </td>
        </tr>
      </table>
      <div style="text-align:center;">
        <input type="submit" value="送信" class="green-button">
      </div>
    </div>
  </div>
</form>

<script src="<c:url value='/js/common.js' />"></script>
<script src="<c:url value='/js/send.js' />"></script>
<script>
document.addEventListener("DOMContentLoaded", function () {
	  const hamburger = document.getElementById("hamburger");
	  const navLinks = document.getElementById("nav-links");

	  if (hamburger && navLinks) {
	    hamburger.addEventListener("click", function () {
	      navLinks.classList.toggle("active");
	    });
	  }
	});
</script>
</body>
</html>