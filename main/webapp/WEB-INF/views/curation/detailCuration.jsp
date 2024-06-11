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
</head>
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main>
            <div class="splash-container">
                <div class="splash-text">
                    <h1 style="text-align: center; margin-left: 25px;">당신에게 어울리는 물고기는</h1>
                    <a href="fishDetail.fi?fishName=${fish.fishName}">
                        <div class="card">
                            <!-- 카드 헤더 -->
                            <div class="card-header">
                                <img src="${pageContext.request.contextPath}/resources/image/${fish.url}" alt="">
                            </div>
                    
                            <!-- 카드 바디 -->
                            <div class="card-body">
                    
                                <!-- 카드 바디 헤더 -->
                                <div class="card-body-header">
                                    <h1>${fish.fishName}</h1>
                                    <p class="card-body-hashtag">#${fish.fishType} #${fish.tasteType} #${fish.tendency}</p>
                                    <p class="card-body-nickname">서식지: ${fish.environment}</p>
                                </div>               
                                <!-- 카드 바디 푸터 -->
                                <hr class="divider">
                                <div class="card-body-footer">
                                    
                                    <i class="icon icon-view_count">수명 : ${fish.lifeSpan}</i>
                                    <i class="icon icon-comments_count">난이도 : ${fish.difficulty}</i>
                                    <i class="reg_date">크기 : ${fish.growthLength}</i>
                                </div>
                    
                            </div>
                    
                        </div>
                    </a>
                    <h1 style="text-align: center; margin-left: 25px;">입니다 !</h1>
                </div>
            </div>
		    
        </main>
            
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
     </div>
</body>
</html>
