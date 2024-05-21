<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
                        <div id="myPage-sidebar-profile-nickName"><b>${loginUser.nickName}홍길동</b>님 환영합니다.</div>
                    </div>
                    <div id="myPage-category-area">
                        <div class="myPage-category"><a style="color: #0089FF;" href="">내 정보</a></div>
                        <div class="myPage-category"><a href="">관심 상품</a></div>
                        <div class="myPage-category"><a href="">주문 내역</a></div>
                        <div class="myPage-category"><a href="">작성한 글</a></div>
                        <div class="myPage-category"><a href="">장바구니</a></div>
                        <div class="myPage-category"><a href="">1:1 문의</a></div>
                        <div class="myPage-category"><a href="">판매자 신청</a></div>
                    </div>
                </div>
                <div id="myPageInfo-info-area">
                    <form action="">
                        <div id="myPageInfo-siteInfo-area">
                            <div id="myPageInfo-siteInfo-profile">
                                <div id="myPage-category-title">
                                    <b>내정보</b>
                                </div>
                                <div id="myPageInfo-siteInfo-profile-img">
                                    <img src="https://previews.123rf.com/images/ann24precious/ann24precious1602/ann24precious160200015/53140153-%EA%B7%80%EC%97%AC%EC%9A%B4-%EB%AC%BC%EA%B3%A0%EA%B8%B0.jpg" alt="">
                                </div>
                                <div id="myPageInfo-siteInfo-profile-edit">
                                    <button>프로필 편집</button>
                                </div>
                            </div>
                            <div id="myPageInfo-siteInfo">
                                <table>
                                    <tr>
                                        <th>닉네임</th>
                                        <td><input type="text" placeholder="${loginUser.nickName}홍길동"></td>
                                    </tr>
                                    <tr>
                                        <th>레벨</th>
                                        <td>${loginUser.level}5</td>
                                    </tr>
                                    <tr>
                                        <th>한줄소개</th>
                                        <td><input type="text" placeholder="${loginUser.intro}안녕하세요. 잘 부탁드리겠습니다."></td>
                                    </tr>
                                </table>
                            </div>
                        </div>

                        <div id="myPageInfo-privacy-area">
                            <table>
                                <tr>
                                    <th>아이디</th>
                                    <td><input type="text" placeholder="${loginUser.id}race123"></td>
                                </tr>
                                <tr>
                                    <th>비밀번호</th>
                                    <td><input type="text" placeholder="${loginUser.password}******"></td>
                                </tr>
                                <tr>
                                    <th>성별</th>
                                    <td><input type="text" placeholder="${loginUser.gender}남"></td>
                                </tr>
                                <tr>
                                    <th>연락처</th>
                                    <td><input type="text" placeholder="${loginUser.phone}010-111-222"></td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td><input type="text" placeholder="${loginUser.email}race123@naver.com"></td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td><input type="text" placeholder="${loginUser.address}경기도 안양시"></td>
                                </tr>
                            </table>
                            <div id="myPageInfo-privacy-button-area">
                                <button>정보수정</button>
                                <button>회원탙퇴</button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </main>          
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %> 
     </div>
</body>
</html>