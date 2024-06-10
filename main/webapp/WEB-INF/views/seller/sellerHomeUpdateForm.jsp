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
<!-- <script src="${pageContext.request.contextPath}/resources/js/sellerJS/sellerHomeUpdate.js"></script> -->

<script>
     $(document).ready(function() {
    let categories = []; // 현재 카테고리 배열
    let originalCategories = []; // 원래 카테고리 배열

    // 페이지 로드 시 카테고리 목록을 가져오고, 그리기
    selectCategories(function(categoriesFromServer){
        categories = categoriesFromServer;
        originalCategories = [...categoriesFromServer]; // 깊은 복사
        drawCategories(categories);
    });

    // 카테고리 목록을 서버로부터 가져오는 함수
    function selectCategories(callback) {
        $.ajax({
            url: "categories.ax", // 서버 URL
            method: "GET",
            success: function(res) {
                callback(res);
            },
            error: function() {
                console.log("categories.ax 통신 실패");
            }
        });
    }

    // 카테고리를 화면에 그리는 함수
    function drawCategories(categoriesToDraw) {
        let $categoryList = $('#categoryList');
        $categoryList.empty(); // 기존의 카테고리 초기화

        if (!categoriesToDraw || categoriesToDraw.length === 0) {
            console.log('No categories received or categories array is empty');
            return;
        }

        categoriesToDraw.forEach(function(category) {
            if (category && category.pdCategory) {
                $categoryList.append($('<div data-category="' + category.pdCategory + '">').append($('<li>').text(category.pdCategory)).append('<button class="removeBtn">x</button>'));
            } else {
                console.log('Invalid category data', category);
            }
        });
    }

    // 카테고리 추가 이벤트
    $('#add-categoryBtn').click(function() {
        let category = $('#enroll-category').val().trim();
        if (category) {
            if (categories.some(cat => cat.pdCategory === category)) {
                alert('이미 추가된 카테고리입니다.');
            } else {
                categories.push({ pdCategory: category }); // 배열에 추가
                $('#categoryList').append($('<div data-category="' + category + '">').append($('<li>').text(category)).append('<button class="removeBtn">x</button>'));
                $('#enroll-category').val(''); // 입력 필드 초기화
                console.log(categories);
            }
        } else {
            alert('카테고리를 입력하세요.');
        }
    });

    // Enter 키를 눌렀을 때 카테고리 추가 이벤트
    $('#enroll-category').keypress(function(event) {
        if (event.which == 13) { // Enter 키 코드가 13입니다.
            event.preventDefault(); // 폼 제출을 막습니다.
            $('#add-categoryBtn').click(); // 카테고리 추가 버튼 클릭 이벤트 호출
        }
    });

    // 카테고리 제거 이벤트
    $(document).on('click', '.removeBtn', function() {
        let categoryDiv = $(this).parent();
        let category = categoryDiv.data('category');
        categories = categories.filter(cat => cat.pdCategory !== category);
        categoryDiv.remove(); // 화면에서 제거
        console.log(categories);
    });

    // 폼 제출 시 추가된 카테고리와 삭제된 카테고리를 JSON 형식으로 변환하여 폼에 추가
    $('#enrollForm').submit(function(event) {
        let addCategories = categories.filter(cat => !originalCategories.some(origCat => origCat.pdCategory === cat.pdCategory));
        let deleteCategories = originalCategories.filter(origCat => !categories.some(cat => cat.pdCategory === origCat.pdCategory));
        
        let categoriesData = {
            addCategories: addCategories,
            deleteCategories: deleteCategories
        };

        let categoriesInput = $('<input>').attr('type', 'hidden').attr('name', 'categoriesJson').val(JSON.stringify(categoriesData));
        $(this).append(categoriesInput);
        console.log("Submitting categories:", JSON.stringify(categoriesData));
    });

    // 스토어 홈 이미지 변경 시 미리보기 기능
    $('#storeHomeImage').change(function(event) {
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
            <h1>스토어 관리 &gt; 판매자 홈 등록</h1>

            <form id="enrollForm"  action="update.srh" method="post" enctype="multipart/form-data">
                
                <div>
                    <h4>스토어 소개</h4>
                    <input id="store-introduce" type="text" name="sellerExplain" placeholder="스토어 소개 입력" value="${sp.sellerExplain}" style="width: 300px; padding: 5px;">
                </div>
                <div>
                    <h4>대표 이미지</h4>
                    <input type="file" name="storeHomeImage" id="storeHomeImage">
                </div>
                <div class="image-container">
                    <img id="preview-image" src="${sp.spChangeName}" alt="스토어 홈 이미지">
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
