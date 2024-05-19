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
        padding-bottom: 200px;
    }

    /* 설명과 문의사항, 빠른 이동 */
    #descript-quick {
        display: flex;
        justify-content: space-between;
    }

    /* 설명 */
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

    /* 문의사항, 빠른 이동 */
    #descript-quick #askn-quick-move {
        padding-top: 100px;
        padding-right: 50px;
        display: flex;
        line-height: 35px;
        height: 300px;
    }

    /* 문의 사항 */
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

    /* 빠른 이동 */
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

    /* 카테고리 */
    #cards-Shelf div {
        display: flex;
    }

    #cards-Shelf div div {
        display: block;
        padding-left: 55px;
    }

    #cards-Shelf div div a figure img {
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

    /* 인기 상품 slick */

    .sm-procuct-section {
        padding-top: 100px;
    }

    .sm-procuct-section-title {
        font-weight: 900;
        font-size: 24px;
        padding-bottom: 20px;
        padding-left: 20px;
    }

    /* Carousel Styles */
    .carousel {
        position: relative;
        overflow: hidden;
    }

    .carousel-item {
        width: 340px;
        height: 450px;
        border-radius: 15px;
        box-shadow: 2px 4px 12px #00000014;
        background-color: white;
        margin: 0 20px 0 20px;
        position: relative;
    }

    .carousel-item a .product-descript{
        padding-top: 20px;
        padding-left: 10px;
    }

    .carousel-item a .product-descript p{
        font-weight: 700;
        color: black;
        margin-bottom: 4px;
    }

    .carousel-item a .product-descript #product-descript-store-name{
        font-size: 13px;
        color: #0089FF;
    }

    .carousel-item a .product-descript #product-descript-rating-review{
        font-size: 13px;
        display: flex;
        align-items: center;
    }

    .carousel-item a .product-descript #product-descript-rating-review img{
        height: 12px;
    }

    .carousel-item a .product-descript #product-descript-rating-review span{
        padding-left: 2px;
    }

    .carousel-item a .carousel-dimg{
        position: absolute;
        bottom: 20px;
        left: 10px;
        right: 10px;
    }


    .carousel-item a .carousel-dimg img{
        width: 100%; 
        border-radius: 15px;
    }

    
    .slick-prev, .slick-next {
    z-index: 25; /* 버튼이 다른 요소 위에 표시되도록 설정 */
    width: auto; /* 버튼의 기본 너비 설정 */
    height: auto; /* 버튼의 기본 높이 설정 */
    }

    .slick-prev:before, .slick-next:before {
        font-size: 40px; /* 화살표 아이콘의 크기 조정 */
    }

    .slick-prev {
        left: 3px; /* 이전 버튼의 위치 설정 */
    }

    .slick-next {
        right: 3px; /* 다음 버튼의 위치 설정 */
    }

    #general-product .carousel {
        display: flex;
        flex-wrap: wrap;
    }
    #general-product .carousel .carousel-item{
        width: calc(25% - 40px); /* 전체 폭의 25%에서 간격을 뺀 값 */
        margin-bottom: 40px;
    }

    #general-product .carousel-item {
        width: calc(25% - 40px); /* 전체 폭의 25%에서 간격을 뺀 값 */
        height: 450px;
    }

</style>


