



const mapDisplayToggle = () => {
  console.log('hello');
  let button = document.querySelector('#nav_btn');

  button.addEventListener('click', (event) => {
    let directionsPopup = document.querySelector(".mapboxgl-ctrl-directions");
    console.log(directionsPopup)
    directionsPopup.classList.toggle("d-none")
  });
}

export { mapDisplayToggle };
