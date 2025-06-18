<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>メニュー | Arico</title>
<link rel="stylesheet" href="<c:url value='/css/common.css' />">
<link rel="stylesheet" href="<c:url value='/css/menu.css' />">
<style>
  .topics-section {
    margin: 30px;
  }

  .topics-section h2 {
    font-size: 24px;
    margin-bottom: 10px;
  }

  .topics-list {
    list-style: none;
    padding: 0;
    border-left: 3px solid #e08888;
  }

  .topics-list li {
    padding: 10px 0;
    border-bottom: 1px solid #f0c0c0;
    font-size: 16px;
  }

  .feature-section {
    display: flex;
    flex-direction: column;
    gap: 30px;
    padding: 20px;
  }

  .feature-card {
    display: flex;
    background-color: #f6d5d5;
    border-radius: 12px;
    padding: 20px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    align-items: center;
    flex-wrap: wrap;
  }

  .feature-image {
    width: 200px;
    height: 200px;
    background-color: #ccc;
    margin-right: 20px;
    flex-shrink: 0;
    border-radius: 10px;
  }

  .feature-text h3 {
    font-size: 20px;
    font-weight: bold;
    margin-bottom: 10px;
  }

  .feature-text p {
    font-size: 16px;
    margin: 0;
  }
</style>
</head>
<body>
<nav id="nav">
  <div class="logo">
    <a href="<c:url value='/MenuServlet'/>">
     <img src="<c:url value='/img/arico_logo2.png'/>" width="300" height="150" alt="Arico">
    </a>
  </div>
  
  <!-- ▼ 追加：ハンバーガーアイコン -->
  <div class="hamburger" id="hamburger">&#9776;</div>
  
  <ul class="nav-links">
    <li><a href="<c:url value='/MenuServlet' />">メニュー</a></li>
    <li><a href="<c:url value='/CoinSendServlet' />">送信</a></li>
    <li><a href="<c:url value='/CoinReceiveServlet' />">受信履歴</a></li>
    <li><a href="<c:url value='/RankingServlet' />">ランキング</a></li>
    <li><a href="<c:url value='/UpdateDeleteServlet' />">アカウント情報</a></li>
    <li><a href="<c:url value='/LogoutServlet' />" class="logout-button">ログアウト</a></li>
  </ul>
</nav>

<h2>ホーム画面</h2>

<div class="topics-section">
  <h2>Topics</h2>
  <ul class="topics-list">
    <c:forEach var="message" items="${recentMessages}">
      <li>
        <strong><fmt:formatDate value="${message.send_date}" pattern="MM/dd" /></strong>
        ${message.sender_name}さんからありがとうを貰いました！
      </li>
    </c:forEach>
    <c:if test="${empty recentMessages}">
      <li>新着受信履歴はありません。</li>
    </c:if>
  </ul>
</div>

<div class="feature-section">
  <div class="feature-card">
    <img src="<c:url value='/img/arico_menulogo1.png'/>" width="200" height="200" alt="Thankyou">
    <div class="feature-text">
      <h3>感謝をコインで気軽に可視化して伝える仕組み</h3>
      <p>仕事中に直接「ありがとう」を伝えられない場面でも、オンライン上でコインとメッセージを使って、誰でも簡単に、立場や時間にとらわれずに感謝を届けられます！</p>
    </div>
  </div>

  <div class="feature-card">
  <img src="<c:url value='/img/arico_menulogo2.png'/>" width="200" height="200" alt="Thankyou">
    <div class="feature-text">
      <h3>見えにくい気配りや助け合いを評価可能に</h3>
      <p>業務の中で小さな配慮や支援は見過ごされがちですが、Aricoはコイン送信やランキング機能によって、”見える化”し、社内での信頼や評価につながります！</p>
    </div>
  </div>

  <div class="feature-card">
   <img src="<c:url value='/img/arico_menulogo3.png'/>" width="200" height="200" alt="Thankyou">
    <div class="feature-text">
      <h3>社内のコミュニケーション活性化と働き甲斐の向上</h3>
      <p>感謝の伝える機会が増えることで、社員同士の信頼関係が深まり、円滑な仕事の進行や前向きな環境の形成につながります！</p>
    </div>
  </div>
</div>

<script src="<c:url value='/js/common.js' />"></script>
<script src="<c:url value='/js/menu.js' />"></script>
</body>
</html>