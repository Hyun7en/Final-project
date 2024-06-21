<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- alertify -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/communityCSS/communityDetail.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/communityCSS/communityList.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/communityJS/communityDetail.js"></script>

</head>
<body onload=" init('communityDetail', `${pageContext.request.contextPath}`, {boardNo : `${c.boardNo}`, userNo : `${loginUser.userNo}`, boardLevel : `${c.boardLevel}`, condition : `${condition}`, nickname : `${loginUser.nickname}`});">
    <c:if test="${ not empty errorMessage}">
		<script>
			var errorMessage = '${errorMessage}';
            if (errorMessage) {
                Swal.fire({
                    icon: 'error',
                    title: 'Error!',
                    html: errorMessage
                });
            }
		</script>
		<c:remove var="errorMessage" scope="session"/>
	</c:if>
    <c:if test="${ not empty successMessage}">
		<script>
			var successMessage = '${successMessage}';
            if (successMessage) {
                Swal.fire({
                    icon: 'success',
                    title: 'success!',
                    html: successMessage
                });
            }
		</script>
		<c:remove var="successMessage" scope="session"/>
	</c:if>
    <c:if test="${ not empty infoMessage}">
		<script>
			var infoMessage = '${infoMessage}';
            if (infoMessage) {
                Swal.fire({
                    icon: 'info',
                    title: 'Notice',
                    html: infoMessage
                });
            }
		</script>
		<c:remove var="infoMessage" scope="session"/>
	</c:if>

    <div id="wrap">
        <%@ include file="../commons/header.jsp" %>
        <main id="community-normal">
            <div id="com-head">
                커뮤니티
            </div>
            <div id="com-nav">
                <ul>
                    <li><button class="com-nav" onclick="boCategory(0)" name="boardLevel" value="0" style="border-radius: 10px 0 0 10px;">일반</button></li>
                    <li><button class="com-nav" onclick="boCategory(1)" name="boardLevel" value="1">꿀팁</button></li>
                    <li><button class="com-nav" onclick="boCategory(2)" name="boardLevel" value="2">질문</button></li>
                    <li><button class="com-nav" onclick="boCategory(3)" name="boardLevel" value="3" style="border-radius: 0 10px 10px 0;">중고거래</button></li>
                </ul>
        </div>
            <div id="com-detail">
                <div id="com-detail-head">
                    <div id="com-detail-title">
                    ${c.boardTitle}
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
                    <c:choose>
                        <c:when test="${empty loginUser}">
                            <button class="goodbutton" type="button" id="com-detail-goodbuttonOff">
                                <img src="${pageContext.request.contextPath}/resources/image/not_good.png" alt="추천 버튼" style="width: 30px; height: 30px;">
                            </button>
                        </c:when>
                        <c:otherwise>
                            <button class="goodbutton" type="button" id="com-detail-goodbutton" onclick="thumbUpOn('${loginUser.userNo}', '${c.boardNo}');" value="1">
                                <img src="${pageContext.request.contextPath}/resources/image/good.png" alt="추천 버튼" style="width: 30px; height: 30px;">
                            </button>
                        </c:otherwise>
                    </c:choose>
                    <div id="com-detail-goodcount">
                        <span id="thumbUpCount">0</span>
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
                                    <th colspan="2" style="vertical-align:middle; width: 180px !important;">
                                        <button id="com-reply-button" class="btn btn-secondary"
                                        onclick="addReply('${pageContext.request.contextPath}/resources/image/Cancel.png', '${c.boardLevel}', '${c.boardNo}', '${loginUser.userNo}', '${loginUser.nickname}')">
                                            등록하기
                                        </button>
                                    </th>
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

                <div id="com-detail-bottom">
                    <c:if test="${loginUser.userNo eq c.userNo}">
                        <button type="button" id="com-blue-button" onclick="location.href='updateForm.co?boardNo=${c.boardNo}'">수정</button>
                        <button id="com-grey-button" onclick="deleteBoard('${c.boardLevel}', '${c.boardNo}')" >삭제</button>
                    </c:if>
                </div>
            </div>
            <table class="com-list">
                <thead id="com-list-header">
                    <th style="width: 60px; border-radius: 10px 0 0 0;">No</th>
                    <th style="width: 450px; background-color: bl;">제목</th>
                    <th style="width: 135px;">글쓴이</th>
                    <th style="width: 135px;">작성일</th>
                    <th style="width: 120px; border-radius: 0 10px 0 0;">조회수</th>
                </thead>
                <c:choose>
                    <c:when test="${empty keyword}">
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
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="b" items="${list}" varStatus="order">
                            <c:choose>
                                <c:when test="${order.last}">
                                    <tbody id="com-list-bottom">
                                        <form id="show-${b.boardNo}" action="detail.co?category=${b.boardLevel}&cpage=${pi.currentPage}&boardNo=${b.boardNo}" method="post">
                                            <input type="hidden" name="condition" value="${condition}">
                                            <input type="hidden" name="keyword" value="${keyword}">
                                            <input type="hidden" name="boardLevel" value="${boardLevel}">
                                            <input type="hidden" name="currentPage" value="${pi.currentPage}">
                                            <td style="border-radius: 0 0 0 10px;">${b.boardNo}</td>
                                            <td><a href="#" onclick="showsearch('${b.boardNo}')" class="com-link-${b.boardNo}">${b.boardTitle}</a></td>
                                            <td>${b.nickname}</td>
                                            <td>${b.writeDate}</td>
                                            <td style="border-radius: 0 0 10px 0;">${b.boardCount}</td>
                                        </form>
                                    </tbody>
                                </c:when>
                                <c:otherwise>
                                    <tbody id="com-list-body">
                                        <form id="show-${b.boardNo}" action="detail.co?category=${b.boardLevel}&cpage=${pi.currentPage}&boardNo=${b.boardNo}" method="post">
                                            <input type="hidden" name="condition" value="${condition}">
                                            <input type="hidden" name="keyword" value="${keyword}">
                                            <input type="hidden" name="boardLevel" value="${boardLevel}">
                                            <input type="hidden" name="currentPage" value="${pi.currentPage}">
                                            <td style="border-radius: 0 0 0 10px;">${b.boardNo}</td>
                                            <td><a href="#" onclick="showsearch('${b.boardNo}')" class="com-link-${b.boardNo}">${b.boardTitle}</a></td>
                                            <td>${b.nickname}</td>
                                            <td>${b.writeDate}</td>
                                            <td style="border-radius: 0 0 10px 0;">${b.boardCount}</td>
                                        </form>
                                    </tbody>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </table>
            <div class="com-bottom1">
                <div class="com-bottom-left">
                    <form action="searchlist.co?category=${boardLevel}&cpage=1" method="post">
                        <select name="condition" id="com-condition">
                            <option value="title">제목</option>
                            <option value="writer">글쓴이</option>
                        </select>
                        <input type="text" name="keyword" value="${keyword}" placeholder="검색어 입력(대소문자 구분)">
                        <input type="hidden" name="boardLevel" value="${boardLevel}">
                        <button id="com-search-button" type="submit">검색</button>
                    </form>
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
                    <c:choose>
                        <c:when test="${empty keyword}">
                            <ul class="pagination">
                                <c:choose>
                                    <c:when test="${ pi.currentPage eq 1 }">
                                        <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link" href="list.co?category=${boardLevel}&cpage=${pi.currentPage - 1}">&laquo;</a></li>
                                    </c:otherwise>
                                </c:choose>
                        
                                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                    <c:set var="b" value="${boardLevel}"/>
                                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="list.co?category=${b}&cpage=${p}">${p}</a></li>
                                </c:forEach>
                            
                                <c:choose>
                                    <c:when test="${ pi.currentPage eq pi.maxPage }">
                                        <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link" href="list.co?category=${boardLevel}&cpage=${pi.currentPage + 1}">&raquo;</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </c:when>
                        <c:otherwise>
                            <ul class="pagination">
                                <c:choose>
                                    <c:when test="${ pi.currentPage eq 1 }">
                                        <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <form id="prevpage-link" action="searchlist.co?category=${boardLevel}&cpage=${pi.currentPage - 1}" method="post">
                                            <input type="hidden" name="condition" value="${condition}">
                                            <input type="hidden" name="keyword" value="${keyword}">
                                            <input type="hidden" name="boardLevel" value="${boardLevel}">
                                            <input type="hidden" name="currentPage" value="${pi.currentPage - 1}">
                                        </form>
                                        <li class="page-item"><a class="page-link" href="#" onclick="return prevpage()">&laquo;</a></li>
                                    </c:otherwise>
                                </c:choose>
                    
                                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                    <c:set var="b" value="${boardLevel}"/>
                                    <form id="numpage-link-${p}" action="searchlist.co?category=${b}&cpage=${p}" method="post">
                                        <input type="hidden" name="condition" value="${condition}">
                                        <input type="hidden" name="keyword" value="${keyword}">
                                        <input type="hidden" name="boardLevel" value="${b}">
                                        <input type="hidden" name="currentPage" value="${p}">
                                    </form>
                                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="#" onclick="return numpage('${p}')">${p}</a></li>
                                </c:forEach>
                        
                                <c:choose>
                                    <c:when test="${ pi.currentPage eq pi.maxPage }">
                                        <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <form id="nextpage-link" action="searchlist.co?category=${boardLevel}&cpage=${pi.currentPage - 1}" method="post">
                                            <input type="hidden" name="condition" value="${condition}">
                                            <input type="hidden" name="keyword" value="${keyword}">
                                            <input type="hidden" name="boardLevel" value="${boardLevel}">
                                            <input type="hidden" name="currentPage" value="${pi.currentPage - 1}">
                                        </form>
                                        <li class="page-item"><a class="page-link" href="#" onclick="return nextpage()">&raquo;</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

        </main>
        <%@ include file="../commons/footer.jsp" %>
    </div>

</body>
</html>