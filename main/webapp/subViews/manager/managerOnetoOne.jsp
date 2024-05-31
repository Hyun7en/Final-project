<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 전체 목록</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerCSS/managerCustomerOnetoOne.css">

</head>
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="header.jsp" %>
        
        <main>
            <!-- sidebar -->
            <%@ include file="sidebar.jsp" %>
                
            <div id="managerOnetoOne">
                <div id="managerOnetoOne-title"><h3>1:1문의</h3></div>
                <div id="managerOnetoOne-subtitle"><b>검색</b></div>
                <form id="search-form" action="">
                    <div id="managerOnetoOne-1sttable">
                        <table>
                            <tr>
                                <th>검색어</th>
                                <td>
                                    <select name="category" id="managerOnetoOne-board-category">
                                        <option value="writer">작성자</option>
                                        <option value="title">제목</option>
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

                <div id="managerOnetoOne-2nd">
                    <div id="total-quest"><b>총 문의글 수 : 5</b></div>
                    <div id="managerOnetoOne-2ndtable">
                        <table>
                            <tr id="managerOnetoOne-2ndtable-head">
                                <th><input type="checkbox"></th>
                                <th>번호</th>
                                <th>제목</th>
                                <th>작성자</th>
                                <th>작성일</th>
                                <th>답변</th>
                                <th>관리</th>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>5</td>
                                <td>안녕하세요.반갑습니다.</td>
                                <td>qwqw11</td>
                                <td>2024-05-14</td>
                                <td>완료</td>
                                <td><button>답변</button></td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>4</td>
                                <td>안녕하세요.반갑습니다.</td>
                                <td>qwqw22</td>
                                <td>2024-05-14</td>
                                <td>대기</td>
                                <td><button>답변</button></td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>3</td>
                                <td>안녕하세요.반갑습니다.</td>
                                <td>qwqw11</td>
                                <td>2024-05-14</td>
                                <td>완료</td>
                                <td><button>답변</button></td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>2</td>
                                <td>안녕하세요.반갑습니다.</td>
                                <td>qwqw33</td>
                                <td>2024-05-14</td>
                                <td>대기</td>
                                <td><button>답변</button></td>
                            </tr>
                            <tr>
                                <td><input type="checkbox"></td>
                                <td>1</td>
                                <td>안녕하세요.반갑습니다.</td>
                                <td>qwqw55</td>
                                <td>2024-05-14</td>
                                <td>완료</td>
                                <td><button>답변</button></td>
                            </tr>
                        </table>
                    </div>
                    <div id="managerOnetoOne-2ndbottom">
                        <button>선택삭제</button>
                        <button>선택답변</button>
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
</body>
</html>