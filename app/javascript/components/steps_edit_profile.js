const adaptCardSize = (counter) => {
  const card = document.querySelector('.card-edit');

  if (card){
    document.getElementById("precedent").style.visibility = "visible"
    document.getElementById("suivant").style.visibility = "visible"

    if (counter === 2 || counter === 3){
      card.style.height = "260px"
      card.style.marginTop = "200px"
    }else if(counter === 6){
      card.style.height = "500px";
      document.getElementById("suivant").style.visibility = "hidden"
    }else if(counter === 0){
      card.style.height = "620px";
      document.getElementById("precedent").style.visibility = "hidden"
    }else if(counter === 5){
      card.style.height = "650px";
    }else{
      card.style.height = "620px";
      card.style.removeProperty('margin-top');
    }
  }
}



const stepsEdit = () => {
  const card = document.querySelector('.card-edit');

  if (card){
    const steps = document.querySelectorAll(".step")
    const progPoints = document.querySelectorAll(".prog")

    const precedent = document.getElementById('precedent')
    const suivant = document.getElementById('suivant')
    let counter = 0

    precedent.style.visibility = "hidden"

    suivant.addEventListener("click", () => {
      if (counter < 6){
        steps[counter].classList.toggle('d-none')
        counter += 1
        adaptCardSize(counter)
        progPoints[counter].classList.toggle('active')
        steps[counter].classList.toggle('d-none')
      }
    })

    precedent.addEventListener("click", () => {
      if (counter > 0){
        steps[counter].classList.toggle('d-none')
        progPoints[counter].classList.toggle('active')
        counter -= 1
        adaptCardSize(counter)
        steps[counter].classList.toggle('d-none')
      }
    })
  }
}

export { stepsEdit }
