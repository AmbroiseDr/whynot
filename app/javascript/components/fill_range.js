const fillRange = () => {
  const placeholderValueJauge = document.querySelector(".jauge_number");
  const jauge = document.querySelector(".range_css");

  if (jauge){
    jauge.addEventListener('change',()=>{
      placeholderValueJauge.innerHTML = `<p>${event.currentTarget.value}</p>`
    })
  }


}

export {fillRange};
