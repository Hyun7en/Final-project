<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- alertify -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/communityCSS/communityEdit.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/communityJS/communityEdit.js"></script>
    
</head>
<body onload="init('communityEdit', `${pageContext.request.contextPath}`, {boardLevel : `${c.boardLevel}`,boardContents : `${c.boardContents}`})">
    <div id="wrap">
        <%@ include file="../commons/header.jsp" %>
        <main id="community-normal">
            <div id="com-head">
                글쓰기
            </div>
            <form method="post" action="update.co">
                <input type="hidden" name="boardNo" value="${c.boardNo}">
                <input type="hidden" name="userNo" value="${loginUser.userNo}">
                <input type="hidden" name="recentPath" value="${recentPath}">
                <div id="com-edit-top">
                    <div>
                        게시판
                    </div>
                    <select name="boardLevel">
                        <option class="com-category" value="0">일반</option>
                        <option class="com-category" value="1">꿀팁</option>
                        <option class="com-category" value="2">질문</option>
                        <option class="com-category" value="3">중고거래</option>
                    </select>
                </div>
                <div id="com-edit-middle">
                    <div>
                        제목
                    </div>
                    <input type="text" name="boardTitle" maxlength="33" required value="${c.boardTitle}">
                </div>
                <div id="com-edit-content">
                    <textarea name="boardContents" id="com-edit-content-p"></textarea>
                </div>
                <div id="com-edit-bottom">
                    <input type="button" id="com-grey-button" onclick="window.history.back()" value="취소">
                    <button type="submit" id="com-blue-button">수정</button>
                </div>
            </form>

        </main>
        <%@ include file="../commons/footer.jsp" %>
    </div>
</body>
</html>