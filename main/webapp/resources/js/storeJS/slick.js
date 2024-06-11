// Slick carousel initialization

$(window).on('load', function() {

    // $(',banner-item').slick({
    //     infinite: true,
    //     slidesToShow: 1,
    //     slidesToScroll: 1,
    //     autoplay: true,
    //     arrows: true,
    //     dots: true
    // });

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

