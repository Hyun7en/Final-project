<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>작성한 글</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageCSS/myPagePost.css">

	
   
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main>
            <div id="myPagePost-wrapper">
                <div id="myPage-sidebar">
                    <div id="myPage-sidebar-profile-area">
                        <div id="myPage-sidebar-profile-img">
                            <img src="https://previews.123rf.com/images/ann24precious/ann24precious1602/ann24precious160200015/53140153-%EA%B7%80%EC%97%AC%EC%9A%B4-%EB%AC%BC%EA%B3%A0%EA%B8%B0.jpg" alt="">
                        </div>
                        <div id="myPage-sidebar-profile-nickName"><b>${loginUser.nickName}홍길동</b>님 환영합니다.</div>
                    </div>
                    <div id="myPage-category-area">
                        <div class="myPage-category"><a href="">내 정보</a></div>
                        <div class="myPage-category"><a href="">관심상품</a></div>
                        <div class="myPage-category"><a href="">주문내역</a></div>
                        <div class="myPage-category"><a style="color: #0089FF;" href="">작성한 글</a></div>
                        <div class="myPage-category"><a href="">장바구니</a></div>
                        <div class="myPage-category"><a href="">1:1 문의</a></div>
                        <div class="myPage-category"><a href="">판매자 신청</a></div>
                    </div>
                </div>
                <div id="myPagePost-info-area">
                    <div id="mypagePost-status-area">
                        <div id="ps1" class="mypagePost-status">
                            <b>일반 게시판</b>
                            <p>count 개</p>
                        </div>
                        <div id="ps2" class="mypagePost-status">
                            <b>자랑 게시판</b>
                            <p>count 개</p>
                        </div>
                        <div id="ps3" class="mypagePost-status">
                            <b>질문 게시판</b>
                            <p>count 개</p>
                        </div>
                        <div class="mypagePost-status">
                            <b>꿀팁 게시판</b>
                            <p>count 개</p>
                        </div>
                    </div>
                    <div id="myPagePost-list-area">
                        <table>
                            <thead>
                                <th width="10%">글 종류</th>
                                <th width="65%">제목</th>
                                <th width="15%">작성일</th>
                                <th width="10%">조회수</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>${board.type}일반</td>
                                    <td>${board.title}물고기를 키워보자</td>
                                    <td>${board.creatDate}2024.05.18</td>
                                    <td>${board.views}20</td>
                                </tr>
                                <tr>
                                    <td>${board.type}일반</td>
                                    <td>${board.title}물고기를 키워보자</td>
                                    <td>${board.creatDate}2024.05.18</td>
                                    <td>${board.views}20</td>
                                </tr>
                                <tr>
                                    <td>${board.type}일반</td>
                                    <td>${board.title}물고기를 키워보자</td>
                                    <td>${board.creatDate}2024.05.18</td>
                                    <td>${board.views}20</td>
                                </tr>
                            </tbody>
                        </table>
                        <div id="btnList-area">
                            <div class="btnList" align="center">
                                <button id="btn1">&lt;</button>
                                <button id="btn2">1</button>
                                <button id="btn3">&gt;</button>
                            </div> 
                        </div>
                    </div>
                </div>
            </div>
        </main>
                
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
     </div>
</body>
</html>