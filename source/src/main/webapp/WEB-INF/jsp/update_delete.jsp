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
 <!-- ▼ アカウント情報編集フォーム -->
<div class="account-info">
  <form action="UpdateDeleteServlet" method="post">
    
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

    <!-- パスワードも必要? -->
  <!-- <div class="info-row">
      <span class="info-label">パスワード：</span>
      <input type="password" name="password" value="${user.password}" required>
    </div>
    
    <div class="button-group">
      <button type="submit" name="submit" value="更新">更新</button>
      <button type="submit" name="submit" value="削除">アカウント削除</button>
    </div>
-->

  </form>
</div>

<script src="js/update_delete.js"></script>
</body>
</html>