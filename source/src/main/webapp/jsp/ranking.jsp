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
    	<a href="menu.jsp"> <img src="${pageContext.request.contextPath}/img/arico_logo2.png" width="200" height="100" alt="Arico"></a>
    		<ul>
	   			<li><a href="/build/classes/servlet/webapp/DataServlet">アカウント情報</a></li>
					<li><a href="/build/classes/servlet/webapp/CoinSendServlet">送信</a></li>
					<li><a href="/build/classes/servlet/webapp/CoinReceiveServlet">受信履歴</a></li>
					<li><a href="/build/classes/servlet/webapp/MenuServlet">メニュー</a></li>
					<li><a href="/build/classes/servlet/webapp/LogoutServlet">ログアウト</a></li>
   			</ul>
   		<h2>ランキング</h2>
   </header>
<script src="js/ranking.js">
</script>
</body>
</html>