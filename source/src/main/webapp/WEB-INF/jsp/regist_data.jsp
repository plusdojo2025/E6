<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>新規登録画面</title>
<link rel="stylesheet" type="text/css" href="css/common.css">
<link rel="stylesheet" type="text/css" href="css/regist_data.css">
</head>
<body>
<div class="wrapper">
	<!-- ヘッダー -->
	<form id="regist_form" action="RegistServlet" method="post">
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
          <td><input type="text" name="mail" id="mail" placeholder="メールアドレス" required></td>
        </tr>
        <tr>
          <th>パスワード</th>
          <td><input type="text" name="password" id="password" placeholder="パスワード" required></td>
        </tr>
        <tr>
          <td>
           <p><small>※8~20文字以内の半角英数字の組み合わせでパスワードを設定してください。</small></p>
           </td>
           </tr>
        <tr>
          <td colspan="2">
            <input type="submit" id="regist" name="submit" value="登録">
            <input type="button" value="前のページに戻る" onclick="location.href=`/E6/LoginServlet`">
          </td>
        </tr>
      </table>
	</form>
	<!-- メイン（ここまで） -->
    <!-- フッター（ここから） -->
</div>
<script src="js/common.js"></script>
<script src="js/regist_data.js"></script>
</body>
</html>