</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>

        <section id="descript-quick">

            <div id="descript">
                <p id="page-title">
                    스토어
                </p>
                <p id="page-descript">
                    수조 · 어항
                </p>
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
                            <p>빠른이동</p>
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
                        <figure>
                            <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        </figure>
                        <div>수조 · 어항</div>
                    </a>
                </div>
                <div>
                    <a href="">
                        <figure>
                            <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        </figure>
                        <div>장식</div>
                    </a>
                </div>
                <div>
                    <a href="">
                        <figure>
                            <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        </figure>
                        <div>사료</div>
                    </a>
                </div>
                <div>
                    <a href="">
                        <figure>
                            <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        </figure>
                        <div>여과기 · 여과재</div>
                    </a>
                </div>
                <div>
                    <a href="">
                        <figure>
                            <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        </figure>
                        <div>조형물</div>
                    </a>
                </div>
                <div>
                    <a href="">
                        <figure>
                            <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        </figure>
                        <div>전기용품</div>
                    </a>
                </div>
                <div>
                    <a href="">
                        <figure>
                            <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        </figure>
                        <div>수초</div>
                    </a>
                </div>
                <div>
                    <a href="">
                        <figure>
                            <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        </figure>
                        <div>바닥재 · 기타</div>
                    </a>
                </div>
            </div>
        </section>

        <section class="sm-procuct-section" id="popular-product">
            <div class="sm-procuct-section-title" >
                인기 상품
            </div>
            <div class="carousel">

                <div class="carousel-item">
                    <a href="">
                        <div class="product-descript">
                            <p id="product-descript-store-name">
                                가게명
                            </p>
                            <p id="product-descript-product-name">
                                제품명
                            </p>
                            <p id="product-descript-product-price">
                                가격
                            </p>
                            <p id="product-descript-rating-review">
                                <img style="width: 13px;" src="../../resources/image/star.png">
                                <span>4.7</span>
                                <span>리뷰</span>
                                <span>1400</span>
                            </p>
                            
                        </div>
                        <div class="carousel-dimg">
                            <img src="../../resources/image/clownfish-1453910_1920.jpg" >
                        </div>
                    </a>
                </div>

                <div class="carousel-item">
                    <a href="">
                        <div class="product-descript">
                            <p id="product-descript-store-name">
                                가게명
                            </p>
                            <p id="product-descript-product-name">
                                제품명
                            </p>
                            <p id="product-descript-product-price">
                                가격
                            </p>
                            <p id="product-descript-rating-review">
                                <img style="width: 13px;" src="../../resources/image/star.png">
                                <span>4.7</span>
                                <span>리뷰</span>
                                <span>1400</span>
                            </p>
                            
                        </div>
                        
                        <div class="carousel-dimg">
                            <img src="../../resources/image/clownfish-1453910_1920.jpg" >
                        </div>
                    </a>
                </div>

                <div class="carousel-item">
                    <a href="">
                        <div class="product-descript">
                            <p id="product-descript-store-name">
                                가게명
                            </p>
                            <p id="product-descript-product-name">
                                제품명
                            </p>
                            <p id="product-descript-product-price">
                                가격
                            </p>
                            <p id="product-descript-rating-review">
                                <img style="width: 13px;" src="../../resources/image/star.png">
                                <span>4.7</span>
                                <span>리뷰</span>
                                <span>1400</span>
                            </p>
                            
                        </div>
                        <div class="carousel-dimg">
                            <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        </div>
                    </a>
                </div>

                <div class="carousel-item">
                    <a href="">
                        <div class="product-descript">
                            <p id="product-descript-store-name">
                                가게명
                            </p>
                            <p id="product-descript-product-name">
                                제품명
                            </p>
                            <p id="product-descript-product-price">
                                가격
                            </p>
                            <p id="product-descript-rating-review">
                                <img style="width: 13px;" src="../../resources/image/star.png">
                                <span>4.7</span>
                                <span>리뷰</span>
                                <span>1400</span>
                            </p>
                            
                        </div>
                        <div class="carousel-dimg">
                            <img src="../../resources/image/clownfish-1453910_1920.jpg" >
                        </div>
                    </a>
                </div>

                <div class="carousel-item">
                    <a href="">
                        <div class="product-descript">
                            <p id="product-descript-store-name">
                                가게명
                            </p>
                            <p id="product-descript-product-name">
                                제품명
                            </p>
                            <p id="product-descript-product-price">
                                가격
                            </p>
                            <p id="product-descript-rating-review">
                                <img style="width: 13px;" src="../../resources/image/star.png">
                                <span>4.7</span>
                                <span>리뷰</span>
                                <span>1400</span>
                            </p>
                            
                        </div>
                        <div class="carousel-dimg">
                            <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        </div>
                    </a>
                </div>

                <div class="carousel-item">
                    <a href="">
                        <div class="product-descript">
                            <p id="product-descript-store-name">
                                가게명
                            </p>
                            <p id="product-descript-product-name">
                                제품명
                            </p>
                            <p id="product-descript-product-price">
                                가격
                            </p>
                            <p id="product-descript-rating-review">
                                <img style="width: 13px;" src="../../resources/image/star.png">
                                <span>4.7</span>
                                <span>리뷰</span>
                                <span>1400</span>
                            </p>
                            
                        </div>
                        <div class="carousel-dimg">
                            <img src="../../resources/image/clownfish-1453910_1920.jpg" >
                        </div>
                    </a>
                </div>

                <div class="carousel-item">
                    <a href="">
                        <div class="product-descript">
                            <p id="product-descript-store-name">
                                가게명
                            </p>
                            <p id="product-descript-product-name">
                                제품명
                            </p>
                            <p id="product-descript-product-price">
                                가격
                            </p>
                            <p id="product-descript-rating-review">
                                <img style="width: 13px;" src="../../resources/image/star.png">
                                <span>4.7</span>
                                <span>리뷰</span>
                                <span>1400</span>
                            </p>
                            
                        </div>
                        <div class="carousel-dimg">
                            <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        </div>
                    </a>
                </div>

                <div class="carousel-item">
                    <a href="">
                        <div class="product-descript">
                            <p id="product-descript-store-name">
                                가게명
                            </p>
                            <p id="product-descript-product-name">
                                제품명
                            </p>
                            <p id="product-descript-product-price">
                                가격
                            </p>
                            <p id="product-descript-rating-review">
                                <img style="width: 13px;" src="../../resources/image/star.png">
                                <span>4.7</span>
                                <span>리뷰</span>
                                <span>1400</span>
                            </p>
                            
                        </div>
                        <div class="carousel-dimg">
                            <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        </div>
                    </a>
                </div>
            </div>
        </section>

        <section class="sm-procuct-section" id="general-product">
            <div class="sm-procuct-section-title">
                수조 · 어항
            </div>
            <div class="carousel">

                <div class="carousel-item">
                    <a href="">
                        <div class="product-descript">
                            <p id="product-descript-store-name">
                                가게명
                            </p>
                            <p id="product-descript-product-name">
                                제품명
                            </p>
                            <p id="product-descript-product-price">
                                가격
                            </p>
                            <p id="product-descript-rating-review">
                                <img style="width: 13px;" src="../../resources/image/star.png">
                                <span>4.7</span>
                                <span>리뷰</span>
                                <span>1400</span>
                            </p>
                            
                        </div>
                        <div class="carousel-dimg">
                            <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        </div>
                    </a>
                </div>

                <div class="carousel-item">
                    <a href="">
                        <div class="product-descript">
                            <p id="product-descript-store-name">
                                가게명
                            </p>
                            <p id="product-descript-product-name">
                                제품명
                            </p>
                            <p id="product-descript-product-price">
                                가격
                            </p>
                            <p id="product-descript-rating-review">
                                <img style="width: 13px;" src="../../resources/image/star.png">
                                <span>4.7</span>
                                <span>리뷰</span>
                                <span>1400</span>
                            </p>
                            
                        </div>
                        <div class="carousel-dimg">
                            <img src="../../resources/image/clownfish-1453910_1920.jpg" >
                        </div>
                    </a>
                </div>

                <div class="carousel-item">
                    <a href="">
                        <div class="product-descript">
                            <p id="product-descript-store-name">
                                가게명
                            </p>
                            <p id="product-descript-product-name">
                                제품명
                            </p>
                            <p id="product-descript-product-price">
                                가격
                            </p>
                            <p id="product-descript-rating-review">
                                <img style="width: 13px;" src="../../resources/image/star.png">
                                <span>4.7</span>
                                <span>리뷰</span>
                                <span>1400</span>
                            </p>
                            
                        </div>
                        <div class="carousel-dimg">
                            <img src="../../resources/image/clownfish-1453910_1920.jpg" >
                        </div>
                    </a>
                </div>

                <div class="carousel-item">
                    <a href="">
                        <div class="product-descript">
                            <p id="product-descript-store-name">
                                가게명
                            </p>
                            <p id="product-descript-product-name">
                                제품명
                            </p>
                            <p id="product-descript-product-price">
                                가격
                            </p>
                            <p id="product-descript-rating-review">
                                <img style="width: 13px;" src="../../resources/image/star.png">
                                <span>4.7</span>
                                <span>리뷰</span>
                                <span>1400</span>
                            </p>
                            
                        </div>
                        <div class="carousel-dimg">
                            <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        </div>
                    </a>
                </div>

                <div class="carousel-item">
                    <a href="">
                        <div class="product-descript">
                            <p id="product-descript-store-name">
                                가게명
                            </p>
                            <p id="product-descript-product-name">
                                제품명
                            </p>
                            <p id="product-descript-product-price">
                                가격
                            </p>
                            <p id="product-descript-rating-review">
                                <img style="width: 13px;" src="../../resources/image/star.png">
                                <span>4.7</span>
                                <span>리뷰</span>
                                <span>1400</span>
                            </p>
                            
                        </div>
                        <div class="carousel-dimg">
                            <img src="../../resources/image/clownfish-1453910_1920.jpg">
                        </div>
                    </a>
                </div>

                <div class="carousel-item">
                    <a href="">
                        <div class="product-descript">
                            <p id="product-descript-store-name">
                                가게명
                            </p>
                            <p id="product-descript-product-name">
                                제품명
                            </p>
                            <p id="product-descript-product-price">
                                가격
                            </p>
                            <p id="product-descript-rating-review">
                                <img style="width: 13px;" src="../../resources/image/star.png">
                                <span>4.7</span>
                                <span>리뷰</span>
                                <span>1400</span>
                            </p>
                            
                        </div>
                        <div class="carousel-dimg">
                            <img src="../../resources/image/clownfish-1453910_1920.jpg" >
                        </div>
                    </a>
                </div>
    
                <div class="carousel-item">
                    <a href="">
                        <div class="product-descript">
                            <p id="product-descript-store-name">
                                가게명
                            </p>
                            <p id="product-descript-product-name">
                                제품명
                            </p>
                            <p id="product-descript-product-price">
                                가격
                            </p>
                            <p id="product-descript-rating-review">
                                <img style="width: 13px;" src="../../resources/image/star.png">
                                <span>4.7</span>
                                <span>리뷰</span>
                                <span>1400</span>
                            </p>
                            
                        </div>
                        <div class="carousel-dimg">
                            <img src="../../resources/image/clownfish-1453910_1920.jpg" >
                        </div>
                    </a>
                </div>

                <div class="carousel-item">
                    <a href="">
                        <div class="product-descript">
                            <p id="product-descript-store-name">
                                가게명
                            </p>
                            <p id="product-descript-product-name">
                                제품명
                            </p>
                            <p id="product-descript-product-price">
                                가격
                            </p>
                            <p id="product-descript-rating-review">
                                <img style="width: 13px;" src="../../resources/image/star.png">
                                <span>4.7</span>
                                <span>리뷰</span>
                                <span>1400</span>
                            </p>
                            
                        </div>
                        <div class="carousel-dimg">
                            <img src="../../resources/image/clownfish-1453910_1920.jpg" >
                        </div>
                    </a>
                </div>

            </div>
           
        </section>


        <!-- 페이징 처리 -->

        <!-- <div class="paging-area" align="center">
            <c:if test="${pi.currentPage ne 1}">
                <button onclick="location.href = '${pageContext.request.contextPath}/review.re?rno=${rest.restNo}&pno=${i - 1}'">&lt;</button>
            </c:if>
            <c:forEach var="i" begin="${pi.startPage }" end="${pi.endPage }">
                <button onclick="location.href = '${pageContext.request.contextPath}/review.re?rno=${rest.restNo}&pno=${i }'">${i}</button>
            </c:forEach>
            <c:if test="${pi.currentPage ne pi.maxPage}">
                <button onclick="location.href = '${pageContext.request.contextPath}/review.re?rno=${rest.restNo}&pno=${i + 1}'">&gt;</button>
            </c:if>
            
        </div> -->


    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>
<!-- Slick carousel initialization -->
<script>
    $(document).ready(function(){
        $('#popular-product .carousel').slick({
            infinite: true,
            slidesToShow: 4,
            slidesToScroll: 1,
            autoplay: false,
            arrows: true,
            dots: true
        });

    });

</script>

</body>
</html>
