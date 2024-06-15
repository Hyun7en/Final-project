

// bootstrap에 의한 css
document.addEventListener('DOMContentLoaded', function () {

    document.getElementById("sticky-container").style.zIndex = "10";

    //장바구니에 담기
    //document.getElementById('product-cart-btn').onclick//

    //구매 페이지로 이동
    document.getElementById('product-buy-btn').onclick = function() {
        location.href = 'enrollForm.pd';
    };    

});


