<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
</head>
<body>
<div style="text-align: center;">
<h1>
      <a><img src="${pageContext.request.contextPath}/img/arico_logo.png" width="300" height="300" alt="ログイン"></a>
</h1>
</div>

<div style="text-align: center;" class="login">
      <h2 id="log_title">Sign In</h2>
      <form style="margin: 0 auto; width: fit-content;" id="login_form" method="POST" action=${pageContext.request.contextPath}/LoginServlet>
        <table>
          <tr>
            <td>
              <label>ユーザーID<br>
              <input style="margin: auto; width: 220px;" type="text" name="id" placeholder="✉Mailadress">
              </label>
            </td>
          </tr>
          <tr>
            <td>
              <label>パスワード<br>
              <input style="margin: auto; width: 220px;" type="password" name="pw" placeholder="🔒Password">
              </label>
            </td>
          <tr>
          <tr>
            <td colspan="2">
              <input class="sub_botun" type="submit" name="submit" value="ログイン">
              <input class="sub_botun" type="reset" name="reset" value="リセット">
              <span id="error_message"></span>
            <td>
          </tr>
        </table>
      </form>
    </div>

</body>
</html>