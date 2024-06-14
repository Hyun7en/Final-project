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
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/ProductManagement.css">

<!-- Summernote CSS & JS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.js"></script>

<!-- JS -->
<script src="${pageContext.request.contextPath}/resources/js/sellerJS/showCategory.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sellerJS/productUpdateForm.js"></script>

<script>

const pno = '${pd.pdNo}';

</script>

</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>
        
        <!-- aside -->
        <%@ include file="../commons/aside.jsp" %>

        <section>
            <h1>스토어 관리 &gt; 상품 수정</h1>
            <form id="updateForm" action="update.pd" method="post" enctype="multipart/form-data">

                <input type="hidden" name="pno" value="${pd.pdNo}">

                <div id="product-management">
                    <div>
                        <div class="form-group">
                            <label for="pdTitle">
                                상품명
                            </label>
                            <input class="form-control" type="text" id="pdTitle" name="pdTitle" placeholder="상품명 입력" value="${pd.pdTitle}" required>
                        </div>
                        <div class="form-group">
                            <label  for="select-category">
                                카테고리
                            </label>
                            <select class="form-control" id="select-category" name="pdCategory" required>
                                
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="pPrice">
                                판매가
                            </label>
                            <input class="form-control" type="number" min="0" step="100"  id="pdPrice" name="pdPrice" placeholder="판매가 입력" value="${pd.pdPrice}" required>
                        </div>
                        
                        <div id="div-enroll-option">
                                <div>
                                    <h4>옵션 등록</h4>
                                    <button type="button" id="add-optionBtn">옵션 추가</button> 
                                </div>
                                <table >
                                  
                                </table>                           
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="productImage">
                        대표 이미지
                    </label>
                    <input type="file" id="productImage" name="productImage" required>
                </div>
                <div class="image-container">
                    <img id="preview-image" src="${pd.pdChangeName}" alt="상품 이미지">
                </div>
                <div class="form-group">
                    <label for="summernote">
                        상품 상세 정보
                    </label>
                </div>
                <div>
                    <textarea id="summernote" name="pdContent">${pd.pdContent}</textarea>
                </div>
                <div class="form-actions">
                    <button type="submit">
                        수정
                    </button>
                    <button type="reset">
                        초기화
                    </button>
                </div>
            </form>
        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>

<script src="${pageContext.request.contextPath}/resources/js/sellerJS/sellerSummernote.js"></script>


</body>
</html>
