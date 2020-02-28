const clickTags = () => {
  const editImage = document.querySelector(".edit-image")
  const tags = document.querySelectorAll(".clickable")

  if (editImage) {
    const updateValueInput = (tag) => {
      if (tag.classList.contains("active")) {
          document.getElementById('user_form_tag_list').value = document.getElementById('user_form_tag_list').value + "," + tag.dataset.value
        };
    };

    const toggleActiveClass = (event) => {
      document.getElementById('user_form_tag_list').value = ""
      event.currentTarget.classList.toggle('active');
      tags.forEach(updateValueInput)
    };

    const toggleActiveOnClick = (tag) => {
      tag.addEventListener('click', toggleActiveClass);
    };

    tags.forEach(toggleActiveOnClick);
  }
};

export { clickTags };
