<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 레벨 관리</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/managerCSS/managerMemberLevelManagement.css">

   
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="header.jsp" %>
        
        <main>
            <!-- sidebar -->
            <%@ include file="sidebar.jsp" %>
            
            <!-- <div id="managerMemberLevelManagement-info-area">
                <div id="manager-sidebar-category-select-title"><h3>회원 레벨관리</h3></div>
                <div id="detail-setting"><b>세부설정</b></div>
                <form action="">
                    <div id="levelManagement-area">
                        <table>
                            <thead>
                                <tr>
                                    <th width="70">레벨</th>
                                    <th width="200">레벨명</th>
                                    <th width="200">할인률</th>
                                    <th width="1170">비고</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>LV.99</td>
                                    <td>
                                        <input type="text" placeholder="관리자">
                                    </td>
                                    <td>
                                        <input type="number" placeholder="0"> %
                                    </td>
                                    <td>사이트 관리자</td>
                                </tr>
                                <tr>
                                    <td>LV.s</td>
                                    <td>
                                        <input type="text" placeholder="판매자">
                                    </td>
                                    <td>
                                        <input type="number" placeholder="0"> %
                                    </td>
                                    <td>매장을 등록해서 상품을 파는 판매자</td>
                                </tr>
                                <tr>
                                    <td>LV.9</td>
                                    <td>
                                        <input type="text" placeholder="고래">
                                    </td>
                                    <td>
                                        <input type="number" placeholder="0"> %
                                    </td>
                                    <td>상품을 사는 일반회원 LV.9(최상위)</td>
                                </tr>
                                <tr>
                                    <td>LV.8</td>
                                    <td>
                                        <input type="text" placeholder="상어">
                                    </td>
                                    <td>
                                        <input type="number" placeholder="0"> %
                                    </td>
                                    <td>상품을 사는 일반회원 LV.8</td>
                                </tr>
                                <tr>
                                    <td>LV.7</td>
                                    <td>
                                        <input type="text" placeholder="해마">
                                    </td>
                                    <td>
                                        <input type="number" placeholder="0"> %
                                    </td>
                                    <td>상품을 사는 일반회원 LV.7</td>
                                </tr>
                                <tr>
                                    <td>LV.6</td>
                                    <td>
                                        <input type="text" placeholder="곰치">
                                    </td>
                                    <td>
                                        <input type="number" placeholder="0"> %
                                    </td>
                                    <td>상품을 사는 일반회원 LV.6</td>
                                </tr>
                                <tr>
                                    <td>LV.5</td>
                                    <td>
                                        <input type="text" placeholder="참치">
                                    </td>
                                    <td>
                                        <input type="number" placeholder="0"> %
                                    </td>
                                    <td>상품을 사는 일반회원 LV.5</td>
                                </tr>
                                <tr>
                                    <td>LV.4</td>
                                    <td>
                                        <input type="text" placeholder="고등어">
                                    </td>
                                    <td>
                                        <input type="number" placeholder="0"> %
                                    </td>
                                    <td>상품을 사는 일반회원 LV.4</td>
                                </tr>
                                <tr>
                                    <td>LV.3</td>
                                    <td>
                                        <input type="text" placeholder="복어">
                                    </td>
                                    <td>
                                        <input type="number" placeholder="0"> %
                                    </td>
                                    <td>상품을 사는 일반회원 LV.3</td>
                                </tr>
                                <tr>
                                    <td>LV.2</td>
                                    <td>
                                        <input type="text" placeholder="새우">
                                    </td>
                                    <td>
                                        <input type="number" placeholder="0"> %
                                    </td>
                                    <td>상품을 사는 일반회원 LV.2</td>
                                </tr>
                                <tr>
                                    <td>LV.1</td>
                                    <td>
                                        <input type="text" placeholder="피래미">
                                    </td>
                                    <td>
                                        <input type="number" placeholder="0"> %
                                    </td>
                                    <td class="td11">상품을 사는 일반회원 LV.1(최하위)</td>
                                </tr>
                            </tbody>
                        </table>

                        <div id="save-btn-area">
                            <button>저장</button>
                        </div>
                        
                    </div>
                </form>
            </div>	-->

        </main>
     </div> 

</body>
</html>