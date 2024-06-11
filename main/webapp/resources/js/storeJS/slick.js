// Slick carousel initialization

$(window).on('load', function() {

    $('#recommendList').slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: false,
        arrows: true,
        dots: true
    });

    $('#popularProduct').slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: false,
        arrows: true,
        dots: true
    });

    $('#recentProduct').slick({
        infinite: true,
        slidesToShow: 4,
        slidesToScroll: 1,
        autoplay: false,
        arrows: true,
        dots: true
    });
});

