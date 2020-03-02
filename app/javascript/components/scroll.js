function scrollLastMessageIntoView() {
  const messages = document.querySelectorAll('li');
  const lastMessage = messages[messages.length - 1];

  if (lastMessage !== undefined) {
    lastMessage.scrollIntoView();
  };
};

export { scrollLastMessageIntoView };
