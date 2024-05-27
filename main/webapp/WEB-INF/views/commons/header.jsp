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

</head>
<body>
	 <header>
            <div id="Header" style="background-color: white">
                <div id="logo">
                    <p>Aquaqu</p>
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
                                recentLink.value = (window.location.pathname + window.location.search).substring(6);
                                console.log(recentLink.value);
                                recentLink.form.submit();
                            }
                        </script>
	            	</c:when>
                    
	                <c:otherwise>
                        <c:choose>
                            <c:when test="${loginUser.authority == 0}">
                                <!-- 일반 회원일 경우 로그인 후 -->
                                <label>${loginUser.userName}님 환영합니다</label> &nbsp;&nbsp;
                                <a href="myPage.me">마이페이지</a>
                                <a href="logout.me">로그아웃</a>
                            </c:when>

                            <c:when test="${loginUser.authority == 1}">
                                <!-- 판매자일 경우 로그인 후  -->
                                <label>${loginUser.userName}님 환영합니다</label> &nbsp;&nbsp;
                                <a href="myPage.me">마이페이지</a>
                                <a href="info.sr">판매자 관리 페이지</a>
                                <a href="logout.me">로그아웃</a>
                            </c:when>

                            <c:otherwise>
                                <!-- 관리자일 경우 로그인 후  -->
                                <label>${loginUser.userName}님 환영합니다</label> &nbsp;&nbsp;
                                <a href="#">관리자 페이지</a>
                                <a href="logout.me">로그아웃</a>
                            </c:otherwise>

                        </c:choose>
	                </c:otherwise>
                    
	            </c:choose>
                
                
                
                

                </div>
            </div>

            <nav>
                <a href="home.ma">홈</a>
                <a href="fishInfo.ma">물고기 정보</a>
                <a href="quration.ma">물고기 큐레이터</a>
                <a href="list.co?category=0&cpage=1">커뮤니티</a>
                <a href="storeMain.ma">스토어</a>
            </nav>
        </header>
</body>
</html>