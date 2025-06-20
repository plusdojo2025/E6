<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>新規登録画面 | Arico</title>
<link rel="stylesheet" href="<c:url value='/css/common.css' />">
<link rel="stylesheet" href="<c:url value='/css/regist_data.css' />">
<style>
/* 入力間違えたら赤くなるよ */
.error {
  border: 2px solid red !important;
  box-shadow: none !important; /* 影などが原因で見えにくくなる場合に対応 */
}
/*フォーカスしても赤枠が消えない*/
input.error:focus {
  outline: none;
  border: 2px solid red !important;
}


.error-message {
	color: red;
	font-size: 0.85em;
	margin-top: 4px;
}
/* 全体の中央配置 */
.wrapper {
	display: flex;
	justify-content: center;
	align-items: center;
	min-height: 100vh;
	padding: 50px;
	box-sizing: border-box;
}
/* カード風全体 */
.card {
	background-color: #ffffff;
	padding: 40px;
	border-radius: 20px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
	width: 100%;
	max-width: 500px;
	box-sizing: border-box;
	text-align: center;
}
/* フォームタイトル */
.form-title {
	margin-bottom: 20px;
	font-size: 24px;
	color: #333;
	text-align: center;
}
/* テーブル調整 */
.form-table {
	width: 100%;
	border-collapse: collapse;
	margin: 0 auto;
}
/* テキストボックス（共通） */
input[type="text"], input[type="email"], input[type="password"] {
	width: 100%;
	max-width: 300px;
	padding: 10px;
	font-size: 16px;
	border-radius: 6px;
	border: 1px solid #ccc;
	box-sizing: border-box;
	display: block;
	margin: 0 auto;
	text-align: left;
}

.input-wrapper {
	position: relative;
	display: flex;
	justify-content: center;
	align-items: center;
	max-width: 300px;
	margin: 0 auto;
}

.input-wrapper input {
	width: 100%;
	padding-right: 40px;
}

.password__toggle {
	position: absolute;
	right: 10px;
	width: 30px;
	height: 30px;
	background:
		url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' height='48' width='48'><path d='M24 31.5q3.55 0 6.025-2.475Q32.5 26.55 32.5 23q0-3.55-2.475-6.025Q27.55 14.5 24 14.5q-3.55 0-6.025 2.475Q15.5 19.45 15.5 23q0 3.55 2.475 6.025Q20.45 31.5 24 31.5Zm0-2.9q-2.35 0-3.975-1.625T18.4 23q0-2.35 1.625-3.975T24 17.4q2.35 0 3.975 1.625T29.6 23q0 2.35-1.625 3.975T24 28.6Zm0 9.4q-7.3 0-13.2-4.15Q4.9 29.7 2 23q2.9-6.7 8.8-10.85Q16.7 8 24 8q7.3 0 13.2 4.15Q43.1 16.3 46 23q-2.9 6.7-8.8 10.85Q31.3 38 24 38Z'/></svg>")
		no-repeat center center;
	background-size: 24px;
	background-color: transparent;
	border: none;
	cursor: pointer;
}

.password__toggle.is-visible {
	background-image:
		url("data:image/svg+xml;utf8,<svg xmlns='http://www.w3.org/2000/svg' height='48' width='48'><path d='m31.45 27.05-2.2-2.2q1.3-3.55-1.35-5.9-2.65-2.35-5.75-1.2l-2.2-2.2q.85-.55 1.9-.8 1.05-.25 2.15-.25 3.55 0 6.025 2.475Q32.5 19.45 32.5 23q0 1.1-.275 2.175-.275 1.075-.775 1.875Zm6.45 6.45-2-2q2.45-1.8 4.275-4.025Q42 25.25 42.85 23q-2.5-5.55-7.5-8.775Q30.35 11 24.5 11q-2.1 0-4.3.4-2.2.4-3.45.95L14.45 10q1.75-.8 4.475-1.4Q21.65 8 24.25 8q7.15 0 13.075 4.075Q43.25 16.15 46 23q-1.3 3.2-3.35 5.85-2.05 2.65-4.75 4.65Zm2.9 11.3-8.4-8.25q-1.75.7-3.95 1.075T24 38q-7.3 0-13.25-4.075T2 23q1-2.6 2.775-5.075T9.1 13.2L2.8 6.9l2.1-2.15L42.75 42.6ZM11.15 15.3q-1.85 1.35-3.575 3.55Q5.85 21.05 5.1 23q2.55 5.55 7.675 8.775Q17.9 35 24.4 35q1.65 0 3.25-.2t2.4-.6l-3.2-3.2q-.55.25-1.35.375T24 31.5q-3.5 0-6-2.45T15.5 23q0-.75.125-1.5T16 20.15Z'/></svg>");
}

