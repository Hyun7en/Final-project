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

<!-- css-->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/ProductManagement.css">

<!-- js -->

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
            <form action="${pageContext.request.contextPath}/insertProduct" method="post" enctype="multipart/form-data">
                <div id="product-management">
                    <div>
                        <div class="form-group">
                            <label for="productName">
                                상품명
                            </label>
                            <input class="form-control" type="text" id="productName" name="productName" placeholder="상품명 입력" required>
                        </div>
                        <div class="form-group">
                            <label  for="category">
                                카테고리
                            </label>
                            <select class="form-control" id="category" name="category" required>
                                <option value="가전">
                                    가전
                                </option>
                            </select>
                        </div>
                        <div class="form-group">
                            <label for="price">
                                판매가
                            </label>
                            <input class="form-control" type="text" id="price" name="price" placeholder="판매가 입력" required>
                        </div>
                        <div class="form-group">
                            <label for="delivery-process">
                                배송방법
                            </label>
                            <input class="form-control" type="text" id="delivery-process" name="delivery-process" placeholder="배송방법 입력" required>
                        </div>
                        <div class="form-group">
                            <label for="delivery-charge">
                                배송비
                            </label>
                            <input class="form-control" type="text" id="delivery-charge" name="delivery-charge" placeholder="배송비 입력" required>
                        </div>
                    </div>

                    <div>
                        <div class="form-group">
                            <label for="amount">
                                판매수량
                            </label>
                            <input class="form-control" type="number" id="amount" name="amount" placeholder="판매수량 입력" required>
                        </div> 

                        <div class="form-group">
                            <label for="category">
                                옵션
                            </label>
                            <select class="form-control" id="category" name="category" required>
                                <option value="가전">
                                    가전
                                </option>
                            </select>
                        </div>
                    
                        <div class="form-group">
                            <label for="product-name">
                                상품명 입력
                            </label>
                            <input class="form-control" type="text" id="product-name" name="product-name" placeholder="상품명 입력" required>
                        </div>
                    </div>
                </div>

                <div class="form-group">
                    <label for="productImage">
                        대표 이미지
                    </label>
                    <input type="file" id="productImage" name="productImage" accept="image/*" required>
                </div>
                <div class="image-container">
                    <img src="${pageContext.request.contextPath}/getImage?id=1" alt="대표 이미지">
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
					$("#summernote").summernote('insertImage', "/summer" + name);	 
				}
			});
		}

		function insertFileApi(data,callback){
			$.ajax({
				url: "upload",
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
