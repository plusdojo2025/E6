<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メニュー</title>
<link rel="stylesheet" href="/webapp/css/menu.css"
	href="/webapp/css/common.css">
</head>
<body>
	<div>
		<ul id="nav">
			<li><img src="${pageContext.request.contextPath}/img/arico_logo2.png" width="613px" height="1283px" alt="Arico" " width="600" height="600"
				alt="Arico"></li>
			<li><a href="/build/classes/servlet/MenuServlet">アカウント情報</a></li>
			<li><a href="/build/classes/servlet/webapp/CoinSendServlet">送信</a></li>
			<li><a href="/build/classes/servlet/webapp/CoinReceiveServlet">受信履歴</a></li>
			<li><a href="/build/classes/servlet/webapp/RankingServlet">ランキング</a></li>
			<li><a href="/build/classes/servlet/webapp/LogoutServlet">ログアウト</a></li>
		</ul>
	</div>
	<h2>ホーム画面</h2>
	<div>
		<p>Topics</p>
		<ul>
			<li></li>
		</ul>
	</div>
	<div>
		<img>
		<h3>感謝を気軽に可視化して伝える仕組み</h3>
		<p></p>
	</div>
	<div>
		<img>
		<h3>感謝を気軽に可視化して伝える仕組み</h3>
		<p></p>
	</div>
	<div>
		<img>
		<h3>見えにくい気配りや助け合いを評価可能に</h3>
		<p></p>
	</div>

	<script src="/webapp/js/common.js"></script>
	<script src="/webapp/js/menu.js"></script>
</body>
</html>