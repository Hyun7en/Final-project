<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>등록 상품 리스트</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<!-- <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/productListView.css"> -->

<style>
        section {
        display: flex;
        flex-direction: column;
        flex: 1;
        padding: 40px 200px;
        height: calc(100vh - 40px);
        overflow-y: scroll;
    }

    /* 스크롤바 없애기 */
    body {
        -ms-overflow-style: none;
    }

    ::-webkit-scrollbar {
        display: none;
    }

    /* 스크롤바 없애기 */

    section h1 {
        margin-bottom: 20px;
    }
    table {
        margin-top: 50px;
        width: 100%;
    }
    th, td {
        border: 1px solid #ccc;
        padding: 8px;
        text-align: center;
    }
    th {
        background-color: #f0f0f0;
    }
   
    .pagination {
        display: flex;
        list-style: none;
        padding: 0;
        justify-content: center;
    }
    
    .pagination > li {
        margin-right: 10px;
    }
    
    .pagination > li > a {
        color: black;
        float: left;
        padding: 8px 16px;
        text-decoration: none;
    }
    
    .pagination > li.active > a {
        background-color: #42A2F4; /* 활성화된 버튼의 배경색 */
        color: white;             /* 활성화된 버튼의 글자색 */
        border-radius: 5px;       /* 테두리 둥글게 */
    }
    
    .pagination > li > a:hover:not(.active) {
        background-color: #ddd;  /* 활성화되지 않은 버튼에 마우스를 올렸을 때 배경색 */
        border-radius: 5px;      /* 테두리 둥글게 */
    }
</style>

</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>
        
        <!-- aside -->
        <%@ include file="../commons/aside.jsp" %>

        <section>
            <h1>스토어 관리 &gt; 등록상품관리</h1>

            <div id="search-area">
                <form action="search.AdminCs" method="get">
                    <input type="hidden" name="cpage" value="1">
                    <select name="condition">
                        <option value="writer">카테고리</option>
                        <option value="title">상품명</option>
                    </select>
                    <input id="search-keyword" type="text" name="keyword" value="${keyword }">
                    <button type="submit" >검색</button>
                </form>

            </div>

            <c:if test="${not empty condition}">
                <script>
                    window.onload = function () {
                        const opt = document.querySelector("#search-area option[value=${condition}]");
                        opt.setAttribute("selected", true);
                    }
                </script>
            </c:if>

            <table>
                <thead>
                    <tr>
                        <th>상품 번호</th>
                        <th>카테고리</th>
                        <th>상품명</th>
                        <th>등록일</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="pd" items="${product}">
	            	<tr onclick = "location.href = 'detail.pd?pno=${pd.pNo}'">
	           			<td>${pd.boardNo }</td>
	           			<td>${pd.boardTitle }</td>
	           			<td>${pd.boardWriter }</td>
	           			<td>${pd.count }</td>
	           		</tr>
           		</c:forEach>
                </tbody>
            </table>

            <!-- 페이징 처리 들어오는 곳-->
            <div id="pagination-div">
                <ul class="pagination">
                    <c:choose>
                        <c:when test="${ pi.currentPage eq 1 }">
                            <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="list.pd?cpage=${pi.currentPage - 1}">&laquo;</a></li>
                        </c:otherwise>
                </c:choose>

            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="list.pd?cpage=${p}">${p}</a></li>
            </c:forEach>
                
            <c:choose>
                    <c:when test="${ pi.currentPage eq pi.maxPage }">
                        <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="list.pd?cpage=${pi.currentPage + 1}">&raquo;</a></li>
                    </c:otherwise>
                </c:choose>
                </ul>
            </div>
          
        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>

</body>
</html>
