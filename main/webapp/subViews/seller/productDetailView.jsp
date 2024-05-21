<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>물품 상세페이지</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">

<style>

    main {
        padding: 150px 300px;
        background-color: #eaf2fc;
    }

    #seller-home-top {
        width: 1200px;
        height: 100px;
        display: flex;
        padding: 30px 0;
        margin: 0 auto;
        align-items: center;
    }

    #seller-home-top p {
        width: 1000px;
        font-size: 30px;
        font-weight: bold;
        color: #0089FF;
        text-align: center;
        margin: 0;
    }

    #seller-home-nav {
        width: 1200px;
        height: 80px;
        display: flex;
        font-size: 20px;
        text-align: center;
        border-top: 1px solid;
        border-bottom: 1px solid;
        margin: 0 auto;
        align-items: center;
        justify-content: center;
    }

    #seller-home-nav a {
        width: 150px;
        height: 30px;
        text-align: center;
        color: black;
        margin: 25px 0;
        line-height: 30px;
        text-decoration: none;
    }

</style>
</head>
<body>
<div class="wrap">
    <!-- header -->
    <%@ include file="../commons/header.jsp" %>
    
    <main>
        <!-- Product Header -->
        <section>
            <div id="seller-home-top">
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
        </section>
        <section>
    <!-- Button to Open the Modal -->
    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
        Open modal
    </button>
  

    <!-- The Modal -->
    <div class="modal" id="myModal">
        <section class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
    
            <!-- Modal Header -->
            
            <h2 class="modal-title">Modal Heading</h2>
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            
    
            <!-- Modal body -->
            <div class="modal-body">
                
            </div>
    
            <!-- Modal footer -->
            <div class="modal-footer">
            <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
            </div>
    
        </div>
        </section>
    </div>
        </section>
    </main>

    
    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>
</body>
</html>
