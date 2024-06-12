<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerCSS/managerSellerProductApplication.css">

	
   
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="header.jsp" %>
        
        <main>
            <!-- sidebar -->
            <%@ include file="sidebar.jsp" %>

            <div id="managerSellerProductApplication-info-area">
                <div id="manager-sidebar-category-select-title"><h3>판매자 상품신청</h3></div>

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
                    <div id="total-store"><b>총 상품신청 수 : ${sellerProductApplicationCount}</b></div> <!-- 총 신규신청 수 가져오기-->
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
                                <th>신청일시</th>
                                <th>승인</th>
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
                                <h3>판매자 신규신청 상세</h3>
                                <table>
                                    <tr>
                                        <th>상품번호</th> <!-- product_option 테이블의  p_no 컬럼의 값 -->
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
                                        <th>옵션명</th>
                                        <td>${spa.pdOptionName}</td>
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
     <script>
        $(document).ready(function(){

            // 판매자 상품신청을 승인하기 위해 버튼 눌렀을 때
            $(".application-approve-btn").click(function(){
                var index = $(this).closest("tr").index(); // 클릭된 버튼이 있는 행의 인덱스 가져오기
                var modal = $(".seller-info-modal").eq(index); // 해당 인덱스의 모달 찾기
                modal.css("display", "flex"); // 모달 표시

                // 승인하기 버튼 눌렀을 때
                modal.find(".approve-btn").click(function(){
                    var pdOptionNo = modal.find(".pdOptionNo").text(); // 해당 모달안의 class이름이 pdNo인 태그안의 text 가져옴
                    console.log(pdOptionNo);
                    location.href="sellerProductApplicationApprove.ma?pdOptionNo=" + pdOptionNo;
                })

                // 닫기 버튼 눌렀을 때
                modal.find(".close-btn").click(function(){
                    modal.css("display", "none"); // 모달 숨김
                })
            });
            });

            // 시작 날짜 선택했을 때
            function syncDate(){
                var startDate = document.getElementById("start-date").value;
                var endDate = document.getElementById("end-date");
                endDate.value = startDate; // 시작 날짜를 선택했을 때 끝 날짜도 자동으로 시작 날짜로 변경(시작날짜만 선택하고 검색하는것을 방지)
                endDate.readOnly = false; // 시작 날짜를 선택해야 끝 날짜를 선택할 수 있음(끝 날짜 먼저 선택 불가)
            }

            // 검색 버튼 눌렀을 떄
            function submitForm() {
                var searchKeyword = document.getElementById("search-bar").value;
                var startDate = document.getElementById("start-date").value
                if (searchKeyword.trim() === "" && startDate.trim() === "") { // 검색값이 공백인지 확인
                    document.getElementById('search-form').action = 'sellerProductApplication.ma'; // 값이 없을 경우 sellerProductApplication.ma로 변경
                }
            }

            // 전체 체크박스 눌렀을 때
            function clickAllCheckboxes() {
                var checkboxes = document.querySelectorAll(".checkbox");    // 전체 체크박스 가져옴
                var allCheckbox = document.querySelector('.all-checkbox');  // 전체선택 체크박스 가져옴

                checkboxes.forEach(function(checkbox) {         // 전체 체크박스 forEach반복문으로 기능 수행
                    checkbox.checked = allCheckbox.checked;     // 전체선택 체크박스에 checked된 값을 checkbox에 대입 
                });
            }

            // 선택승인 버튼 눌렀을 때
            function selectApprove(){
                var checkboxes = document.querySelectorAll('.checkbox:checked');  // 체크된 체크박스들 가져오기
                console.log(checkboxes);
                checkboxes.forEach(function(checkbox) {     // 체크된 체크박스 하나씩 기능 수행시키기
                    var index = $(checkbox).closest("tr").index();  // 체크된 체크박스 행의 인덱스 가져오기
                    console.log(index);
                    var modal = $(".seller-info-modal").eq(index);  // 해당 인덱스의 모달 가져오기(리스트(행)에는 userNo이 없고 모달에 userNo이 있어 모달 가져옴)
                    console.log(modal);
                    var pdOptionNo = modal.find(".pdOptionNo").text();      // 해당 모달안의 class이름이 userNo인 태그안의 값 가져옴
                    console.log(pdOptionNo);
                    location.href="sellerProductApplicationApprove.ma?pdOptionNo=" + pdOptionNo;
                });
            }
     </script>
</body>
</html>