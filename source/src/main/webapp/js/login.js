document.addEventListener("DOMContentLoaded", function () {
  const loginForm = document.getElementById("loginForm");

  loginForm.addEventListener("submit", function (e) {
    const mail = document.getElementById("mail");
    const password = document.getElementById("password");
    const mailError = document.getElementById("mailError");
    const passwordError = document.getElementById("passwordError");
    const mailWrapper = mail.closest('.input-wrapper');
    const passwordWrapper = password.closest('.input-wrapper');

    let isValid = true;
    
    

    // ★サーバー側で出力されている "error" クラスも初期化
    mailWrapper.classList.remove("error");
    passwordWrapper.classList.remove("error");
    mailError.textContent = "";
    passwordError.textContent = "";

    if (!mail.value.trim()) {
      mailWrapper.classList.add("error");
      mailError.textContent = "メールアドレスを入力してください。";
      isValid = false;
    }

    if (!password.value.trim()) {
      passwordWrapper.classList.add("error");
      passwordError.textContent = "パスワードを入力してください。";
      isValid = false;
    }

    if (!isValid) {
      e.preventDefault(); // フォーム送信中止
    }
  });
});