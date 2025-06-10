<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アカウント情報画面</title>
</head>
<body>
	<header>
    	<a href="menu.jsp"> <img src="${pageContext.request.contextPath}/img/arico_logo2.png" width="300" height="150" alt="Arico"></a>
    		<ul>
	   			<li><a href="/build/classes/servlet/webapp/DataServlet">アカウント情報</a></li>
					<li><a href="/build/classes/servlet/webapp/CoinSendServlet">送信</a></li>
					<li><a href="/build/classes/servlet/webapp/CoinReceiveServlet">受信履歴</a></li>
					<li><a href="/build/classes/servlet/webapp/MenuServlet">メニュー</a></li>
					<li><a href="/build/classes/servlet/webapp/LogoutServlet">ログアウト</a></li>
   			</ul>
   		<h2>アカウント情報</h2>
   </header>
	<div class="accout-info">
		<h2>アカウント情報</h2>
		
		<div class="info-row">
			<span class="info-label">氏名：</span>
		</div>
		
		<div class="info-row">
			<span class="info-label">会社名：</span>
		</div>
		
		<div class="info-row">
			<span class="info-label">メールアドレス：</span>
		</div>
		
		<div class="button-group">
			<button>編集</button>
			<button>アカウント削除</button>
		</div>
</div>
<script src="js/update_delete.js">
</script>		
</body>
</html>