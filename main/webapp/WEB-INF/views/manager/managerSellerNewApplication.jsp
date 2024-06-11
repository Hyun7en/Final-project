<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 신규 신청</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerCSS/managerSellerNewApplication.css">
    


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
                    <div id="total-seller"><b>총 신규신청 수 : ${fn:length(sellerNewApplicationList)}</b></div>
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
     
     <script>

        $(document).ready(function(){

            // 판매자 신규신청을 승인하기 위해 버튼 눌렀을 때
            $(".application-approve-btn").click(function(){
                var index = $(this).closest("tr").index(); // 클릭된 버튼이 있는 행의 인덱스 가져오기
                var modal = $(".seller-info-modal").eq(index); // 해당 인덱스의 모달 찾기
                modal.css("display", "flex"); // 모달 표시

                // 승인하기 버튼 눌렀을 때
                $(".approve-btn").click(function(){
                    var userNo = modal.find(".userNo").text(); // 해당 모달안의 class이름이 userNo인 태그안의 값 가져옴
                    location.href="sellerNewApplicationApprove.ma?userNo=" + userNo;
                })

                // 닫기 버튼 눌렀을 때
                $(".close-btn").click(function(){
                    // modal.find(".change-input").val(""); // class이름이 change-input인 태그의 value값을 "" 으로 바꿈
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
                document.getElementById('search-form').action = 'sellerNewApplication.ma'; // 값이 없을 경우 memberList.ma로 변경
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
            checkboxes.forEach(function(checkbox) {     // 체크된 체크박스 하나씩 기능 수행시키기
                var index = $(checkbox).closest("tr").index();  // 체크된 체크박스 행의 인덱스 가져오기
                var modal = $(".seller-info-modal").eq(index);  // 해당 인덱스의 모달 가져오기(리스트(행)에는 userNo이 없고 모달에 userNo이 있어 모달 가져옴)
                var userNo = modal.find(".userNo").text();      // 해당 모달안의 class이름이 userNo인 태그안의 값 가져옴
                location.href="sellerNewApplicationApprove.ma?userNo=" + userNo;
            });
        }

     </script>
</body>
</html>