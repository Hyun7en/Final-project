<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 전체 목록</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerCSS/managerSellerListView.css">
   
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="header.jsp" %>
        
        <main>
            <!-- sidebar -->
            <%@ include file="sidebar.jsp" %>
                
            <div id="managerSellerListView-info-area">
                <div id="manager-sidebar-category-select-title"><h3>판매자 전체목록</h3></div>

                <div id="search-title"><b>검색</b></div>
                <form id="search-form" action="">
                    <div id="search-condition-area">
                        <table>
                            <tr>
                                <th>검색어</th>
                                <td>
                                    <select name="" id="">
                                        <option value="">아이디</option>
                                        <option value="">회원명</option>
                                    </select>
                                    <input id="search-bar" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th>등록일시</th>
                                <td>
                                    <input class="date-search-bar" type="date">
                                    -
                                    <input class="date-search-bar" type="date">
                                </td>
                            </tr>
                        </table>
                        <div id="search-btn-area">
                            <button>검색</button>
                            <button>초기화</button>
                        </div>
                    </div>
                </form>

                <div id="search-result-list-area">
                    <div id="total-seller"><b>총 판매자 수 : 1</b></div> <!-- 총 판매자 수 가져오기-->
                    <div id="search-result-list">
                        <table>
                            <thead>
                                <th>번호</th>
                                <th>회원명</th>
                                <th>아이디</th>
                                <th>상점명</th>
                                <th>이메일</th>
                                <th>전화번호</th>
                                <th>등록일시</th>
                                <th>상세정보</th>
                            </thead>
                            <tbody>
                                <c:choose>
                                    <c:when test="${empty sellerList}">
                                        <td align="center">판매자가 없습니다.</td>
                                    </c:when>
                                    <c:otherwise>
                                        <c:forEach var="sl" items="${sellerList}">
                                            <tr>
                                                <td></td>
                                                <td>${sl.userName}</td>
                                                <td>${sl.userId}</td>
                                                <td>${sl.storeName}</td>
                                                <td>${sl.businessNo}</td>
                                                <td>${sl.crn}</td>
                                                <td>${sl.applicationDate}</td>
                                                <td>
                                                    <button onclick="">상세정보</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>

                    <div id="pageList-area">
                        <div class="pageList" align="center">
                            <a id="a1">&lt;</a>
                            <a id="a2">1</a>
                            <a id="a3">&gt;</a>
                        </div> 
                    </div>

                </div>
            </div>
        </main>
     </div>
</body>
</html>