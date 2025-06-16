<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コイン送信画面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/send.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
</style>
<body>
<nav id="nav">
  <div class="logo">
    <a href="/E6/MenuServlet"> <img src="${pageContext.request.contextPath}/img/arico_logo2.png" width="300" height="150" alt="Arico"></a>
  </div>
  <ul class="nav-links">
    <li><a href="/E6/UpdateDeleteServlet">アカウント情報</a></li>
    <li><a href="/E6/MenuServlet">メニュー</a></li>
    <li><a href="/E6/CoinReceiveServlet">受信履歴</a></li>
    <li><a href="/E6/RankingServlet">ランキング</a></li>
    <li><a href="/E6/LogoutServlet">ログアウト</a></li>
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

<script src="js/send.js">
</script>
</body>
</html>