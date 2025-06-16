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
/* 入力間違えたら赤くなるよ */
 .error {
      border: 2px solid red;
    }
    .error-message {
      color: red;
      font-size: 0.9em;
      margin-top: 4px;
    }
    
  .login-card {
    background-color: #f6bfbc;
    max-width: 440px;
    margin: 0 auto;
    padding: 30px;
    border-radius: 15px;
    box-shadow: 0 0 15px rgba(0,0,0,0.1);
  }

  .input-wrapper {
    display: flex;
    border: 1px solid #ccc;
    border-radius: 5px;
    overflow: hidden;
    margin: 10px auto;
    width: 300px;
    background-color: #fff;
  }

  .input-wrapper input {
    flex: 1;
    outline: none;
    border: none;
    padding: 10px;
    font-size: 16px;
  }

  .password__toggle {
    width: 44px;
    border: none;
    background: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' height='48' width='48'><path d='M24 31.5q3.55 0 6.025-2.475Q32.5 26.55 32.5 23q0-3.55-2.475-6.025Q27.55 14.5 24 14.5q-3.55 0-6.025 2.475Q15.5 19.45 15.5 23q0 3.55 2.475 6.025Q20.45 31.5 24 31.5Zm0-2.9q-2.35 0-3.975-1.625T18.4 23q0-2.35 1.625-3.975T24 17.4q2.35 0 3.975 1.625T29.6 23q0 2.35-1.625 3.975T24 28.6Zm0 9.4q-7.3 0-13.2-4.15Q4.9 29.7 2 23q2.9-6.7 8.8-10.85Q16.7 8 24 8q7.3 0 13.2 4.15Q43.1 16.3 46 23q-2.9 6.7-8.8 10.85Q31.3 38 24 38Z'/></svg>") no-repeat center center;
    background-size: 24px;
    background-color: transparent;
    cursor: pointer;
  }

  .password__toggle.is-visible {
    background-image: url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' height='48' width='48'><path d='m31.45 27.05-2.2-2.2q1.3-3.55-1.35-5.9-2.65-2.35-5.75-1.2l-2.2-2.2q.85-.55 1.9-.8 1.05-.25 2.15-.25 3.55 0 6.025 2.475Q32.5 19.45 32.5 23q0 1.1-.275 2.175-.275 1.075-.775 1.875Zm6.45 6.45-2-2q2.45-1.8 4.275-4.025Q42 25.25 42.85 23q-2.5-5.55-7.5-8.775Q30.35 11 24.5 11q-2.1 0-4.3.4-2.2.4-3.45.95L14.45 10q1.75-.8 4.475-1.4Q21.65 8 24.25 8q7.15 0 13.075 4.075Q43.25 16.15 46 23q-1.3 3.2-3.35 5.85-2.05 2.65-4.75 4.65Zm2.9 11.3-8.4-8.25q-1.75.7-3.95 1.075T24 38q-7.3 0-13.25-4.075T2 23q1-2.6 2.775-5.075T9.1 13.2L2.8 6.9l2.1-2.15L42.75 42.6ZM11.15 15.3q-1.85 1.35-3.575 3.55Q5.85 21.05 5.1 23q2.55 5.55 7.675 8.775Q17.9 35 24.4 35q1.65 0 3.25-.2t2.4-.6l-3.2-3.2q-.55.25-1.35.375T24 31.5q-3.5 0-6-2.45T15.5 23q0-.75.125-1.5T16 20.15Z'/></svg>");
  }

  .sub_botun {
    background-color: #ffffff;
    color: black;
    padding: 10px 25px;
    font-size: 16px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    transition: background-color 0.3s;
    margin-top: 15px;
  }

  .sub_botun:hover {
    background-color: #e64a4a;
  }

  @media (any-hover: hover) {
    .password__toggle:hover {
      opacity: 0.7;
    }
  }
</style>
</head>
<body>
  <div style="text-align: center;">
    <h1><a><img src="img/arico_logo.png" width="300" height="300" alt="ログイン"></a></h1>
  </div>

  <div class="login login-card">
    <h2 id="log_title" style="text-align: center;">Sign In</h2>
    <form id="loginForm" method="POST" action="/E6/LoginServlet">
      <table style="margin: 0 auto;">
<tr>
  <td>
    <label for="mail">メールアドレス</label><br>
    <div class="input-wrapper <%= request.getAttribute("loginError") != null ? "error" : "" %>">
      <input type="text" id="mail" name="mail" placeholder="✉Mailadress"
        value="<%= request.getAttribute("enteredMail") != null ? request.getAttribute("enteredMail") : "" %>">
    </div>
    <div id="mailError" class="error-message"></div>
  </td>
</tr>
<tr>
  <td>
    <label for="password">パスワード</label><br>
    <div class="input-wrapper <%= request.getAttribute("loginError") != null ? "error" : "" %>">
      <input type="password" id="password" name="password" placeholder="🔒Password">
      <button type="button" class="password__toggle"></button>
    </div>
    <div id="passwordError" class="error-message"></div>
  </td>
</tr>
        <tr>
          <td>
            <p>登録していない方は<a href="/E6/RegistServlet" style="color: blue;">こちら</a></p>
          </td>
        </tr>
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

  <script>
    const passwordToggle = document.querySelector('.password__toggle');

    passwordToggle.addEventListener('click', (e) => {
      const input = e.target.previousElementSibling;
      const type = input.getAttribute('type');
      input.setAttribute('type', type === 'password' ? 'text' : 'password');
      passwordToggle.classList.toggle('is-visible');
    });
  </script>
 <script src="js/common.js"></script>
<script src="js/login.js"></script>
</body>
</html>