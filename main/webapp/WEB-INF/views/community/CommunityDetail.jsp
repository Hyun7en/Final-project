<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>

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
                    location.href = "list.co?category=" + category;
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
                const button = document.querySelector(".com-nav-" + category);
                button.id = "com-nav-selected";
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
                                    <th colspan="2" style="width: 720px !important;">
                                        <textarea id="com-reply-insertbox" name="replyContents" readonly cols="55" rows="2" style="resize:none; outline: none; padding-left: 10px; padding-top: 5px;">로그인 후 이용 가능합니다.</textarea>
                                    </th>
                                    <th colspan="2" style="vertical-align:middle; width: 180px !important;"><button id="com-reply-button" class="btn btn-secondary disabled">등록하기</button></th>
                                </tr>
                            </c:when>
                            <c:otherwise>
                                <tr id="com-reply-insert"> 
                                    <th colspan="2" style="width: 720px !important;">
                                        <textarea id="com-reply-insertbox" name="replyContents" cols="55" rows="2" style="resize:none; outline: none; padding-left: 10px; padding-top: 5px;"></textarea>
                                    </th>
                                    <th colspan="2" style="vertical-align:middle; width: 180px !important;"><button id="com-reply-button" class="btn btn-secondary" onclick="addReply();">등록하기</button></th>
                                </tr>
                            </c:otherwise>
                        </c:choose>
                    
                        
                        
                        <tr>
                            <td colspan="4" style="height: 30px; background-color: #0089FF; color: white; padding-left: 10px;">댓글(<span id="rcount">0</span>)</td>
                        </tr>
        
                    </thead>
                    <tbody>
                    </tbody>
                </table>
            
            <br><br>
                <script>
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
                                                  <td id="com-reply-edit"><img src="${pageContext.request.contextPath}/resources/image/Cancel.png" alt="댓글 삭제 이미지"></td>`;
                            parent.appendChild(replyRow1);

                            const replyRow2 = document.createElement('tr');
                            replyRow2.innerHTML = `<td id="com-reply-blank"></td>
                                                    <td id="com-reply-words" colspan="2">` + reply.replyContents + `</td>
                                                    <td id="com-reply-blank"></td>`;
                            parent.appendChild(replyRow2);
                            
                        }
        
                    }
                </script>
                <div id="com-detail-bottom">
                    <c:if test="${loginUser.userNo eq c.userNo}">
                        <form action="updateForm.co?boardNo=${c.boardNo}" method="post">
                            <input type="hidden" name="recentLink" id="recentLink" value="">
                            <button type="submit" id="com-blue-button" onclick="getRecentURL()">수정</button>
                        <button id="com-grey-button">삭제</button>
                    </form>
                    </c:if>
                </div>
            </div>

            <script>
                function show(boardLevel, cpage, boardNo){
                    location.href = "detail.co?category=" + boardLevel + "&cpage=" + cpage + "&boardNo=" + boardNo;
                }
                function getRecentURL(){
                    const recentLink = document.querySelector('#recentLink');
                    recentLink.value = (window.location.pathname + window.location.search).substring(6);
                }
            </script>
            <table class="com-list">
                <thead id="com-list-header">
                    <th style="width: 60px; border-radius: 10px 0 0 0;">No</th>
                    <th style="width: 450px; background-color: bl;">제목</th>
                    <th style="width: 135px;">글쓴이</th>
                    <th style="width: 135px;">작성일</th>
                    <th style="width: 120px; border-radius: 0 10px 0 0;">조회수</th>
                </thead>
                <c:forEach var="b" items="${list}" varStatus="order">
                    <c:choose>
                        <c:when test="${order.last}">
                            <tbody id="com-list-bottom">
                                <td style="border-radius: 0 0 0 10px;">${b.boardNo}</td>
                                <td><a href="javascript:show(${b.boardLevel}, ${pi.currentPage}, ${b.boardNo})" class="com-link-${b.boardNo}">${b.boardTitle}</a></td>
                                <td>${b.nickname}</td>
                                <td>${b.writeDate}</td>
                                <td style="border-radius: 0 0 10px 0;">${b.boardCount}</td>
                            </tbody>
                        </c:when>
                        <c:otherwise>
                            <tbody id="com-list-body">
                                <td>${b.boardNo}</td>
                                <td><a href="javascript:show(${b.boardLevel}, ${pi.currentPage}, ${b.boardNo})" class="com-link-${b.boardNo}">${b.boardTitle}</a></td>
                                <td>${b.nickname}</td>
                                <td>${b.writeDate}</td>
                                <td>${b.boardCount}</td>
                            </tbody>
                        </c:otherwise>
                    </c:choose> 
                </c:forEach>
            </table>
            <div class="com-bottom1">
                <div class="com-bottom-left">
                    <select name="condition" id="com-condition">
                        <option value="title">제목</option>
                        <option value="writer">글쓴이</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="keyword" value="" placeholder="검색어 입력">
                    <button id="com-search-button" type="submit">검색</button>
                </div>
                <div id="com-bottom-right">
                    <c:choose>
                        <c:when test="${empty loginUser}">
                            <!-- 로그인 전 -->
                            <button id="com-grey-button" disabled>글쓰기</button>
                        </c:when>
                        <c:otherwise>
                            <!-- 로그인 후 -->
                            <button onclick="location.href='enrollForm.co'" id="com-blue-button">글쓰기</button>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
            <div class="com-bottom2">
                <div id="pagination-div">
                    <ul class="pagination">
                        <c:choose>
                            <c:when test="${ pi.currentPage eq 1 }">
                                <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="list.co?category=${b.boardLevel}&cpage=${pi.currentPage - 1}">&laquo;</a></li>
                            </c:otherwise>
                    </c:choose>
                
                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <c:set var="b" value="${list[0].boardLevel}"/>
                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="list.co?category=${b}&cpage=${p}">${p}</a></li>
                </c:forEach>
                    
                  <c:choose>
                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                            <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="list.co?category=${b.boardLevel}&cpage=${pi.currentPage + 1}">&raquo;</a></li>
                        </c:otherwise>
                    </c:choose>
                     </ul>
                </div>
            </div>

        </main>
        <%@ include file="../commons/footer.jsp" %>
    </div>

</body>
</html>