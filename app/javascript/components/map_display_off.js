


const mapDisplayOff = () => {
  const display = document.querySelector(".mapboxgl-ctrl-directions")
  const step = document.querySelector(".mapbox-directions-step");
  if (display) {
    console.log('true');
    step.addEventListener('mouseover', function () {
    });

    var event = new MouseEvent('mouseover', {
      'view': window,
      'bubbles': true,
      'cancelable': true
    });

    step.dispatchEvent(event);

    display.style.display = "none";
  }
}

export { mapDisplayOff };
