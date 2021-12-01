



const mapDisplayToggle = () => {
  let button = document.querySelector('#nav_btn');
  button.addEventListener('click', (event) => {
    let directionsPopup = document.querySelector(".mapboxgl-ctrl-directions");
    console.log(directionsPopup)
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

export { mapDisplayToggle };