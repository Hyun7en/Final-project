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
                                            <a href="sellerNewApplicationApprove.ma?userNo=${sna.userNo}">승인</a>
                                            <!-- <button type="button" class="modal-btn" onclick="approveApplication()">승인</button> -->
                                        </td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <!-- <c:forEach var="sna" items="${list}">
                        <div class="modal">
                            <div class=".modal-popup">
                                <h3>판매자 신규신청 상세</h3>
                                <table>
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
                                <button type="button" class="approve-btn">승인</button>
                                <button type="button" class="close-btn">닫기</button>
                            </div>
                        </div>
                    </c:forEach> -->

                    <form action="">
                        <div id="select-btn-area">
                            <button>선택삭제</button>
                            <button>선택승인</button>
                        </div>
                    </form>

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
     
     <script>

        function approveApplication(){
            location.href='sellerNewApplicationApprove.ma?userNo=${sna.userNo}'
        }

        const modal = document.querySelector('.modal');
        const modalOpen = document.querySelector(".modal-btn");
        const moadlApprove = document.querySelector('.approve-btn');
        const modalClose = document.querySelector('.close-btn');

        // modalOpen.forEach((button, index) => {
        //     button.addEventListener('click', function () {
        //         // 선택한 모달 열기
        //         modals[index].style.display = 'block';
        //     });
        // });

        // moadlApprove.forEach((button, index) => {
        //     button.addEventListener('click', function () {
        //         // 승인 처리 및 모달 닫기
        //         modals[index].style.display = 'none';
        //     });
        // });

        // modalClose.forEach((button, index) => {
        //     button.addEventListener('click', function () {
        //         // 모달 닫기
        //         modals[index].style.display = 'none';
        //     });
        // });

        // //열기 버튼을 눌렀을 때 모달팝업이 열림
        // modalOpen.addEventListener('click',function(){
        //     //display 속성을 block로 변경
        //     modal.style.display = 'block';
        // });

        // //승인 버튼을 눌렀을 때 값이 컨트롤러로 넘어가서 status 'N'으로 바뀌고 팝업 닫힘
        // moadlApprove.addEventListener('click',function(){
        //     //display 속성을 none으로 변경
        //     modal.style.display = 'none';
        // });

        // //닫기 버튼을 눌렀을 때 모달팝업이 닫힘
        // modalClose.addEventListener('click',function(){
        // //display 속성을 none으로 변경
        //     modal.style.display = 'none';
        // });
     </script>
</body>
</html>