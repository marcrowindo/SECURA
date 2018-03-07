
import Slider from 'bootstrap-slider'

  new Slider('#ex1', {
    tooltip: 'hide'
  });

let MutationObserver = window.MutationObserver || window.WebKitMutationObserver || window.MozMutationObserver;

let slider = document.getElementById('ex1');
debugger

let sliderValue = document.getElementById('slider-value')

var observer = new MutationObserver(function(mutations) {
  mutations.forEach(function(mutation) {
    if (mutation.type == "attributes") {
      sliderValue.innerText = slider.getAttribute('data-value')
    }
  });
});


observer.observe(slider, {
  attributes: true //configure it to listen to attribute changes
});

console.log("I GET LOADED");

// sliderValue.addEventListener('change', function(e) {
//   console.log(e)
// })



// JQuery
// $('#ex1').slider({
//   formatter: function(value) {
//     return 'Current value: ' + value;
//   }
// });

