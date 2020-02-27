import autoComplete from "../plugins/autoComplete";


const searchMovie = () => {
  const input = document.querySelector("#autoComplete")
  if (input){
    new autoComplete({
        data: {                              // Data src [Array, Function, Async] | (REQUIRED)
          src: async () => {
            // API key token
            const token = document.querySelector("#autoComplete").dataset.omdb;
            // User search query
            const query = document.querySelector("#autoComplete").value;
            // Fetch External Data Source
            const source = await fetch(`http://www.omdbapi.com/?apikey=${token}&s=${query}`);
            // Format data into JSON
            const data = await source.json();
            // Return Fetched data
            console.log(data.Search)
            return data.Search;
          },
          key: ["Title"],
          cache: false
        },
        sort: (a, b) => {                    // Sort rendered results ascendingly | (Optional)
            if (a.match < b.match) return -1;
            if (a.match > b.match) return 1;
            return 0;
        },
        selector: "#autoComplete",           // Input field selector              | (Optional)
        threshold: 3,                        // Min. Chars length to start Engine | (Optional)
        debounce: 300,                       // Post duration for engine to start | (Optional)
        searchEngine: "strict",              // Search Engine type/mode           | (Optional)
        resultsList: {                       // Rendered results list object      | (Optional)
            render: true,
            container: source => {
                source.setAttribute("id", "movie_list");
            },
            destination: document.querySelector("#search-movie"),
            position: "beforeend",
            element: "ul"
        },
        maxResults: 5,                         // Max. number of rendered results | (Optional)
        highlight: true,                       // Highlight matching results      | (Optional)
        resultItem: {                          // Rendered result item            | (Optional)
            content: (data, source) => {
                source.innerHTML = data.match;
            },
            element: "li"
        },
        onSelection: feedback => {
          const selection = feedback.selection.value;
          // Render selected choice to selection div
          const pastMovie = document.querySelector('.selection')
          if (pastMovie) {
            document.querySelector(".selection").innerHTML =`
              <img src='${selection.Poster}'>
              <div>
                <div class='card-title'>
                  ${selection.Title}
                </div>
                <div class='card-text'>
                  ${selection.Year}
                </div>
              </div>`;
          } else {
              document.getElementById("search-movie").insertAdjacentHTML("afterend",`
              <div class='selection d-flex'>
                <img src='${selection.Poster}'>
                <div>
                  <div class='card-title'>
                    ${selection.Title}
                  </div>
                  <div class='card-text'>
                    ${selection.Year}
                  </div>
                </div>
              </div>`)
          }
          // Clear Input
          document.querySelector("#autoComplete").value = "";
          // Change placeholder with the selected value
          document
            .querySelector("#autoComplete")
            .setAttribute("placeholder", selection.Title);
          document.querySelector('#user_movie_title').value = selection.Title
          document.querySelector('#user_movie_year').value = selection.Year
          document.querySelector('#user_movie_image_url').value = selection.Poster
        }
    });
  }
}

export { searchMovie }


