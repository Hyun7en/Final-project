<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller Information</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/sellerInfo.css">

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

            
        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>

</body>
</html>
