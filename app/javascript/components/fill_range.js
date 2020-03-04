const fillRange = () => {
  const placeholderValueJauge = document.querySelector(".jauge_number");
  const jauge = document.querySelector(".range_css");
  const inputField = document.getElementById('answer_value')

  if (jauge){
    inputField.value = 50
    jauge.addEventListener('change',()=>{
      inputField.value = jauge.value
    })
  }
}

export {fillRange};
