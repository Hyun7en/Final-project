<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aquaqu</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/sellerHomeDetailView.css">

<!-- JS -->
<script src="${pageContext.request.contextPath}/resources/js/sellerJS/showCategory.js"></script>

</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>
        
        <!-- aside -->
        <%@ include file="../commons/aside.jsp" %>

        <section>
            
            <h1>스토어 관리 &gt; 판매자 홈 관리</h1>
            <c:choose>    
                <c:when test="${not empty sp and not empty sp.sellerPageNo}">
                    <div>
                        <h4>스토어 소개</h4>
                        <span>${sp.sellerExplain}</span>
                    </div>
                    
                    <h4>대표 이미지</h4>                    
                    
                    <div class="image-container">
                        <img src="${sp.spChangeName}">
                    </div>

                    <div>
                        <h4>카테고리</h4>
                        <select id="select-category" name="pdCategory" required>
                            
                        </select>
                    </div>
                    
                    <div class="form-actions">
                        <a href="updateForm.srh">수정하기</a>
                    </div>
                </c:when>
                <c:otherwise>
                    <div id="enroll-please">
                        판매자 홈 등록 먼저 부탁드립니다.
                    </div>
                </c:otherwise>
            </c:choose>    
        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

    <c:if test="${not empty message}">
        <script>
            alert('${message}');
        </script>
    </c:if>

</div>

</body>
</html>
