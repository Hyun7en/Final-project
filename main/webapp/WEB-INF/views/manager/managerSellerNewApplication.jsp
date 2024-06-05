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
                                <th>신청일시</th>
                                <td>
                                    <input class="date-search-bar" type="date">
                                    -
                                    <input class="date-search-bar" type="date">
                                </td>
                            </tr>
                        </table>
                        <div id="search-btn-area">
                            <button type="submit">검색</button>
                            <button type="reset">초기화</button>
                        </div>
                    </div>
                </form>

                <div id="search-result-list-area">
                    <div id="total-seller"><b>총 신규신청 수 : ${fn:length(list)}</b></div> <!-- 총 신규신청 수 가져오기-->
                    <div id="search-result-list">
                        <table>
                            <thead>
                                <th>
                                    <input type="checkbox">
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
                                <c:forEach var="sna" items="${list}">
                                    <tr>
                                        <td><input type="checkbox"></td>
                                        <td>${sna.userName}</td>
                                        <td>${sna.userId}</td>
                                        <td>${sna.storeName}</td>
                                        <td>${sna.businessNo}</td>
                                        <td>${sna.crn}</td>
                                        <td>${sna.applicationDate}</td>
                                        <td>
                                            <!-- <a href="sellerNewApplicationApprove.ma?userNo=${sna.userNo}">승인</a> -->
                                            <button type="button" class="application-approve-btn" onclick="approveApplication()">승인</button>
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <c:forEach var="sna" items="${list}">
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

                    <form action="">
                        <div id="select-btn-area">
                            <button>선택삭제</button>
                            <button>선택승인</button>
                        </div>
                    </form>

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
                            <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="sellerNewApplication.ma?cpage=${p}&categoryName=seller">${p}</a></li>
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
                        console.log(userNo);
                        location.href="sellerNewApplicationApprove.ma?userNo=" + userNo;
                    })

                    // 닫기 버튼 눌렀을 때
                    $(".close-btn").click(function(){
                        // modal.find(".change-input").val(""); // class이름이 change-input인 태그의 value값을 "" 으로 바꿈
                        modal.css("display", "none"); // 모달 숨김
                    })
                });
            });

     </script>
</body>
</html>