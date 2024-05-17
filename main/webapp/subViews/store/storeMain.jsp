<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
<script src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />
<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css" />
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" />

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storeCSS/storeMain.css">

    <style>
        main{
            background: #E0F1FF;
        }

        #descript-quick{
            display: flex;
            justify-content: space-between;
        }
        #descript-quick #descript{
            padding-top: 80px;
            padding-left: 150px;
            font-weight: bolder;
        }

        #descript-quick #descript #page-title{
            font-size: 35px;
            padding-bottom: 20px;
        }

        #descript-quick #descript #page-descript{
            font-size: 30px;
            color: #0089FF;
        }

        #descript-quick #askn-quick-move{
            padding-top: 100px;
            padding-right: 50px;
            display: flex;
            line-height: 35px;
            height: 300px;
        }
        #descript-quick #askn-quick-move #ask img{
            margin-top: 20px;
            height: 60px;
            width: 60px;
        }

        #descript-quick #askn-quick-move #ask{
            display: flex;
            padding-top: 10px;
            padding-right: 30px;
        }

        #descript-quick #askn-quick-move #ask #ask-descript{
            padding-top: 20px;
        }

        #descript-quick #askn-quick-move #ask #ask-descript #ad-span1{
            font-weight: 700;
        }
        #descript-quick #askn-quick-move #ask #ask-descript #ad-span2 a{
            font-weight: 700;
            color: #0089FF;
        }
      
        #descript-quick #askn-quick-move #quick-move .quick-move-li-title{
            font-weight: 700;
            text-align: center;
        }

        #descript-quick #askn-quick-move #quick-move .quick-move-li{
            background-color: white;
            margin-bottom: 10px;
            width: 80px;
            height: 30px;
            line-height: 30px;
            text-align: center;
            border-radius: 20px;
            box-shadow: 1px 1px 3px;
            opacity: 90%;
        }

        #descript-quick #askn-quick-move #quick-move .quick-move-li a{
            font-size: 15px;
            color: black;
        }

        
        #descript-quick #askn-quick-move #quick-move .quick-move-li a:hover{
            color: #0089FF;
        }
         /* Slick 캐러셀 추가 */
         #section-1 .slick-slide img {
            display: block;
            margin: auto;
        }

        .slick-prev, .slick-next {
            background: none;
            border: none;
            color: #0089FF;
            font-size: 24px;
            line-height: 1;
            opacity: 0.75;
            transition: opacity 0.3s;
        }
        .slick-prev:hover, .slick-next:hover {
            opacity: 1;
        }
        .slick-prev::before, .slick-next::before {
            display: none;
        }

        #section-1 {
            margin-top: 50px;
        }

    </style>

</head>
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main style="height: 2000px">
            
            <section id="descript-quick">
                
                <div id="descript">
                    <div id="page-title">
                        스토어
                    </div>
                    <div id="page-descript">
                        사랑하는 반려어를 위해 <br> 
                        이건 어떠신가요?
                    </div>
                </div>

                <div id="askn-quick-move">
                    <div id="ask">
                        <img id="ask-img" src="../../resources/image/octopus-303622_1280.png" alt="">
                        <div id="ask-descript">
                            <span id="ad-span1">문의사항이 있으신가요?</span> <br>
                            <span id="ad-span2">
                                <a href="#">
                                    관리자에게 문의해보세요.
                                </a>
                            </span>
                        </div>
                    </div>

                    <div id="quick-move">
                        <ul>
                            <li class="quick-move-li-title">
                                빠른이동
                            </li>

                            <li class="quick-move-li">
                                <a href="#">관심상품</a>
                            </li>

                            <li class="quick-move-li">
                                <a href="#">주문 내역</a>
                            </li>

                            <li class="quick-move-li">
                                <a href="#">장바구니</a>
                            </li>

                            <li class="quick-move-li">
                                <a href="#">최근검색</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>

            <section id="cardsshelf">

            </section>

            <section id="section-1">
                <div class="carousel">
                    <div><img src="https://via.placeholder.com/300x200" alt="Slide 1"></div>
                    <div><img src="https://via.placeholder.com/300x200" alt="Slide 2"></div>
                    <div><img src="https://via.placeholder.com/300x200" alt="Slide 3"></div>
                    <div><img src="https://via.placeholder.com/300x200" alt="Slide 4"></div>
                </div>
            </section>

            <section>
                <!-- 다른 내용들 -->
            </section>

            <section>
                <!-- 다른 내용들 -->
            </section>

            <section>
                <!-- 다른 내용들 -->
            </section>

        </main>
                
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
    </div>

    <script>
        $(document).ready(function(){
            $('.carousel').slick({
                dots: true,
                infinite: true,
                speed: 300,
                slidesToShow: 4,  // 한번에 표시할 슬라이드 수
                slidesToScroll: 1,  // 스크롤할 슬라이드 수
                adaptiveHeight: true,
                prevArrow: '<button type="button" class="slick-prev"><i class="fas fa-chevron-left"></i></button>',
                nextArrow: '<button type="button" class="slick-next"><i class="fas fa-chevron-right"></i></button>'
            });
        });
    </script>


</body>
</html>
