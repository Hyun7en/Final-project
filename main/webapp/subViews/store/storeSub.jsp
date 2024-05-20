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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storeCSS/storeSub.css">

</style>

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

</body>
</html>
