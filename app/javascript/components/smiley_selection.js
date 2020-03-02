const smileySelection = () => {

  const smileys = Array.from(document.querySelector('.smileys').children)

  if (smileys){
    smileys.forEach((smiley) => {
      smiley.addEventListener("click", (event) => {
        document.getElementById("user_smiley").value = event.currentTarget.innerHTML
      })
    })
  }
}

export { smileySelection };
