<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/mainCSS/main.css">
	<script src="${pageContext.request.contextPath}/resources/js/mainJS/main.js"></script>
    <script src="https://unpkg.com/scrollreveal"></script>

</head>
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
        
        <main style="height: 4270px">
            <div id="main-text">
                <div id="text-div">      
                        <div style="font-size: 40px; height:65px; color: #0089FF;" class="title show">
                            Aquaqu
                        </div>

                        <div style="font-size: 96px; height:120px" class="title show2">
                            당신만의 아쿠아리움
                         </div>     
                        
                        <div style="font-size: 128px; width:1000px; text-align:right" class="title show3">
                            아쿠아쿠
                        </div>           
                </div>
               
                <div class="ocean">
                    <div class="wave"></div>
                    <div class="wave"></div>
                </div>
            </div>
            

            <div id="show-info">
             <p class="number">1</p>
                <div id="first">
                    <div id="first-img">
                        <img src="${pageContext.request.contextPath}/resources/image/teacher.png" alt="선생님">
                    </div>
                    <div id="first-explane">
                        <p>당신만의 아쿠아리움을 위한 <br>
                              아쿠아리스트가 되어보세요 !</p>
                    </div>
                </div>

                <div id="second">
                    <p class="number">2</p>
                        <div id="second-explane">
                            <p>물살이 동물에 대한 정보를 쉽게 전달해드립니다!</p>
                        </div>
                    <div id="second-img">
                        <div id="feed-img">
                            <img src="${pageContext.request.contextPath}/resources/image/feed.png" alt="">
                            <p class="s-explain">사료</p>
                        </div>
                        <div id="light-img">
                            <img src="${pageContext.request.contextPath}/resources/image/light.png" alt="">
                            <p class="s-explain">조명</p>
                        </div>
                        <div id="temp-img">
                            <img src="${pageContext.request.contextPath}/resources/image/temp.png" alt="">
                            <p class="s-explain">온도</p>
                        </div>
                    </div>
                </div>
            
                <div id="third">
                    <p class="number">3</p>
                    <div id="third-explane">
                        <p>아쿠아리스트를 위한 사이트 !</p>
                    </div>
                    <div id="third-img">
                        <img src="${pageContext.request.contextPath}/resources/image/main_banner.png" alt="">
                    </div>
                </div>

                <div id="fourth">
                    <p class="number">4</p>
                    <div id="fourth-explane">
                        <p>자신에게 딱 맞는 물살이동물 추천!</p>
                    </div>
                    <div id="fourth-chatbox">
                        <img src="${pageContext.request.contextPath}/resources/image/whale_explane.png" alt="">
                    </div>
                    <div id="fourth-img">
                        <a href="gotoCuration.cu"><img src="${pageContext.request.contextPath}/resources/image/whale.png" alt=""></a>
                    </div>
                </div>
            
            </div>
		    
        </main>
                
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
     </div>
</body>
</html>