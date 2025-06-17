<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規登録画面</title>
<link rel="stylesheet" href="<c:url value='/css/common.css' />">
<link rel="stylesheet" href="<c:url value='/css/regist_data.css' />">
</head>
<body>
<div class="wrapper">
<div class="card">
	<!-- ヘッダー -->
	<h2 class="form-title">新規登録</h2>
	<form id="regist_form" action="RegistServlet" method="post">
		<table class="form-table">
        <tr>
          <th>会社名</th>
          <td>
          	<input type="text" name="company" id="company" placeholder="会社名">
          	<div id="companyError" class="error-message"></div>
          </td>
        </tr>
        <tr>
          <th>氏名</th>
          <td>
          	<input type="text" name="name" id="name" placeholder="氏名">
          	<div id="nameError" class="error-message"></div>
          </td>
        </tr>
        <tr>
          <th>メールアドレス</th>
          <td>
          	<input type="email" name="mail" id="mail" placeholder="メールアドレス">
          	<div id="mailError" class="error-message"></div>
          </td>
        </tr>
        <tr>
          <th>パスワード</th>
          <td>
          	<input type="text" name="password" id="password" placeholder="パスワード" maxlength="20" minlength="8" pattern="^[a-zA-Z0-9]+$">
          	<div id="passwordError" class="error-message"></div>
          </td>
        </tr>
        <tr>
          <th>パスワード再入力</th>
          <td>
          	<input type="text" name="password2" id="password2" placeholder="パスワード再入力" pattern="^[a-zA-Z0-9]+$">
          	<div id="password2Error" class="error-message"></div>
          </td>
        </tr>
        <tr>
          <td>
           <p><small>※8~20文字以内の半角英数字の組み合わせでパスワードを設定してください。</small></p>
           </td>
           </tr>
        <tr>
          <td colspan="2">
            <input type="submit" id="regist" name="submit" value="登録">
            <span id="error_message"></span>
            <input type="button" value="前のページに戻る" onclick="location.href=`/E6/LoginServlet`">
          </td>
        </tr>
      </table>
	</form>
	<!-- メイン（ここまで） -->
    <!-- フッター（ここから） -->
    </div>
</div>
<script src="<c:url value='/js/common.js' />"></script>
<script src="<c:url value='/js/regist_data.js' />"></script>
</body>
</html>