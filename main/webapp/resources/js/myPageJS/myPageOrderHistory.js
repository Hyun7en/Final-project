$(document).ready(function(){
    productPriceCommas();
});

function productPriceCommas(){
    const allProductPrice = document.querySelectorAll(".product-price");
    allProductPrice.forEach(function(productPrice) {
        const p = parseInt($(productPrice).text());
        const formattedProductPrice = numberWithCommas(p);
        $(productPrice).text(formattedProductPrice + "원");
    })
}

// 숫자 3자리마다 콤마(,) 추가하는 함수
function numberWithCommas(x){
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}
