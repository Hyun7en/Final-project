function businessNumber(){
    let num = document.getElementById('businessNo').value; //사업자번호
    var data = {
        b_no: [num] 
    }; 
  
    $.ajax({
        url: `https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=CyIbg1w%2BruaWHNUV7qJySFVkigkOcUzi%2FSYeINSMNtSzSrkreTn843csiwTN5EtUMiVt6lx%2FFqCG4wtX7pcEhw%3D%3D`,
        type: "POST",
        data: JSON.stringify(data), // json 을 string으로 변환하여 전송
        dataType: "JSON",
        contentType: "application/json",
        accept: "application/json",
        success: function(result) {
            resultCheck(result);
        },
        error: function(result) {
            console.log(result.responseText); //responseText의 에러메세지 확인
        }
    });
}

function resultCheck(result){
    if(result.status_code == "OK"){
        console.log("진위여부성공");
    }else {
        console.log("진위여부실패");
    }
}

// function swal(){
//     var successMessage = "${successMessage}";
//         if (successMessage) {
//         Swal.fire({
//             icon: 'success',
//             title: 'success!',
//             html: successMessage
//         });
//     }
// }