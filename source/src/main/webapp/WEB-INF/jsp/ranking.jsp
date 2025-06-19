<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>ランキング | Arico</title>
<link rel="stylesheet" href="<c:url value='/css/common.css' />">
<link rel="stylesheet" href="<c:url value='/css/ranking.css' />">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
</head>
<body>
   <nav id="nav">
  <div class="logo">
    <a href="<c:url value='/MenuServlet' />">
      <img src="<c:url value='/img/arico_logo2.png'/>" width="300" height="150" alt="Arico">
    </a>
  </div>
  
  <!-- ▼ 追加：ハンバーガーアイコン -->
  <div class="hamburger" id="hamburger">&#9776;</div>
  
  <ul class="nav-links" id="nav-links">
  	<li><a href="<c:url value='/MenuServlet' />">メニュー</a></li>
  	<li><a href="<c:url value='/CoinSendServlet' />">送信</a></li>
    <li><a href="<c:url value='/CoinReceiveServlet' />">受信履歴</a></li>
    <li><a href="<c:url value='/RankingServlet' />">ランキング</a></li>
    <li><a href="<c:url value='/UpdateDeleteServlet' />">アカウント情報</a></li>
    <li><a href="<c:url value='/LogoutServlet' />" class="logout-button">ログアウト</a></li>
  </ul>
</nav>
<h2 style="text-align: center; margin-top: 30px; font-family: 'メイリオ', Meiryo, sans-serif;">ランキング</h2>


<script src="<c:url value='/js/common.js' />"></script>
<script src="<c:url value='/js/ranking.js' />"></script>

<div class="ranking-container">

<div id="chart_div" style="background-color: #fef4f4;"></div>

<!-- ランキング文章の領域 -->
  <div id="ranking_text">
  <h3>先月のTOP5</h3>
  <ol style="list-style: none; padding: 0;">
      <c:forEach var="user" items="${rankingList}" varStatus="status">
        <li style="
          <c:choose>
            <c:when test='${status.index == 0}'>color: #ffd700; font-weight: bold;</c:when>
            <c:when test='${status.index == 1}'>color: #c0c0c0; font-weight: bold;</c:when>
            <c:when test='${status.index == 2}'>color: #cd7f32; font-weight: bold;</c:when>
          </c:choose>
        ">
          ${status.index + 1}位　${user.name}　${user.ranking_coin}枚
        </li>
      </c:forEach>
    </ol>
  </div>
</div>


<script type="text/javascript">
  google.charts.load('current', {packages: ['corechart']});
  google.charts.setOnLoadCallback(drawChart);

  function drawChart() {
    var rawData = [
      ['氏名', 'コイン受取枚数'],
      <c:forEach var="user" items="${rankingList}" varStatus="status">
        ['${user.name}', ${user.ranking_coin}]<c:if test="${!status.last}">,</c:if>
      </c:forEach>
    ];

    var header = rawData[0];
    var rows = rawData.slice(1).reverse();  // 逆順に

    var dataArray = [header].concat(rows);

    var data = google.visualization.arrayToDataTable(dataArray);

    var options = {
      title: '先月の　${companyName}　コイン受取枚数ランキング',
      hAxis: { title: '氏名' },
      vAxis: { title: '受取コイン枚数', minValue: 0 },
      legend: 'none',
      height: 500,
      backgroundColor: '#fef4f4',
      colors: ['#f6bfbc']
    };

    var chart = new google.visualization.ColumnChart(document.getElementById('chart_div'));
    chart.draw(data, options);
  }
</script>

<script>
function adjustBodyPadding() {
    const nav = document.getElementById('nav');
    if (nav) {
      const navHeight = nav.offsetHeight;
      document.body.style.paddingTop = navHeight + 'px';
    }
  }

  window.addEventListener('DOMContentLoaded', adjustBodyPadding);
  window.addEventListener('resize', adjustBodyPadding);
</script>
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