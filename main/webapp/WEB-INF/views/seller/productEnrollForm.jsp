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
<!-- <script src="${pageContext.request.contextPath}/resources/js/sellerJS/addOption.js"></script> -->

<script>
    //옵션 추가

    $(document).ready(function() {
        let options = [];

        $('#add-optionBtn').click(function() {
            let optionName = $('#enroll-option').val().trim();
            let quantity = parseInt($('#enroll-quantity').val().trim(), 10);
            
            if (optionName && quantity >= 0) {
                let option = { name: optionName, quantity: quantity };
                
                // 배열에 옵션이 이미 존재하는지 검사
                if (options.some(opt => opt.name === optionName)) {
                    alert('이미 추가된 옵션입니다.');
                } else {
                    options.push(option);
                    $('#optionList').append(`<li data-option="${optionName}">${option.optionName} - ${quantity}<button class="removeBtn">x</button></li>`);
                    $('#enroll-option').val('');
                    $('#enroll-quantity').val('');  // 입력 필드 초기화
                    console.log(options);
                }
            } else {
                alert('옵션과 수량을 모두 입력하세요.');
            }
        });

        $(document).on('click', '.removeBtn', function() {
            let optionLi = $(this).closest('li');
            let optionName = optionLi.data('option');
            options = options.filter(opt => opt.name !== optionName);
            optionLi.remove();
            console.log(options);
        });

        $('#enrollForm').submit(function(event) {
            let optionsInput = $('<input>').attr('type', 'hidden').attr('name', 'optionsJson').val(JSON.stringify(options));
            $(this).append(optionsInput);
        });

        $('#productImage').change(function(event) {
            let reader = new FileReader();
            reader.onload = function(e) {
                $('#preview-image').attr('src', e.target.result);
            }
            reader.readAsDataURL(event.target.files[0]);
        });
    });

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
            <h1>스토어 관리 &gt; 상품 등록</h1>
            <form id="enrollForm" action="insert.pd" method="post" enctype="multipart/form-data">
                <div id="product-management">
                    <div>
                        <div class="form-group">
                            <label for="pdTitle">
                                상품명
                            </label>
                            <input class="form-control" type="text" id="pdTitle" name="pdTitle" placeholder="상품명 입력" required>
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
                            <input class="form-control" type="number" min="0" step="100"  id="pdPrice" name="pdPrice" placeholder="판매가 입력" required>
                        </div>

                        <div id="div-enroll-option">
                            <div>
                                <h4>옵션 등록</h4>
                                <input id="enroll-option" type="text" placeholder="옵션 입력">
                                <input id="enroll-quantity" type="number" min="0" id="pdCount" name="pdCount" placeholder="수량" required>
                                <button type="button" id="add-optionBtn">추가</button>
                            </div>
                            <div>
                                <ul id="optionList"></ul>
                            </div>
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
                    <img id="preview-image" src="getImage?id=1" alt="대표 이미지">
                </div>
                <div class="form-group">
                    <label for="summernote">
                        상품 상세 정보
                    </label>
                </div>
                <div>
                    <textarea id="summernote" name="pdContent"></textarea>
                </div>
                <div class="form-actions">
                    <button type="submit">
                        검수 요청
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
