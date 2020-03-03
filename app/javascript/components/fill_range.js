const fillRange = () => {
  const placeholderValueJauge = document.querySelector(".jauge_number");
  const jauge = document.querySelector(".range_css");

  const jaugeValue = jauge.value;
  // question_type_jauge.insertAdjacentHTML('beforeend', `<p>${jauge_number}</p>`);

  jauge.addEventListener('change',()=>{
    placeholderValueJauge.innerHTML = `<p>${event.currentTarget.value}</p>`
  })


}

export {fillRange};
