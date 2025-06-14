<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ranking</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/ranking.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
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

<div style="display: flex; gap: 20px; align-items: flex-start; width: 90%; margin: auto;">

<div id="chart_div" style="width: 50%; height: 500px; background-color: #fef4f4;"></div>

<!-- ランキング文章の領域 -->
  <div id="ranking_text" style="
  width: 65%;
  background-color: white;
  border-radius: 12px;
  padding: 20px;
  box-shadow: 0 0 8px rgba(0,0,0,0.1);
  font-size: 1.1em;
  line-height: 1.6;
  color: #333;
">
  <h3>ランキング</h3>
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
</body>
</html>