/* ボタン共通 */
input[type="submit"], input[type="button"] {
	display: inline-block;
	font-weight: bold;
	border: none;
	border-radius: 8px;
	padding: 10px 20px;
	cursor: pointer;
}

/* 登録ボタン */
input[type="submit"] {
	background-color: #ee827c;
	color: white;
}

input[type="submit"]:hover {
	background-color: #ed665f;
}
/* 戻るボタン */
input[type="button"] {
	background-color: #38b48b;
	color: white;
	margin-left: 10px;
}

input[type="button"]:hover {
	background-color: #2f9976;
}

@media screen and (max-width: 480px) {
	.card {
		padding: 20px;
	}
}

input::-ms-reveal,
input::-webkit-credentials-auto-fill-button {
  display: none;
}


</style>
</head>
<body>
	<div class="wrapper">
		<div class="card">
			<h2 class="form-title">新規登録</h2>
			<form id="regist_form" action="RegistServlet" method="post">
				<div class="form-group">
					<label for="company">会社名</label> <input type="text" name="company"
						id="company" value="${company}" placeholder="会社名">
					<div id="companyError" class="error-message"></div>
				</div>

				<div class="form-group">
					<label for="name">氏名</label> <input type="text" name="name"
						id="name" value="${name}" placeholder="氏名">
					<div id="nameError" class="error-message"></div>
				</div>

				<div class="form-group">
					<label for="mail">メールアドレス</label> <input type="email" name="mail"
						id="mail" value="${mail}" placeholder="メールアドレス">
					<div id="mailError" class="error-message"></div>
					<c:if test="${not empty errorMessage}">
						<p class="error-message">${errorMessage}</p>
					</c:if>
				</div>

				<div class="form-group">
					<label for="password">パスワード</label>
					<div class="input-wrapper">
						<input type="password" name="password" id="password" autocomplete="new-password"
							placeholder="パスワード" maxlength="20" minlength="8"
							pattern="[A-Za-z0-9!@#$%^&*()_+\-=\[\]{};':\\\|,.<>\/?]+">
						<button type="button" class="password__toggle"
							data-target="password"></button>
					</div>
					<div id="passwordError" class="error-message"></div>
				</div>

				<div class="form-group">
					<label for="password2">パスワード再入力</label>
					<div class="input-wrapper">
						<input type="password" name="password2" id="password2" autocomplete="new-password"
							placeholder="パスワード再入力"
							pattern="[A-Za-z0-9!@#$%^&*()_+\-=\[\]{};':\\\|,.<>\/?]+">
						<button type="button" class="password__toggle"
							data-target="password2"></button>
					</div>
					<div id="password2Error" class="error-message"></div>
				</div>

				<div class="note">
					<small>※8~20文字以内の記号と半角英数字の組み合わせで<br>パスワードを設定してください。</small>
				</div>

				<!-- ★ 登録ボタンの上に表示されるエラー（登録失敗など） -->
				<c:if test="${not empty errorMessage2}">
					<p class="error-message">${errorMessage2}</p>
				</c:if>

				<div class="form-actions">
					<input type="submit" id="regist" name="submit" value="登録">
					<input type="button" value="前のページに戻る"
						onclick="location.href='/e6/LoginServlet'">
				</div>
			</form>
		</div>
	</div>

	<script>
  // 目玉ボタンでパスワード表示切り替え
  document.querySelectorAll('.password__toggle').forEach(btn => {
    btn.addEventListener('click', function () {
      const inputId = this.getAttribute('data-target');
      const input = document.getElementById(inputId);
      const isPassword = input.getAttribute('type') === 'password';
      input.setAttribute('type', isPassword ? 'text' : 'password');
      this.classList.toggle('is-visible', isPassword);
    });
  });
</script>

	<script src="<c:url value='/js/common.js' />"></script>
	<script src="<c:url value='/js/regist_data.js' />"></script>
</body>
</html>