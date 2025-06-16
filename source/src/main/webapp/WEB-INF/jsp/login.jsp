<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<style>
    .error {
      border: 2px solid red;
    }
    .error-message {
      color: red;
      font-size: 0.9em;
      margin-top: 4px;
    }
  </style>
</head>
<body>
<div style="text-align: center;">
<h1>
      <a><img src="img/arico_logo.png" width="300" height="300" alt="ログイン"></a>
</h1>
</div>

<div style="text-align: center;" class="login">
      <h2 id="log_title">Sign In</h2>
      <form id="loginForm" style="margin: 0 auto; width: fit-content;" id="login_form" method="POST" action="/E6/LoginServlet">
        <table>
          <tr>
            <td>
              <label for="mail">メールアドレス<br>
              <input style="margin: auto; width: 220px;" type="text" id="mail" name="mail" placeholder="✉Mailadress"
              value="<%= request.getAttribute("enteredMail") != null ? request.getAttribute("enteredMail") : "" %>"
       class="<%= request.getAttribute("loginError") != null ? "error" : "" %>">
              </label>
              <div id="mailError" class="error-message"></div>
            </td>
          </tr>
          <tr>
            <td>
              <label for="password">パスワード<br>
              <input style="margin: auto; width: 220px;" type="password" id="password" name="password" placeholder="🔒Password"
              class="<%= request.getAttribute("loginError") != null ? "error" : "" %>"
              >
              </label>
              <div id="passwordError" class="error-message"></div>
            </td>
          </tr>
          <tr>
          <td>
           <p>登録していない方は<a href="/E6/RegistServlet" style="color: blue;">こちら</a></p>
           </td>
           </tr>
          <tr>
            <td colspan="2">
              <input class="sub_botun" type="submit" name="submit" value="ログイン">
              <span id="error_message"></span>
              <% if (request.getAttribute("loginError") != null) { %>
  <div class="error-message" style="color:red; font-weight:bold; text-align:center; margin-top:10px;">
    <%= request.getAttribute("loginError") %>
  </div>
<% } %>
            </td>
          </tr>
        </table>
      </form>
    </div>

	<script src="js/common.js"></script>
	<script src="js/login.js"></script>
</body>
</html>