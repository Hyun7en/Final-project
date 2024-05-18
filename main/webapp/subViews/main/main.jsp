<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://unpkg.com/scrollreveal@4.0.0/dist/scrollreveal.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="../../resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="../../resources/css/mainCSS/main.css">
	<script src="../../resources/js/mainJS/main.js"></script>
    

</head>
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main style="height: 4370px">
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
                        <img src="../../resources/image/teacher.png" alt="선생님">
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
                            <img src="../../resources/image/feed.png" alt="">
                        </div>
                        <div id="light-img">
                            <img src="../../resources/image/light.png" alt="">
                        </div>
                        <div id="temp-img">
                            <img src="../../resources/image/temp.png" alt="">
                        </div>
                    </div>
                </div>
            
                <div id="third">
                    <p class="number">3</p>
                    <div id="third-explane">
                        <p>아쿠아리스트를 위한 사이트 !</p>
                    </div>
                    <div id="third-img">
                        <img src="../../resources/image/main_banner.png" alt="">
                    </div>
                </div>

                <div id="fourth">
                    <p class="number">4</p>
                    <div id="fourth-explane">
                        <p>자신에게 딱 맞는 물살이동물 추천!</p>
                    </div>
                    <div id="fourth-chatbox">
                        <img src="../../resources/image/whale_explane.png" alt="">
                    </div>
                    <div id="fourth-img">
                        <img src="../../resources/image/whale.png" alt="">
                    </div>
                </div>
            
            </div>
		    
        </main>
                
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
     </div>

     <script>
        ScrollReveal().reveal('.number',{duration:1600});
        ScrollReveal().reveal('#first-img',{duration:1600});
        ScrollReveal().reveal('#first-explane',{duration:1600});
        ScrollReveal().reveal('#second-explane',{duration:1600});
        ScrollReveal().reveal('#second-img',{duration:1600});
        ScrollReveal().reveal('#third-explane',{duration:1600});
        ScrollReveal().reveal('#third-img',{duration:1600});
        ScrollReveal().reveal('#fourth-explane',{duration:1600});
        ScrollReveal().reveal('#fourth-img',{duration:1600});

        
     </script>
</body>
</html>