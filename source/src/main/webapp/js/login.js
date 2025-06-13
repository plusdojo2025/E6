document.addEventListener("DOMContentLoaded", function () {
  const loginForm = document.getElementById("loginForm");

  loginForm.addEventListener("submit", function (e) {
    const mail = document.getElementById("mail");
    const password = document.getElementById("password");
    const mailError = document.getElementById("mailError");
    const passwordError = document.getElementById("passwordError");

    // 初期化
    let isValid = true;
    mail.classList.remove("error");
    password.classList.remove("error");
    mailError.textContent = "";
    passwordError.textContent = "";

    // メールアドレスのバリデーション
    if (!mail.value) {
      mail.classList.add("error");
      mailError.textContent = "メールアドレスを入力してください。";
      isValid = false;
    } else if (!validateEmail(mail.value)) {
      mail.classList.add("error");
      mailError.textContent = "正しいメールアドレスを入力してください。";
      isValid = false;
    }

    // パスワードのバリデーション
    if (!password.value) {
      password.classList.add("error");
      passwordError.textContent = "パスワードを入力してください。";
      isValid = false;
    }

    // isValid が false の場合、送信を止める
    if (!isValid) {
      e.preventDefault();
    }
  });
});

