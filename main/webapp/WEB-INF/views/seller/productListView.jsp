<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aquaqu</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/productListView.css">


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
                <form action="search.pd" method="get">
                    <input type="hidden" name="cpage" value="1">
                    <select name="condition">
                        <option value="category">카테고리</option>
                        <option value="productName">상품명</option>
                    </select>
                    <input id="search-keyword" type="text" name="keyword" value="${keyword}">
                    <button type="submit" >검색</button>
                </form>

            </div>

            <table>
                <thead>
                    <tr>
                        <th>상품 번호</th>
                        <th>카테고리</th>
                        <th>상품명</th>
                        <th>등록일</th>
                    </tr>
                </thead>
                <c:choose>
                    <c:when test="${empty list}">
                        <tbody>
                            <td colspan="5" style="border-radius: 0 0 10px 10px;">등록 상품이 존재하지 않습니다.</td>
                        </tbody>
                    </c:when>
                    <c:otherwise>
                        <tbody>
                            <c:forEach var="pd" items="${list}">
                                <tr id="pdList" onclick = "location.href = 'detail.pd?pno=${pd.pdNo}'">
                                    <td>${pd.pdNo}</td>
                                    <td>${pd.pdCategory}</td>
                                    <td>${pd.pdTitle}</td>
                                    <td>${pd.pdEnrollDate}</td>
                                </tr>
            
                            </c:forEach>
                        </tbody>
                    </c:otherwise>
                </c:choose>
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
