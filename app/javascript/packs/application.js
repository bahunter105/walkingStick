// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.

require("@rails/ujs").start()
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")


// Uncomment to copy all static images under ../images to the output folder and reference
// them with the image_pack_tag helper in views (e.g <%= image_pack_tag 'rails.png' %>)
// or the `imagePath` JavaScript helper below.
//
// const images = require.context('../images', true)
// const imagePath = (name) => images(name, true)


// ----------------------------------------------------
// Note(lewagon): ABOVE IS RAILS DEFAULT CONFIGURATION
// WRITE YOUR OWN JS STARTING FROM HERE 👇
// ----------------------------------------------------

// External imports
import "bootstrap";

// Internal imports, e.g:
// import { initSelect2 } from '../components/init_select2';

document.addEventListener('turbolinks:load', () => {
  // Call your functions here, e.g:
  // initSelect2();
});

// Mapbox
// CSS
import 'mapbox-gl/dist/mapbox-gl.css';
// internal imports
import { initMapbox } from '../plugins/init_mapbox';

// document.addEventListener('turbolinks:load', () => {
//   initMapbox();
// })



  /* Lettering.JS 0.6.1 by Dave Rupert  - http://daverupert.com */
  (function ($) { function injector(t, splitter, klass, after) { var a = t.text().split(splitter), inject = ''; if (a.length) { $(a).each(function (i, item) { inject += '<span class="' + klass + (i + 1) + '">' + item + '</span>' + after }); t.empty().append(inject) } } var methods = { init: function () { return this.each(function () { injector($(this), '', 'char', '') }) }, words: function () { return this.each(function () { injector($(this), ' ', 'word', ' ') }) }, lines: function () { return this.each(function () { var r = "eefec303079ad17405c889e092e105b0"; injector($(this).children("br").replaceWith(r).end(), r, 'line', '') }) } }; $.fn.lettering = function (method) { if (method && methods[method]) { return methods[method].apply(this, [].slice.call(arguments, 1)) } else if (method === 'letters' || !method) { return methods.init.apply(this, [].slice.call(arguments, 0)) } $.error('Method ' + method + ' does not exist on jQuery.lettering'); return this } })(jQuery);

$('h1 a').lettering();
$('h1 a').children().each(function (i) {
  var letter = $(this);
  setTimeout(function () {
    //alert('yo');
    letter.addClass('fadeBounceIn')
  }, i * 50)
});

function randomImage() {
  var images = [
    '/assets/madrid.jpg',
    '/assets/london.png',
    '/assets/amsterdam.jpg'];
  var size = images.length;
  var x = Math.floor(size * Math.random());
  var element = document.getElementsByClassName('home-intro');
  console.log(element);
  element[0].style["background-image"] = "url(" + images[x] + ")";
}

document.addEventListener("DOMContentLoaded", randomImage);
