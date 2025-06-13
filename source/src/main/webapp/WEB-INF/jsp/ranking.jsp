<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ranking</title>
<link rel="stylesheet" href="css/ranking.css" href="css/common.css">
</head>
<body>
   <header>
    	<a href="menu.jsp"> <img src="${pageContext.request.contextPath}/img/arico_logo2.png" width="300" height="150" alt="Arico"></a>
    		<ul>
	   			<li><a href="/E6/UpdateDeleteServlet">アカウント情報</a></li>
			<li><a href="/E6/CoinSendServlet">送信</a></li>
			<li><a href="/E6/CoinReceiveServlet">受信履歴</a></li>
					<li><a href="/E6/MenuServlet">メニュー</a></li>
					<li><a href="/E6/LogoutServlet">ログアウト</a></li>
   			</ul>
   		<h2>ランキング</h2>
   </header>
<script src="js/common.js"></script>
<script src="js/ranking.js"></script>
</body>
</html>