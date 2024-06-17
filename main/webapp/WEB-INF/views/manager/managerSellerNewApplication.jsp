<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 신규 신청</title>
	
    <!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

    <!-- css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerCSS/managerSellerNewApplication.css">
    
     <!-- javaScript -->
     <script src="${pageContext.request.contextPath}/resources/js/managerJS/managerSellerNewApplication.js"></script>

<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="header.jsp" %>
        
        <main>
            <!-- sidebar -->
            <%@ include file="sidebar.jsp" %>

            <div id="managerSellerNewApplication-info-area">
                <div id="manager-sidebar-category-select-title"><h3>판매자 신규신청</h3></div>

                <div id="search-title"><b>검색</b></div>
                <form id="search-form" action="searchSellerNewApplication.ma">
                    <input type="hidden" name="cpage" value="1">
                    <input type="hidden" name="categoryName" value="seller">
                    <div id="search-condition-area">
                        <table>
                            <tr>
                                <th>검색어</th>
                                <td>
                                    <select name="searchType" id="">
                                        <option value="user_id">아이디</option>
                                        <option value="user_name">회원명</option>
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
                    <div id="total-seller"><b>총 신규신청 수 : ${sellerNewApplicationCount}</b></div>
                    <div id="search-result-list">
                        <table>
                            <thead>
                                <th>
                                    <input type="checkbox" class="all-checkbox" onclick="clickAllCheckboxes()">
                                </th>
                                <th>회원명</th>
                                <th>아이디</th>
                                <th>상점 명</th>
                                <th>사업자등록번호</th>
                                <th>법인등록번호</th>
                                <th>신청일시</th>
                                <th>승인</th>
                            </thead>
                            <tbody>
                                <c:forEach var="sna" items="${sellerNewApplicationList}">
                                    <tr>
                                        <td><input type="checkbox" class="checkbox"></td>
                                        <td>${sna.userName}</td>
                                        <td>${sna.userId}</td>
                                        <td>${sna.storeName}</td>
                                        <td>${sna.businessNo}</td>
                                        <td>${sna.crn}</td>
                                        <td>${sna.applicationDate}</td>
                                        <td>
                                            <button type="button" class="application-approve-btn">승인</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <c:forEach var="sna" items="${sellerNewApplicationList}">
                        <div class="seller-info-modal">
                            <div class="seller-info-modal-content">
                                <h3>판매자 신규신청 상세</h3>
                                <table>
                                    <tr>
                                        <th>회원 번호</th>
                                        <td class="userNo">${sna.userNo}</td>
                                    </tr>
                                    <tr>
                                        <th>이름</th>
                                        <td>${sna.userName}</td>
                                    </tr>
                                    <tr>
                                        <th>아이디</th>
                                        <td>${sna.userId}</td>
                                    </tr>
                                    <tr>
                                        <th>사업자등록번호</th>
                                        <td>${sna.businessNo}</td>
                                    </tr>
                                    <tr>
                                        <th>대표자성명</th>
                                        <td>${sna.businessName}</td>
                                    </tr>
                                    <tr>
                                        <th>대표자성명2</th>
                                        <td>${sna.subBusinessName}</td> 
                                    </tr>
                                    <tr>
                                        <th>개업일자</th>
                                        <td>${sna.openBusinessDate}</td>
                                    </tr>
                                    <tr>
                                        <th>상호</th>
                                        <td>${sna.storeName}</td>
                                    </tr>
                                    <tr>
                                        <th>법인등록번호</th>
                                        <td>${sna.crn}</td>
                                    </tr>
                                    <tr>
                                        <th>주 업태명</th>
                                        <td>${sna.mainBusinessName}</td>
                                    </tr>
                                    <tr>
                                        <th>주 종목명</th>
                                        <td>${sna.mainItemName}</td>
                                    </tr>
                                    <tr>
                                        <th>사업장주소</th>
                                        <td>${sna.businessAddress}</td>
                                    </tr>
                                    <tr>
                                        <th>정산대금<hr>입금계좌</th>
                                        <td>${sna.businessAccount}</td>
                                    </tr>
                                </table>

                                <div class="approve-btn-area">
                                    <button type="button" class="approve-btn">신청 승인</button>
                                    <button type="button" class="reject-btn">신청 거부</button>
                                    <button type="button" class="close-btn">닫기</button>
                                </div>
                                
                            </div>
                        </div>
                    </c:forEach>

                    <div id="select-btn-area">
                        <button onclick="selectApplicationReject()">선택 신청거부</button>
                        <button onclick="selectApplicationApprove()">선택 신청승인</button>
                    </div>
                    
                    <!-- 페이징 처리 -->
                    <div id="pagination-div">
                        <ul class="pagination">
                            <c:choose>
                                <c:when test="${ pi.currentPage eq 1 }">
                                    <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="sellerNewApplication.ma?cpage=${pi.currentPage - 1}&categoryName=seller">&laquo;</a></li>
                                </c:otherwise>
                        </c:choose>
                    
                        <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                            <c:choose>
                                <c:when test="${empty searchKeyword && not empty startDate}"> <!-- 날짜 값만 입력하고 검색했을 때 -->
                                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="searchSellerNewApplication.ma?cpage=${p}&categoryName=seller&searchType=&searchKeyword=&startDate=${startDate}&endDate=${endDate}">${p}</a></li>
                                </c:when>
                                <c:when test="${not empty searchKeyword && empty startDate}"> <!-- 검색어만 입력하고 검색했을 때 -->
                                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="searchSellerNewApplication.ma?cpage=${p}&categoryName=seller&searchType=${searchType}&searchKeyword=${searchKeyword}&startDate=&endDate=">${p}</a></li>
                                </c:when>
                                <c:when test="${not empty searchKeyword && not empty startDate}"> <!-- 검색어, 날짜 둘다 입력하고 검색했을 때 -->
                                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="searchSellerNewApplication.ma?cpage=${p}&categoryName=seller&searchType=${searchType}&searchKeyword=${searchKeyword}&startDate=${startDate}&endDate=${endDate}">${p}</a></li>
                                </c:when>
                                <c:otherwise>   <!-- 헤더바나 사이드바에 있는 회원관리 눌렀을때 || 검색값 없이 검색 눌렀을 때 -->
                                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="sellerNewApplication.ma?cpage=${p}&categoryName=seller">${p}</a></li>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                        
                        <c:choose>
                            <c:when test="${ pi.currentPage eq pi.maxPage }">
                                <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="sellerNewApplication.ma?cpage=${pi.currentPage + 1}&categoryName=seller">&raquo;</a></li>
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