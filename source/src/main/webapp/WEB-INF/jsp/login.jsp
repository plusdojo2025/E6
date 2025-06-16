<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ログイン</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/login.css">
<style>
    .error {
      border: 2px solid red;
    }
    .error-message {
      color: red;
      font-size: 0.9em;
      margin-top: 4px;
    }
    
   /* カード風ログインボックス */
  .login-card {
    background-color: #f6bfbc;
    padding: 40px 30px;
    border-radius: 16px;
    box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
    max-width: 400px;
    margin: 0 auto;
    font-family: "メイリオ", Meiryo, sans-serif;
  }

  .login-card table {
    width: 100%;
  }

  .sub_botun {
    background-color: #f66;
    color: white;
    font-size: 16px;
    padding: 10px 20px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    margin-top: 10px;
    transition: background-color 0.3s ease;
  }

  .sub_botun:hover {
    background-color: #cc3333;
  }

  #log_title {
    text-align: center;
    margin-bottom: 20px;
  }

  </style>
</head>
<body>
<div style="text-align: center;">
<h1>
      <a><img src="img/arico_logo.png" width="300" height="300" alt="ログイン"></a>
</h1>
</div>

<div style="text-align: center;" class="login-card">
  <h2 id="log_title">Sign In</h2>
  <form id="loginForm" method="POST" action="/E6/LoginServlet">
    <table>
      <!-- メール入力 -->
      <tr>
        <td>
          <label for="mail">メールアドレス<br>
            <input style="width: 100%;" type="text" id="mail" name="mail" placeholder="✉Mailadress"
              value="<%= request.getAttribute("enteredMail") != null ? request.getAttribute("enteredMail") : "" %>"
              class="<%= request.getAttribute("loginError") != null ? "error" : "" %>">
          </label>
          <div id="mailError" class="error-message"></div>
        </td>
      </tr>
      <!-- パスワード入力 -->
      <tr>
        <td>
          <label for="password">パスワード<br>
            <input style="width: 100%;" type="password" id="password" name="password" placeholder="🔒Password"
              class="<%= request.getAttribute("loginError") != null ? "error" : "" %>">
          </label>
          <div id="passwordError" class="error-message"></div>
        </td>
      </tr>
      <!-- リンク -->
      <tr>
        <td style="text-align: center;">
          <p>登録していない方は <a href="/E6/RegistServlet" style="color: blue;">こちら</a></p>
        </td>
      </tr>
      <!-- ボタン -->
      <tr>
        <td style="text-align: center;">
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