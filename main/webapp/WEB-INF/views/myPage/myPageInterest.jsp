<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심상품</title>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

    <!-- alertify -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

    <!-- css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageCSS/myPageInterest.css">

<body>
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
            <div id="myPageInterest-wrapper">
                <div id="myPage-sidebar">
                    <div id="myPage-sidebar-profile-area">
                        <div id="myPage-sidebar-profile-img">
                            <img src="${ma.changeName}" alt="">
                        </div>
                        <div id="myPage-sidebar-profile-nickName"><b>${loginUser.nickname}</b>님 환영합니다.</div>
                    </div>
                    <div id="myPage-category-area">
                        <div class="myPage-category"><a href="myPage.my?userNo=${loginUser.userNo}">내 정보</a></div>
                        <div class="myPage-category"><a style="color: #0089FF;" href="interestProduct.my?userNo=${loginUser.userNo}&cpage=1">관심상품</a></div>
                        <div class="myPage-category"><a href="cart.my?userNo=${loginUser.userNo}">장바구니</a></div>
                        <div class="myPage-category"><a href="orderHistory.my?userNo=${loginUser.userNo}&cpage=1">주문내역</a></div>
                        <div class="myPage-category"><a href="writePost.my?userNo=${loginUser.userNo}">작성한 글</a></div>
                        <div class="myPage-category"><a href="inquiry.my?userNo=${loginUser.userNo}">1:1 문의</a></div>
                        <div class="myPage-category"><a href="sellerConversionPage.my?userNo=${loginUser.userNo}">판매자 신청</a></div>
                    </div>
                </div>
                <div id="myPageInterest-info-area">
                    <div id="myPage-category-select-title">
                        <h3>관심상품</h3>
                    </div>
                    <div id="interest-product-count">
                        <b>상품(count)</b>
                    </div>
                    <c:forEach var="i" items="${iList}">
                        <div id="interest-product">
                            <div id="interest-product-img">
                                <a href="detail.spd?pno=${i.prNo}">
                                    <img src="${i.prChangeName}">
                                </a>
                            </div>
                            <div id="interest-product-info">
                                <ul>
                                    <li><b>${i.prTitle}</b></li>
                                    <li>${i.prPrice} 원</li>
                                </ul>
                                <ul id="ul2">
                                    <li><b>판매자</b></li>
                                    <li>${i.storeName}</li>
                                </ul>
                            </div>

                            <div id="interest-product-button-area">
                                <div class="interest-product-button"><a href="detail.spd?pno=${i.prNo}">구매하기</a></div>
                                <div class="interest-product-button"><a href="sellersStore.st?sellerPageNo=${i.sellerPageNo}&order=1&cpage=1">판매자의 다른 상품 보기</a></div>
                                <div class="interest-product-button"><a href="interestCancle.my?userNo=${loginUser.userNo}&prNo=${i.prNo}">관심상품 취소</a></div>
                            </div>

                        </div>
                    </c:forEach>

                    <!-- 페이징 처리 -->
                    <div id="pagination-div">
                        <ul class="pagination">
                            <c:choose>
                                <c:when test="${ pi.currentPage eq 1 }">
                                    <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="interestProduct.my?cpage=${pi.currentPage - 1}&userNo=${loginUser.userNo}">&laquo;</a></li>
                                </c:otherwise>
                            </c:choose>

                            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="interestProduct.my?cpage=${p}&userNo=${loginUser.userNo}">${p}</a></li>
                            </c:forEach>
                        
                            <c:choose>
                                <c:when test="${ pi.currentPage eq pi.maxPage }">
                                    <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="interestProduct.my?cpage=${pi.currentPage + 1}&userNo=${loginUser.userNo}">&raquo;</a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>

                    <!-- <div id="similar-products-area">
                        <div id="similar-products-title">
                            <h3>관심상품과 비슷한 상품</h3>
                        </div>
                        <div id="similar-products-list">
                            <div class="similar-products">
                                <div class="similar-products-img" >
                                    <a href=""><img src="https://m.healingaqua.co.kr/web/product/big/202307/8c3f0b4a50ce3f27f7d21a0cc005d599.jpg" alt=""></a>
                                </div>
                                <div class="similar-products-info" >
                                    <b>아프리칸파이크</b> 
                                    <p>50,000원</p>
                                </div>
                            </div>
                            <div class="similar-products">
                                <div class="similar-products-img" >
                                    <a href=""><img src="https://m.healingaqua.co.kr/web/product/big/202307/8c3f0b4a50ce3f27f7d21a0cc005d599.jpg" alt=""></a>
                                </div>
                                <div class="similar-products-info" >
                                    <b>아프리칸파이크</b> 
                                    <p>50,000원</p>
                                </div>
                            </div>
                            <div class="similar-products">
                                <div class="similar-products-img">
                                    <a href=""><img src="https://m.healingaqua.co.kr/web/product/big/202307/8c3f0b4a50ce3f27f7d21a0cc005d599.jpg" alt=""></a>
                                </div>
                                <div class="similar-products-info">
                                    <b>아프리칸파이크</b> 
                                    <p>50,000원</p>
                                </div>
                            </div>
                        </div>
                    </div> -->
                    
                </div>
            </div>
        </main>          
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
     </div>
</body>
</html>