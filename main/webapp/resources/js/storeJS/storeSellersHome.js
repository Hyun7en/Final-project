let path;
function contextPath(contextPath){
    path = contextPath;
}

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

//알람 ON/OFF 체크
function checkAlarm(userNo, sellerPageNo){
    console.log(userNo);
    console.log(sellerPageNo);
    if (Object.keys(userNo).length != 0){
        const alarmDiv = document.querySelector('.alarmDiv');
        const alarmButton = document.querySelector('.alarmButton');
        const url = path + `/resources/image/mdi_bell.png`
        $.ajax({
            url: "alarmCheck.st",
            data: {userNo : userNo, sellerPageNo : sellerPageNo},
            success: function(count){
                console.log(count);
                if (count > 0){
                    console.log("알람 ON");
                    alarmDiv.id = "seller-confirmed-img";
                    alarmDiv.setAttribute("onclick", `getAlarmOff(${userNo}, ${sellerPageNo})`)
                    alarmButton.id = "seller-confirmed-button";
                    alarmButton.setAttribute("onclick", `getAlarmOff(${userNo}, ${sellerPageNo})`);
                    alarmButton.innerHTML = "알람해제"
                    document.querySelector('.alarmDiv>img').src = url;
                } else{
                    console.log("알람 OFF");
                }
            },
            error: function(){
                console.log("알람 ON/OFF 체크 실패");
            }
        })
    }
}

//알람 ON
function getAlarmOn(userNo, sellerPageNo){
    const alarmDiv = document.querySelector('.alarmDiv');
    const alarmButton = document.querySelector('.alarmButton');
    const url = path + `/resources/image/mdi_bell.png`
    $.ajax({
        url: "alarmOn.st",
        data: {userNo : userNo, sellerPageNo : sellerPageNo},
        success: function(){
            alarmDiv.id = "seller-confirmed-img";
            alarmDiv.setAttribute("onclick", `getAlarmOff(${userNo}, ${sellerPageNo})`)
            alarmButton.id = "seller-confirmed-button";
            alarmButton.setAttribute("onclick", `getAlarmOff(${userNo}, ${sellerPageNo})`);
            alarmButton.innerHTML = "알람해제"
            document.querySelector('.alarmDiv>img').src = url;
            infoMsg("알람이 설정되었습니다.")
        },
        error: function(){
            console.log("알람 ON 실패");
        }
    })
}

//알람 OFF
function getAlarmOff(userNo, sellerPageNo){
    const alarmDiv = document.querySelector('.alarmDiv');
    const alarmButton = document.querySelector('.alarmButton');
    const url = path + `/resources/image/mdi_bell-outline.png`
    $.ajax({
        url: "alarmOff.st",
        data: {userNo : userNo, sellerPageNo : sellerPageNo},
        success: function(){
            alarmDiv.id = "seller-blue-img";
            alarmDiv.setAttribute("onclick", `getAlarmOn(${userNo}, ${sellerPageNo})`)
            alarmButton.id = "seller-blue-button";
            alarmButton.setAttribute("onclick", `getAlarmOn(${userNo}, ${sellerPageNo})`);
            alarmButton.innerHTML = "알람설정"
            document.querySelector('.alarmDiv>img').src = url;
            infoMsg("알람이 해제되었습니다.")
        },
        error: function(){
            console.log("알람 OFF 실패");
        }
    })
}


function infoMsg(infoMsg){
    swal({
        title: "NOTICE",
        text: infoMsg,
        type: "info",
    })
}
