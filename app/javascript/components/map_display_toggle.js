



const mapDisplayToggle = () => {
  let button = document.querySelector('#nav_btn');
  if (button) {

    button.addEventListener('click', (event) => {
      let directionsPopup = document.querySelector(".mapboxgl-ctrl-directions");
      directionsPopup.classList.toggle("d-none")

      let step = document.querySelector(".mapbox-directions-step");
      const mouse = new MouseEvent('mouseover', {
        'view': window,
        'bubbles': true,
        'cancelable': true
      });
      step.dispatchEvent(mouse);
    });
  }
}

export { mapDisplayToggle };
