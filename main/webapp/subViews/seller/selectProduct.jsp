<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Summernote CSS & JS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/selectProduct.css">

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
                                상품명
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="pd-detail-title" >
                                카테고리
                            </div>
                            <div class="form-control" id="category">
                                카테고리
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="pd-detail-title">
                                판매가
                            </div>
                            <div class="form-control" id="price">
                                상품명
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="pd-detail-title">
                                배송방법
                            </div>
                            <div class="form-control" id="delivery-process">
                                상품명
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="pd-detail-title">
                                배송비
                            </div>
                            <div class="form-control" id="delivery-charge">
                                상품명
                            </div>
                        </div>
                    </div>

                    <div>
                        <div class="form-group">
                            <div class="pd-detail-title">
                                판매수량
                            </div>
                            <div class="form-control"id="amount">
                                상품명
                            </div>
                        </div> 

                        <div class="form-group">
                            <div class="pd-detail-title">
                                옵션
                            </div>
                            <div class="form-control" id="category">
                                옵션
                            </div>
                        </div>
                    
                        <div class="form-group">
                            <div class="pd-detail-title">
                                상품명 입력
                            </div>
                            <div class="form-control"id="product-name">
                                상품명
                            </div>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <div class="pd-detail-title">
                        대표 이미지
                    </div>
                </div>

                <div class="image-container">
                    <img src="${pageContext.request.contextPath}/getImage?id=1" alt="대표 이미지">
                </div>

                <div class="form-group">
                    <div class="pd-detail-title">
                        상품 상세 정보
                    </div>
                </div>

                <div id="summernote">
                    <!-- summernote 상세 -->
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
