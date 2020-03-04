const unselectSmileys = () => {
  const smileys = document.querySelector(".answer-with-smileys")

  if (smileys){
    Array.from(smileys.children).forEach((smiley)=>{
      smiley.classList.remove("active")
    })
  }
}



const selectSmileyAnswer = () => {
  const smileys = document.querySelector(".answer-with-smileys")
  const inputField = document.getElementById('answer_value')
  if (smileys){
    Array.from(smileys.children).forEach((smiley)=>{
      smiley.addEventListener("click",()=>{
        unselectSmileys()
        smiley.classList.toggle("active")
        inputField.value = smiley.dataset.value
      })
    })
  }
}

export { selectSmileyAnswer }
