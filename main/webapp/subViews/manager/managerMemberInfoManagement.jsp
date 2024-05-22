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
                    <div id="total-member"><b>총 회원 수 : 1</b></div> <!-- 총 회원 수 가져오기 -->
                    <div id="search-result-list">
                        <table>
                            <!-- 테이블의 head와 body를 쉽게 구분하려고 thead사용함 -->
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
                                <tr>
                                    <td>1</td>
                                    <td>홍길동</td>
                                    <td>qwqw11</td>
                                    <td>qwqw11@gmail.com</td>
                                    <td>010-1111-1111</td>
                                    <td>2024-05-13</td>
                                    <td>
                                        <button>정보수정</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
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
        </main>
     </div>

     <script>
        $(document).ready(function(){
            $("#nav ul.sub").hide();
            $("#nav ul.menu li").click(function(){
                $("ul",this).slideToggle("fast")
            });
        });
     </script>
</body>
</html>