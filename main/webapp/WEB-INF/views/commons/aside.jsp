<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/aside.css">
	
<!-- Js -->
<script src="${pageContext.request.contextPath}/resources/js/commonsJS/aside.js"></script>

</head>
<body>
    <aside>
        <ul>
            <li>
                <div>판매자 정보 <img src="${pageContext.request.contextPath}/resources/image/triangle.png"></div>
                <ul class="sub-menu">
                    <li><a href="info.sr">판매자 정보</a></li>
                </ul>
            </li>
            <li>
                <div>스토어 관리 <img src="${pageContext.request.contextPath}/resources/image/triangle.png"></div>
                <ul class="sub-menu">
                    <li><a href="enrollForm.srh">판매자 홈 등록</a></li>
                    <li><a href="detail.srh">판매자 홈 관리</a></li>
                    <li><a href="enrollForm.pd">상품 등록</a></li>
                    <li><a href="list.pd">등록 상품 관리</a></li>
                </ul>
            </li>
            <li>
                <div>주문/배송 <img src="${pageContext.request.contextPath}/resources/image/triangle.png"></div>
                <ul class="sub-menu">
                    <li><a href="customerOrder.sr">주문 관리</a></li>
                    <li><a href="customerShipment.sr">배송 관리</a></li>
                </ul>
            </li>
            <li>
                <div>고객 관리 <img src="${pageContext.request.contextPath}/resources/image/triangle.png"></div>
                <ul class="sub-menu">
                    <li><a href="loadAlarm.ci?userNo=${loginUser.userNo}">알람 보내기</a></li>
                    <li><a href="customerInquery.sr">고객 문의</a></li>
                </ul>
            </li>
            <li>
                <div>정산 관리 <img src="${pageContext.request.contextPath}/resources/image/triangle.png"></div>
                <ul class="sub-menu">
                    <li><a href="settlement.sr">정산</a></li>
                </ul>
            </li>
        </ul>
    </aside>
</body>
</html>