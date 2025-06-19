// 3秒後に MenuServlet へリダイレクト
setTimeout(function() {
	window.location.href = "http://localhost:8080/e6/MenuServlet";
}, 3000);

const quotes = [
	{ message: "神は２つの場所に住んでいます；一つは天国、もう一つは穏やかに感謝している心です。", author: "アイザック・ウォルトン" },
	{ message: "幸せになるには、感謝することを探しなさい。歩けるでしょ、見えるでしょ、聞こえるでしょ、しゃべれるでしょ。それができない方はいっぱいいらっしゃるんです", author: "美輪明宏" },
	{ message: "期待するよりも感謝するようにすると人生は大きく変わる", author: "アンソニー・ロビンズ" },
	{ message: "悪くなったのは自分のせい、良くなったのは他人のおかげ", author: "IKKO" },
	{ message: "大切なのは他人だけではなく、自分自身への感謝や労いも忘れないということ", author: "國分利治" },
	{ message: "感謝の念は教養の結実である。粗野な人々の間には見受けられない。", author: "サミュエル・ジョンソン" },
	{ message: "感謝の心が高まれば高まるほど、それに正比例して幸福感が高まっていく", author: "松下幸之助" },
	{ message: "感謝する理由が見つからなければ、落ち度はあなた自身にある", author: "北米ミンカス族の格言" },
	{ message: "感謝は心の最初の言語です。", author: "ジョーイ・ガルシア" },
	{ message: "〈おかげさん〉でないものは、この世に一ツもありません。みんな〈おかげさん〉で成り立っているんです", author: "相田みつを" }
];

const rand = Math.random(); // ✅ ページを開くたびに変わる
const index = Math.floor(rand * quotes.length);
const selected = quotes[index];

document.getElementById("daily-message").textContent = `「${selected.message}」`;
document.getElementById("author").textContent = `— ${selected.author}`;