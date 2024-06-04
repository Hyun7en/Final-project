function order(sellerPageNo, prCategory, number){
    console.log(sellerPageNo, prCategory, number);
    location.href=`sellersCategory.st?sellerPageNo=` + sellerPageNo + `&pCategory=` + prCategory + `&order=` + number + `&cpage=1`;
}

function orderSelected() {
    function getOrderFromUrl() {
        const params = new URLSearchParams(window.location.search);
        return params.get('order');
    }
    var buttons = document.querySelectorAll(".list-order");
    const order = getOrderFromUrl();

    buttons.forEach(function(button){

        if(button.value === order){
            button.id = "list-order-selected";
        }
    })
}