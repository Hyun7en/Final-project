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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/selectSellerHome.css">


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
            
            <div>
                <h4>스토어 소개</h4>
                <span>안성맞춤의 공간</span>
            </div>
            
            <h4>대표 이미지</h4>                    
            
            <div class="image-container">
                <img src="${pageContext.request.contextPath}/getImage?id=1" >
            </div>

            <div>
                <h4>카테고리</h4>
                <select name="" id="">
                    
                </select>
            </div>
            
            <div class="form-actions">
                <a href="#">수정하기</a>
            </div>
            
        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>

</body>
</html>
