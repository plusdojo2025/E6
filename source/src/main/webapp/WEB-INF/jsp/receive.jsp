<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>受信履歴 | Arico</title>
<link rel="stylesheet" href="css/receive.css">
<link rel="stylesheet" href="css/common.css">
</head>
<body>
<h1>
  <a><img src="${pageContext.request.contextPath}/img/arico_logo2.png" width="300px" height="150px" alt="Arico"></a>
</h1>

<ul id="nav">
  <li><a href="/webapp/DataServlet">アカウント情報</a></li>
  <li><a href="/webapp/CoinSendServlet">送信</a></li>
  <li><a href="/webapp/MenuServlet">メニュー</a></li>
  <li><a href="/webapp/RankingServlet">ランキング</a></li>
  <li><a href="/webapp/LogoutServlet">ログアウト</a></li>    
</ul>

<h2>受信履歴</h2>

<div class="card-container">
  <c:forEach var="send" items="${receivedList}">
    <div class="card">
      <p><strong>日時：</strong> ${send.date}</p>
      <p><strong>送信者：</strong> ${send.Name}</p>
      <p><strong>コメント：</strong> ${send.comment}</p>
      <p><strong>コイン枚数：</strong> ${send.coin} 枚</p>
    </div>
  </c:forEach>
</div>

<script src="js/receive.js"></script>
</body>
</html>