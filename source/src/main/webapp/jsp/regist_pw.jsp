<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>パスワード登録</title>
</head>
<body>
<h1>
      <a><img src="${pageContext.request.contextPath}/img/arico_logo.png" width="300" height="300" alt="ログイン"></a>
</h1>

<div style="text-align: center;" class="login">
      <h2 id="log_title">パスワード登録</h2>
      <form style="margin: 0 auto; width: fit-content;"  method="POST" action=${pageContext.request.contextPath}/LoginServlet>
        <table>
          <tr>
            <td>
              <label>パスワード<br>
              <input style="margin: auto; width: 220px;" type="password" >
              </label>
            </td>
          </tr>
          <tr>
            <td>
              <label>パスワード再入力<br>
              <input style="margin: auto; width: 220px;" type="password" >
              </label>
            </td>
          </tr>
          <tr>
          <td>
           <p>※8~20文字以内の半角英数字の組み合わせでパスワードを設定してください。</p>
           </td>
           </tr>
          <tr>
            <td colspan="2">
              <input class="sub_botun" type="submit" name="submit" value="登録">
              <span id="error_message"></span>
            <td>
          </tr>
        </table>
      </form>
    </div>
</body>
</html>