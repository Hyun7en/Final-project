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

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/communityCSS/communityDetail.css">

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/communityCSS/communityList.css">


<style>
    

</style>
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
                        <li><button style="background-color: #0089FF; color: white; border: 0px; border-radius: 10px 0 0 10px;">일반</button></li>
                        <li><button>꿀팁</button></li>
                        <li><button>질문</button></li>
                        <li><button style="border-radius: 0 10px 10px 0;">중고거래</button></li>
                    </ul>
            </div>
            <div id="com-detail">
                <div id="com-detail-head">
                    <div id="com-detail-title">
                    첫 관상어 소개
                    </div>
                    <div id="com-detail-good">
                    추천 수 | 9
                    </div>
                </div>
                <div id="com-detail-info">
                    <ul class="com-writer">왓더</ul>
                    <ul class="com-enrolldate">작성일 | 0000.00.00</ul>
                </div>
                <div id="com-detail-content">
                    <p>
                        미안하다 이거 보여주려고 어그로끌었다..(이하생략)
                    </p>
                </div>
                <div id="com-detail-goodarea">
                    <div id="com-detail-goodbutton">
                        <img src="${pageContext.request.contextPath}/resources/image/good.png" alt="추천 버튼" style="width: 30px; height: 30px;">
                    </div>
                    <div id="com-detail-goodcount">
                        9 
                    </div>
                </div>
                <table id="com-reply">
                    <thead>
                        <th id="com-reply-blank"></th>
                        <th colspan="3" style="width: 800px;">댓글</th>
                        <th id="com-reply-blank"></th>
                    </thead>
                    <tbody id="com-reply-info">
                        <td id="com-reply-blank"></td>
                        <td id="com-reply-writer">지저스</td>
                        <td id="com-reply-enrolldate">작성일 | 0000.00.00</td>
                        <td id="com-reply-edit">
                            <img src="${pageContext.request.contextPath}/resources/image/Edit.png" alt="댓글 수정 이미지">
                            <img src="${pageContext.request.contextPath}/resources/image/Cancel.png" alt="댓글 삭제 이미지">
                        </td>
                        <td id="com-reply-blank"></td>
                    </tbody>
                    <tbody id="com-reply-content">
                        <td id="com-reply-goodbutton"><img src="${pageContext.request.contextPath}/resources/image/good.png" alt="추천 버튼" style="width: 30px; height: 30px;"></td>
                        <td colspan="3" id="com-reply-words">
                            <p>
                            젠장, 또 대상혁이야. 이 글만 보고 자려고 했는데, 대상혁을 보고 말았어. 이제 나는 숭배해야만 해...
                            숭배를 시작하면 잠이 확 깨 버릴 걸 알면서도, 나는 숭배해야만 해. 그것이 대상혁을 목도한 자의 사명이다. 자, 숭배를 시작하겠어.
                            </p>
                        </td>
                        
                        <td id="com-reply-blank"></td>
                    </tbody>
                </table>
                <div id="com-reply-insert">
                    <div>
                        <textarea style="resize: none;"></textarea>
                    </div>
                    <div>
                        <button id="com-reply-button">등록하기</button>
                    </div>
                </div>
                <div id="com-detail-bottom">
                    <button id="com-blue-button">수정</button>
                    <button id="com-grey-button">삭제</button>
                </div>
            </div>
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
                    <td>아쿠아프라자 다녀온 후기</td>
                    <td>이야후</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>9</td>
                    <td>드립 칠 제목도 생각이 안 난다</td>
                    <td>할렐루야</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>8</td>
                    <td>액퍼 커뮤니티 사이트인 줄 알았는데</td>
                    <td>비바</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>7</td>
                    <td>낚시 관련 커뮤니티 사이트가 아니라고?</td>
                    <td>오예</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>6</td>
                    <td>제목 뭐 하지</td>
                    <td>지저스</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>5</td>
                    <td style="font-weight: bold;">첫 관상어 소개</td>
                    <td>왓더</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>4</td>
                    <td>가즈아</td>
                    <td>호눌룰루</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>3</td>
                    <td>몰?루</td>
                    <td>요시</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>2</td>
                    <td>첫 뻘글</td>
                    <td>아자</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-bottom">
                    <td style="border-radius: 0 0 0 10px;">1</td>
                    <td>첫 게시글</td>
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
                <div class="com-bottom-right">
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