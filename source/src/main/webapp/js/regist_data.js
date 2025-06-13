document.getElementById("regist_form").addEventListener("submit", function(event) {
    const name = document.getElementById("name").value.trim();
    const email = document.getElementById("email").value.trim();
    const company = document.getElementById("company").value.trim();
    const password = document.getElementById("password").value.trim();

    if (!name || !email || !company || !password) {
      alert("すべての必須項目を入力してください。");
      event.preventDefault(); // フォーム送信を停止
    }
  });