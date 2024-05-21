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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/communityCSS/communityList.css">

</head>
<body>
    <div id="wrap">
        <%@ include file="../commons/header.jsp" %>
        <main id="community-normal">
            <div id="com-head">
                커뮤니티
            </div>
            <!-- windows.onload 스크립트로 session에 저장된 value값을 불러온 뒤, value 값이 일치하는 button에 id="com-nav-selected" 부여-->
            <div id="com-nav">
                    <ul>
                        <li><button class="com-nav-0" onclick="boCategory(0)" style="border-radius: 10px 0 0 10px;">일반</button></li>
                        <li><button class="com-nav-10" onclick="boCategory(10)" id="com-nav-selected" value="10">꿀팁</button></li>
                        <li><button class="com-nav-20" onclick="boCategory(20)" value="20">질문</button></li>
                        <li><button class="com-nav-30" onclick="boCategory(30)" value="30" style="border-radius: 0 10px 10px 0;">중고거래</button></li>
                    </ul>
            </div>
            <script>
                function boCategory(category){
                    if(category === 0){ // 카테고리 번호 0 = 일반 버튼 누름
                        location.href = "communityNorm.jsp"; // 일반 게시판 페이지로 이동
                    }else{ // 카테고리 번호 10~30 = 일반 이외의 3가지 게시판 버튼 중 하나를 누름
                        //session에 value 값 저장
                        location.href = "communityCategory.jsp?category=" + category; // 해당 게시판 페이지로 이동
                    }
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
                <tbody id="com-list-body">
                    <td>10</td>
                    <td><a href="">아쿠아프라자 다녀온 후기</a></td>
                    <td>이야후</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>9</td>
                    <td><a href="">드립 칠 제목도 생각이 안 난다</a></td>
                    <td>할렐루야</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>8</td>
                    <td><a href="">액퍼 커뮤니티 사이트인 줄 알았는데</a></td>
                    <td>비바</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>7</td>
                    <td><a href="">낚시 관련 커뮤니티 사이트가 아니라고?</a></td>
                    <td>오예</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>6</td>
                    <td><a href="">제목 뭐 하지</a></td>
                    <td>지저스</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>5</td>
                    <td><a href="">첫 관상어 소개</a></td>
                    <td>왓더</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>4</td>
                    <td><a href="">가즈아</a></td>
                    <td>호눌룰루</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>3</td>
                    <td><a href="">몰?루</a></td>
                    <td>요시</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>2</td>
                    <td><a href="">첫 뻘글</a></td>
                    <td>아자</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-bottom">
                    <td style="border-radius: 0 0 0 10px;">1</td>
                    <td><a href="">첫 게시글</a></td>
                    <td>관리자</td>
                    <td>0000.00.00</td>
                    <td style="border-radius: 0 0 10px 0;">0</td>
                </tbody>
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
                    <button id="com-blue-button">글쓰기</button>
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