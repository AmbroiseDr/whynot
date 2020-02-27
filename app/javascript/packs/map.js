import GMaps from 'gmaps/gmaps.js';

const mapElement = document.getElementById('map');
  // navigator.geolocation.getCurrentPosition((data) => {
  //   // oldMarkers.unshift({lat: data.coordinates.latitude, lng: data.coordinates.longitude})
  //   console.log(data.coordinates)
  // });

if (mapElement) { // don't try to build a map if there's no div#map to inject in
  const oldMarkers = mapElement.dataset.markers
  navigator.geolocation.getCurrentPosition((data) => {
    const melat = data.coords.latitude;
    const melng = data.coords.longitude;
    const map = new GMaps({ el: '#map', lat: 0, lng: 0 });
    const markers = JSON.parse(oldMarkers);
    markers.push({
      lat: melat,
      lng: melng,
      icon:'https://res.cloudinary.com/ambroise/image/upload/c_scale,w_22/v1582822068/logo_why_not_-_copie_zsernr.png'
    });
    map.addMarkers(markers);
    if (markers.length === 0) {
      map.setZoom(2);
    } else if (markers.length === 1) {
      map.setCenter(melat, melng);
      map.setZoom(14);
    } else {
      map.setCenter(melat, melng);
      map.setZoom(14);
      map.fitLatLngBounds(markers);
    }
  });
}


