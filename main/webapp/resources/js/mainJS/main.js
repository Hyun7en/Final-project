
document.addEventListener("DOMContentLoaded", function() {
    const show = document.querySelector(".show");

    show.innerHTML = show.textContent.split("")
      .map((letter, idx) => {
        if (letter === " ") return " ";
        return `<span style="animation-delay:${idx * 15}ms" class="letter">${letter}</span>`;
      })
      .join("");
});

document.addEventListener("DOMContentLoaded", function() {
    const show = document.querySelector(".show2");

    show.innerHTML = show.textContent.split("")
      .map((letter, idx) => {
        if (letter === " ") return " ";
        return `<span style="animation-delay:${idx * 15}ms" class="letter">${letter}</span>`;
      })
      .join("");
});

document.addEventListener("DOMContentLoaded", function() {
    const show = document.querySelector(".show3");

    show.innerHTML = show.textContent.split("")
      .map((letter, idx) => {
        if (letter === " ") return " ";
        return `<span style="animation-delay:${idx * 15}ms" class="letter">${letter}</span>`;
      })
      .join("");
});


