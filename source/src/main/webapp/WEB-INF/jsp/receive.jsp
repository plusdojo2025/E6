<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>受信履歴 | Arico</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/receive.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>
<h1>
  <a><img src="${pageContext.request.contextPath}/img/arico_logo2.png" width="300px" height="150px" alt="Arico"></a>
</h1>

<ul id="nav">
  <li><a href="/E6/UpdateDeleteServlet">アカウント情報</a></li>
  <li><a href="/E6/CoinSendServlet">送信</a></li>
  <li><a href="/E6/MenuServlet">メニュー</a></li>
  <li><a href="/E6/RankingServlet">ランキング</a></li>
  <li><a href="/E6/LogoutServlet">ログアウト</a></li>    
</ul>

<h2>受信履歴</h2>
<c:forEach var="send" items="${receivedList}">
  <div class="card">
    <p><strong>日時：</strong> ${send.date}</p>
    <p><strong>送信者：</strong> ${send.Name}</p>
    <p><strong>コメント：</strong> ${send.comment}</p>
    <p><strong>コイン枚数：</strong> ${send.coin} 枚</p>
  </div>
</c:forEach>
  
  
<!-- ページャー -->
<div style="margin-top: 20px; text-align: center;">
  <c:if test="${currentPage > 1}">
    <a href="CoinReceiveServlet?page=${currentPage - 1}">← 前のページ</a>
  </c:if>

  <span>ページ ${currentPage} / ${totalPages}</span>

  <c:if test="${currentPage < totalPages}">
    <a href="CoinReceiveServlet?page=${currentPage + 1}">次のページ →</a>
  </c:if>
</div>
<script src="${pageContext.request.contextPath}/js/common.js"></script>
<script src="${pageContext.request.contextPath}/js/receive.js"></script>
</body>
</html>