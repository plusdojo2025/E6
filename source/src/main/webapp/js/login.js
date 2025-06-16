document.addEventListener("DOMContentLoaded", function () {
  const loginForm = document.getElementById("loginForm");

  loginForm.addEventListener("submit", function (e) {
    const mail = document.getElementById("mail");
    const password = document.getElementById("password");
    const mailError = document.getElementById("mailError");
    const passwordError = document.getElementById("passwordError");

     // 初期化（前回のエラー状態をクリア）
    let isValid = true;
    mail.classList.remove("error");
    password.classList.remove("error");
    mailError.textContent = "";
    passwordError.textContent = "";

    // メールが空かどうかだけチェック
    if (!mail.value.trim()) {
      mail.classList.add("error");
      mailError.textContent = "メールアドレスを入力してください。";
      isValid = false;
    }

    // パスワードが空かどうかだけチェック
    if (!password.value.trim()) {
      password.classList.add("error");
      passwordError.textContent = "パスワードを入力してください。";
      isValid = false;
    }

    // エラーがあれば送信中止
    if (!isValid) {
      e.preventDefault();
    }
  });
});

