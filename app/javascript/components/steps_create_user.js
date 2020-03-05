
const stepsCreate = () => {
  const card = document.querySelector('.sign-up');

  if (card){
    const steps = document.querySelectorAll(".step")
    const progPoints = document.querySelectorAll(".prog")

    const precedent = document.getElementById('precedent')
    const suivant = document.getElementById('suivant')
    let counter = 0


    suivant.addEventListener("click", () => {
      steps[counter].classList.toggle('d-none')
      counter += 1
      suivant.classList.toggle('d-none')
      precedent.classList.toggle('d-none')
      // adaptCardSize(counter)
      progPoints[counter].classList.toggle('active')
      steps[counter].classList.toggle('d-none')
    })

    precedent.addEventListener("click", () => {
      steps[counter].classList.toggle('d-none')
      progPoints[counter].classList.toggle('active')
      counter -= 1
      suivant.classList.toggle('d-none')
      precedent.classList.toggle("d-none")
      // adaptCardSize(counter)
      steps[counter].classList.toggle('d-none')
    })
  }
}

export { stepsCreate }
