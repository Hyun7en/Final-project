<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성한 글</title>
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageCSS/myPageWritePost.css">

<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main>
            <div id="myPageWritePost-wrapper">
                <div id="myPage-sidebar">
                    <div id="myPage-sidebar-profile-area">
                        <div id="myPage-sidebar-profile-img">
                            <img src="${ma.changeName}" alt="">
                        </div>
                        <div id="myPage-sidebar-profile-nickName"><b>${loginUser.nickname}</b>님 환영합니다.</div>
                    </div>
                    <div id="myPage-category-area">
                        <div class="myPage-category"><a href="myPage.my?userNo=${loginUser.userNo}">내 정보</a></div>
                        <div class="myPage-category"><a href="interestProduct.my?userNo=${loginUser.userNo}&cpage=1">관심상품</a></div>
                        <div class="myPage-category"><a href="cart.my?userNo=${loginUser.userNo}">장바구니</a></div>
                        <div class="myPage-category"><a href="orderHistory.my?userNo=${loginUser.userNo}">주문내역</a></div>
                        <div class="myPage-category"><a style="color: #0089FF;" href="writePost.my?userNo=${loginUser.userNo}">작성한 글 </a></div>
                        <div class="myPage-category"><a href="inquiry.my?userNo=${loginUser.userNo}">1:1 문의</a></div>
                        <div class="myPage-category"><a href="sellerConversionPage.my?userNo=${loginUser.userNo}">판매자 신청</a></div>
                    </div>
                </div>
                <div id="myPageWritePost-info-area">
                    <div id="myPageWritePost-status-area">
                        <div id="ps1" class="myPageWritePost-status">
                            <b>일반 게시판</b>
                            <c:choose>
                                <c:when test="${empty myBoardListCount[0]}">
                                    <p>0 개</p>
                                </c:when>
                                <c:otherwise>
                                    <p>${myBoardListCount[0]} 개</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div id="ps2" class="myPageWritePost-status">
                            <b>꿀팁 게시판</b>
                            <c:choose>
                                <c:when test="${empty myBoardListCount[1]}">
                                    <p>0 개</p>
                                </c:when>
                                <c:otherwise>
                                    <p>${myBoardListCount[1]} 개</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div id="ps3" class="myPageWritePost-status">
                            <b>질문 게시판</b>
                            <c:choose>
                                <c:when test="${empty myBoardListCount[2]}">
                                    <p>0 개</p>
                                </c:when>
                                <c:otherwise>
                                    <p>${myBoardListCount[2]} 개</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="myPageWritePost-status">
                            <b>중고거래 게시판</b>
                            <c:choose>
                                <c:when test="${empty myBoardListCount[3]}">
                                    <p>0 개</p>
                                </c:when>
                                <c:otherwise>
                                    <p>${myBoardListCount[3]} 개</p>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                    <div id="myPageWritePost-list-area">
                        <table>
                            <thead>
                                <th width="10%">글 종류</th>
                                <th width="65%">제목</th>
                                <th width="15%">작성일</th>
                                <th width="10%">조회수</th>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${empty myBoardList}">
                                        <tr>
                                            <td colspan="4" style="text-align: center;"><p>작성한 게시글이 없습니다.</p></td>
                                        </tr>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="b" items="${myBoardList}">
                                            <tr onclick="location.href = 'detail.co?category=${b.boardLevel}&boardNo=${b.boardNo}'">
                                                <c:choose>
                                                    <c:when test="${b.boardLevel eq 0}">
                                                        <td>일반</td>
                                                    </c:when>
                                                    <c:when test="${b.boardLevel eq 1}">
                                                        <td>꿀팁</td>
                                                    </c:when>
                                                    <c:when test="${b.boardLevel eq 2}">
                                                        <td>질문</td>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <td>중고거래</td>
                                                    </c:otherwise>
                                                </c:choose>
                                                <td>${b.boardTitle}</td>
                                                <td>${b.writeDate}</td>
                                                <td>${b.boardCount}</td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>

                          <!-- 페이징 처리 -->
                        <div id="pagination-div">
                            <ul class="pagination">
                                <c:choose>
                                    <c:when test="${ pi.currentPage eq 1 }">
                                        <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link" href="writePost.my?cpage=${pi.currentPage - 1}&userNo=${loginUser.userNo}">&laquo;</a></li>
                                    </c:otherwise>
                            </c:choose>
                        
                            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="writePost.my?cpage=${p}&userNo=${loginUser.userNo}">${p}</a></li>
                            </c:forEach>
                            
                            <c:choose>
                                <c:when test="${ pi.currentPage eq pi.maxPage }">
                                    <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="writePost.my?cpage=${pi.currentPage + 1}&userNo=${loginUser.userNo}">&raquo;</a></li>
                                </c:otherwise>
                            </c:choose>
                            </ul>
                        </div>

                    </div>
                </div>
            </div>
        </main>
                
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
     </div>
</body>
</html>