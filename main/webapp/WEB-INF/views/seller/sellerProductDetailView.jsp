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
<!-- <script src="${pageContext.request.contextPath}/resources/js/sellerJS/showOption.js"></script> -->

<script>

    // JSP에서 pno 변수를 JavaScript로 전달
    const pno = ${pd.pdNo};
    console.log("pno: " + pno); // pno 값이 제대로 전달되었는지 확인
    
    $(document).ready(function() {
    // 페이지 로드 시 옵션 목록을 가져오고, 그리기
    selectOptions();

    function selectOptions() {
        $.ajax({
            url: "options.ax", // 서버 URL
            method: "GET",
            data: { pno: pno },
            success: function(res) {
                drawOptions(res);
            },
            error: function() {
                console.log("options.ax 통신 실패");
                alert("옵션을 가져오는 데 실패했습니다. 페이지를 새로고침해주세요.");
            }
        });
    }

    function drawOptions(options) {
        let $selectOption = $('#select-option');
        $selectOption.empty(); // 기존의 옵션들을 초기화

        if (!options || options.length === 0) {
            console.log('No options received or options array is empty');
            return;
        }

        // 옵션 목록의 각 항목에 대해 option 요소를 생성하여 추가
        options.forEach(function(option) {
            if (option) {
                $selectOption.append($('<option>').text(option.pdOptionName).val(option.pdOptionName)); // 값을 옵션 이름으로 사용
            } else {
                console.log('Invalid option data', option);
            }
        });

        // 첫 번째 옵션 항목을 선택
        if ($selectOption.find('option').length > 0) {
            $selectOption.val($selectOption.find('option:first').val());
        }
    }
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
                <a href="updateForm.pd">
                    수정
                </a>
                <button>
                    삭제
                </button>
            </div>
            
        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>
</body>
</html>
