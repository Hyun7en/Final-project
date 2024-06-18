<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 전체 목록</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerCSS/managerCustomerOutlist.css">

</head>
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="header.jsp" %>
        
        <main>
            <!-- sidebar -->
            <%@ include file="sidebar.jsp" %>
                
            <div id="managerOutlist">
                <div id="managerOutlist-title"><h3>1:1문의</h3></div>
                <div id="managerOutlist-subtitle"><b>검색</b></div>
                <form id="search-form" action="searchedOutlist.ma?" method="get">
                    <div id="managerOutlist-1sttable">
                        <input type="hidden" name="categoryName" value="customer">
                        <table>
                            <tr>
                                <th>검색어</th>
                                <td>    
                                    <select name="condition" id="admin-board-category">
                                        <option value="id">아이디</option>
                                        <option value="name">회원명</option>
                                    </select>
                                    <input type="text" name="keyword">
                                </td>
                            </tr>
                        </table>
                        <div>
                            <button type="submit" style="width: 60px;">검색</button>
                            <button type="reset" style="width: 75px;">초기화</button>
                        </div>
                    </div>
                </form>

                <div id="managerOutlist-2nd">
                    <div id="total-Outlist"><b>총 탈퇴회원 수 : ${outCount}</b></div>
                    <div id="managerOutlist-2ndtable">
                        <table>
                            <tr id="admin-2ndtable-head">
                                <th style="width: 10%;">번호</th>
                                <th style="width: 20%;">회원명</th>
                                <th style="width: 20%;">아이디</th>
                                <th style="width: 30%;">이메일</th>
                                <th style="width: 20%;">탈퇴일시</th>
                            </tr>
                            <c:choose>
                                <c:when test="${empty olist}">
                                    <tr>
                                        <td colspan="5">검색 결과가 존재하지 않습니다.</td>
                                    </tr>
                                </c:when>
                                <c:otherwise>
                                    <c:forEach var="ol" items="${olist}">
                                        <tr>
                                            <td>${ol.userNo}</td>
                                            <td>${ol.userName}</td>
                                            <td>${ol.userId}</td>
                                            <td>${ol.email}</td>
                                            <td>${ol.dropDate}</td>
                                        </tr>
                                    </c:forEach>
                                </c:otherwise>
                            </c:choose>
                        </table>
                    </div>
                    <div id="pageList-area">
                        <div class="pageList" align="center">
                            <ul class="pagination">
                                <c:choose>
                                    <c:when test="${ pi.currentPage eq 1 }">
                                        <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link" href="customerOutlist.ma?categoryName=customer&cpage=${pi.currentPage - 1}">&laquo;</a></li>
                                    </c:otherwise>
                                </c:choose>
                        
                                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                    <c:set var="b" value="${boardLevel}"/>
                                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="customerOutlist.ma?categoryName=customer&cpage=${p}">${p}</a></li>
                                </c:forEach>
                            
                                <c:choose>
                                    <c:when test="${ pi.currentPage eq pi.maxPage }">
                                        <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link" href="customerOutlist.ma?categoryName=customer&cpage=${pi.currentPage + 1}">&raquo;</a></li>
                                    </c:otherwise>
                                </c:choose>
                            </ul>
                        </div>
                    </div>
                </div>
                </div>
            </div>
        </main>
     </div>
</body>
</html>