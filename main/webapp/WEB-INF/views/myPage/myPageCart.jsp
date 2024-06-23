<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>

	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageCSS/myPageCart.css">
	
    <!-- javaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/myPageJS/myPageCart.js"></script>
   
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
            <div id="myPageCart-wrapper">
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
                        <div class="myPage-category"><a style="color: #0089FF;" href="cart.my?userNo=${loginUser.userNo}">장바구니</a></div>
                        <div class="myPage-category"><a href="orderHistory.my?userNo=${loginUser.userNo}&cpage=1">주문내역</a></div>
                        <div class="myPage-category"><a href="writePost.my?userNo=${loginUser.userNo}"> 작성한 글</a></div>
                        <div class="myPage-category"><a href="inquiry.my?userNo=${loginUser.userNo}">1:1 문의</a></div>
                        <div class="myPage-category"><a href="sellerConversionPage.my?userNo=${loginUser.userNo}">판매자 신청</a></div>
                    </div>
                </div>
                <div id="myPageCart-info-area">
                    <div id="myPage-category-select-title"><h3>장바구니</h3></div>
                    <table>
                        <thead>
                            <th width="5%"><input type="checkbox" class="all-checkbox" onclick="clickAllCheckboxes()"></th>
                            <th width="30%">상품정보</th>
                            <!-- <th width="15%">옵션</th> -->
                            <th width="15%">수량</th>
                            <th width="15%">상품가격</th>
                            <th width="20%">선택</th>
                        </thead>
                        <tbody>
                            <c:choose>
                                <c:when test="${empty cartProductList}">
                                    <tr>
                                        <td colspan="5" style="text-align: center;">장바구니에 담긴 상품이 없습니다.</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>

                                </c:otherwise>
                            </c:choose>
                            <c:forEach var="cp" items="${cartProductList}">
                                <tr class="product">
                                    <!-- <td class="userNo" style="display: none;">${loginUser.userNo}</td> -->
                                    <td class="poNo" style="display: none;">${cp.poNo}</td>
                                    <td width="5%"><input class="checkbox" type="checkbox"></td>
                                    <td class="product-info" width="45%">
                                        <div class="product-info-img"><img src="${cp.pdChangeName}" alt=""></div>
                                        <div class="product-info-name">
                                            <b>${cp.pdTitle}</b>
                                            <span class="product-option">옵션: ${cp.pdOptionName}</span>
                                        </div>
                                    </td>
                                    <!-- <td width="15%">
                                        <div id="product-option">
                                            
                                        </div>
                                    </td> -->
                                    <td width="15%">${cp.buyCount}</td>
                                    <td width="15%" class="product-price">${cp.buyMoney}</td>
                                    <td width="20%">
                                        <div class="product-btn">
                                            <button onclick="productOrder('${cp.poNo}')">주문하기</button>  <!-- 버튼 눌렀을 때 해당 상품의 옵션번호 넘겨주기 -->
                                            <button onclick="location.href='deleteCartProduct.my?poNo=${cp.poNo}'">삭제</button>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>

                        </tbody>
                    </table>
                    <div id="myPageCart-product-list-price-area">
                        <div id="myPageCart-product-list-price">
                            <div class="product-list-price" id="product-list-total-count">
                                <b>총 주문 갯수</b>
                                <span>${cartProductListCount}</span>
                            </div>
                            <div class="product-list-price" id="product-list-total-price">
                                <b>상품가격</b>
                                <span></span>
                            </div>
                            <div class="operator">+</div>
                            <div class="product-list-price">
                                <b>배송비용</b>
                                <span>0</span>
                            </div>
                            <div class="operator">-</div>
                            <div class="product-list-price" id="product-list-total-sale">
                                <b>할인금액</b>
                                <span></span>
                            </div>
                            <div class="operator">=</div>
                            <div class="product-list-price" id="product-list-total-order-amount">
                                <b>총 주문 금액</b>
                                <span></span>
                            </div>
                        </div>
                    </div>
                    <div id="select-btn-area">
                        <div id="select-btn">
                            <div id="delete-btn-area">
                                <button onclick="allProductRemove()">전체삭제</button>
                                <button onclick="selectProductRemove()">선택상품 삭제</button>
                            </div>
                            <div id="order-btn-area">
                                <button onclick="selectProductOrder()">선택상품 주문</button>
                                <button onclick="allProductOrder()">전체 주문</button>
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