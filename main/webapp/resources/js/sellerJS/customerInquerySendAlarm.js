function insertAlarm(sellerNo){
    const alarmContents = document.querySelector("#alarm-contents").value;

    $.ajax({
        url: "insertAlarm.ci",
        type: "post",
        dataType : "json",
        data: {sellerNo : sellerNo, alarmContents : alarmContents},
        success: function(data){
            SswalMessage(data);
            // sendAlarmData(data);
            console.log("ajax 성공")
        },
        error: function(){
            console.log("ajax 실패")
        }
    })
}

function SswalMessage(data){
    var successMessage = data.success;
    if (successMessage) {
        Swal.fire({
            icon: 'success',
            title: 'success!',
            html: successMessage
        });
    }
}

function EswalMessage(data){
    var errorMessage = data.error;
    if (errorMessage) {
        Swal.fire({
            icon: 'error',
            title: 'error!',
            html: errorMessage
        });
    }
}


//보류
// //구독자들에게 알람 날리는 함수
// function sendAlarmData(data){
//     data.list.forEach(element => {
//         $.ajax({
//             url: `send-data.pr/${element}`,
//             type: 'get',
//             success: function(response) {
//                 console.log(`Data for ${element} sent successfully.`);
//             },
//             error: function(jqXHR, textStatus, errorThrown) {
//                 console.log(`Failed to send data for ${element}.`);
//                 console.log("Status: " + textStatus);
//                 console.log("Error: " + errorThrown);
//                 console.log("Response Text: " + jqXHR.responseText);
//             }
//         });
//     });
// }
