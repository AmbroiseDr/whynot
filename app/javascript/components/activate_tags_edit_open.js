const activateTagsOnLoad = () => {
  const editImage = document.querySelector(".edit-image")
  const icons = document.querySelectorAll(".clickable");
  if (editImage){
    icons.forEach((icon) => {
      if (icon.dataset.tagList.includes(icon.dataset.value)){
        icon.classList.add("active")
      }
    })

  }
}

export { activateTagsOnLoad };
