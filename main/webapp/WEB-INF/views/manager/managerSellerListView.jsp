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
                <form id="search-form" action="sellerSearch.ma" method="get">
                    <div id="search-condition-area">
                        <table>
                            <tr>
                                <th>검색어</th>
                                <td>
                                    <select name="condition" id="select-option">
                                        <option value="user_id">아이디</option>
                                        <option value="user_name">회원명</option>
                                    </select>
                                    <input id="search-bar" name="search" type="text">
                                </td>
                            </tr>
                            <tr>
                                <th>등록일시</th>
                                <td>
                                    <input class="date-search-bar" name="startDate" type="date">
                                    -
                                    <input class="date-search-bar" name="endDate" type="date">
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
                    <div id="total-seller"><b>총 판매자 수 : ${sellerListCount}</b></div> <!-- 총 판매자 수 가져오기-->
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

                    <!-- 페이징 처리 -->
                    <div id="pagination-div">
                        <ul class="pagination">
                            <c:choose>
                                <c:when test="${ pi.currentPage eq 1 }">
                                    <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="sellerList.ma?cpage=${pi.currentPage - 1}&categoryName=seller">&laquo;</a></li>
                                </c:otherwise>
                        </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                        <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="sellerList.ma?cpage=${p}&categoryName=seller">${p}</a></li>
                    </c:forEach>
                        
                      <c:choose>
                            <c:when test="${ pi.currentPage eq pi.maxPage }">
                                <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="sellerList.ma?cpage=${pi.currentPage + 1}&categoryName=seller">&raquo;</a></li>
                            </c:otherwise>
                        </c:choose>
                         </ul>
                    </div>

                </div>
            </div>
        </main>
     </div>
</body>
</html>