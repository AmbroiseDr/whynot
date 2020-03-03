const smileySelection = () => {
  const parentSmileys = document.querySelector('.smileys')
  if (parentSmileys) {
    const smileys = Array.from(parentSmileys.children)

    if (smileys){
      smileys.forEach((smiley) => {
        smiley.addEventListener("click", (event) => {
          document.getElementById("user_smiley").value = event.currentTarget.innerHTML
        })
      })
    }
  }
}

export { smileySelection };
