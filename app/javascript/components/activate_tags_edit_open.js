const activateTagsOnLoad = () => {
  const editImage = document.querySelector(".edit-image")
  const icons = document.querySelectorAll(".clickable");

  if (editImage){

    icons.forEach((icon) => {
      if (icon.dataset.tagList.includes(icon.dataset.value)){
        icon.classList.add("active")
        document.getElementById('user_form_tag_list').value = document.getElementById('user_form_tag_list').value + "," + icon.dataset.value
      }
    })
  }
}

export { activateTagsOnLoad };
