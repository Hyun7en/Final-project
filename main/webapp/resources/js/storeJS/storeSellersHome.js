function order(sellerPageNo, number){
    location.href=`sellersStore.st?sellerPageNo=` + sellerPageNo + `&order=` + number + `&cpage=1`;
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

//이하 ajax
//알람받기 ON/OFF 체크
function checkAlarm(userNo, sellerPageNo){

}

//알람받기 ON
function getAlarmOn(userNo, sellerPageNo){

}

//알람받기 OFF
function getAlarmOff(userNo, sellerPageNo){

}