<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- include libraries(jQuery, bootstrap) -->
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

    <!-- include summernote css/js -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/communityCSS/communityEnroll.css">
<style>
</style>
</head>
<body>
    <div id="wrap">
        <%@ include file="../commons/header.jsp" %>
        <main id="community-normal">
            
            <div id="com-head">
                글쓰기
            </div>
            <form method="post" action="insert.co">
                <div id="com-enroll-top">
                    <div>
                        게시판
                    </div>
                    <select name="boardLevel">
                        <option value="0">일반</option>
                        <option value="1">꿀팁</option>
                        <option value="2">질문</option>
                        <option value="3">중고거래</option>
                    </select>
                </div>
                <div id="com-enroll-middle">
                    <div>
                        제목
                    </div>
                    <input type="hidden" name="userNo" value="${loginUser.userNo}">
                    <input type="text" name="boardTitle" maxlength="33" required>
                </div>
                <div id="com-enroll-content">
                    <textarea name="boardContents" id="com-enroll-content-p"></textarea>
                </div>
                <div id="com-enroll-bottom">
                    <button id="com-grey-button">취소</button>
                    <button type="submit" id="com-blue-button">등록</button>
                </div>
            </form>

            <script>
                $(document).ready(function() {
                  $('#com-enroll-content-p').summernote({
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
                            $("#com-enroll-content-p").summernote('insertImage', "/psvm" + name);
                        }
                    });
                }
        
                function insertFileApi(data,callback){
                    $.ajax({
                        url: "upload.co",
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
        </main>
        <%@ include file="../commons/footer.jsp" %>
    </div>
</body>
</html>