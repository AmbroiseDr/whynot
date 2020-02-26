const clickTags = () => {
  const tags = document.getElementById('user_tags')

  if (tags) {
    const icons = document.querySelectorAll(".clickable");

    icons.forEach((icon) => {
      icon.addEventListener('click', (event) => {
        tags.value += icon.dataset.value + ',';
        icon.classList.toggle("active")
      });
    });






// A GERER DEMAIN: quand on clique plusieurs fois

  //   const updateValueInput = (tag) => {
  //     if (tag.classList.contains("active")) {
  //         document.getElementById('tag').value = document.getElementById('tag').value + "," + tag.innerText
  //       };
  //   };

  //   const toggleActiveClass = (event) => {
  //     document.getElementById('tag').value = ""
  //     event.currentTarget.classList.toggle('active');
  //     tags.forEach(updateValueInput)
  //   };

  //   const toggleActiveOnClick = (tag) => {
  //     tag.addEventListener('click', toggleActiveClass);
  //   };

  //   tags.forEach(toggleActiveOnClick);
  }
};

export { clickTags };
