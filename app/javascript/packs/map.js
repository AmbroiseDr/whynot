import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
  // navigator.geolocation.getCurrentPosition((data) => {
  //   // oldMarkers.unshift({lat: data.coordinates.latitude, lng: data.coordinates.longitude})
  //   console.log(data.coordinates)
  // });



if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const oldMarkers = mapElement.dataset.markers
  // const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const map = new google.maps.Map(document.getElementById('map'), {center : {lat: 48.8522428, lng: 2.3393369}, zoom: 15});
  const markers = JSON.parse(oldMarkers);
  const userMarker = new google.maps.Marker({position: {lat: 48.8522428,lng: 2.3393369},
    map: map,
    title: "test",
    animation: google.maps.Animation.DROP,
    icon:'https://res.cloudinary.com/ambroise/image/upload/c_scale,w_22/v1582822068/logo_why_not_-_copie_zsernr.png'});
  let counter = 1;


  markers.forEach((marker) => {
    if (marker.users_match.length != 0) {
      let stars = "";
      for (let i = 0; i < 5; i++) {
        if ( i < marker.rating ){
          stars = stars + "⭐️";
        };
      }
      let content_info = `
          <p class= "place_name">${marker.name}</p>
          <p class= "place_type">${marker.type}</p>
          <p class= "place_rating" >${stars}</p>
          <p>Est aussi intéressé par cet endroit: </p>
          <div class="places_photos">`
      marker.users_match.forEach((match) => {
        let to_add_html = `
        <a href="/matches/${match.user_id}"><img src="http://res.cloudinary.com/duv3g4cfp/image/upload/c_thumb/${match.user_photo_key}"></a>
        `
          content_info = content_info + to_add_html
      });
      content_info = content_info + "</div>"
      console.log(marker.users_match)
      let infowindow = new google.maps.InfoWindow({
        content: content_info
      });
      window.setTimeout(function() {
        const newMarker = new google.maps.Marker({position: marker, map: map, title: "test",animation: google.maps.Animation.DROP});
        newMarker.addListener('click', function() {
            infowindow.open(map, newMarker);
        });
      },counter * 200);
      counter = counter + 1;
    };
  })
}

