//카테고리 링크
function boCategory(category){
    location.href = "list.co?category=" + category + "&cpage=1";
}

function categorySelected(boardLevel) {
    console.log(boardLevel);

    var buttons = document.querySelectorAll(".com-nav");
    buttons.forEach(function(button){
        if(button.value === boardLevel){
            button.id = "com-nav-selected";
        }
    })
}

//검색어 조건 고정
function conditionSelected(condition){
    console.log(condition)
    if(Object.keys(condition).length !== 0){
        const opt = document.querySelector("#com-condition option[value=" + condition + "]");
        opt.setAttribute("selected", true);
    }
}

//게시글 열람 링크
function show(boardLevel, cpage, boardNo){
    location.href = "detail.co?category=" + boardLevel + "&cpage=" + cpage + "&boardNo=" + boardNo;
}

//(기능 안 하는 스크립트)
// //success 메시지
// function callSuccessMsg(sucMsg){
//     console.log('msg:' + sucMsg);
//     var successMessage = sucMsg;
//     if (successMessage) {
//         Swal.fire({
//             icon: 'success',
//             title: 'success!',
//             html: successMessage
//         });
//     }
// }
// //info 메시지
// function callInfoMsg(infoMsg){
//     console.log(infoMsg);
//     var infoMessage = infoMsg;
//     if (infoMessage) {
//         Swal.fire({
//             icon: 'info',
//             title: 'Notice',
//             html: infoMessage
//         });
//     }
// }