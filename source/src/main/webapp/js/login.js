/**
 * 入力が間違っていた時の処理だよ
 */
document.getElementById("loginForm").addEventListener("submit", function(e) {
  e.preventDefault(); // フォーム送信を一旦止める

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

  // バリデーションOKならフォーム送信
  if (isValid) {
    this.submit(); // 明示的に送信（必要ならここをコメントアウト可）
  }
});

// メールアドレスの簡易的な正規表現チェック関数（関数スコープ外に置く）
function validateEmail(mail) {
  const re = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
  return re.test(mail);
}