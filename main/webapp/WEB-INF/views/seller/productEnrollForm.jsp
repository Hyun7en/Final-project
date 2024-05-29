<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/ProductManagement.css">

<!-- Summernote CSS & JS -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.css" rel="stylesheet">
<script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.18/summernote-lite.js"></script>

<!-- JS -->
<script src="${pageContext.request.contextPath}/resources/js/sellerJS/category.js"></script>

<script>
    $(document).ready(function() {
        let options = [];

        $('#add-optionBtn').click(function() {
            let option = $('#enroll-option').val().trim();
            if (option) {
                // 배열에 옵션이 이미 존재하는지 검사
                if (options.includes(option)) {
                    alert('이미 추가된 옵션입니다.');
                } else {
                    options.push(option);
                    $('#optionList').append('<div data-option="' + option + '"><li>' + option + '</li><button class="removeBtn">x</button></div>');
                    $('#enroll-option').val('');  // 입력 필드 초기화
                    console.log(options);
                }
            } else {
                alert('옵션을 입력하세요.');
            }
        });

        $(document).on('click', '.removeBtn', function() {
            let optionDiv = $(this).parent();
            let option = optionDiv.data('option');
            let index = options.indexOf(option);
            if (index > -1) {
                options.splice(index, 1);
                optionDiv.remove();
                console.log(options);
            }
        });

        $('#enrollForm').submit(function(event) {
            let optionsInput = $('<input>').attr('type', 'hidden').attr('name', 'optionsJson').val(JSON.stringify(options));
            $(this).append(optionsInput);

            console.log("Submitting options:", JSON.stringify(options));
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
            <form action="insert.pd" method="post" enctype="multipart/form-data">
                <div id="product-management">
                    <div>
                        <div class="form-group">
                            <label for="pTitle">
                                상품명
                            </label>
                            <input class="form-control" type="text" id="pTitle" name="pTitle" placeholder="상품명 입력" required>
                        </div>
                        <div class="form-group">
                            <label  for="select-category">
                                카테고리
                            </label>
                            <select class="form-control" id="select-category" name="category" required>
                                
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="pPrice">
                                판매가
                            </label>
                            <input class="form-control" type="number" min="0" step="100"  id="pPrice" name="pPrice" placeholder="판매가 입력" required>
                        </div>
                   
                        <div class="form-group">
                            <label for="pCount">
                                수량
                            </label>
                            <input class="form-control" type="number" min="0" id="pCount" name="pCount"  placeholder="판매수량 입력" required>
                        </div> 

                        <div id="div-enroll-option">
                            <div>
                                <h4>옵션 등록</h4>
                                <input id="enroll-option" type="text" placeholder="옵션 입력">
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
                    <textarea id="summernote" name="productDescription"></textarea>
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

<script>
    $(document).ready(function() {
      $('#summernote').summernote({
          placeholder: "게시글을 작성해주세요.",
          height: 400,
          maxHeight: 1000,
          width: 900,
          toolbar: [
                // [groupName, [list of button]]
                ['style', ['bold', 'italic', 'underline', 'clear']],
                ['font', ['strikethrough', 'superscript', 'subscript']],
                ['fontsize', ['fontsize']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['height', ['height']],
                ['Insert',['picture']]
              ],
          callbacks: {
                onImageUpload: fileUpload
          }
      });
    });
    
    //썸머노트에 이미지업로드가 발생하였을 때 동작하는 함수
    function fileUpload(fileList){
        //썸머노트는 이미지를 추가하면 해당이미지파일을 전달해준다.
        //callback함수를 작성하지 않을경우 자동으로 이미지를 string으로 변환해서 보여주지만
        //customCallback을 작성할 경우 해당 이미지의 경로를 직접 주어야한다.

        //파일업로드를 할때는 form태그에서 encType을 multipart/form-data형식으로
        //요청하는 것처럼 자바스크립트 객체에 FormData객체를 이용해서 ajax요청을 해준다.
    
        const fd = new FormData();
        for(let file of fileList){
            fd.append("fileList", file);
        }

        insertFileApi(fd, function(nameList){
            for(let name of nameList) {
                $("#summernote").summernote('insertImage', "/psvm" + name);
            }
        });
    }

    function insertFileApi(data,callback){
        $.ajax({
            url: "upload.pd",
            type: "POST",
            data: data,
            processData: false, //기본이 true로 true일때는 전송하는 data를 string으로 변환해서 요청
            contentType: false, // application/x-www-form-urlencoded; charset=UTF-8; -> multipart/form-data로 보내기위해 false로 지정
            dataType: "json", // 서버로부터 json으로 데이터를 받겠다.
            success: function(changeNameList){
                callback(changeNameList)
            },
            error: function(){
                console.log("파일업로드 api요청 실패")
            }
        })
    }
</script>
</body>
</html>
