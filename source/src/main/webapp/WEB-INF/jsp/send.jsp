<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>コイン送信画面</title>
<link rel="stylesheet" href="css/send.css" href='css/common.css'>

</head>
<body>
<h1>
      <a><img src="${pageContext.request.contextPath}/img/arico_logo2.png" width="300" height="150" alt="Arico"></a>
</h1>
<ul id="nav">
    <li><a href="/build/classes/servlet/webapp/DataServlet">アカウント情報</a></li>
    <li><a href="/build/classes/servlet/webapp/MenuServlet">メニュー</a></li>
    <li><a href="/build/classes/servlet/webapp/CoinReceiveServlet">受信履歴</a></li>
    <li><a href="/build/classes/servlet/webapp/RankingServlet">ランキング</a></li>
    <li><a href="/build/classes/servlet/webapp/LogoutServlet">ログアウト</a></li>    
</ul>
<h2>コイン送信</h2>

<form method="POST" action="E6/CoinSendServlet">
    <h3>ありがとう送信✉</h3>
    <table>
        <tr>
            <td>
            <label>送りたい相手の氏名</label>
            <input type="text">
            </td>
        </tr>
        <tr>
            <td>
            <label>コインの枚数</label>
            <input type="text" id="coinAmount" name="coin" value="0" required />
            <tr>
            <td>
            <button type="button" onclick="adjustCoin(1)">▲</button>
            </td>
            </tr>
            <tr>
            <td>
            <button type="button" onclick="adjustCoin(-1)">▼</button>
            </td>
            </tr>
            </td>
        </tr>
        <tr>
            <td>
            <label>メッセージ</label>
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