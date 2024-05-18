<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>

    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/header.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/footer.css">

<style>
    body{
        background-color: #E0F1FF;
        position: relative;
    }
    #seller-home{
        min-height: 100%;
        width: 100%;
        margin-left: auto;
        margin-right: auto;
    }
    #seller-home-top{
        width: 1200px;
        height: 100px;
        display: flex;
        padding: 30px 0 30px 0;
        margin-left: auto;
        margin-right: auto;
    }
    #seller-blue-button{
        border: 0;
        width: 150px;
        height: 40px;
        color: white;
        background-color: #0089FF;
        font-size: 18px;
        margin-right: 0px;
        border-radius: 10px;
    }
    #seller-blue-button img{
        width: 25px;
        height: 25px;
    }
    #seller-home-top p{
        width: 900px;
        height: 40px;
        font-size: 30px;
        font-weight: bold;
        color: #0089FF;
        text-align: center;
        margin-bottom: 0;
    }
    #seller-home-nav{
        width: 100%;
        height: 80px;
        display: flex;
        font-size: 20px;
        text-align: center;
        border-top: 1px solid;
        border-bottom: 1px solid;
    }
    #seller-home-nav a{
        width: 150px;
        height: 30px;
        text-align: center;
        color: black;
        margin: 25px 0 25px 0;
    }
    #seller-home-banner{
        width: 100%;
        height: 400px;
        background-color: black;
        text-align: center;
        margin-bottom: 50px;
    }
    #seller-home-banner img{
        width: 1000px;
        height: 400px;
    }
    #seller-home-list{
        width: 1120px;
        height: 2000px;
        margin: 0 auto 0;
    }
    #seller-home-list p{
        width: 100%;
        height: 40px;
        font-size: 30px;
        font-weight: bold;
        text-align: center;
        margin-bottom: 20px
    }
    #seller-home-listnav{
        width: 800px;
        height: 40px;
        font-size: 18px;
        display: flex;
        text-align: center;
        margin-left: auto;
        margin-right: auto;
    }
    #seller-home-listnav a{
        width: 100px;
        height: 30px;
        color: black;
        
    }
    #seller-home-products{
        width: 1120px;
        height: 1105px;
        display: grid;
        grid-template-columns: repeat(4, 1fr);
        grid-auto-rows: 305px;
        column-gap: 40px;
        row-gap: 95px;
    }
    #seller-home-products a{
        border: 1px solid;
        }
</style>

</head>
<body>
    <div id="wrap">
        <%@ include file="../commons/header.jsp" %>
        <main id="seller-home">
            <div id="seller-home-top">
                <button id="seller-blue-button"><img src="${pageContext.request.contextPath}/resources/image/mdi_bell-outline.png" alt="">알림받기</button>
                <p>워터 박스</p>
            </div>
            <div id="seller-home-nav">
                <a href="" style="margin-left: auto;">BEST</a>
                <a href="">전체상품</a>
                <a href="">특가판매</a>
                <a href="">주문제작</a>
                <a href="">어항</a>
                <a href="">어항용품</a>
                <a href="">수족관용품</a>
                <a href="" style="margin-right: auto;">기타</a>
            </div>
            <div id="seller-home-banner">
                <img src="${pageContext.request.contextPath}\resources\image\seller_banner.png" alt="">
            </div>
            <div id="seller-home-list">
                <p>전체상품</p>
                <div id="seller-home-listnav">
                    <a href="">인기도순</a>|
                    <a href="">최신등록순</a>|
                    <a href="">낮은 가격순</a>|
                    <a href="">높은 가격순</a>|
                    <a href="">할인율순</a>|
                    <a href="">누적 판매순</a>|
                    <a href="">리뷰 많은순</a>|
                    <a href="">평점 높은순</a>
                </div>
                <div id="seller-home-products">
                    <a href=""></a>
                    <a href=""></a>
                    <a href=""></a>
                    <a href=""></a>
                    <a href=""></a>
                    <a href=""></a>
                    <a href=""></a>
                    <a href=""></a>
                    <a href=""></a>
                    <a href=""></a>
                    <a href=""></a>
                    <a href=""></a>
                </div>
            </div>
        </main>
        <%@ include file="../commons/footer.jsp" %>
    </div>
</body>
</html>