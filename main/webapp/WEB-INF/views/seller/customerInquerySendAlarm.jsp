<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aquaqu</title>

<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
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

        <section id="main-section">
            <h1>고객 관리 &gt; 고객 알림 </h1>
            <br>
            
            <div class="subscriber-count">총 구독자 수: <c:out value="${fn:length(list)}"/></div>
            <div class="subscriber-list-container">
                <c:forEach var="subscriber" items="${list}">
                    <div class="subscriber-item">${subscriber.nickName}</div>
                </c:forEach>
            </div>

            <div id="alarm-input-div">
                <input id="alarm-contents" type="text" name="contents" placeholder="알람으로 보낼 메세지를 입력해주세요">
                <button id="sendAlarmInfo" onclick="insertAlarm(`${list[0].sellerPageNo}`)">보내기</button>
            </div>
                
        </section>
        <div id="loading_spinner">
            알람을 보내는 중 입니다
            <div class="spinner"></div>
        </div>
    </main>
    <!-- 로딩 스피너 -->
    

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>

</body>
</html>
