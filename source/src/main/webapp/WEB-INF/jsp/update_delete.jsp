<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>アカウント情報画面</title>

<!-- 共通CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/common.css">
<!-- この画面用CSS（例: account.css） -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/css/updata_delete.css">

<style>

/* モーダル共通 */
.modal-overlay {
  position: fixed;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  display: none;
  justify-content: center;
  align-items: center;
  background-color: rgba(0, 0, 0, 0.5);
  z-index: 999;
}

.modal-content {
  background-color: white;
  padding: 30px;
  border-radius: 10px;
  width: 90%;
  max-width: 400px;
  text-align: left;
}

.modal-buttons {
  display: flex;
  justify-content: space-between;
  margin-top: 20px;
}

.button-group button {
  margin: 5px;
}
</style>
</head>
<body>

System.out.println(">>> submit: " + request.getParameter("submit"));
System.out.println(">>> regist_number: " + request.getParameter("regist_number"));
System.out.println(">>> password: " + request.getParameter("password"));

<header>
  <a href="menu.jsp">
    <img src="${pageContext.request.contextPath}/img/arico_logo2.png" width="300" height="150" alt="Arico">
  </a>
  <ul>
    <li><a href="${pageContext.request.contextPath}/MenuServlet">メニュー</a></li>
    <li><a href="${pageContext.request.contextPath}/CoinSendServlet">送信</a></li>
    <li><a href="${pageContext.request.contextPath}/CoinReceiveServlet">受信履歴</a></li>
    <li><a href="${pageContext.request.contextPath}/RankingServlet">ランキング</a></li>
    <li><a href="${pageContext.request.contextPath}/LogoutServlet">ログアウト</a></li>
  </ul>
</header>

<h2>アカウント情報</h2>

<div class="account-info">
  <div class="info-row"><strong>氏名：</strong> ${user.name}</div>
  <div class="info-row"><strong>会社名：</strong> ${user.company}</div>
  <div class="info-row"><strong>メールアドレス：</strong> ${user.mail}</div>

  <div class="button-group">
    <button id="editButton">編集</button>
    <button id="deleteButton" style="background-color: #f88;">アカウント削除</button>
  </div>
</div>

<!-- 編集モーダル -->
<div id="editModal" class="modal-overlay">
  <div class="modal-content">
    <h3>アカウント編集</h3>
    <form action="${pageContext.request.contextPath}/UpdateDeleteServlet" method="post">
      <input type="hidden" name="regist_number" value="${user.regist_number}">

      <label for="name">氏名：</label>
      <input type="text" id="name" name="name" value="${user.name}" required><br><br>

      <label for="company">会社名：</label>
      <input type="text" id="company" name="company" value="${user.company}" required><br><br>

      <label for="mail">メール：</label>
      <input type="email" id="mail" name="mail" value="${user.mail}" required><br><br>

      <!-- パスワードは今使ってないけどフォームとしては保持しておく -->
      <input type="hidden" name="password" value="${user.password}">

      <div class="modal-buttons">
        <button type="button" id="cancelEdit">戻る</button>
        <button type="submit" name="submit" value="更新">更新</button>
      </div>
    </form>
  </div>
</div>

<!-- 削除モーダル -->
<div id="deleteModal" class="modal-overlay">
  <div class="modal-content">
    <h3>アカウント削除確認</h3>
    <p>本当にアカウントを削除しますか？この操作は元に戻せません。</p>
    <form action="${pageContext.request.contextPath}/UpdateDeleteServlet" method="post">
      <input type="hidden" name="regist_number" value="${user.regist_number}">
      <input type="hidden" name="password" value="${user.password}">
      <div class="modal-buttons">
        <button type="button" id="cancelDelete">キャンセル</button>
        <button type="submit" name="submit" value="削除" style="background-color: #f66; color: white;">削除</button>
      </div>
    </form>
  </div>
</div>


<script>
document.addEventListener("DOMContentLoaded", () => {
	  const editBtn = document.getElementById("editButton");
	  const deleteBtn = document.getElementById("deleteButton");
	  const editModal = document.getElementById("editModal");
	  const deleteModal = document.getElementById("deleteModal");
	  const cancelEdit = document.getElementById("cancelEdit");
	  const cancelDelete = document.getElementById("cancelDelete");

	  editBtn.addEventListener("click", () => editModal.style.display = "flex");
	  cancelEdit.addEventListener("click", () => editModal.style.display = "none");

	  deleteBtn.addEventListener("click", () => deleteModal.style.display = "flex");
	  cancelDelete.addEventListener("click", () => deleteModal.style.display = "none");

	  window.addEventListener("click", (e) => {
	    if (e.target === editModal) editModal.style.display = "none";
	    if (e.target === deleteModal) deleteModal.style.display = "none";
	  });
	});
</script>
</body>
</html>