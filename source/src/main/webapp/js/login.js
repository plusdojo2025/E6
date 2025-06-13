/**
 * 入力が間違っていた時の処理だよ
 */
document.addEventListener("DOMContentLoaded", function () {
  const loginForm = document.getElementById("loginForm");

  loginForm.addEventListener("submit", function (e) {
    // 入力フィールドとエラーメッセージ要素の取得
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
      e.preventDefault();
      mail.classList.add("error");
      mailError.textContent = "メールアドレスを入力してください。";
      isValid = false;
    } else if (!validateEmail(mail.value)) {
      e.preventDefault();
      mail.classList.add("error");
      mailError.textContent = "正しいメールアドレスを入力してください。";
      isValid = false;
    }

    // パスワードのバリデーション
    if (!password.value) {
      e.preventDefault();
      password.classList.add("error");
      passwordError.textContent = "パスワードを入力してください。";
      isValid = false;
    }

    // 通過しているときは何もしない（submit は通常通り進行）
  });
});

// メールアドレスの正規表現チェック関数
function validateEmail(mail) {
  const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return re.test(mail);
}