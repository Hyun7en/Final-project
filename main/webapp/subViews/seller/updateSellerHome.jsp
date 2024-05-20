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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/insertSellerHome.css">


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
                    <span><input type="text" name="storeDescription" placeholder="스토어 소개 입력" style="width: 300px; padding: 5px;"></span>
                </div>
                <div>
                    <h4>대표 이미지</h4>
                    <input type="file" name="storeHomeImage" id="storeHomeImage">
                </div>
                <div class="image-container">
                    <img src="${pageContext.request.contextPath}/getImage?id=1" >
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
