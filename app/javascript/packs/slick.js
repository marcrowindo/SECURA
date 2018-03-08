import { slick } from "slick-carousel";

$(document).ready(function(){
  $('.carousel').slick({
    slidesToScroll: 1,
    autoplay: false,
    dots: true,
    arrows: true,
    draggable: false,
    pauseOnFocus: false,
    pauseOnHover: false
  });
});
