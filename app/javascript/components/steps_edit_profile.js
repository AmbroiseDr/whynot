const stepsEdit = () => {
  const steps = document.querySelectorAll(".step")
  if (steps){
    const progPoints = document.querySelectorAll(".prog")

    const precedent = document.getElementById('precedent')
    const suivant = document.getElementById('suivant')
    let counter = 0


    suivant.addEventListener("click", () => {
      if (counter < 6){
        steps[counter].classList.toggle('d-none')
        counter += 1
        progPoints[counter].classList.toggle('active')
        steps[counter].classList.toggle('d-none')
      }
    })

    precedent.addEventListener("click", () => {
      if (counter > 0){
        steps[counter].classList.toggle('d-none')
        progPoints[counter].classList.toggle('active')
        counter -= 1
        steps[counter].classList.toggle('d-none')
      }
    })
  }
}

export { stepsEdit }
