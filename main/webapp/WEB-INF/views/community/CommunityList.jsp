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