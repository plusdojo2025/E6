<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>メニュー</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/send.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>
	<div>
		<ul id="nav">
			<li><img src="${pageContext.request.contextPath}/img/arico_logo2.png" alt="Arico" " width="600" height="600"
				alt="Arico"></li>
			<li><a href="/E6/UpdateDeleteServlet">アカウント情報</a></li>
			<li><a href="/E6/CoinSendServlet">送信</a></li>
			<li><a href="/E6/CoinReceiveServlet">受信履歴</a></li>
			<li><a href="/E6/RankingServlet">ランキング</a></li>
			<li><a href="/E6/LogoutServlet">ログアウト</a></li>
		</ul>
	</div>
	<h2>ホーム画面</h2>
	<div>
		<p>Topics</p>
		<ul>
			<c:forEach var="message" items="${recentMessages}">
			<li>
				${message.sender_name}さんからコインを受信しました(${messeage.send_date})
			</li>
			</c:forEach>
			<c:if test="${empty recentMessages}">
				<li>新着受信履歴はありません。</li>
			</c:if>
		</ul>
	</div>
	<div>
		<img>
		<h3>感謝を気軽に可視化して伝える仕組み</h3>
		<p>仕事中に直接「ありがとう」を伝えられない場面でも、オンライン上でコインとメッセージを使って、誰でも簡単に、立場や時間にとらわれずに感謝を届けられる</p>
	</div>
	<div>
		<img>
		<h3>見えにくい気配りや助け合いを評価可能に</h3>
		<p>業務の中で小さな配慮や支援は見過ごされがちですが、Aricoはコイン送信やランキング機能によって、”見える化”し、社内での信頼や評価につながります</p>
	</div>
	<div>
		<img>
		<h3>社内のコミュニケーション活性化と働き甲斐の向上</h3>
		<p>感謝の伝える機会が増えることで、社員同士の信頼関係が深まり、円滑な仕事の進行や前向きな環境の形成につながります！</p>
	</div>

	<script src="/E6/js/common.js"></script>
	<script src="/E6/js/menu.js"></script>
</body>
</html>