<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>受信履歴 | Arico</title>
<link rel="stylesheet" href="<c:url value='css/receive.css'/>">
<link rel="stylesheet" href="<c:url value='/css/common.css' />">
</head>
<body>
<nav id="nav">
  <div class="logo">
     <a href="<c:url value='/MenuServlet' />"> <img src="<c:url value='/img/arico_logo2.png'/>" alt="Arico"></a>
  </div>
  
  <!-- ▼ 追加：ハンバーガーアイコン -->
  <div class="hamburger" id="hamburger">&#9776;</div>
  
  <ul class="nav-links" id="nav-links">
  	<li><a href="<c:url value='/MenuServlet' />">メニュー</a></li>
  	<li><a href="<c:url value='/CoinSendServlet' />">送信</a></li>
  	<li><a href="<c:url value='/CoinReceiveServlet' />">受信履歴</a></li>
  	<li><a href="<c:url value='/RankingServlet' />">ランキング</a></li>
    <li><a href="<c:url value='/UpdateDeleteServlet' />">アカウント情報</a></li>
    <li><a href=<c:url value='/LogoutServlet' /> class="logout-button">ログアウト</a></li>
  </ul>
</nav>

<h2>受信履歴</h2>
<div class="card-container">
<c:forEach var="send" items="${companySendList}">
  <div class="card">
    <p><strong>日時：</strong> ${send.send_date}</p>
    <p><strong>送信者：</strong> ${send.sender_name}</p>
    <p><strong>コメント：</strong> ${send.comment}</p>
    <p><strong>コイン枚数：</strong> ${send.send_coin} 枚</p>
  </div>
</c:forEach>
 </div> 
  
<!-- ページャー -->
<!-- ページネーション -->
<div class="pager">
  <ul class="pagination">
    <c:if test="${currentPage > 1}">
      <li class="pre"><a href="CoinReceiveServlet?page=${currentPage - 1}"><span>←</span></a></li>
    </c:if>

    <c:forEach begin="1" end="${totalPages}" var="i">
      <li>
        <a href="CoinReceiveServlet?page=${i}" class="${i == currentPage ? 'active' : ''}">
          <span>${i}</span>
        </a>
      </li>
    </c:forEach>

    <c:if test="${currentPage < totalPages}">
      <li class="next"><a href="CoinReceiveServlet?page=${currentPage + 1}"><span>→</span></a></li>
    </c:if>
  </ul>
</div>
<script src="<c:url value='/js/common.js' />"></script>
<script src="<c:url value='/js/receive.js' />"></script>
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