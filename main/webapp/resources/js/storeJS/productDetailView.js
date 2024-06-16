

// bootstrap에 의한 css
document.addEventListener('DOMContentLoaded', function () {

     // 자동 폼 제출 관련 코드
     var urlParams = new URLSearchParams(window.location.search);
    if (!urlParams.has('submitted')) {
        var autoSubmitForm = document.getElementById('auto-submit-form');
        if (autoSubmitForm) {
            autoSubmitForm.submit();
        }
    }

    document.getElementById("sticky-container").style.zIndex = "10";

    //장바구니에 담기
    //document.getElementById('product-cart-btn').onclick//

    //구매 페이지로 이동
    document.getElementById('product-buy-btn').onclick = function() {
        location.href = 'order.pd';
    };    

});


