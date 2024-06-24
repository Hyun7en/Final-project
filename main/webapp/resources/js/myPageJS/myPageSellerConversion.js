function businessNumber(){
    let num = document.getElementById('businessNo').value; //사업자번호
    var data = {
        b_no: [num]
    }; 
    console.log("data : "+ data);
    $.ajax({
        url: `https://api.odcloud.kr/api/nts-businessman/v1/status?serviceKey=CyIbg1w%2BruaWHNUV7qJySFVkigkOcUzi%2FSYeINSMNtSzSrkreTn843csiwTN5EtUMiVt6lx%2FFqCG4wtX7pcEhw%3D%3D`,
        type: "POST",
        data: JSON.stringify(data), // json 을 string으로 변환하여 전송
        dataType: "JSON",
        contentType: "application/json",
        accept: "application/json",
        success: function(result) {
            console.log(result);
            resultCheck(result);
        },
        error: function(result) {
            console.log(result.responseText); //responseText의 에러메세지 확인
        }
    });
}

function resultCheck(result){
    console.log(result.data[0].b_stt);
    
    const businessNoInput = document.getElementById("businessNo");
    const businessManCertify = document.getElementById("businessMan-certify");
    const checkMessage = document.getElementById("check-message");

    if(result.data[0].b_stt ==="계속사업자"){
        console.log("진위여부성공");

        businessManCertify.readOnly = true;
        businessManCertify.style.backgroundColor = "#eee";
        businessNoInput.readOnly = true;
        businessNoInput.style.backgroundColor = "#eee";
        checkMessage.innerText = "인증되었습니다.";
        checkMessage.style.color = "green";
    }else {
        console.log("진위여부실패");

        checkMessage.innerText = "인증에 실패하였습니다.";
        checkMessage.style.color = "red";

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