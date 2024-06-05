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
    console.log(userNo);
    console.log(sellerPageNo);
    if (Object.keys(userNo).length != 0){
        const alarmDiv = document.querySelector('.alarmDiv');
        const alarmButton = document.querySelector('.alarmButton');
        $.ajax({
            url: "alarmCheck.st",
            data: {userNo : userNo, sellerPageNo : sellerPageNo},
            success: function(count){
                console.log(count);
                if (count > 0){
                    console.log("알람받기 ON");
                    alarmDiv.id = "seller-confirmed-img";
                    alarmDiv.setAttribute("onclick", `getAlarmOff(`+ userNo + `,` + sellerPageNo`)`)
                    alarmButton.id = "seller-confirmed-button";
                    alarmButton.setAttribute("onclick", `getAlarmOff(`+ userNo + `,` + sellerPageNo`)`);
                } else{
                    console.log("알람받기 OFF");
                }
            },
            error: function(){
                console.log("알람받기 ON/OFF 체크 실패");
            }
        })
    }
}

//알람받기 ON
function getAlarmOn(userNo, sellerPageNo){

}

//알람받기 OFF
function getAlarmOff(userNo, sellerPageNo){

}