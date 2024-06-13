<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
    <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerCSS/managerSellerProductApplication.css">

	<!-- javaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/managerJS/managerSellerProductApplication.js"></script>
   
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="header.jsp" %>
        
        <main>
            <!-- sidebar -->
            <%@ include file="sidebar.jsp" %>

            <div id="managerSellerProductApplication-info-area">
                <div id="manager-sidebar-category-select-title"><h3>신고상품 목록</h3></div>

                <div id="search-title"><b>검색</b></div>
                <form id="search-form" action="searchSellerProductApplication.ma">
                    <input type="hidden" name="cpage" value="1">
                    <input type="hidden" name="categoryName" value="seller">
                    <div id="search-condition-area">
                        <table>
                            <tr>
                                <th>검색어</th>
                                <td>
                                    <select name="searchType" id="">
                                        <option value="store_name">상점명</option>
                                        <option value="p_title">상품명</option>
                                    </select>
                                    <input id="search-bar" type="text" name="searchKeyword">
                                </td>
                            </tr>
                            <tr>
                                <th>신청일시</th>
                                <td>
                                    <input class="date-search-bar" type="date" id="start-date" name="startDate" onchange="syncDate()">
                                    -
                                    <input class="date-search-bar" type="date" id="end-date" name="endDate" readonly>
                                </td>
                            </tr>
                        </table>
                        <div id="search-btn-area">
                            <button type="submit" onclick="submitForm()">검색</button>
                            <button type="reset">초기화</button>
                        </div>
                    </div>
                </form>

                <div id="search-result-list-area">
                    <div id="total-store"><b>총 신고상품 수 : ${sellerProductApplicationCount}</b></div> <!-- 총 신규신청 수 가져오기-->
                    <div id="search-result-list">
                        <table>
                            <thead>
                                <th>
                                    <input type="checkbox" class="all-checkbox" onclick="clickAllCheckboxes()">
                                </th>
                                <th>회원명</th>
                                <th>상점명</th>
                                <th>상품명</th>
                                <th>판매가</th>
                                <th>판매수량</th>
                                <th>카테고리</th>
                                <th>신고일시</th>
                                <th>상세정보</th>
                            </thead>
                            <tbody>
                                <c:forEach var="spa" items="${sellerProductApplicationList}">
                                    <tr>
                                        <td>
                                            <input type="checkbox" class="checkbox">
                                        </td>
                                        <td>${spa.userName}</td>
                                        <td>${spa.storeName}</td>
                                        <td>${spa.pdTitle}</td>
                                        <td>${spa.pdPrice}</td>
                                        <td>${spa.pdCount}</td>
                                        <td>${spa.pdCategory}</td>
                                        <td>${spa.pdEnrollDate}</td>
                                        <td>
                                            <button type="button" class="application-approve-btn">승인</button>
                                        </td>
                                    </tr>
                                </c:forEach>

                            </tbody>
                        </table>
                    </div>

                    <c:forEach var="spa" items="${sellerProductApplicationList}">
                        <div class="seller-info-modal">
                            <div class="seller-info-modal-content">
                                <h3>신고상품 상세</h3>
                                <table>
                                    <tr>
                                        <th>상품번호</th> <!-- product 테이블의  p_no 컬럼의 값 -->
                                        <td class="pdOptionNo">${spa.pdOptionNo}</td>
                                    </tr>
                                    <tr>
                                        <th>회원명</th>
                                        <td>${spa.userName}</td>
                                    </tr>
                                    <tr>
                                        <th>상점명</th>
                                        <td>${spa.storeName}</td>
                                    </tr>
                                    <tr>
                                        <th>상품명</th>
                                        <td>${spa.pdTitle}</td>
                                    </tr>
                                    <tr>
                                        <th>상품내용</th>
                                        <td>${spa.pdContent}</td>
                                    </tr>
                                    <tr>
                                        <th>카테고리</th>
                                        <td>${spa.pdCategory}</td> 
                                    </tr>
                                    <tr>
                                        <th>상품갯수</th>
                                        <td>${spa.pdCount}</td>
                                    </tr>
                                    <tr>
                                        <th>신청일자</th>
                                        <td>${spa.pdEnrollDate}</td>
                                    </tr>
                                    <tr>
                                        <th>별점</th>
                                        <td>${spa.pdStar}</td>
                                    </tr>
                                    <tr>
                                        <th>신고한 회원</th>
                                        <td>${spa.userId}</td>
                                    </tr>
                                    <tr>
                                        <th>신고 내용</th>
                                        <td>${spa.reportContent}</td>
                                    </tr>
                                </table>

                                <div class="approve-btn-area">
                                    <button type="button" class="approve-btn">승인</button>
                                    <button type="button" class="close-btn">닫기</button>
                                </div>
                                
                            </div>
                        </div>
                    </c:forEach>

                    <div id="select-btn-area">
                        <button>선택삭제</button>
                        <button onclick="selectApprove()">선택승인</button>
                    </div>

                    <!-- 페이징 처리 -->
                    <div id="pagination-div">
                        <ul class="pagination">
                            <c:choose>
                                <c:when test="${ pi.currentPage eq 1 }">
                                    <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="sellerProductApplication.ma?cpage=${pi.currentPage - 1}&categoryName=seller">&laquo;</a></li>
                                </c:otherwise>
                        </c:choose>
                    
                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                            <c:choose>
                                <c:when test="${empty searchKeyword && not empty startDate}"> <!-- 날짜 값만 입력하고 검색했을 때 -->
                                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="searchSellerProductApplication.ma?cpage=${p}&categoryName=seller&searchType=&searchKeyword=&startDate=${startDate}&endDate=${endDate}">${p}</a></li>
                                </c:when>
                                <c:when test="${not empty searchKeyword && empty startDate}"> <!-- 검색어만 입력하고 검색했을 때 -->
                                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="searchSellerProductApplication.ma?cpage=${p}&categoryName=seller&searchType=${searchType}&searchKeyword=${searchKeyword}&startDate=&endDate=">${p}</a></li>
                                </c:when>
                                <c:when test="${not empty searchKeyword && not empty startDate}"> <!-- 검색어, 날짜 둘다 입력하고 검색했을 때 -->
                                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="searchSellerProductApplication.ma?cpage=${p}&categoryName=seller&searchType=${searchType}&searchKeyword=${searchKeyword}&startDate=${startDate}&endDate=${endDate}">${p}</a></li>
                                </c:when>
                                <c:otherwise>   <!-- 헤더바나 사이드바에 있는 회원관리 눌렀을때 || 검색값 없이 검색 눌렀을 때 -->
                                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="sellerProductApplication.ma?cpage=${p}&categoryName=seller">${p}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        
                        <c:choose>
                            <c:when test="${ pi.currentPage eq pi.maxPage }">
                                <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="sellerProductApplication.ma?cpage=${pi.currentPage + 1}&categoryName=seller">&raquo;</a></li>
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