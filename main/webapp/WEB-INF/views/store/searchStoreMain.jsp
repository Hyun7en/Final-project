<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aquaqu</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Slick CSS -->
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick-theme.css"/>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storeCSS/searchStoreMain.css">

<!-- Slick JS -->
<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>

<!-- JS -->
<script src="${pageContext.request.contextPath}/resources/js/storeJS/slick.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/storeJS/searchStoreMain.js"></script>


</head>
<body onload="init('searchStoreMain', `${pageContext.request.contextPath}`, {userNo : `${loginUser.userNo}`, title: `${title}`})">
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>

        <section>
            <div  class="banner">
                <div class="banner-item">
                        <img src="${pageContext.request.contextPath}/resources/image/2024052809050218597.jpg" alt="">
                </div>
            </div>
        </section>

        <section id="descript-quick">

            <div id="descript">
                <p id="page-title">
                    스토어
                </p>
                <p id="page-descript">
                    사랑하는 반려어를 위해 <br>
                    이건 어떠신가요?
                </p>
            </div>

            <div id="askn-quick-move">
                <div id="ask">
                    <img id="ask-img" src="${pageContext.request.contextPath}/resources/image/octopus-303622_1280.png" alt="">
                    <div id="ask-descript">
                        <span id="ad-span1">문의사항이 있으신가요?</span> <br>
                        <span id="ad-span2">
                            <a href="list.cs">
                                관리자에게 문의해보세요.
                            </a>
                        </span>
                    </div>
                </div>

            </div>

            
        </section>

        <section class="sm-procuct-section" id="all-product">
            <div class="sm-procuct-section-title">
                전체 제품
            </div>

            <div class="carousel" id="all-product-carousel">

            </div>

            <div class="button-container">
                <button id="load-more" style="display: none;">더 보기</button>
            </div>
        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>
    
</body>
</html>
