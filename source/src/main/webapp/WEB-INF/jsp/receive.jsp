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

  <div class="card">
    <p><strong>日時：</strong> 2025-06-13 10:00</p>
    <p><strong>送信者：</strong> テスト太郎</p>
    <p><strong>コメント：</strong> お疲れさまです！</p>
    <p><strong>コイン枚数：</strong> 5 枚</p>
  </div>

  <div class="card">
    <p><strong>日時：</strong> 2025-06-13 11:30</p>
    <p><strong>送信者：</strong> テスト花子</p>
    <p><strong>コメント：</strong> ありがとう！</p>
    <p><strong>コイン枚数：</strong> 3 枚</p>
  </div>

  <div class="card">
    <p><strong>日時：</strong> 2025-06-13 12:15</p>
    <p><strong>送信者：</strong> サンプル一郎</p>
    <p><strong>コメント：</strong> 助かりました！</p>
    <p><strong>コイン枚数：</strong> 7 枚</p>
  </div>
<div class="card">
  <p><strong>日時：</strong> 2025-06-13 13:00</p>
  <p><strong>送信者：</strong> 開発次郎</p>
  <p><strong>コメント：</strong> 今日もありがとう！</p>
  <p><strong>コイン枚数：</strong> 2 枚</p>
</div>

<div class="card">
  <p><strong>日時：</strong> 2025-06-13 13:15</p>
  <p><strong>送信者：</strong> 山田三郎</p>
  <p><strong>コメント：</strong> 助かりました！</p>
  <p><strong>コイン枚数：</strong> 4 枚</p>
</div>

<div class="card">
  <p><strong>日時：</strong> 2025-06-13 13:30</p>
  <p><strong>送信者：</strong> テスト四郎</p>
  <p><strong>コメント：</strong> ナイスフォロー！</p>
  <p><strong>コイン枚数：</strong> 1 枚</p>
</div>

<div class="card">
  <p><strong>日時：</strong> 2025-06-13 14:00</p>
  <p><strong>送信者：</strong> 佐藤五郎</p>
  <p><strong>コメント：</strong> またよろしくね</p>
  <p><strong>コイン枚数：</strong> 6 枚</p>
</div>

<div class="card">
  <p><strong>日時：</strong> 2025-06-13 14:20</p>
  <p><strong>送信者：</strong> 林六子</p>
  <p><strong>コメント：</strong> とても助かりました！</p>
  <p><strong>コイン枚数：</strong> 5 枚</p>
</div>

<div class="card">
  <p><strong>日時：</strong> 2025-06-13 14:45</p>
  <p><strong>送信者：</strong> 中村七海</p>
  <p><strong>コメント：</strong> お疲れさまでした！</p>
  <p><strong>コイン枚数：</strong> 3 枚</p>
</div>

<div class="card">
  <p><strong>日時：</strong> 2025-06-13 15:00</p>
  <p><strong>送信者：</strong> 渡辺八郎</p>
  <p><strong>コメント：</strong> ありがとう！</p>
  <p><strong>コイン枚数：</strong> 2 枚</p>
</div>

<div class="card">
  <p><strong>日時：</strong> 2025-06-13 15:15</p>
  <p><strong>送信者：</strong> 高橋九美</p>
  <p><strong>コメント：</strong> グッジョブ！</p>
  <p><strong>コイン枚数：</strong> 4 枚</p>
</div>

<div class="card">
  <p><strong>日時：</strong> 2025-06-13 15:30</p>
  <p><strong>送信者：</strong> 鈴木十郎</p>
  <p><strong>コメント：</strong> 助かった！</p>
  <p><strong>コイン枚数：</strong> 3 枚</p>
</div>

<div class="card">
  <p><strong>日時：</strong> 2025-06-13 15:45</p>
  <p><strong>送信者：</strong> 松本十一</p>
  <p><strong>コメント：</strong> 素晴らしいです！</p>
  <p><strong>コイン枚数：</strong> 6 枚</p>
</div>
  
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