<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
  <!-- SweetAlert2 -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.min.css">
  <script src="https://cdnjs.cloudflare.com/ajax/libs/limonte-sweetalert2/7.2.0/sweetalert2.all.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/header.css">
    <script src="${pageContext.request.contextPath}/resources/js/commonsJS/header.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
</head>
<body onload="notification()">
	 <header>
            <div id="Header" style="background-color: white">
                <div id="logo">
                    <a href="home.ma"><p>Aquaqu</p></a>
                </div>
                <div id="searchBar">
                    <form action="">
                        
                        <input type="text" id="inputArea">
                        <input type="submit" id="inputSubmit" value="">
                    </form>
                    
                </div>
                
                <div id="loginArea">
                    <c:choose>
                        <c:when test="${empty loginUser}">
                            <!-- 로그인 전 -->
                            <form action="loginForm.me" method="post">
                                <input type="hidden" name="recentLink" id="recentLink">
                            </form>
                            <a href="javascript:void(0)" onclick="getRecentURL()" >로그인</a>
                            <a href="signUpForm.me">회원가입</a>
                            
                            <script>
                                function getRecentURL(){
                                    const recentLink = document.querySelector('#recentLink');
                                    recentLink.value = (window.location.href);
                                    recentLink.form.submit();
                                }
                            </script>
                        </c:when>
                        <c:otherwise>
                            <c:choose>
                                <c:when test="${loginUser.authority == 0}">
                                    <!-- 일반 회원일 경우 로그인 후 -->
                                    <div class="user-img">
                                        <div id="myPageInfo-profile-imgs">
                                            <a href="interestProduct.my?userNo=${loginUser.userNo}"><img style="margin-right: 15px;" src="${pageContext.request.contextPath}/resources/image/loveit.png" alt=""></a>
                                            <a href="cart.my?userNo=${loginUser.userNo}"><img style="margin-right: 15px;" src="${pageContext.request.contextPath}/resources/image/shopping.png" alt=""></a>

                                            <c:choose>
                                                <c:when test="${empty loginUser.changeName}">
                                                    <img id="profile-img" onclick="headerShow()" src="${pageContext.request.contextPath}/resources/image/user.png">
                                                </c:when>
                                                <c:otherwise>
                                                    <img id="profile-img" onclick="headerShow()" src="${loginUser.changeName}">
                                                </c:otherwise>
                                            </c:choose>
                                            <div id="click-menu">
                                                <a href="myPage.me?userNo=${loginUser.userNo}">마이페이지</a>
                                                <a href="sellerConversionPage.my?userNo=${loginUser.userNo}">판매자 전환 신청</a>
                                                <a href="logout.me">로그아웃</a>
                                            </div>
                                        </div>
                                    </div>
                                </c:when>

                                <c:when test="${loginUser.authority == 1}">
                                    <!-- 판매자일 경우 로그인 후  -->
    
                                        <div id="myPageInfo-profile-imgs">
                                            <a href="interestProduct.my?userNo=${loginUser.userNo}"><img style="margin-right: 15px;" src="${pageContext.request.contextPath}/resources/image/loveit.png" alt=""></a>
                                            <a href="cart.my?userNo=${loginUser.userNo}"><img style="margin-right: 15px;" src="${pageContext.request.contextPath}/resources/image/shopping.png" alt=""></a>

                                            <c:choose>
                                                <c:when test="${empty loginUser.changeName}">
                                                    <img id="profile-img" onclick="headerShow()" src="${pageContext.request.contextPath}/resources/image/user.png">
                                                </c:when>
                                                <c:otherwise>
                                                    <img id="profile-img" onclick="headerShow()" src="${loginUser.changeName}">
                                                </c:otherwise>
                                            </c:choose>
                                            <div id="click-menu">
                                                <a href="myPage.me?userNo=${loginUser.userNo}">마이페이지</a>
                                                <a href="info.sr">판매자 페이지</a>
                                                <a href="logout.me">로그아웃</a>
                                            </div>
                                        </div>
                                </c:when>

                                <c:otherwise>
                                    <!-- 관리자일 경우 로그인 후  -->

                                    <div id="myPageInfo-profile-imgs">
                                        <a href="interestProduct.my?userNo=${loginUser.userNo}"><img style="margin-right: 15px;" src="${pageContext.request.contextPath}/resources/image/loveit.png" alt=""></a>
                                            <a href="cart.my?userNo=${loginUser.userNo}"><img style="margin-right: 15px;" src="${pageContext.request.contextPath}/resources/image/shopping.png" alt=""></a>

                                        <c:choose>
                                            <c:when test="${empty loginUser.changeName}">
                                                <img id="profile-img" onclick="headerShow()" src="${pageContext.request.contextPath}/resources/image/user.png">
                                            </c:when>
                                            <c:otherwise>
                                                <img id="profile-img" onclick="headerShow()" src="${loginUser.changeName}">
                                            </c:otherwise>
                                        </c:choose>
                                        <div id="click-menu">
                                            <a href="myPage.me?userNo=${loginUser.userNo}">마이페이지</a>
                                            <a href="main.ma">관리자 페이지</a>
                                            <a href="logout.me">로그아웃</a>
                                        </div>
                                    </div>

                                </c:otherwise>

                            </c:choose>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>

            <nav>
                <a href="fishInfo.ma">물고기 정보</a>
                <a href="quration.ma">물고기 큐레이터</a>
                <a href="list.co?category=0&cpage=1">커뮤니티</a>
                <a href="list.spd">스토어</a>
                <a href="list.cs">고객센터</a>
            </nav>
        </header>
</body>
</html>