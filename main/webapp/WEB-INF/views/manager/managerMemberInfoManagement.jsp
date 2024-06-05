<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 정보 관리</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerCSS/managerMemberInfoManagement.css">
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="header.jsp" %>
        
        <main>
            <!-- sidebar -->
            <%@ include file="sidebar.jsp" %>
             
            <div id="managerMemberInfoManagement-info-area">
                <div id="manager-sidebar-category-select-title"><h3>회원 정보관리</h3></div>
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
                                <th>기간검색</th>
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
                    <div id="total-member"><b>총 회원 수 : ${memberListCount}</b></div> <!-- 총 회원 수 가져오기 -->
                    <div id="search-result-list">
                        <table>
                            <thead>
                                <tr>
                                    <th>번호</th>
                                    <th>회원명</th>
                                    <th>아이디</th>
                                    <th>이메일</th>
                                    <th>휴대폰 번호</th>
                                    <th>가입일시</th>
                                    <th>수정</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="m" items="${memberList}">
                                    <tr>
                                        <td></td>
                                        <td>${m.userName}</td>
                                        <td>${m.userId}</td>
                                        <td>${m.email}</td>
                                        <td>${m.phone}</td>
                                        <td>${m.joinDate}</td>
                                        <td>
                                            <button class="memberInfo-detailView-btn">상세보기</button>
                                        </td>
                                    </tr> 
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>

                    <c:forEach var="m" items="${memberList}">
                        <div class="memberInfo-modal">
                            <div class="memberInfo-modal-content">
                                <h3>회원 정보</h3>
                                <table>
                                    <tr>
                                        <th>회원번호</th>
                                        <td class="userNo">${m.userNo}</td>
                                    </tr>
                                    <tr>
                                        <th>아이디</th>
                                        <td>${m.userId}</td>
                                    </tr>
                                    <tr>
                                        <th>이메일</th>
                                        <td>${m.email}</td>
                                    </tr>
                                    <tr>
                                        <th>이름</th>
                                        <td>${m.userName}</td>
                                    </tr>
                                    <tr>
                                        <th>닉네임</th>
                                        <td>${m.nickname}</td>
                                    </tr>
                                    <tr>
                                        <th>생년월일</th>
                                        <td>${m.birthday}</td>
                                    </tr>
                                    <tr>
                                        <th>성별</th>
                                        <td>${m.gender}</td>
                                    </tr>
                                    <tr>
                                        <th>주소</th>
                                        <td>${m.address}</td>
                                    </tr>
                                    <tr>
                                        <th>전화번호</th>
                                        <td>${m.phone}</td>
                                    </tr>
                                    <tr>
                                        <th>좋아하는 물고기</th>
                                        <td>${m.likeFish}</td>
                                    </tr>
                                    <tr>
                                        <th>키우는 물고기</th>
                                        <td>${m.tailFish}</td>
                                    </tr>
                                    <tr>
                                        <th>권한</th>
                                        <td>${m.authority}</td>
                                    </tr>
                                    <tr>
                                        <th>레벨</th>
                                        <td>${m.userLv}</td>
                                    </tr>
                                    <tr>
                                        <th>가입일자</th>
                                        <td>${m.joinDate}</td>
                                    </tr>
                                    <tr>
                                        <th>한줄소개</th>
                                        <td>${m.userIntro}</td>
                                    </tr>
                                </table>

                                <div class="update-btn-area">
                                    <button class="deleteMember-btn">회원탈퇴</button>
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
                                    <li class="page-item"><a class="page-link" href="memberList.ma?cpage=${pi.currentPage - 1}&categoryName=member">&laquo;</a></li>
                                </c:otherwise>
                        </c:choose>
                    
                    <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                        <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="memberList.ma?cpage=${p}&categoryName=member">${p}</a></li>
                    </c:forEach>
                        
                    <c:choose>
                            <c:when test="${ pi.currentPage eq pi.maxPage }">
                                <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                            </c:when>
                            <c:otherwise>
                                <li class="page-item"><a class="page-link" href="memberList.ma?cpage=${pi.currentPage + 1}&categoryName=member">&raquo;</a></li>
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
            // // 사이드바 서브 카테고리 숨김
            // $("#nav ul.sub").hide();
            // // 사이드바의 li 클릭시 카테고리 드롭
            // $("#nav ul.menu li").click(function(){
            //     $("ul",this).slideToggle("fast")
            // });

            // 회원 정보를 보기 위해 상세보기 버튼 눌렀을 때
            $(".memberInfo-detailView-btn").click(function(){
                var index = $(this).closest("tr").index(); // 클릭된 버튼이 있는 행의 인덱스 가져오기
                var modal = $(".memberInfo-modal").eq(index); // 해당 인덱스의 모달 찾기
                modal.css("display", "flex"); // 모달 표시

                // 회원탈퇴 버튼 눌렀을 때
                $(".deleteMember-btn").click(function(){
                    var userNo = modal.find(".userNo").text(); // 해당 모달안의 class이름이 userNo인 input태그안의 값 가져옴
                    location.href="deleteMember.ma?userNo=" + userNo; // 회원탈퇴하는 메서드로 이동
                })

                // 닫기 버튼 눌렀을 때
                $(".close-btn").click(function(){
                    modal.css("display", "none"); // 모달 숨김
                })
            });
        });

     </script>
</body>
</html>