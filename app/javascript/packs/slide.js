
import Slider from 'bootstrap-slider'

  new Slider('#ex1', {
    formatter: function(value) {
      return 'Current value: ' + value;
    }
  });

var sliderValue = document.querySelector('.slider-handle').getAttribute('aria-valuenow')
console.log(sliderValue)
sliderValue.addEventListener('change', function(value) {
  console.log(value)
})

// JQuery
// $('#ex1').slider({
//   formatter: function(value) {
//     return 'Current value: ' + value;
//   }
// });