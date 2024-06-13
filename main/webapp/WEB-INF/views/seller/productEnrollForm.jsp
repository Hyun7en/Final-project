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
document.addEventListener('DOMContentLoaded', function() {
    document.getElementById('add-optionBtn').addEventListener('click', function() {
        let table = document.querySelector('#div-enroll-option table');

        // 마지막 입력된 옵션명 가져오기
        let optionInputs = table.querySelectorAll('input[type="text"]');
        let lastInputValue = optionInputs.length > 0 ? optionInputs[optionInputs.length - 1].value.trim() : "";

        // 옵션명 입력 검사 (마지막 입력된 값만 검사)
        if (optionInputs.length > 0 && lastInputValue === "") {
            alert("옵션명을 입력해주세요.");
            return;
        }

        // 중복 검사 (마지막 값이 입력된 후에만 수행)
        if (optionInputs.length > 0) {
            let isDuplicate = Array.from(optionInputs, input => input.value.trim()).slice(0, -1).includes(lastInputValue);
            if (isDuplicate) {
                alert("이미 같은 옵션이 존재합니다.");
                return;
            }
        }

        // 새 행 추가
        addNewOptionRow(table);
    });

    function addNewOptionRow(table) {
        let newTr = document.createElement('tr');

        let td1 = document.createElement('td');
        let input1 = document.createElement('input');
        input1.type = 'text';
        input1.placeholder = '옵션명 입력';
        td1.appendChild(input1);
        newTr.appendChild(td1);

        let td2 = document.createElement('td');
        let input2 = document.createElement('input');
        input2.type = 'number';
        input2.min = '0';
        input2.placeholder = '수량';
        td2.appendChild(input2);
        newTr.appendChild(td2);

        let td3 = document.createElement('td');
        let removeBtn = document.createElement('button');
        removeBtn.textContent = '제거';
        removeBtn.className = 'remove-btn';
        removeBtn.onclick = function(event) {
            let tr = event.target.closest('tr');
            tr.remove(); // 해당 행 제거
        };
        td3.appendChild(removeBtn);
        newTr.appendChild(td3);

        table.appendChild(newTr);
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
                            <select class="form-control" id="select-category" name="caNo" required>
                                
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
                    <img id="preview-image" src="" alt="상품 이미지">
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
                    <button type="submit" >
                        검수 요청
                    </button>
                    <button type="reset" onclick="sendMessage(4)"> 
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
