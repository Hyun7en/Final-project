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
                <a href=""> <!-- 클릭 시 링크 설정 -->
                    <div class="card">
                
                        <!-- 카드 헤더 -->
                        <div class="card-header" >
                            <div class = "card-header-is_closed" > 
                                <div class = "card-header-text" > 모집중 </div > 
                                <div class = "card-header-number" > 2 / 5 </div > 
                            </div >
                        </div>
                
                        <!--  카드 바디 -->
                        <div class="card-body">
                
                            <!--  카드 바디 헤더 -->
                            <div class="card-body-header">
                                <h1>${fish.fishName}</h1>
                                <p class="card-body-hashtag">#여수 #순천 #광양</p>
                                 <p class = "card-body-nickname"> 
                                                 작성자: ENDORPHIN0710
                           		         </p>
                            </div>
                            <p class="card-body-description">
                                안녕하세요!
                                4월 15일 순천만 동행구합니다!
                            </p>
                            <!--  카드 바디 본문 -->
                
                            <!--  카드 바디 푸터 -->
                            <div class="card-body-footer">
                                <hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
                                <i class="icon icon-view_count"></i>조회 38회
                                <i class="icon icon-comments_count"></i>댓글 4개
                                <i class="reg_date"> 2018/04/12 </i>
                            </div>
                
                        </div>
                
                    </div>
                    </a>
                출처: https://endorphin0710.tistory.com/70 [Festina Lente:티스토리]
            </div>
		    
        </main>
            
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
     </div>
</body>
</html>
