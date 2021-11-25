import mapboxgl from 'mapbox-gl';

const buildMap = (mapElement) => {
  mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
  return new mapboxgl.Map({
    container: 'map',
    style: 'mapbox://styles/mapbox/streets-v10'
  });
};

const addMarkersToMap = (map, markers) => {
  markers.forEach((marker) => {
    const popup = new mapboxgl.Popup().setHTML(marker.info_window); // add this
    new mapboxgl.Marker()
      .setLngLat([marker.lng, marker.lat])
      .setPopup(popup) // add this
      .addTo(map);
  });
};

const fitMapToMarkers = (map, markers) => {
  const bounds = new mapboxgl.LngLatBounds();
  markers.forEach(marker => bounds.extend([marker.lng, marker.lat]));
  map.fitBounds(bounds, { padding: 70, maxZoom: 15, duration: 2000  });
};

// const initMapbox = () => {
//   const mapElement = document.getElementById('map');
//   if (mapElement) {
//     const map = buildMap(mapElement);
//     const markers = JSON.parse(mapElement.dataset.markers);
//     if (mapElement.dataset.needUserMarker === 'true') {
//       navigator.geolocation.getCurrentPosition((position) => {
//         let lat = position.coords.latitude
//         let lng = position.coords.longitude;
//         let currentCoords = {
//           lng: lng,
//           lat: lat,
//           info_window: '<h1>This is you</h1>'
//         };
//         markers.unshift(currentCoords);
//         console.log(markers);
//       });
//     }
//     addMarkersToMap(map, markers);
//     fitMapToMarkers(map, markers);
//   }
// };

const initMapbox = () => {
//   const mapElement = document.getElementById('map');
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const markers = JSON.parse(mapElement.dataset.markers);
    let map
    if (("geolocation" in navigator) && (mapElement.dataset.needUserMarker === 'true')) {

      navigator.geolocation.getCurrentPosition(position => {
        let currentCoords = {
            'lng': position.coords.longitude,
            'lat': position.coords.latitude,
            'info_window': '<h1>This is you</h1>'
          };

        markers.unshift(currentCoords);
        mapboxgl.accessToken = mapElement.dataset.mapboxApiKey;
        map = new mapboxgl.Map({
          container: 'map',
          style: 'mapbox://styles/mapbox/streets-v10',
          center: [currentCoords.lng, currentCoords.lat],
          zoom: 14
        })

        addMarkersToMap(map, markers);
        fitMapToMarkers(map, markers);
      })
      console.log(markers);

      // markers.push(currentCoords);
    } else {
      map = buildMap(mapElement);
      addMarkersToMap(map, markers);
      fitMapToMarkers(map, markers);
    }
  }
}

export { initMapbox };
