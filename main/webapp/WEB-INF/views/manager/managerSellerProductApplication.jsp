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
                <form id="search-form" action="">
                    <div id="search-condition-area">
                        <table>
                            <tr>
                                <th>검색어</th>
                                <td>
                                    <select name="" id="">
                                        <option value="">상점명</option>
                                        <option value="">상품명</option>
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
                    <div id="total-store"><b>총 상품신청 수 : 1</b></div> <!-- 총 신규신청 수 가져오기-->
                    <div id="search-result-list">
                        <table>
                            <thead>
                                <th>
                                    <input type="checkbox">
                                </th>
                                <th>승인</th>
                                <th>상점명</th>
                                <th>상품명</th>
                                <th>판매가</th>
                                <th>판매수량</th>
                                <th>카테고리</th>
                                <th>신청일시</th>
                                <th>승인</th>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <input type="checkbox">
                                    </td>
                                    <td>완료</td>
                                    <td>그린피쉬</td>
                                    <td>25특 HQ 올디아망 수조</td>
                                    <td>23,000원</td>
                                    <td>100개</td>
                                    <td>어항/수조</td>
                                    <td>2024-05-13</td>
                                    <td>
                                        <button>승인</button>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>

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
</body>
</html>