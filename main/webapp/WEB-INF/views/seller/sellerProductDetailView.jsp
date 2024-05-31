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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/sellerProductDetailView.css">

<!-- JS -->
<script src="${pageContext.request.contextPath}/resources/js/sellerJS/showOption.js"></script>

</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>
        
        <!-- aside -->
        <%@ include file="../commons/aside.jsp" %>

        <section>
            <h1>스토어 관리</h1>
                <div id="product-management">
                    <div>
                        <div class="form-group">
                            <div class="pd-detail-title" >
                                상품명
                            </div>
                            <div class="form-control" id="productName">
                                ${pd.pdTitle}
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="pd-detail-title" >
                                카테고리
                            </div>
                            <div class="form-control" id="category">
                                ${pd.pdCategory}
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="pd-detail-title">
                                판매가
                            </div>
                            <div class="form-control" id="price">
                                ${pd.pdPrice}원
                            </div>
                        </div>
                        
                        <div class="form-group">
                            <div class="pd-detail-title">
                                수량
                            </div>
                            <div class="form-control"id="amount">

                            </div>
                        </div> 
                        
                        <div class="form-group">
                            <label  for="pdOptionName">
                                옵션
                            </label>
                            <select class="form-control" id="select-option" name="pdOptionName" required>
                                
                            </select>
                        </div>

                    </div>
                </div>

                <div class="form-group">
                    <div class="pd-detail-title">
                        대표 이미지
                    </div>
                </div>

                <div class="image-container">
                    <img src="${pd.pdChangeName}">
                </div>

                <div class="form-group">
                    <div class="pd-detail-title">
                        상품 상세 정보
                    </div>
                </div>

                <div id="summernote">
                    <!-- summernote 내용 -->
                    ${pd.pdContent}
                </div>

                <div class="form-actions">
                    <a href="">
                        수정 하기
                    </a>
                </div>
            
        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>
</body>
</html>
