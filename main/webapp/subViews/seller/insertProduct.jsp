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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/insertProduct.css">

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

    .content .form-group {
        margin-bottom: 15px;
        display: flex;
        align-items: center;
    }

    .content .form-group label {
        width: 150px;
        font-weight: bold;
    }

    .content .form-group input, 
    .content .form-group select {
        flex: 1;
        padding: 5px;
        font-size: 14px;
    }

    .image-container {
        text-align: center;
        margin: 20px 0;
    }

    .image-container img {
        max-width: 100%;
        height: auto;
        border: 1px solid #ccc;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }

    .form-actions {
        display: flex;
        justify-content: space-between;
    }

    .form-actions button {
        padding: 10px 20px;
        border: 1px solid #ccc;
        background-color: white;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .form-actions button:hover {
        background-color: #f0f0f0;
    }

    #summernote {
        height: 300px;
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
            <form action="${pageContext.request.contextPath}/insertProduct" method="post" enctype="multipart/form-data">
                <div>
                    <div class="form-group">
                        <label for="productName">상품명</label>
                        <input type="text" id="productName" name="productName" placeholder="상품명 입력">
                    </div>
                    <div class="form-group">
                        <label for="category">카테고리</label>
                        <select id="category" name="category">
                            <option value="가전">가전</option>
                            <option value="의류">의류</option>
                            <option value="생활용품">생활용품</option>
                            <!-- 추가 카테고리 옵션들 -->
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="price">판매가</label>
                        <input type="text" id="price" name="price" placeholder="판매가 입력">
                    </div>
                    <div class="form-group">
                        <label for="stock">재고수량</label>
                        <input type="text" id="stock" name="stock" placeholder="재고수량 입력">
                    </div>
                </div>

                <div>

                </div>
                
                <div class="form-group">
                    <label for="productImage">대표 이미지</label>
                    <input type="file" id="productImage" name="productImage" accept="image/*">
                </div>
                <div class="image-container">
                    <img src="${pageContext.request.contextPath}/getImage?id=1" alt="대표 이미지">
                </div>
                <div class="form-group">
                    <label for="summernote">상품 상세 정보</label>
                    <textarea id="summernote" name="productDescription"></textarea>
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

<script>
    $(document).ready(function() {
        $('#summernote').summernote({
            height: 300,
            placeholder: '상품 상세 정보를 입력하세요',
            toolbar: [
                ['style', ['style']],
                ['font', ['bold', 'italic', 'underline', 'clear']],
                ['fontname', ['fontname']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'picture', 'video']],
                ['view', ['fullscreen', 'codeview', 'help']]
            ]
        });
    });
</script>
</body>
</html>
