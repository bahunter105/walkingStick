import mapboxgl from 'mapbox-gl';
import mapboxDirections from '@mapbox/mapbox-gl-directions/dist/mapbox-gl-directions';

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


const initMapbox = () => {
  const mapElement = document.getElementById('map');
  if (mapElement) {
    const markers = JSON.parse(mapElement.dataset.markers);
    let map
    if (("geolocation" in navigator) && (mapElement.dataset.needUserMarker === 'true')) {

      navigator.geolocation.getCurrentPosition(position => {
        let currentCoords = {
            lng: position.coords.longitude,
            lat: position.coords.latitude,
            info_window: '<h1>This is you</h1>'
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

        let directions = new mapboxDirections({
          accessToken: mapElement.dataset.mapboxApiKey,
          unit: 'metric',
          profile: 'mapbox/walking'
        });
        directions.setOrigin([markers[0].lng, markers[0].lat])

        directions.setDestination([markers[1].lng, markers[1].lat])
        map.addControl(directions, 'top-left');
      })

    } else {
      map = buildMap(mapElement);
      addMarkersToMap(map, markers);
      fitMapToMarkers(map, markers);
    }
  }
}

export { initMapbox };
