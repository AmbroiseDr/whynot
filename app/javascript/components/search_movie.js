
const resultMovies = (event) => {
  const query = event.currentTarget.value
  const omdbKey = event.currentTarget.dataset.omdb
  fetch(`http://www.omdbapi.com/?apikey=${omdbKey}&s=${query}`)
    .then(response => response.json())
    .then((data) => {
      console.log(data); // Look at local_names.default
    });
}



const searchMovie = () => {
  const inputMovie = document.getElementById("search-movie")
  if (inputMovie) {
    inputMovie.addEventListener("keyup",(event) => {
      resultMovies(event)
    })
  }
}

export { searchMovie }
