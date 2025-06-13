<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アカウント情報画面</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/send.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
</head>
<body>
	<header>
    	<a href="menu.jsp">
    	    <img src="${pageContext.request.contextPath}/img/arico_logo2.png" width="300" height="150" alt="Arico">
    	</a>
    	<ul>
   			<li><a href="${pageContext.request.contextPath}/UpdateDeleteServlet">アカウント情報</a></li>
			<li><a href="${pageContext.request.contextPath}/CoinSendServlet">送信</a></li>
			<li><a href="${pageContext.request.contextPath}/CoinReceiveServlet">受信履歴</a></li>
			<li><a href="${pageContext.request.contextPath}/MenuServlet">メニュー</a></li>
			<li><a href="${pageContext.request.contextPath}/LogoutServlet">ログアウト</a></li>
   		</ul>
    </header>

	<h2>アカウント情報</h2>
	<div class="account-info">
	  <form action="${pageContext.request.contextPath}/UpdateDeleteServlet" method="post">
	    
	    <!-- ユーザーの登録番号（非表示） -->
	    <input type="hidden" name="regist_number" value="${user.regist_number}">

	    <div class="info-row">
	      <span class="info-label">氏名：</span>
	      <input type="text" name="name" value="${user.name}" required>
	    </div>
	    
	    <div class="info-row">
	      <span class="info-label">会社名：</span>
	      <input type="text" name="company" value="${user.company}" required>
	    </div>
	    
	    <div class="info-row">
	      <span class="info-label">メールアドレス：</span>
	      <input type="email" name="mail" value="${user.mail}" required>
	    </div>

	   <!--  <div class="info-row">
	      <span class="info-label">パスワード：</span>
	      <input type="password" name="password" value="${user.password}" required>
	    </div>
	     -->
	    <div class="button-group">
	      <button type="submit" name="submit" value="更新">更新</button>
	      <button type="submit" name="submit" value="削除">アカウント削除</button>
	    </div>
	  </form>
	</div>

	<script src="js/update_delete.js"></script>
</body>
</html>