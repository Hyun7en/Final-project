<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>

    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/header.css">
    
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/footer.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/communityCSS/communityEdit.css">
</head>
<body>
    <div id="wrap">
        <%@ include file="../commons/header.jsp" %>
        <main id="community-normal">
            <div id="com-head">
                수정
            </div>
            <div id="com-edit-top">
                <div>
                    게시판
                </div>
                <select name="category">
                    <option value="normal">일반</option>
                    <option value="tip">꿀팁</option>
                    <option value="question">질문</option>
                    <option value="trade">중고거래</option>
                </select>
            </div>
            <div id="com-edit-middle">
                <div>
                    제목
                </div>
                <input type="text" name="title">
            </div>
            <div id="com-edit-content">
                <div id="com-edit-content1">
                    <img src="${pageContext.request.contextPath}/resources/image/comimageupload.png" alt="사진 올리기">사진 올리기
                </div>
                <div id="com-edit-content2">
                    <textarea name="본문" id="com-edit-content-p" style="resize: none;"></textarea>
                </div>
                <div id="com-edit-content3">
                    <div>첨부파일</div>
                    <div id="com-edit-uploadlist"></div>
                </div>
            </div>
            <div id="com-edit-bottom">
                <button id="com-grey-button">취소</button>
                <button id="com-blue-button">수정</button>
            </div>
        </main>
        <%@ include file="../commons/footer.jsp" %>
    </div>
</body>
</html>