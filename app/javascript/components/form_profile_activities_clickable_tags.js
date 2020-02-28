const clickTags = () => {
  const tags = document.getElementById('user_form_tag_list')

  if (tags) {
    const icons = document.querySelectorAll(".clickable");

    icons.forEach((icon) => {
      icon.addEventListener('click', (event) => {
        tags.value += icon.dataset.value + ',';
        icon.classList.toggle("active")
      });
    });


export { clickTags };
