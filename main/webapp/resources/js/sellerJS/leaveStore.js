
let userNo = document.querySelector('#leaveStore').val


function leaveStore(){
    
    let userNo;

    $ajax({
        url:'leaveStore.ax',
        method: 'POST',
        data: userNo,
        sucess: function(result){
            console.log("ajax 성공", result);

        },
        error: function(error){
            console.log("ajax 실패", error);

        }

    })
}