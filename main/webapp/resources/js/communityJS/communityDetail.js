//error 메시지
function callErrorMsg(errMsg){
    var errorMessage = errMsg;
    if (errorMessage) {
        Swal.fire({
            icon: 'error',
            title: 'Error!',
            html: errorMessage
        });
    }
}

function deleteReply(boardReplyNo, boardLevel, boardNo){
    console.log(boardReplyNo, boardLevel, boardNo);
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
$(function(){
    getReplyList({bno : "${c.boardNo}"}, function(result){
        
        setReplyCount(result.length)

        const replyBody = document.querySelector("#com-reply tbody");
        drawTableList(result, replyBody);
    })
})

//댓글 등록
function addReply(){
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
            drawTableList(result, document.querySelector("#com-reply tbody"));
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

function drawTableList(itemList, parent){
    $(parent).empty();

    //이벤트를 넣는 뷰를 작성하고 싶을 때
    for (let reply of itemList) {

        const replyRow1 = document.createElement('tr');
        replyRow1.innerHTML = `<th id="com-reply-writer" colspan="2">` + reply.nickname + `</th>
                              <td id="com-reply-enrolldate">` + reply.replyDate + `</td>
                              <td id="com-reply-edit"><img src="${pageContext.request.contextPath}/resources/image/Cancel.png" alt="댓글 삭제 이미지" onclick="deleteReply(`
                                 + reply.boardReplyNo + `, ${c.boardLevel}, ${c.boardNo})"></td>`;
        parent.appendChild(replyRow1);

        const replyRow2 = document.createElement('tr');
        replyRow2.innerHTML = `<td id="com-reply-blank"></td>
                                <td id="com-reply-words" colspan="2">` + reply.replyContents + `</td>
                                <td id="com-reply-blank"></td>`;
        parent.appendChild(replyRow2);
        
    }
}

//추천 관련 스크립트
$(function(){
    getThumbUpCount({bno : "${c.boardNo}"}, {user : "${loginUser.userNo}"}), function(data){
        setThumbUpCount(data.count1)
        if(user != empty){
            checkThumbUp(data.count2);
        }
    }

})

//추천 정보 가져오기
function getThumbUpCount(bno, callback){
    $.ajax({
        url: "thumbUpCheck.co",
        data: bno, user,
        success: function(data){
            
            callback(data);
        },
        error: function(item){
            console.log(item);
            console.log("추천 정보 요청 ajax 실패");
        }
    })
}

//추천 카운트 넣기
function setThumbUpCount(count1){
    const thumbUpCount = document.querySelector('#thumbUpCount');
    thumbUpCount.innerHTML = count1;
}


//추천 버튼 클릭
function thumbUp(userNo, boardNo){

    $.ajax({
        url: 'thumbUp.co',
        data : userNo, boardNo,
        success: function(data){
            checkThumbUp(data.newCount2);
            setThumbUpCount(data.newCount1);
        },
        error: function(item){
            console.log(item);
            console.log("추천 입력 실패");
        }
    })
}

//추천 버튼 클릭 여부 체크
function checkThumbUp(count2){
    const goodbutton = document.querySelector('#com-detail-goodbutton');
    if(count2 > 0){
        goodbutton.disabled = true;
    }
}