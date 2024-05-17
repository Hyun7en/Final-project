<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
                    <a href="#">로그인</a>
                    <a href="#">회원가입</a>
                </div>
            </div>

            <nav>
                <a href="#">홈</a>
                <a href="#">물고기 정보</a>
                <a href="#">물고기 큐레이터</a>
                <a href="#">커뮤니티</a>
                <a href="#">스토어</a>
            </nav>
        </header>
</body>
</html>