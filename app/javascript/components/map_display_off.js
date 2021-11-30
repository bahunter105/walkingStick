


const mapDisplayOff = () => {
  let directionPopup = document.querySelector(".mapboxgl-ctrl-directions")
  let step = document.querySelector(".mapbox-directions-step");
  if (directionPopup) {
    var event = new MouseEvent('mouseover', {
      'view': window,
      'bubbles': true,
      'cancelable': true
    });

    step.dispatchEvent(event);

    // directionPopup.style.directionPopup = "none";
  }
}

export { mapDisplayOff };
