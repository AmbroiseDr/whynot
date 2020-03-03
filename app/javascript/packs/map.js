import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
  // navigator.geolocation.getCurrentPosition((data) => {
  //   // oldMarkers.unshift({lat: data.coordinates.latitude, lng: data.coordinates.longitude})
  //   console.log(data.coordinates)
  // });



if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const oldMarkers = mapElement.dataset.markers
  const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
  const markers = JSON.parse(oldMarkers);
  markers.push({
    lat: 48.8522428,
    lng: 2.3393369,
    icon:'https://res.cloudinary.com/ambroise/image/upload/c_scale,w_22/v1582822068/logo_why_not_-_copie_zsernr.png',
  });
  let counter = 1;
  markers.forEach((marker)=>{
    marker.animation = google.maps.Animation.DROP
    counter = counter + 1
    window.setTimeout(function() {
      map.addMarkers([marker]);
    }, 200 * counter);
    let infowindow = new google.maps.InfoWindow({
      content: "contentString"
    });
    google.maps.event.addListener(marker, 'click', function() {
        infowindow.open(map, marker);
    });
  })

  if (markers.length === 0) {
    map.setZoom(2);
  } else if (markers.length === 1) {
    map.setCenter(48.8522428, 2.3393369);
    map.setZoom(14);
  } else {
    map.setCenter(48.8522428, 2.3393369);
    map.setZoom(14);
    // map.fitLatLngBounds(markers);
  }
}

