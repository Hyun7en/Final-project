<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>insertSellerHome</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/insertSellerHome.css"> -->

<style>
    
    .content {
        display: flex;
        flex-direction: column;
        flex: 1;
        padding: 40px 200px 40px 200px;
        height: calc(100vh - 40px);
    }

    .content h1 {
        margin-bottom: 20px;
    }

    .content div {
        margin-bottom: 30px;
        display: flex;
        flex-direction: row;
        align-items: center;
    }

    .content div input{
        margin-left: 20px;
    }

    .content div #store-introduce{
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .content div #enroll-category{
        border: 1px solid #ccc;
        border-radius: 5px;
    }

    .image-container img {
        max-width: 100%;
        height: auto;
        border-radius: 5px;
        box-shadow: 2px 4px 12px #00000014;
    }

    .form-actions button {
        padding: 8px;
        background-color: #0089FF;
        cursor: pointer;
        border-radius: 5px;
        margin-right: 20px;
        color: white;
    }

    .form-actions button:hover {
        background-color: #005bb5;
    }
    .image-container{
        width: 800px;
        height: 400px;
    }
    .image-container img{
        width: 800px;
        height: 400px;
    }


</style>

</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>
        
        <!-- aside -->
        <%@ include file="../commons/aside.jsp" %>

        <section class="content">
            <h1>스토어 관리</h1>
            <form action="${pageContext.request.contextPath}/insertSeller" method="post" enctype="multipart/form-data">
                <div>
                    <h4>스토어 소개</h4>
                    <input id="store-introduce" type="text" name="storeDescription" placeholder="스토어 소개 입력" style="width: 300px; padding: 5px;">
                </div>
                <div>
                    <h4>대표 이미지</h4>
                    <input type="file" name="storeHomeImage" id="storeHomeImage">
                </div>
                <div class="image-container">
                    <img src="${pageContext.request.contextPath}/getImage?id=1" alt="대표 이미지">
                </div>

                <div>
                    <h4>카테고리 등록</h4>
                    <input id="enroll-category" type="text" id="categoryInput" placeholder="카테고리 입력">
                    <button type="button" id="addCategoryBtn">추가</button>
                    <ul id="categoryList"></ul>
                </div>
                
                <div class="form-actions">
                    <button type="submit">등록하기</button>
                    <button type="reset">초기화</button>
                </div>
            </form>
        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>
</body>
</html>
