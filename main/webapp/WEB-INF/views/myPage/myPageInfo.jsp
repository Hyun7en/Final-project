<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageCSS/myPageInfo.css">	
   
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        <main>
            <div id="myPageInfo-wrapper" >
                <div id="myPage-sidebar">
                    <div id="myPage-sidebar-profile-area">
                        <div id="myPage-sidebar-profile-img">
                            <img src="https://previews.123rf.com/images/ann24precious/ann24precious1602/ann24precious160200015/53140153-%EA%B7%80%EC%97%AC%EC%9A%B4-%EB%AC%BC%EA%B3%A0%EA%B8%B0.jpg" alt="">
                        </div>
                        <div id="myPage-sidebar-profile-nickName"><b>${myInfo.nickName}홍길동</b>님 환영합니다.</div>
                    </div>
                    <div id="myPage-category-area">
                        <div class="myPage-category"><a style="color: #0089FF;" href="myInfo.my">내 정보</a></div>
                        <div class="myPage-category"><a href="interestProduct.my">관심 상품</a></div>
                        <div class="myPage-category"><a href="orderHistory.my">주문 내역</a></div>
                        <div class="myPage-category"><a href="writePost.my">작성한 글</a></div>
                        <div class="myPage-category"><a href="cart.my">장바구니</a></div>
                        <div class="myPage-category"><a href="inquiry.my">1:1 문의</a></div>
                        <div class="myPage-category"><a href="sellerConversion.my">판매자 신청</a></div>
                    </div>
                </div>
                <div id="myPageInfo-info-area">
                    <form action="myInfo.my">
                        <div id="myPageInfo-siteInfo-area">
                            <div id="myPageInfo-siteInfo-profile">
                                <div id="myPage-category-select-title">
                                    <b>내정보</b>
                                </div>
                                <div id="myPageInfo-siteInfo-profile-img">
                                    <img src="https://previews.123rf.com/images/ann24precious/ann24precious1602/ann24precious160200015/53140153-%EA%B7%80%EC%97%AC%EC%9A%B4-%EB%AC%BC%EA%B3%A0%EA%B8%B0.jpg" alt="">
                                </div>
                                <div id="myPageInfo-siteInfo-profile-edit">
                                    <button onclick="chooseFile();">프로필 편집</button>
                                </div>
                                <div style="display: none;">
                                    <input type="file" name="file" id="file">
                                </div>
                            </div>
                            <div id="myPageInfo-siteInfo">
                                <table>
                                    <tr>
                                        <th>닉네임</th>
                                        <td><input type="text" placeholder="${myInfo.nickName}홍길동"></td>
                                    </tr>
                                    <tr>
                                        <th>레벨</th>
                                        <td>${myInfo.level}5</td>
                                    </tr>
                                    <tr>
                                        <th>한줄소개</th>
                                        <td><input type="text" placeholder="${myInfo.intro}안녕하세요. 잘 부탁드리겠습니다."></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div id="myPageInfo-privacy-area">
                            <table>
                                <tr>
                                    <th>아이디</th>
                                    <td><input type="text" placeholder="${myInfo.id}race123"></td>
                                </tr>
                                <tr>
                                    <th>비밀번호</th>
                                    <td><input type="text" placeholder="${myInfo.password}******"></td>
                                </tr>
                                <tr>
                                    <th>성별</th>
                                    <td><input type="text" placeholder="${myInfo.gender}남"></td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td><input type="text" placeholder="${myInfo.phone}010-111-222"></td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td><input type="text" placeholder="${myInfo.email}race123@naver.com"></td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td><input type="text" placeholder="${myInfo.address}경기도 안양시"></td>
                                </tr>
                            </table>
                            <div id="myPageInfo-privacy-button-area">
                                <button type="submit">정보수정</button>
                                <button onclick="location.href='deleteMember.my'">회원탙퇴</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </main>          
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %> 
     </div>

     <script>
        function chooseFile(){
            document.querySelector("#file").click();
        }
     </script>
</body>
</html>