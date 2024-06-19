$(document).ready(function(){
    productPriceCommas();
});

function productPriceCommas(){
    const productPrice = parseInt($(".order-history-product-price").text());
    const formattedProductPrice = numberWithCommas(productPrice); 
    $(".order-history-product-price").text(formattedProductPrice);
}

// 숫자 3자리마다 콤마(,) 추가하는 함수
function numberWithCommas(x){
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}
