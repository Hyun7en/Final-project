<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 전체 목록</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerCSS/managerCustomerOutlist.css">

</head>
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="header.jsp" %>
        
        <main>
            <!-- sidebar -->
            <%@ include file="sidebar.jsp" %>
                
            <div id="managerOutlist">
                <div id="managerOutlist-title"><h3>1:1문의</h3></div>
                <div id="managerOutlist-subtitle"><b>검색</b></div>
                <form id="search-form" action="">
                    <div id="managerOutlist-1sttable">
                        <table>
                            <tr>
                                <th>검색어</th>
                                <td>
                                    <select name="category" id="admin-board-category">
                                        <option value="id">아이디</option>
                                        <option value="name">회원명</option>
                                    </select>
                                    <input type="text">
                                </td>
                            </tr>
                        </table>
                        <div>
                            <button style="width: 60px;">검색</button>
                            <button style="width: 75px;">초기화</button>
                        </div>
                    </div>
                </form>

                <div id="managerOutlist-2nd">
                    <div id="total-Outlist"><b>총 탈퇴회원 수 : 5</b></div>
                    <div id="managerOutlist-2ndtable">
                        <table>
                            <tr id="admin-2ndtable-head">
                                <th><input type="checkbox"></th>
                                <th >번호</th>
                                <th>회원명</th>
                                <th>아이디</th>
                                <th>탈퇴일시</th>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>5</td>
                                <td>홍길동</td>
                                <td>qwqw11</td>
                                <td>2024-05-14</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>4</td>
                                <td>고길동</td>
                                <td>qwqw22</td>
                                <td>2024-05-14</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>3</td>
                                <td>최길동</td>
                                <td>qwqw33</td>
                                <td>2024-05-14</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>2</td>
                                <td>나길동</td>
                                <td>qwqw44</td>
                                <td>2024-05-14</td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>1</td>
                                <td>조길동</td>
                                <td>qwqw55</td>
                                <td>2024-05-14</td>
                            </tr>
                        </table>
                    </div>
                    <div id="managerOutlist-2ndbottom">
                        <button>선택삭제</button>
                    </div>
                    <div id="pageList-area">
                        <div class="pageList" align="center">
                            <a id="a1">&lt;</a>
                            <a id="a2">1</a>
                            <a id="a3">&gt;</a>
                        </div> 
                    </div>
                </div>
                </div>
            </div>
        </main>
     </div>
</body>
</html>