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

<script>
    // JSP에서 JavaScript로 변수 전달
    const pno = '${pd.pdNo}'; // JSP 변수를 JavaScript 변수로 할당
</script>

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
            
            <div id="product-detail">

                <div class="form-group">
                    <h4>상품명</h4>
                    <span class="form-control" id="productName">
                        ${pd.pdTitle}
                    </span>
                </div>

                <div class="form-group">
                    <h4>카테고리</h4>
                    <span class="form-control" id="category">
                        ${pd.pdCategory}
                    </span>
                </div>

                <div class="form-group">
                    <h4>판매가</h4>
                    <span class="form-control" id="price">
                        ${pd.pdPrice}원
                    </span>
                </div> 
                
                <div class="form-group">
                    <h4>옵션</h4>
                    <select class="form-control" id="select-option" name="optionName" required>
                        
                    </select>
                </div>

                <div class="form-g">
                    <h4>상품 이미지</h4>

                    <div class="image-container">
                        <img src="${pd.pdChangeName}">
                    </div>
                </div>

                <div class="form-g">
                    <h4>상품 상세 정보</h4>

                    <div id="summernote">
                        <!-- summernote 내용 -->
                        ${pd.pdContent}
                    </div>
                </div>

            </div>

            <div class="form-actions">
                <a onclick="postFormSubmit('edit')">
                    수정
                </a>
                <a onclick="postFormSubmit('delete')">
                    삭제
                </a>
            </div>

            <form action="" method="POST" id="postForm">
                <input type="hidden" name="pno" value="${pd.pdNo}">
            </form>

            <script>
                function postFormSubmit(type){
                    const formEl = document.querySelector("#postForm");
                    switch(type){
                        case "edit" : {
                            //formEl.action = "updateForm.bo";
                            $(formEl).attr("action", "updateForm.pd");
                        }break;
                        case "delete":{
                            //formEl.action = "delete.bo";
                            $(formEl).attr("action", "delete.pd")
                        }break;
                    }
                    
                    $(formEl).submit();
                }
            </script>
            
        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>
</body>
</html>
