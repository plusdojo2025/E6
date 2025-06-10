<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メニュー</title>
</head>
<body>
	<div>
		<ul id="nav">
			<li><img src=".png" width="600" height="600" alt="Arico"></li>
			<li><a href="/build/classes/servlet/MenuServlet">アカウント情報</a></li>
			<li><a href="/build/classes/servlet/webapp/CoinSendServlet">送信</a></li>
			<li><a href="/build/classes/servlet/webapp/CoinReceiveServlet">受信履歴</a></li>
			<li><a href="/build/classes/servlet/webapp/RankingServlet">ランキング</a></li>
			<li><a href="/build/classes/servlet/webapp/LogoutServlet">ログアウト</a></li>
		</ul>
	</div>

</body>
</html>