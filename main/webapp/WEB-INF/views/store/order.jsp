<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aquaqu</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storeCSS/order.css">

<script src="${pageContext.request.contextPath}/resources/js/storeJS/order.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <!-- 주문 container -->
    <div id="order-container">
        <div id="order-information-area">
            <div style="font-size: 23px; font-weight: bold;">주문/결제</div>

            <input type="hidden" id="businessNo" value="${businessNo}">

            <!-- 구매자 배송지 정보 칸 -->
            <div id="buyer-address-information">
                <div class="area-top">배송지</div>
                <div class="information-area">
                    <div id="buyer-address-name-area" class="information-div">
                        <div class="information-title">*배송지명</div>
                            <input type="text" id="input-delivery-name" required>
                    </div>

                    <div id="buyer-recipient-area" class="information-div">
                        <div class="information-title">*받는사람</div>
                            <input type="text" id="input-delivery-recipient" required>
                    </div>

                    <div id="buyer-phonenumber-area" class="information-div">
                        <div class="information-title">*전화번호</div>
                            <input type="text" id="input-delivery-phone" required>
                    </div>

                    <div id="buyer-address-area" class="information-div">
                        <div class="information-title">*주소</div>
                        <div class="address-input-container">
                            <div class="find_address_area">
                                <button id="find-address-btn" onclick="sample6_execDaumPostcode()">주소찾기</button>
                                <input type="text" id="sample6_postcode" placeholder="우편번호">
                            </div>
                            <input type="text" id="sample6_address" placeholder="주소" required>
                            <input type="text" placeholder="상세주소 입력" style="padding-left: 10px;" id="sample6_detailAddress">
                                <input type="text" id="sample6_extraAddress"  style="padding-left: 10px;" placeholder="참고항목">
                        </div>
                    </div>
                </div>
            </div>

            <!-- 주문자 칸 -->
            <div id="buyer-information-area">
                <div class="area-top">
                    주문자
                </div>
                <div id="buyer-information" class="information-area">
                    <div id="buyer-name-area" class="information-div">
                        <div class="information-title">*이름</div>
                        <input type="text" value="${loginUser.userName}" id="input-buyer-name" required>
                    </div>
                    <div id="buyer-email-area" class="information-div">
                        <div class="information-title">이메일</div>
                        <input type="text" value="${loginUser.email}" id="input-buyer-email" required>
                    </div>
                    <div id="buyer-phone-area" class="information-div">
                        <div class="information-title">*전화번호</div>
                            <input type="text" value="${loginUser.phone}" id="input-buyer-phone" required>
                    </div>
                </div>
            </div>

             <!-- 주문상품 -->
             <div id="buyer-order-product-area">
                <div class="area-top">주문상품</div>
                <div class="information-area">
                    <c:forEach var="option" items="${orderOptions}">
                        <div class="order-product-container">
                            <div class="order-product-container-content">
                                <div class="order-product-info" data-price="${option.optionPrice}" data-quantity="${option.buyCount}">
                                    <div class="order-product-name">
                                        <img src="${productImage}" alt="상품 이미지" style="width: 100px; height: 100px;">
                                    </div>
                                    <div class="order-productOpt-container">
                                        <span class="order-product-name">${productName}</span>
                                        <span class="order-product-name-pname">옵션: ${option.optionName}</span>
                                        <div class="order-product-quantity-area">
                                            <span class="order-product-saled-price">
                                                <fmt:formatNumber value="${option.optionPrice}" type="number" /> 원
                                            </span>
                                            <span class="order-product-quantity">${option.buyCount}</span>개
                                              <input type="hidden" class="input-order-optNo" value="${option.optionId}">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            
        </div>

        <div id="cart-price-area">
            <div id="cart-detail-price-area">
                <div style="font-weight: bold; font-size: 18px;">
                    결제금액
                </div>
                <div id="cart-detail-price">
                    <div id="total-product-price-area">
                        <span>총 상품금액</span>
                        <div>
                            <span id="total-product-price"></span><span>원</span>
                        </div>
                    </div>
                    <!-- <div id="total-delivery-charge-area">
                        <span>배송비</span>
                        <div>
                            <span id="total-delivery-charge">0</span><span>원</span>
                        </div>
                    </div> -->
                </div>
                <div id="cart-price-sum-area">
                    <span style="font-size: 17px; font-weight: bold;">결제금액</span>
                    <div>
                        <span class="cart-price-sum totalPrice"></span><span class="total-price-sum">원</span>
                    </div>
                </div>
            </div>
            <form id="buy_btn_container" method="post" action="insertOrder.spd">
                <input type="hidden" id="order-input-orderInfo" name="orderDataJson">
                <button id="buy_btn"><span class="totalPrice"></span>원 결제하기</button>
            </form>
        </div>
    </div>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>
</body>
</html>
