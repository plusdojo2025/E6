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