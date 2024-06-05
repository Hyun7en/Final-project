<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/curationCSS/detailCuration.css">
	<script src="${pageContext.request.contextPath}/resources/js/curationJS/detailCuration.js"></script>
   
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main id="main-div">
            <div id="cu-explain">
                <p>어울리는 물고기를 추천해드려요 !</p>
            </div>
            <div id="cu-img">
                <img src="${pageContext.request.contextPath}/resources/image/whale.png" alt="">
            </div>
            <div id="cu-curation">
                
            </div>
            <div id="cu-sub-explain">
                <p>자신에게 맞는 물고기를 찾아보세요!</p>
            </div>
            <div id="cu-btn">
                <button>제출</button>
            </div>
		    
        </main>
            
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
     </div>
</body>
</html>