// JavaScript
document.addEventListener("DOMContentLoaded", function () {
  const waves = document.querySelectorAll('.wave');
  let wave1X = 0;
  let wave2X = 0;

  function animateWaves() {
      wave1X -= 1; // 속도 조정
      wave2X -= 2;

      waves[0].style.transform = `translate3d(${wave1X}px, 0, 0)`;
      waves[1].style.transform = `translate3d(${wave2X}px, 0, 0)`;

      if (wave1X <= -3200) { // 3200px을 기준으로 반복
          wave1X = 0;
      }

      if (wave2X <= -3200) { // 3200px을 기준으로 반복
          wave2X = 0;
      }

      requestAnimationFrame(animateWaves);
  }
  requestAnimationFrame(animateWaves);

  const show = document.querySelector(".show");

  show.innerHTML = show.textContent.split("")
    .map((letter, idx) => {
      if (letter === " ") return " ";
      return `<span style="animation-delay:${idx * 15}ms" class="letter">${letter}</span>`;
    })
    .join("");

  const show2 = document.querySelector(".show2");

  show2.innerHTML = show2.textContent.split("")
    .map((letter, idx) => {
      if (letter === " ") return " ";
      return `<span style="animation-delay:${idx * 15}ms" class="letter">${letter}</span>`;
    })
    .join("");

  const show3 = document.querySelector(".show3");
  show3.innerHTML = show3.textContent.split("")
    .map((letter, idx) => {
      if (letter === " ") return " ";
      return `<span style="animation-delay:${idx * 15}ms" class="letter">${letter}</span>`;
    })
    .join("");

  ScrollReveal().reveal('.number',{duration:1600});
  ScrollReveal().reveal('#first-img',{duration:1600});
  ScrollReveal().reveal('#first-explane',{duration:1600});
  ScrollReveal().reveal('#second-explane',{duration:1600});
  ScrollReveal().reveal('#second-img',{duration:1600});
  ScrollReveal().reveal('#third-explane',{duration:1600});
  ScrollReveal().reveal('#third-img',{duration:1600});
  ScrollReveal().reveal('#fourth-explane',{duration:1600});
  ScrollReveal().reveal('#fourth-chatbox',{duration:1600});
  ScrollReveal().reveal('#fourth-img',{duration:1600});
});




