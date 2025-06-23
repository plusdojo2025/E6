document.addEventListener("DOMContentLoaded", function () {
  const cards = document.querySelectorAll(".card");

  cards.forEach((card) => {
    card.style.transition = "transform 0.3s, box-shadow 0.3s";
    card.addEventListener("mouseover", () => {
      card.style.transform = "translateY(-5px)";
      card.style.boxShadow = "0 4px 10px rgba(0,0,0,0.15)";
    });
    card.addEventListener("mouseout", () => {
      card.style.transform = "translateY(0)";
      card.style.boxShadow = "2px 2px 8px rgba(0,0,0,0.1)";
    });
  });
});

document.addEventListener("DOMContentLoaded", function () {
  const modal = document.getElementById("commentModal");
  const modalDate = document.getElementById("modalDate");
  const modalSender = document.getElementById("modalSender");
  const modalComment = document.getElementById("modalComment");
  const modalCoin = document.getElementById("modalCoin");
  const closeModal = document.querySelector(".modal .close");

  // 全カードにイベントを付加
  document.querySelectorAll(".card").forEach(card => {
    card.addEventListener("click", function () {
      modalDate.textContent = this.dataset.date;
      modalSender.textContent = this.dataset.sender;
      modalComment.textContent = this.dataset.comment;
      modalCoin.textContent = this.dataset.coin;
      modal.style.display = "block";
    });
  });

  // モーダルを閉じる
  closeModal.addEventListener("click", () => {
    modal.style.display = "none";
  });

  window.addEventListener("click", function (e) {
    if (e.target === modal) {
      modal.style.display = "none";
    }
  });
});