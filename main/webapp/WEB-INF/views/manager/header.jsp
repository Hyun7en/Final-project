<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
 <title>adminMenubar</title>

    <!-- css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerCSS/header.css">

</head>
<body>
    <header>
        <div id="adminMenubar-logo">
            <h1><a href="home.ma">Aquaqu</a></h1>
            <div id="adminMenubar-link">
                <ul>
                    <li>
                        <a href="">스토어</a>
                    </li>
                    <li>
                        <a href="main.ma">관리자 홈</a>
                    </li>
                    <li id="adminMenubar-logout">
                        <a id="logout" href="logout.me">로그아웃</a>
                    </li>
                </ul>
            </div>
        </div>
        <nav>
            <div>
                <a href="memberList.ma?cpage=1&categoryName=member">회원 관리</a>
            </div>
            <div>
                <a href="sellerList.ma?cpage=1&categoryName=seller">판매자 관리</a>
            </div>    
            <div>
                <a href="boardList.ma?cpage=1&categoryName=board">게시판 관리</a>
            </div>
            <div>
                <a href="">혜택 관리</a>
            </div>
            <div>
                <a href="customerOnetoOne.ma?categoryName=customer">고객지원</a>
            </div>
            <div>
                <a href="">설정</a>
            </div>
        </nav>
    </header>
</body>
</html>