<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aquaqu</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/customerInquerySendAlarm.css">
<script src="${pageContext.request.contextPath}/resources/js/sellerJS/customerInquerySendAlarm.js"></script>
</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>
        
        <!-- aside -->
        <%@ include file="../commons/aside.jsp" %>

        <section>
            <h1>고객 관리 &gt; 고객 알림 </h1>
            <br>
            
            <div class="subscriber-count">총 구독자 수: 5</div>
            <div class="subscriber-list-container">
                <c:forEach var="subscriber" items="${list}">
                    <div class="subscriber-item">${subscriber.nickName}</div>
                </c:forEach>
            </div>

        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>

</body>
</html>