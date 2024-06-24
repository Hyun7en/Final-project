<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문내역</title>
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageCSS/myPageOrderHistory.css">
    
    <!-- javaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/myPageJS/myPageOrderHistory.js"></script>
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
            <div id="myPageOrderHistory-wrapper">
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
                        <div class="myPage-category"><a style="color: #0089FF;" href="orderHistory.my?userNo=${loginUser.userNo}&cpage=1">주문내역</a></div>
                        <div class="myPage-category"><a href="writePost.my?userNo=${loginUser.userNo}">작성한 글</a></div>
                        <div class="myPage-category"><a href="inquiry.my?userNo=${loginUser.userNo}">1:1 문의</a></div>
                        <div class="myPage-category"><a href="sellerConversionPage.my?userNo=${loginUser.userNo}">판매자 신청</a></div>
                    </div>
                </div>

                <div id="myPageOrderHistory-info-view">
                    <!-- <div id="myPageOrderHistory-delivery-status">
                        <div id="de1" class="delivery-status">
                            <b>배송중</b>
                            <p>count</p>
                        </div>
                        <div id="de2" class="delivery-status">
                            <b>배송완료</b>
                            <p>count</p>
                        </div>
                        <div class="delivery-status">
                            <b>총 주문 갯수</b>
                            <p>count</p>
                        </div>
                    </div> -->

                    <div id="myPageOrderHistory-list" align="center">
                        <div id="myPage-category-select-title"><h3>주문내역</h3></div>
                        <c:choose>
                            <c:when test="${empty orderHistoryList}">
                                <span>주문내역이 없습니다.</span>
                            </c:when>
                            <c:otherwise>
                                <c:forEach var="oh" items="${orderHistoryList}">
                                    <div class="myPageOrderHistory">
                                        <div class="myPageOrderHistory-date"><h4>${oh.buyDate} 주문</h4></div>
                                        <div class="myPageOrderHistory-info-area">
                                            <div class="myPageOrderHistory-img">
                                                <a href="detail.spd?pno=${oh.pdNo}">
                                                    <img src="${oh.pdChangeName}">
                                                </a>
                                            </div>
                                            <div class="myPageOrderHistory-info">
                                                <ul>
                                                    <li><b>${oh.pdTitle}</b></li>
                                                    <li class="product-price">${oh.buyMoney}</li>
                                                </ul>
                                                <ul class="ul2">
                                                    <li><b>판매자</b></li>
                                                    <li>${oh.storeName}</li>
                                                </ul>
                                            </div>
                                            <div class="myPageOrderHistory-button-area">
                                                <div><button>배송조회</button></div>
                                                <div><button>주문ㆍ배송 취소</button></div>
                                                <div><button onclick="location.href='detail.spd?pno=${oh.pdNo}#go-product-inquiry'">판매자 문의</button></div> <!-- 문의글 작성하는곳으로 이동 -->
                                            </div>
                                        </div>
                                    </div>
                                </c:forEach>
                            </c:otherwise>
                        </c:choose>

                        <!-- 페이징 처리 -->
                        <div id="pagination-div">
                            <ul class="pagination">
                                <c:choose>
                                    <c:when test="${ pi.currentPage eq 1 }">
                                        <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link" href="orderHistory.my?userNo=${loginUser.userNo}&cpage=${pi.currentPage - 1}">&laquo;</a></li>
                                    </c:otherwise>
                                </c:choose>

                                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="orderHistory.my?userNo=${loginUser.userNo}&cpage=${p}">${p}</a></li>
                                </c:forEach>
                            
                                <c:choose>
                                    <c:when test="${ pi.currentPage eq pi.maxPage }">
                                        <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link" href="orderHistory.my?userNo=${loginUser.userNo}&cpage=${pi.currentPage + 1}">&raquo;</a></li>
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