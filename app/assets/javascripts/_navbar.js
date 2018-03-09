  $(document).ready(function(){

  var userScroll = 0;
  $(window).scroll( function() {
    var scrollTop = $(this).scrollTop();
    if (scrollTop - userScroll > 50) {
      var navHeight = $('.header').css('height');
      console.log(navHeight)
        $('.header').animate({top: '-' + navHeight}, 150);
        userScroll = scrollTop;
      } else if (userScroll - scrollTop > 50) {
        $('.header').animate({top: '0px'}, 150);
        userScroll = scrollTop;
      }
  });
});
