<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コイン送信画面</title>
<link rel="stylesheet" href="css/send.css" href='css/common.css'>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
</head>
<body>
<h1>
      <a><img src="${pageContext.request.contextPath}/img/arico_logo2.png" width="300" height="150" alt="Arico"></a>
</h1>
<ul id="nav">
    <li><a href="/E6/UpdateDeleteServlet">アカウント情報</a></li>
    <li><a href="/E6/MenuServlet">メニュー</a></li>
    <li><a href="/E6/CoinReceiveServlet">受信履歴</a></li>
    <li><a href="/E6/RankingServlet">ランキング</a></li>
    <li><a href="/E6/LogoutServlet">ログアウト</a></li>    
</ul>
<h2>コイン送信</h2>

<h2>コイン送信</h2>

<% String error = (String) request.getAttribute("error"); %>
<% String message = (String) request.getAttribute("message"); %>
<% if (error != null) { %>
    <p style="color:red;"><%= error %></p>
<% } else if (message != null) { %>
    <p style="color:green;"><%= message %></p>
<% } %>

<form method="POST" action="CoinSendServlet">
    <h3>ありがとう送信✉</h3>
    <table>
        <tr>
            <td><label>送りたい相手</label></td>
            <td>
                <select name="receiver_number" required>
                    <c:forEach var="user" items="${userList}">
                        <option value="${user.regist_number}">
      					${user.regist_number}　${user.name}
    					</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td><label>コインの枚数</label></td>
            <td>
                <select name="send_coin" required>
                    <c:forEach var="i" begin="1" end="10">
                        <option value="${i}">${i}</option>
                    </c:forEach>
                </select>
            </td>
        </tr>
        <tr>
            <td><label>メッセージ</label></td>
            <td>
                <textarea name="comment" rows="4" placeholder="感謝の気持ちを入力してください" required></textarea>
            </td>
        </tr>
    </table>
    <input type="submit" value="送信" class="submit-btn">
</form>
<script src="js/send.js">
</script>
</body>
</html>