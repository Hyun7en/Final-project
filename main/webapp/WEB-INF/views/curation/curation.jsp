
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/curationCSS/curation.css">
	<script src="${pageContext.request.contextPath}/resources/js/curationJS/curation.js"></script>

    <!-- 애니메이션 cdn -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/animate.css/4.1.1/animate.min.css"/>
</head>
<body onload="fishInfoInit('${pageContext.request.contextPath}')">
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main id="main-div">
            <div class="cu-explain">
                <p>어울리는 물고기를 추천해드려요 !</p>
            </div>
            <div id="cu-img">
                <img src="${pageContext.request.contextPath}/resources/image/whale.png" alt="">
            </div>
            <div id="cu-sub-explain">
                <p>자신에게 맞는 물고기를 찾아보세요!</p>
            </div>
            <div id="cu-btn">
                <button class="startBtn" onclick="startCuration();">시작하기</button>
                
            </div>
        </main>
        <!-- 로딩 스피너 -->
        <div id="loading_spinner">
            <div class="spinner"></div>
        </div>
                
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
     </div>
</body>
</html>