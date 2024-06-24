<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerCSS/managerMain.css">

	<style>



    </style>
   
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="header.jsp" %>
        
        <main>
            <div id="managerMain-wrapper">
                <div id="main-status-title"><h3>주요 현황</h3></div>
                <div id="main-status-area">
                    <div id="total-members-area" class="main-status">
                        <div class="main-status-info-title">
                            <b>전체 회원 수</b>
                        </div>
                        <div class="main-status-info-title">
                            <div class="total-members-info">
                                <b>현재 회원 수</b>
                                <p>${currentMemberCount}</p>
                            </div>
                            <div class="total-members-info">
                                <b>탈퇴한 회원 수</b>
                                <p>${deleteMemberCount}</p>
                            </div>
                        </div>
                    </div>
                    <div id="orderHistory-status-area" class="main-status">
                        <div class="main-status-info-title">
                            <b>주문 상태 현황</b>
                        </div>
                        <div class="main-status-info-title">
                            <div class="orderHistory-status-info">
                                <b>입금대기</b>
                                <p>0</p>
                            </div>
                            <div class="orderHistory-status-info">
                                <b>입금완료</b>
                                <p>0</p>
                            </div>
                            <div class="orderHistory-status-info">
                                <b>배송중</b>
                                <p>0</p>
                            </div>
                            <div class="orderHistory-status-info">
                                <b>배송완료</b>
                                <p>0</p>
                            </div>
                        </div>
                    </div>
                    <div id="visit-status-area" class="main-status">
                        <div class="main-status-info-title">
                            <b>방문 현황</b>
                        </div>
                        <div class="main-status-info-title">
                            <div id="visit-status-graph">
                                <p></p>
                            </div>
                        </div>
                    </div>
                </div>

                <div id="main-status-title"><h3>최근 주문내역</h3></div>
                <div id="recent-orderHistory-area">   
                    <table>
                        <thead>
                            <tr>
                                <th>주문번호</th>
                                <th>주문자명</th>
                                <th>전화번호</th>
                                <th>결제방법</th>
                                <th>총 주문액</th>
                                <th>주문일시</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="ro" items="${recentOrderHistory}">
                                <tr>
                                    <td>${ro.payNo}</td>
                                    <td>${ro.userName}</td>
                                    <td>${ro.phone}</td>
                                    <td>신용카드</td>
                                    <td>${ro.payMoney}</td>
                                    <td>${ro.payDate}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div> 

                <div id="main-status-title"><h3>최근 회원가입</h3></div>
                <div id="recent-signUp-area">
                    <table>
                        <thead>
                            <th>이름</th>
                            <th>아이디</th>
                            <th>등급</th>
                            <th>이메일</th>
                            <th>전화번호</th>
                            <th>가입일시</th>
                        </thead>
                        <tbody>
                            <c:forEach var="rm" items="${recentMemberList}">
                                <tr>
                                    <td>${rm.userName}</td>
                                    <td>${rm.userId}</td>
                                    <c:choose>
                                        <c:when test="${rm.authority eq 0}">
                                            <td>일반회원</td>
                                        </c:when>
                                        <c:otherwise>
                                            <td>판매자</td>
                                        </c:otherwise>
                                    </c:choose>
                                    <td>${rm.email}</td>
                                    <td>${rm.phone}</td>
                                    <td>${rm.joinDate}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
                



            </div>
		    
        </main>
                    
     </div>
</body>
</html>