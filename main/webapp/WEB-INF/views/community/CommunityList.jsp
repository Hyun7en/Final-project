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

    <script src=""></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/communityCSS/communityList.css">

</head>
<body>
    <div id="wrap">
        <%@ include file="../commons/header.jsp" %>
        <main id="community-normal">
            <div id="com-head">
                커뮤니티
            </div>
            <div id="com-nav">
                    <ul>
                        <li><button class="com-nav-0" onclick="boCategory(0)" name="boardLevel" value="0" style="border-radius: 10px 0 0 10px;">일반</button></li>
                        <li><button class="com-nav-1" onclick="boCategory(1)" name="boardLevel" value="1">꿀팁</button></li>
                        <li><button class="com-nav-2" onclick="boCategory(2)" name="boardLevel" value="2">질문</button></li>
                        <li><button class="com-nav-3" onclick="boCategory(3)" name="boardLevel" value="3" style="border-radius: 0 10px 10px 0;">중고거래</button></li>
                    </ul>
            </div>
            <script>
                function boCategory(category){
                        location.href = "list.co?category=" + category;
                }
                window.onload = function() {
                    // URL에서 category 값을 추출하는 함수
                    function getCategoryFromUrl() {
                        const params = new URLSearchParams(window.location.search);
                        return params.get('category');
                    }

                    // category 값을 가져옴
                    const category = getCategoryFromUrl();

                    // category 값과 동일한 버튼에 id="com-nav-selected"를 부여
                    const button = document.querySelector(".com-nav-" + category);
                    button.id = "com-nav-selected";
                }
            </script>
            <table class="com-list">
                <thead id="com-list-header">
                    <th style="width: 60px; border-radius: 10px 0 0 0;">No</th>
                    <th style="width: 450px; background-color: bl;">제목</th>
                    <th style="width: 135px;">글쓴이</th>
                    <th style="width: 135px;">작성일</th>
                    <th style="width: 120px; border-radius: 0 10px 0 0;">조회수</th>
                </thead>
                <c:forEach var="b" items="${list}" varStatus="order">
                    <c:choose>
                        <c:when test="${order.last}">
                            <tbody id="com-list-bottom">
                                <td style="border-radius: 0 0 0 10px;">${b.boardNo}</td>
                                <td><a href="detail.co?category=${b.boardLevel}&boardNo=${b.boardNo}">${b.boardTitle}</a></td>
                                <td>${b.nickname}</td>
                                <td>${b.writeDate}</td>
                                <td style="border-radius: 0 0 10px 0;">${b.boardCount}</td>
                            </tbody>
                        </c:when>
                        <c:otherwise>
                            <tbody id="com-list-body">
                                <td>${b.boardNo}</td>
                                <td><a href="detail.co?boardNo=${b.boardNo}">${b.boardTitle}</a></td>
                                <td>${b.nickname}</td>
                                <td>${b.writeDate}</td>
                                <td>${b.boardCount}</td>
                            </tbody>
                        </c:otherwise>
                    </c:choose> 
                </c:forEach>
            </table>
            <div class="com-bottom1">
                <div class="com-bottom-left">
                    <select name="condition" id="com-condition">
                        <option value="title">제목</option>
                        <option value="writer">글쓴이</option>
                        <option value="content">내용</option>
                    </select>
                    <input type="text" name="keyword" value="" placeholder="검색어 입력">
                    <button id="com-search-button" type="submit">검색</button>
                </div>
                <div id="com-bottom-right">
                    <button onclick="location.href='enrollForm.co'" id="com-blue-button">글쓰기</button>
                </div>
            </div>
            <div class="com-bottom2">
                이전  1  2  3  4  5  6  7  8  9  10  다음
            </div>
        </main>
        <%@ include file="../commons/footer.jsp" %>
    </div>
</body>
</html>