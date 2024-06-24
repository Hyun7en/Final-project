<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageCSS/myPageInquiry.css">
   
<body>
    <c:if test="${ not empty successMessage}">
		<script>
			var successMessage = "${successMessage}";
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
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main>
            <div id="myPageInquiry-wrapper">
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
                        <div class="myPage-category"><a href="orderHistory.my?userNo=${loginUser.userNo}&cpage=1">주문내역</a></div>
                        <div class="myPage-category"><a href="writePost.my?userNo=${loginUser.userNo}">작성한 글</a></div>
                        <div class="myPage-category"><a style="color: #0089FF;" href="inquiry.my?userNo=${loginUser.userNo}">1:1 문의</a></div>
                        <div class="myPage-category"><a href="sellerConversionPage.my?userNo=${loginUser.userNo}">판매자 신청</a></div>
                    </div>
                </div>
                <div id="myPageInquiry-info-area">
                    <div id="myPage-category-select-title">
                        <h3>1:1 문의</h3>
                    </div>
                    <div id="myPageInquiry-list-area">
                        <div id="myPageInquiry-list">
                            <table>
                                <thead>
                                    <th width="15%">글 번호</th>
                                    <th width="60%">제목</th>
                                    <th width="25%">작성일</th>
                                </thead>
                                <tbody>
                                    <c:choose>
                                        <c:when test="${empty myInquiryList}">
                                            <tr>
                                                <td colspan="4" style="text-align: center;"><p>작성한 문의사항이 없습니다.</p></td>
                                            </tr>
                                        </c:when>
                                        <c:otherwise>
                                            <c:forEach var="i" items="${myInquiryList}">
                                                <tr onclick="location.href = 'detail.spd?pno=${i.pdNo}#go-product-inquiry'" style="cursor: pointer;">
                                                    <td width="15%">${i.faqNo}</td>
                                                    <td width="60%">${i.inquiryTitle}</td>
                                                    <td width="25%">${i.inquiryDate}</td>
                                                </tr>
                                            </c:forEach>
                                        </c:otherwise>
                                    </c:choose>
 
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <!-- 페이징 처리 -->
                    <div id="pagination-div">
                        <ul class="pagination">
                            <c:choose>
                                <c:when test="${ pi.currentPage eq 1 }">
                                    <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="inquiry.my?cpage=${pi.currentPage - 1}&userNo=${loginUser.userNo}">&laquo;</a></li>
                                </c:otherwise>
                        </c:choose>

                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                            <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="inquiry.my?cpage=${p}&userNo=${loginUser.userNo}">${p}</a></li>
                        </c:forEach>
                        
                        <c:choose>
                            <c:when test="${ pi.currentPage eq pi.maxPage }">
                                <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="inquiry.my?cpage=${pi.currentPage + 1}&userNo=${loginUser.userNo}">&raquo;</a></li>
                            </c:otherwise>
                        </c:choose>
                        </ul>
                    </div>

                </div>
            </div>    
        </main>
                
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
     </div>
</body>
</html>