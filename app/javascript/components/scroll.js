const validation = document.querySelector('.conv-name')

function scrollLastMessageIntoView() {
  if (validation) {
    const messages = document.querySelectorAll('li');
    const lastMessage = messages[messages.length - 1];
    lastMessage.scrollIntoView();
  }
};

export { scrollLastMessageIntoView };
