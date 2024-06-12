<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심상품</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageCSS/myPageInterest.css">

<body>
	<div class="wrap">
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        <main>
            <div id="myPageInterest-wrapper">
                <div id="myPage-sidebar">
                    <div id="myPage-sidebar-profile-area">
                        <div id="myPage-sidebar-profile-img">
                            <img src="https://previews.123rf.com/images/ann24precious/ann24precious1602/ann24precious160200015/53140153-%EA%B7%80%EC%97%AC%EC%9A%B4-%EB%AC%BC%EA%B3%A0%EA%B8%B0.jpg" alt="">
                        </div>
                        <div id="myPage-sidebar-profile-nickName"><b>${loginUser.nickname}</b>님 환영합니다.</div>
                    </div>
                    <div id="myPage-category-area">
                        <div class="myPage-category"><a href="myPage.me?userNo=${loginUser.userNo}">내 정보</a></div>
                        <div class="myPage-category"><a style="color: #0089FF;" href="interestProduct.my?userNo=${loginUser.userNo}">관심상품</a></div>
                        <div class="myPage-category"><a href="cart.my?userNo=${loginUser.userNo}">장바구니</a></div>
                        <div class="myPage-category"><a href="orderHistory.my?userNo=${loginUser.userNo}">주문내역</a></div>
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
                                <img src="${i.prChangeName}" alt="">
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
                            <form action="">
                                <div id="interest-product-button-area">
                                    <div class="interest-product-button"><button>구매하기</button></div>
                                    <div class="interest-product-button"><button onclick="gotoStore(`${i.sellerPageNo}`)">판매자의 다른 상품 보기</button></div>
                                    <div class="interest-product-button"><button>관심상품 취소</button></div>
                                </div>
                            </form>
                        </div>
                    </c:forEach>

                    <div id="btnList-area">
                        <div class="btnList" align="center">
                            <button id="btn1">&lt;</button>
                            <button id="btn2">1</button>
                            <button id="btn3">&gt;</button>
                        </div> 
                    </div>
                    <div id="similar-products-area">
                        <div id="similar-products-title">
                            <h3>관심상품과 비슷한 상품</h3>
                        </div>
                        <div id="similar-products-list">
                            <div class="similar-products">
                                <div class="similar-products-img" >
                                    <a href=""><img src="https://m.healingaqua.co.kr/web/product/big/202307/8c3f0b4a50ce3f27f7d21a0cc005d599.jpg" alt=""></a>
                                </div>
                                <div class="similar-products-info" >
                                    <b>아프리칸파이크</b> <!-- AI 알고리즘 이용? -->
                                    <p>50,000원</p>
                                </div>
                            </div>
                            <div class="similar-products">
                                <div class="similar-products-img" >
                                    <a href=""><img src="https://m.healingaqua.co.kr/web/product/big/202307/8c3f0b4a50ce3f27f7d21a0cc005d599.jpg" alt=""></a>
                                </div>
                                <div class="similar-products-info" >
                                    <b>아프리칸파이크</b> <!-- AI 알고리즘 이용? -->
                                    <p>50,000원</p>
                                </div>
                            </div>
                            <div class="similar-products">
                                <div class="similar-products-img">
                                    <a href=""><img src="https://m.healingaqua.co.kr/web/product/big/202307/8c3f0b4a50ce3f27f7d21a0cc005d599.jpg" alt=""></a>
                                </div>
                                <div class="similar-products-info">
                                    <b>아프리칸파이크</b> <!-- AI 알고리즘 이용? -->
                                    <p>50,000원</p>
                                </div>
                            </div>
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