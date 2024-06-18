<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
 
<body>
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
                        <div class="myPage-category"><a style="color: #0089FF;" href="orderHistory.my?userNo=${loginUser.userNo}">주문내역</a></div>
                        <div class="myPage-category"><a href="writePost.my?userNo=${loginUser.userNo}">작성한 글</a></div>
                        <div class="myPage-category"><a href="inquiry.my?userNo=${loginUser.userNo}">1:1 문의</a></div>
                        <div class="myPage-category"><a href="sellerConversionPage.my?userNo=${loginUser.userNo}">판매자 신청</a></div>
                    </div>
                </div>

                <div id="myPageOrderHistory-info-view">
                    <div id="myPageOrderHistory-delivery-status">
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
                    </div>

                    <div id="myPageOrderHistory-list" align="center">
                        <div id="myPage-category-select-title"><h3>주문내역</h3></div>
                        <div id="myPageOrderHistory">
                            <div id="myPageOrderHistory-date"><h4>${date}2024.05.17 주문</h4></div>
                            <div id="myPageOrderHistory-info-area">
                                <div id="myPageOrderHistory-img">
                                    <img src="https://www.kimaqua.com/mall//shop_image/202110/EMB_500.jpg" alt="">
                                </div>
                                <div id="myPageOrderHistory-info">
                                    <ul>
                                        <li><b>${cart.name}일렉트릭 모스코블루 구피</b></li>
                                        <li>${cart.value}17,000원</li>
                                    </ul>
                                    <ul id="ul2">
                                        <li><b>판매자</b></li>
                                        <li>${buisnessInfo}(주)그린피쉬</li>
                                    </ul>
                                </div>
                                <form action="">
                                    <div id="myPageOrderHistory-button-area">
                                        <div><button>배송조회</button></div>
                                        <div><button>주문ㆍ배송 취소</button></div>
                                        <div><button>판매자 문의</button></div> <!-- 문의글 작성하는곳으로 이동 -->
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div id="btnList-area">
                            <div class="btnList" align="center">
                                <button id="btn1">&lt;</button>
                                <button id="btn2">1</button>
                                <button id="btn3">&gt;</button>
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