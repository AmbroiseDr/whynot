const addGif = () => {
  const gif = document.getElementById('giphy')
  if (gif){
    fetch(`https://api.giphy.com/v1/gifs/random?api_key=${gif.dataset.apiGiphy}&tag=clap&rating=G`)
    .then(response => response.json())
    .then((data) => {
      const url = data.data.fixed_height_downsampled_url;
      let img = new Image()
      img.src = url
      img.style.borderRadius = "5px"
      img.style.maxWidth = "300px"
      img.style.maxHeight = "300px"
      gif.appendChild(img)
  });

  }
}

export { addGif };
