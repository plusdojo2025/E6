<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規登録画面</title>
<link rel="stylesheet" type="text/css" href="/webapp/css/common.css">
<link rel="stylesheet" type="text/css" href="/webapp/css/regist_data.css">
</head>
<body>
<div class="wrapper">
	<!-- ヘッダー -->
	<form id="regist_form" action="/webapp/" method="post">
		<table class="form-table">
        <tr>
          <th>会社名</th>
          <td><input type="text" name="company" id="company" placeholder="会社名" required></td>
        </tr>
        <tr>
          <th>氏名</th>
          <td><input type="text" name="name" id="name" placeholder="氏名" required></td>
        </tr>
        <tr>
          <th>メールアドレス</th>
          <td><input type="text" name="email" id="email" placeholder="メールアドレス" required></td>
        </tr>
        <tr>
          <td colspan="2">
            <input type="submit" id="regist" name="submit" value="登録">
            <input type="button" value="前のページに戻る" onclick="location.href=`login.jsp`">
          </td>
        </tr>
      </table>
	</form>
	<!-- メイン（ここまで） -->
    <!-- フッター（ここから） -->
</div>
</body>
</html>