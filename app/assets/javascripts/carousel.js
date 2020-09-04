var $c = jQuery.noConflict();

$c(document).ready(function(){
  $c('.post-slider').slick({
    centerMode: true,
    centerPadding: '60px',
    autoplay:true,
    dots:true,
    slidesToShow: 3,
    responsive: [
      {
        breakpoint: 960,
        settings: {
          arrows: false,
          centerMode: true,
          centerPadding: '40px',
          slidesToShow: 3
        }
      },
      {
        breakpoint: 480,
        settings: {
          arrows: false,
          centerMode: true,
          centerPadding: '40px',
          slidesToShow: 2
        }
      }
    ]
});
});
