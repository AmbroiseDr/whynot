const unselectMbti = () => {
  const squares = document.querySelectorAll(".mbti-letters")

  if (squares){
    squares.forEach((square) => {
      square.classList.remove('active')
    })
  }
}



const selectMbti = () => {
  const squares = document.querySelectorAll(".mbti-letters")
  const inputField = document.getElementById("user_profile_mbti_id")

  if (squares){
    squares.forEach((square)=>{
      square.addEventListener("click",()=>{
        unselectMbti();
        event.currentTarget.classList.toggle('active')
        inputField.value = event.currentTarget.dataset.value
      })
    })

  }
}

export { selectMbti }
