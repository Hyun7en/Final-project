//(기능 안 하는 스크립트)
//error 메시지
// function callErrorMsg(errMsg){
//     var errorMessage = errMsg;
//     if (errorMessage) {
//         Swal.fire({
//             icon: 'error',
//             title: 'Error!',
//             html: errorMessage
//         });
//     }
// }

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

function categorySelectedsc(boardLevel) {
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

function deleteReply(boardReplyNo, boardLevel, boardNo){
    swal({
    title: "WARNING",
    text: "정말로 삭제하시겠습니까?",
    type: "warning",
    confirmButtonText: "예",
    cancelButtonText: "아니요",
    showCancelButton: true
    })
    .then((result) => {
        if (result.value) {
            window.location = "rdelete.co?boardLevel=" + boardLevel + "&boardNo=" + boardNo + "&boardReplyNo=" + boardReplyNo;
        }
    })
}
function deleteBoard(boardLevel, boardNo){
    console.log(boardLevel, boardNo);
    swal({
    title: "WARNING",
    text: "정말로 삭제하시겠습니까?",
    type: "warning",
    confirmButtonText: "예",
    cancelButtonText: "아니요",
    showCancelButton: true
    })
    .then((result) => {
        if (result.value) {
            window.location = "delete.co?boardLevel=" + boardLevel + "&boardNo=" + boardNo;
        }
    })
}

//댓글 관련 스크립트
function callReply(CboardNo, Cancel, cBoardLevel){
    getReplyList({bno : CboardNo}, function(result){
        
        setReplyCount(result.length)

        const replyBody = document.querySelector("#com-reply tbody");
        drawTableList(result, replyBody, Cancel, cBoardLevel, CboardNo);
    })
}

//댓글 등록
function addReply(Cancel, cBoardLevel, CboardNo){
    //boardNo
    //userId
    //댓글내용

    const boardNo = "${c.boardNo}";
    const userNo = "${loginUser.userNo}";
    const content = document.querySelector("#com-reply-insertbox").value;


    addReplyAjax({
        boardNo: boardNo,
        userNo: userNo,
        replyContents: content
    }, function(res){
        getReplyList({bno : "${c.boardNo}"}, function(result){
            setReplyCount(result.length);
            drawTableList(result, document.querySelector("#com-reply tbody"), Cancel, cBoardLevel, CboardNo);
        })
        
    })
}


//댓글 카운트 넣기
function setReplyCount(count){
    const rCount = document.querySelector("#rcount");
    rCount.innerHTML = count;
}

function addReplyAjax(data, callback){
    $.ajax({
        url: "rinsert.co",
        data : data,
        success : function(res){
            callback(res)
        }, error(){
            console.log("댓글 생성 ajax실패");
        }
    })
}

// 댓글 목록 가져오기
function getReplyList(data, callback){
    $.ajax({
        url: 'rlist.co',
        data : data,
        success: function(result){
            callback(result)
        },
        error: function(item){
            console.log(item);
            console.log("댓글요청 ajax 실패");
        }
    })
}

function drawTableList(itemList, parent, Cancel, cBoardLevel, CboardNo){
    $(parent).empty();

    //이벤트를 넣는 뷰를 작성하고 싶을 때
    for (let reply of itemList) {

        const replyRow1 = document.createElement('tr');
        replyRow1.innerHTML = `<th id="com-reply-writer" colspan="2">` + reply.nickname + `</th>
                              <td id="com-reply-enrolldate">` + reply.replyDate + `</td>
                              <td id="com-reply-edit"><img src="` + Cancel +
                              `" alt="댓글 삭제 이미지" onclick="deleteReply(` + reply.boardReplyNo +
                              `, ` + cBoardLevel + `, ` + CboardNo + `)"></td>`;
        parent.appendChild(replyRow1);

        const replyRow2 = document.createElement('tr');
        replyRow2.innerHTML = `<td id="com-reply-blank"></td>
                                <td id="com-reply-words" colspan="2">` + reply.replyContents + `</td>
                                <td id="com-reply-blank"></td>`;
        parent.appendChild(replyRow2);
        
    }
}

//추천 관련 스크립트
//추천 버튼 지정

function callThumbup(CboardNo, LuserNo){ //onload로 작동하는 function
    const goodbutton = document.querySelector('.goodbutton');
    if (Object.keys(LuserNo).length === 0){
        LuserNo = 0;
    }
    checkThumbUp({userNo : LuserNo, boardNo : CboardNo}, LuserNo, goodbutton);
    getThumbUpCount({boardNo : CboardNo}, function(count){
        setThumbUpCount(count)
    })
}

//추천 정보 가져오기
function getThumbUpCount(boardNo, callback){
    $.ajax({
        url: "thumbUpCount.co",
        data: boardNo,
        success: function(count){
            callback(count)
        },
        error: function(item){
            console.log(item);
            console.log("추천 정보 요청 ajax 실패");
        }
    })
}

//추천 카운트 넣기
function setThumbUpCount(count){
    const thumbUpCount = document.querySelector('#thumbUpCount');
    thumbUpCount.innerHTML = count;
}

//추천 버튼 클릭 여부 체크
function checkThumbUp(ThumbUp, userNo, goodbutton){
    if(userNo.value != 0) {
        $.ajax({
            url: "thumbUpCheck.co",
            data: ThumbUp,
            success: function(result){
                if (result > 0){
                    console.log(goodbutton);
                    goodbutton.id = "com-detail-goodbuttonClicked";
                    goodbutton.setAttribute('onclick', `thumbUpOff(${userNo}, ${ThumbUp.boardNo})`);
                }
            },
            error: function(item){
                console.log(item);
                console.log("추천 버튼 체크 ajax 실패");
            }
        })
    }
}

//추천 버튼 클릭
function thumbUpOn(userNo, boardNo){
    const goodbutton = document.querySelector('.goodbutton');
    goodbutton.id = "com-detail-goodbuttonClicked";
    goodbutton.setAttribute('onclick', `thumbUpOff(${userNo}, ${boardNo})`);
    ajaxthumbUpOn({
        userNo : userNo,
        boardNo : boardNo
    }, function(res){
        console.log(boardNo);
        getThumbUpCount({boardNo : boardNo}, function(count){
            setThumbUpCount(count)
        })
    }
)}

function ajaxthumbUpOn(data, callback){
    $.ajax({
        url: 'thumbUpOn.co',
        data : data,
        success: function(res){
            console.log("추천 입력 성공")
            callback(res)
        },
        error: function(item){
            console.log(item);
            console.log("추천 입력 실패");
        }
    })
}

function thumbUpOff(userNo, boardNo){
    const goodbutton = document.querySelector('.goodbutton');
    goodbutton.id = "com-detail-goodbutton";
    goodbutton.setAttribute('onclick', `thumbUpOn(${userNo}, ${boardNo})`);
    ajaxthumbUpOff({
        userNo : userNo,
        boardNo : boardNo
    }, function(res){
        console.log(boardNo);
        getThumbUpCount({boardNo : boardNo}, function(count){
            setThumbUpCount(count)
        })
    }
)}

function ajaxthumbUpOff(data, callback){
    $.ajax({
        url: 'thumbUpOff.co',
        data : data,
        success: function(res){
            console.log("추천 취소 성공")
            callback(res)
        },
        error: function(item){
            console.log(item);
            console.log("추천 취소 실패");
        }
    })
}

//게시글 열람 링크(list)
function show(boardLevel, cpage, boardNo){
    location.href = "detail.co?category=" + boardLevel + "&cpage=" + cpage + "&boardNo=" + boardNo;
}

//게시글 열람 링크(searchlist)
function showsearch(boardNo){
    document.querySelector(`#show-${boardNo}`).submit()
}



//페이지 이동(searchlist)
function prevpage(){
    document.querySelector('#prevpage-link').submit();
}

function numpage(num){
    console.log(num);
    document.querySelector(`#numpage-link-${num}`).submit();
}

function nextpage(){
    document.querySelector('#nextpage-link').submit();
}
