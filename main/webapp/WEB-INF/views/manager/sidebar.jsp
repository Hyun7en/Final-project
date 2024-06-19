<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>adminMenubar</title>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerCSS/sidebar.css">

    <style>

    </style>
</head>
<body>

    <div id="adminSide">
        <div id="side-header">
            <c:choose>
                <c:when test="${categoryName eq 'member'}">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVNGTT7tfDUT76FU0F7fjghG_3s1-xlCwrjc9CaCrCmw&s" alt="카테고리 관리 아이콘">
                    <div><p>회원 관리</p></div>
                </c:when>
                <c:when test="${categoryName eq 'seller'}">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVNGTT7tfDUT76FU0F7fjghG_3s1-xlCwrjc9CaCrCmw&s" alt="카테고리 관리 아이콘">
                    <div><p>판매자 관리</p></div>
                </c:when>
                <c:when test="${categoryName eq 'category'}">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQVNGTT7tfDUT76FU0F7fjghG_3s1-xlCwrjc9CaCrCmw&s" alt="카테고리 관리 아이콘">
                    <div><p>카테고리 관리</p></div>
                </c:when>
                <c:when test="${categoryName eq 'customer'}">
                    <img src="${pageContext.request.contextPath}/resources/image/icon_help.png" alt="카테고리 관리 아이콘">
                    <div><p>고객지원</p></div>
                </c:when>
            </c:choose>
        </div>

        <div id="side-list">
            <c:choose>
                <c:when test="${categoryName eq 'member'}">
                    <div id="side-list-head">회원 관리</div>
                    <div class="select" id="side-list-selected1"><a href="memberList.ma?cpage=1&categoryName=member">회원 정보관리</a></div>
                    <div class="select" id="side-list-selected2"><a href="memberLevel.ma?cpage=1&categoryName=member">회원 레벨 관리</a></div>
                </c:when>
                <c:when test="${categoryName eq 'seller'}">
                    <div id="side-list-head">판매자 관리</div>
                    <div class="select" id="side-list-selected1"><a href="sellerList.ma?cpage=1&categoryName=seller">판매자 전체목록</a></div>
                    <div class="select" id="side-list-selected2"><a href="sellerNewApplication.ma?cpage=1&categoryName=seller">판매자 신규신청</a></div>
                    <div class="select" id="side-list-selected3"><a href="reportProductList.ma?cpage=1&categoryName=seller">신고상품 목록</a></div>
                </c:when>
                <c:when test="${categoryName eq 'category'}">
                    
                
                
                
                </c:when>
                <c:when test="${categoryName eq 'customer'}">
                    <div id="side-list-head">고객지원</div>
                    <div class="select" id="side-list-selected1"><a href="customerOnetoOne.ma?categoryName=customer">1:1문의</a></div>
                    <div class="select" id="side-list-selected2"><a href="customerOutlist.ma?categoryName=customer">회원 탈퇴내역</a></div>
                </c:when>
            </c:choose>


        </div>
    </div>
    
</body>
</html>