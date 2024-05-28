<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 홈 관리 상세</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/sellerHomeDetailView.css">


</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>
        
        <!-- aside -->
        <%@ include file="../commons/aside.jsp" %>

        <script>
            console.log(businessNo);
        </script>

        <section>
            <h1>스토어 관리 &gt; 판매자 홈 관리</h1>
            
            <div>
                <h4>스토어 소개</h4>
                <span>${sellerHomeDetail.sellerExpalin}</span>
            </div>
            
            <h4>대표 이미지</h4>                    
            
            <div class="image-container">
                <c:choose>
                    <c:when test="${not empty b.originName }">
                        <!-- case1 -->
                        <a href="${sellerHomeDetail.changeName }" download="${sellerHomeDetail.originName }">${sellerHomeDetail.originName }</a>
                    </c:when>
                    <c:otherwise>
                        <!-- case2 -->
                        
                    </c:otherwise>
				</c:choose>
            </div>

            <div>
                <h4>카테고리</h4>
                <select id="select-category" name="category" required>
                    <option value="ddd">1111</option>
                </select>
            </div>
            
            <div class="form-actions">
                <a href="enrollForm.srh">등록하기</a>
                <a href="#">수정하기</a>
            </div>
            
            <form action="" method="POST" id="postForm">
                <input type="hidden" name="businessNo" value="${sellerPage.businessNo}">
            </form>

        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>

</body>
</html>
