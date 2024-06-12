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
                <form id="search-form" action="searchSeller.ma" method="get">
                    <input type="hidden" name="cpage" value="1">
                    <input type="hidden" name="categoryName" value="seller">
                    <div id="search-condition-area">
                        <table>
                            <tr>
                                <th>검색어</th>
                                <td>
                                    <select name="searchType" id="select-option">
                                        <option value="user_id">아이디</option>
                                        <option value="user_name">회원명</option>
                                    </select>
                                    <input id="search-bar" type="text" name="searchKeyword">
                                </td>
                            </tr>
                            <tr>
                                <th>등록일시</th>
                                <td>
                                    <input class="date-search-bar" type="date" id="start-date" name="startDate" onchange="syncDate()">
                                    -
                                    <input class="date-search-bar"  type="date" id="end-date" name="endDate" readonly>
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
                                                    <button class="sellerInfo-detailView-btn">상세정보</button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                    </c:otherwise>
                                </c:choose>
                            </tbody>
                        </table>
                    </div>

                    <c:forEach var="s" items="${sellerList}">
                        <div class="sellerInfo-modal">
                            <div class="sellerInfo-modal-content">
                                <h3>회원 정보</h3>
                                <table>
                                    <tr>
                                        <th>회원번호</th>
                                        <td class="userNo">${s.userNo}</td>
                                    </tr>
                                    <tr>
                                        <th>이름</th>
                                        <td>${s.userName}</td>
                                    </tr>
                                    <tr>
                                        <th>아이디</th>
                                        <td>${s.userId}</td>
                                    </tr>
                                    <tr>
                                        <th>사업자등록번호</th>
                                        <td>${s.businessNo}</td>
                                    </tr>
                                    <tr>
                                        <th>대표자성명</th>
                                        <td>${s.businessName}</td>
                                    </tr>
                                    <tr>
                                        <th>대표자성명2</th>
                                        <td>${s.subBusinessName}</td>
                                    </tr>
                                    <tr>
                                        <th>개업일자</th>
                                        <td>${s.openBusinessDate}</td>
                                    </tr>
                                    <tr>
                                        <th>상호</th>
                                        <td>${s.storeName}</td>
                                    </tr>
                                    <tr>
                                        <th>법인등록번호</th>
                                        <td>${s.crn}</td>
                                    </tr>
                                    <tr>
                                        <th>주 업태명</th>
                                        <td>${s.mainBusinessName}</td>
                                    </tr>
                                    <tr>
                                        <th>주 종목명</th>
                                        <td>${s.mainItemName}</td>
                                    </tr>
                                    <tr>
                                        <th>사업장 주소</th>
                                        <td>${s.businessAddress}</td>
                                    </tr>
                                    <tr>
                                        <th>정산대금 입금계좌</th>
                                        <td>${s.businessAccount}</td>
                                    </tr>
                                    <tr>
                                        <th>신청일자</th>
                                        <td>${s.applicationDate}</td>
                                    </tr>
                                </table>

                                <div class="update-btn-area">
                                    <button class="deleteSeller-btn">판매자<br>탈퇴</button>
                                    <button class="close-btn">닫기</button>
                                </div>

                            </div>
                        </div>
                    </c:forEach>

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
                            <c:choose>
                                <c:when test="${empty searchKeyword && not empty startDate}"> <!-- 날짜 값만 입력하고 검색했을 때 -->
                                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="searchSeller.ma?cpage=${p}&categoryName=seller&searchType=&searchKeyword=&startDate=${startDate}&endDate=${endDate}">${p}</a></li>
                                </c:when>
                                <c:when test="${not empty searchKeyword && empty startDate}"> <!-- 검색어만 입력하고 검색했을 때 -->
                                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="searchSeller.ma?cpage=${p}&categoryName=seller&searchType=${searchType}&searchKeyword=${searchKeyword}&startDate=&endDate=">${p}</a></li>
                                </c:when>
                                <c:when test="${not empty searchKeyword && not empty startDate}"> <!-- 검색어, 날짜 둘다 입력하고 검색했을 때 -->
                                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="searchSeller.ma?cpage=${p}&categoryName=seller&searchType=${searchType}&searchKeyword=${searchKeyword}&startDate=${startDate}&endDate=${endDate}">${p}</a></li>
                                </c:when>
                                <c:otherwise>   <!-- 헤더바나 사이드바에 있는 회원관리 눌렀을때 || 검색값 없이 검색 눌렀을 때 -->
                                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="sellerList.ma?cpage=${p}&categoryName=seller">${p}</a></li>
                                </c:otherwise>
                            </c:choose>
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

     <script>
            $(document).ready(function(){

            // 회원 정보를 보기 위해 상세보기 버튼 눌렀을 때
            $(".sellerInfo-detailView-btn").click(function(){
                var index = $(this).closest("tr").index(); // 클릭된 버튼이 있는 행의 인덱스 가져오기
                var modal = $(".sellerInfo-modal").eq(index); // 해당 인덱스의 모달 찾기
                modal.css("display", "flex"); // 모달 표시

                // 판매자탈퇴 버튼 눌렀을 때
                // $(".deleteSeller-btn").click(function(){
                //     var userNo = modal.find(".userNo").text(); // 해당 모달안의 class이름이 userNo인 input태그안의 값 가져옴
                //     location.href="deleteSeller.ma?userNo=" + userNo; // 판매자탈퇴하는 메서드로 이동(아직 안만들었음 병현님이 만들실것같음)
                // })

                // 닫기 버튼 눌렀을 때
                $(".close-btn").click(function(){
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
                document.getElementById('search-form').action = 'sellerList.ma'; // 값이 없을 경우 memberList.ma로 변경
            }
        }

     </script>
</body>
</html>