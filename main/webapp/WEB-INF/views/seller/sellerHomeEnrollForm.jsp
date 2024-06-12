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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/sellerHomeForm.css">

<!-- JS -->
<script src="${pageContext.request.contextPath}/resources/js/sellerJS/addCategory.js"></script>

</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>
        
        <!-- aside -->
        <%@ include file="../commons/aside.jsp" %>

        <section>
            <h1>스토어 관리 &gt; 판매자 홈 등록</h1>

            <form id="enrollForm"  action="insert.srh" method="post" enctype="multipart/form-data">
                
                <div>
                    <h4>스토어 소개</h4>
                    <input id="store-introduce" type="text" name="sellerExplain" placeholder="스토어 소개 입력" style="width: 300px; padding: 5px;">
                </div>
                <div>
                    <h4>대표 이미지</h4>
                    <input type="file" name="storeHomeImage" id="storeHomeImage">
                </div>
                <div class="image-container">
                    <img id="preview-image" src="getImage?id=1" alt="스토어 홈 이미지">
                </div>

                <div id="div-enroll-category">
                    <div>
                        <h4>카테고리 등록</h4>
                        <input id="enroll-category" type="text" placeholder="카테고리 입력">
                        <button type="button" id="add-categoryBtn">추가</button>
                    </div>
                    <div>
                        <ul id="categoryList"></ul>
                    </div>
                </div>                
                
                <div class="form-actions">
                    <button type="submit">등록</button>
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
