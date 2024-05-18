<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Slick CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>
<!-- Slick JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storeCSS/storeMain.css">

<style>
    main {
        background: #E0F1FF;
    }

    #descript-quick {
        display: flex;
        justify-content: space-between;
    }

    #descript-quick #descript {
        padding-top: 80px;
        padding-left: 55px;
        font-weight: bolder;
    }

    #descript-quick #descript #page-title {
        font-size: 35px;
        padding-bottom: 20px;
    }

    #descript-quick #descript #page-descript {
        font-size: 30px;
        color: #0089FF;
    }

    #descript-quick #askn-quick-move {
        padding-top: 100px;
        padding-right: 50px;
        display: flex;
        line-height: 35px;
        height: 300px;
    }

    #descript-quick #askn-quick-move #ask img {
        margin-top: 20px;
        height: 60px;
        width: 60px;
    }

    #descript-quick #askn-quick-move #ask {
        display: flex;
        padding-top: 10px;
        padding-right: 30px;
    }

    #descript-quick #askn-quick-move #ask #ask-descript {
        padding-top: 20px;
    }

    #descript-quick #askn-quick-move #ask #ask-descript #ad-span1 {
        font-weight: 700;
    }

    #descript-quick #askn-quick-move #ask #ask-descript #ad-span2 a {
        font-weight: 700;
        color: #0089FF;
    }

    #descript-quick #askn-quick-move #quick-move .quick-move-li-title {
        font-weight: 700;
        text-align: center;
    }

    #descript-quick #askn-quick-move #quick-move .quick-move-li {
        background-color: white;
        margin-bottom: 10px;
        width: 80px;
        height: 30px;
        line-height: 30px;
        text-align: center;
        border-radius: 20px;
        box-shadow: 2px 4px 12px #00000014;
        opacity: 90%;
    }

    #descript-quick #askn-quick-move #quick-move .quick-move-li a {
        font-size: 15px;
        color: black;
    }

    #descript-quick #askn-quick-move #quick-move .quick-move-li a:hover {
        color: #0089FF;
    }

    #cards-Shelf div {
        display: flex;
    }

    #cards-Shelf div div {
        display: block;
        padding-left: 55px;
    }

    #cards-Shelf div div a img {
        width: 110px;
        height: 70px;
        border-radius: 15px;
        box-shadow: 2px 4px 12px #00000014;

    }

    #cards-Shelf div div a div {
        padding: 0;
        text-align: center;
        color: black;
        font-weight: 900;
        font-size: 13px;
    }

    .sm-procuct-section {
        padding-top: 100px;
        padding-left: 55px;
        display: block;
    }

    .sm-procuct-section-title {
        font-weight: 900;
        font-size: 24px;
        padding-bottom: 20px;
    }

    /* Carousel Styles */
    .carousel {
        display: flex;
    }

    .carousel-item {
        width: 300px;
        height: 400px;
        border-radius: 15px;
        box-shadow: 2px 4px 12px #00000014;
        background-color: white;
        margin: auto;
    }


    .carousel-item a img {
        display: block;
        margin: 0 auto; 
        width: 80%; 
        border-radius: 15px;
    }

    .carousel-item a #carousel-dimg{
        justify-items: center;
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

        <section id="cards-Shelf">
            <div>
                <div>
                    <a href="">
                        <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        <div>수조 · 어항</div>
                    </a>
                </div>
                <div>
                    <a href="">
                        <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        <div>장식</div>
                    </a>
                </div>
                <div>
                    <a href="">
                        <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        <div>사료</div>
                    </a>
                </div>
                <div>
                    <a href="">
                        <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        <div>여과기 · 여과재</div>
                    </a>
                </div>
                <div>
                    <a href="">
                        <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        <div>조형물</div>
                    </a>
                </div>
                <div>
                    <a href="">
                        <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        <div>전기용품</div>
                    </a>
                </div>
                <div>
                    <a href="">
                        <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        <div>수초</div>
                    </a>
                </div>
                <div>
                    <a href="">
                        <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        <div>바닥재 · 기타</div>
                    </a>
                </div>
            </div>
        </section>

        <section class="sm-procuct-section" id="recommend-product">
            <div class="sm-procuct-section-title">
                추천 제품
            </div>
            <div class="carousel">

                <div class="carousel-item">
                    <a href="">
                        <div>

                        </div>
                        <img src="../../resources/image/clownfish-1453910_1920.jpg" alt="Product 1">
                    </a>
                </div>

                <div class="carousel-item">
                    <a href="">
                        <div>
                            
                        </div>
                        <img src="../../resources/image/clownfish-1453910_1920.jpg" alt="Product 2">
                    </a>
                </div>

                <div class="carousel-item">
                    <a href="">
                        <div>
                            
                        </div>
                        <img src="../../resources/image/clownfish-1453910_1920.jpg" alt="Product 3">
                    </a>
                </div>

                <div class="carousel-item">
                    <a href="">
                        <div>
                            <div>
                                가게명
                            </div>
                            <div>
                                제품명
                            </div>
                            <div>
                                가격
                            </div>
                            <div>
                                <img style="width: 15px;" src="../../resources/image/star.png">
                                별점, 리뷰수
                            </div>
                        </div>
                        <div id="carousel-dimg">
                            <img src="../../resources/image/clownfish-1453910_1920.jpg" alt="Product 4">
                        </div>
                    </a>
                </div>

               

            </div>
        </section>

        <section class="sm-procuct-section" id="special-discount">
            <div class="sm-procuct-section-title">
                특별 할인
            </div>
            <div>

            </div>
        </section>

        <section class="sm-procuct-section" id="popular-product">
            <div class="sm-procuct-section-title">
                인기 상품
            </div>
            <div>

            </div>
        </section>

        <section class="sm-procuct-section" id="brand-new">
            <div class="sm-procuct-section-title">
                최신 제품
            </div>
            <div>

            </div>
        </section>

    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>


</body>
</html>
