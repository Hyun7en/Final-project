//카테고리 링크
function boCategory(category){
    location.href = "list.co?category=" + category + "&cpage=1";
}

function categorySelected() {
    function getCategoryFromUrl() {
        const params = new URLSearchParams(window.location.search);
        return params.get('category');
    }
    var buttons = document.querySelectorAll(".com-nav");
    const category = getCategoryFromUrl();
    buttons.forEach(function(button){
        if(button.value === category){
            button.id = "com-nav-selected";
        }
    })
}

//게시글 열람 링크
function show(boardLevel, cpage, boardNo){
    location.href = "detail.co?category=" + boardLevel + "&cpage=" + cpage + "&boardNo=" + boardNo;
}

//success 메시지
function callSuccessMsg(sucMsg){
    var successMessage = sucMsg;
    if (successMessage) {
        Swal.fire({
            icon: 'success',
            title: 'success!',
            html: successMessage
        });
    }
}
//info 메시지
function callInfoMsg(infoMsg){
    var infoMessage = infoMsg;
    if (infoMessage) {
        Swal.fire({
            icon: 'info',
            title: 'Notice',
            html: infoMessage
        });
    }
}