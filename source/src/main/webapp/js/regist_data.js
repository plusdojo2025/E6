document.addEventListener("DOMContentLoaded", function () {
  const registform = document.getElementById("regist_form");

  registform.addEventListener("submit", function (e) {
    const name = document.getElementById("name");
    const mail = document.getElementById("mail");
    const company = document.getElementById("company");
    const password = document.getElementById("password");
    const password2 = document.getElementById("password2");

    const nameError = document.getElementById("nameError");
    const mailError = document.getElementById("mailError");
    const companyError = document.getElementById("companyError");
    const passwordError = document.getElementById("passwordError");
    const password2Error = document.getElementById("password2Error");

     // 初期化（前回のエラー状態をクリア）
    let isValid = true;
    name.classList.remove("error");
    mail.classList.remove("error");
    company.classList.remove("error");
    password.classList.remove("error");
    password2.classList.remove("error");
    nameError.textContent = "";
    mailError.textContent = "";
    companyError.textContent = "";
    passwordError.textContent = "";
    password2Error.textContent = "";

		// 氏名が空かどうかだけチェック
    if (!name.value.trim()) {
      name.classList.add("error");
      nameError.textContent = "氏名を入力してください。";
      isValid = false;
    }

    // メールが空かどうかだけチェック
    if (!mail.value.trim()) {
      mail.classList.add("error");
      mailError.textContent = "メールアドレスを入力してください。";
      isValid = false;
    }
    
     // 会社名が空かどうかだけチェック
     if (!company.value.trim()) {
      company.classList.add("error");
      companyError.textContent = "会社名を入力してください。";
      isValid = false;
    }

    // パスワードが空かどうかだけチェック
    if (!password.value.trim()) {
      password.classList.add("error");
      passwordError.textContent = "パスワードを入力してください。";
      isValid = false;
    }
    // 再入力パスワードが空かどうかだけチェック
    if (!password2.value.trim()) {
      password2.classList.add("error");
      password2Error.textContent = "パスワードを再入力してください。";
      isValid = false;
    }
		//パスワードと再入力パスワードが合っているか確認
    if (password.value.trim() && password2.value.trim() && password.value !== password2.value) {
      password.classList.add("error");
      password2.classList.add("error");
      password2Error.textContent = "パスワードが一致しません。";
      isValid = false;
    }

    // エラーがあれば送信中止
    if (!isValid) {
      e.preventDefault();
    }
  });
});