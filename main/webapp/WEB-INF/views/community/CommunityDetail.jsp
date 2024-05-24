<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/communityCSS/communityDetail.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/communityCSS/communityList.css">

</head>
<body>
    <div id="wrap">
        <%@ include file="../commons/header.jsp" %>
        <main id="community-normal">
            <div id="com-head">
                커뮤니티
            </div>
            <div id="com-nav">
                <ul>
                    <li><button class="com-nav-0" onclick="boCategory(0)" name="boardLevel" value="0" style="border-radius: 10px 0 0 10px;">일반</button></li>
                    <li><button class="com-nav-1" onclick="boCategory(1)" name="boardLevel" value="1">꿀팁</button></li>
                    <li><button class="com-nav-2" onclick="boCategory(2)" name="boardLevel" value="2">질문</button></li>
                    <li><button class="com-nav-3" onclick="boCategory(3)" name="boardLevel" value="3" style="border-radius: 0 10px 10px 0;">중고거래</button></li>
                </ul>
            </div>
            <script>
                function boCategory(category){
                        location.href = "list.co?category=" + category + "?cpage=1";
                }
                window.onload = function() {
                    // URL에서 category 값을 추출하는 함수
                    function getCategoryFromUrl() {
                        const params = new URLSearchParams(window.location.search);
                        return params.get('category');
                    }

                    // category 값을 가져옴
                    const category = getCategoryFromUrl();

                    // category 값과 동일한 버튼에 id="com-nav-selected"를 부여
                    if (category !== null) {
                        const button = document.querySelector(`.com-nav-${category}`);
                        if (button) {
                            button.id = "com-nav-selected";
                        }
                    }
                }
            </script>
            <div id="com-detail">
                <div id="com-detail-head">
                    <div id="com-detail-title">
                    ${c.boardTitle}
                    </div>
                    <div id="com-detail-good">
                    추천 수 | ${c.boardDibs}
                    </div>
                </div>
                <div id="com-detail-info">
                    <ul class="com-writer">${c.nickname}</ul>
                    <ul class="com-enrolldate">작성일 | ${c.writeDate}</ul>
                </div>
                <div id="com-detail-content">
                    ${c.boardContents}
                </div>
                <div id="com-detail-goodarea">
                    <button type="button" id="com-detail-goodbutton">
                        <img src="${pageContext.request.contextPath}/resources/image/good.png" alt="추천 버튼" style="width: 30px; height: 30px;">
                    </button>
                    <div id="com-detail-goodcount">
                        ${c.boardDibs}
                    </div>
                </div>


                <table id="com-reply" class="table" align="center">
                    <thead>
                        <c:choose>
                            <c:when test="${empty loginUser }">
                                <tr id="com-reply-insert">
                                    <th colspan="2">
                                        <textarea id="com-reply-insertbox" name="replyContents" readonly cols="55" rows="2" style="resize:none;">로그인 후 이용 가능합니다.</textarea>
                                    </th>
                                    <th colspan="2" style="vertical-align:middle"><button id="com-reply-button" class="btn btn-secondary disabled">등록하기</button></th>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr id="com-reply-insert"> 
                                    <th colspan="2">
                                        <textarea id="com-reply-insertbox" name="replyContents" cols="55" rows="2" style="resize:none;"></textarea>
                                    </th>
                                    <th colspan="2" style="vertical-align:middle"><button id="com-reply-button" class="btn btn-secondary" onclick="addReply();">등록하기</button></th>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    
                        
                        
                        <tr>
                            <td colspan="4">댓글(<span id="rcount">0</span>)</td>
                        </tr>
        
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            
            <br><br>
                <script>
                    $(function(){
                        getReplyList({bno : "${c.boardNo}"}, function(result){
                            // reulst = reulst.map(r => {
                            //     return {
                            //         ...r,
                            //         cNo : 1
                            //     }
                            // })
        
                            // reulst.push({
                            //     cNo : 2,
                            //     createDate : "2022-10-30",
                            //     refBno : 0,
                            //     replyContent : "안녕하세요",
                            //     replyNo: 5,
                            //     replyWriter: "admin"
                            // });
        
                            // const rList = {
                                
                            // }
                            // for (let r of reulst) {
                            //     if (rList[r.cNo]) {
                            //         rList[r.cNo].push(r);
                            //     } else {
                            //         rList[r.cNo] = [r];
                            //     }
                            // }
                            // console.log(rList)
                            
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
                       
                        //단순하게 보여주기위한 view를 작성할때  
                        // let str = "";                
                        // for (let reply of replyList) {
                        //     str += `<tr>
                        //                 <th>` + reply.replyWriter + `</th>
                        //                 <td>` + reply.replyContent + `</td>
                        //                 <td>` + reply.createDate + `</td>
                        //             </tr>`;
                        // }
                        // replyBody.innerHTML = str;
                       
                        //이벤트를 넣는 뷰를 작성하고 싶을 때               
                        for (let reply of itemList) {
                          
                            const replyRow = document.createElement('tr');
                            replyRow.innerHTML = `<th id="com-reply-writer">` + reply.nickname + `</th>
                                                  <td id="com-reply-words" colspan="2">` + reply.replyContents + `</td>
                                                  <td id="com-reply-enrolldate">` + reply.replyDate + `<img src="${pageContext.request.contextPath}/resources/image/Cancel.png" alt="댓글 삭제 이미지"></td>`;
                            parent.appendChild(replyRow);
                            
                            replyRow.onclick = function(){
                            }
                        }
        
                        //ui라이브러리형식으로 구성하기
                        // for (let item of itemList) {
                        //     const row = document.createElement('tr');
                        //     row.innerHTML = `<th>` + item.tdData1 + `</th>
                        //                           <td>` + item.tdData2 + `</td>
                        //                           <td>` + item.tdData3 + `</td>`
                        //     parent.appendChild(row);
                            
                        //     row.onclick = function(){
                        //         item.rowEvent(item);
                        //     }
                        // }
                       
                    }
                </script>

                <div id="com-detail-bottom">
                    <button id="com-blue-button">수정</button>
                    <button id="com-grey-button">삭제</button>
                </div>
            </div>
        </main>
        <%@ include file="../commons/footer.jsp" %>
    </div>

</body>
</html>