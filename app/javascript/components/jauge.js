
const AnimateJauge = () => {
  const elem = document.querySelector(".progress-bar");
  if(elem) {
      let width = -1;
      const id = setInterval(frame, 10);
      function frame() {

        if (width >= elem.dataset.percentage) {
          clearInterval(id);
        } else {
          width++;
          elem.style.width = width + "%";
        }
      }
    }
}
export { AnimateJauge }
