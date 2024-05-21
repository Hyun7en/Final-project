<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 등록</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">

</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>
        
        <!-- aside -->
        <%@ include file="../commons/aside.jsp" %>

        <section class="content">
            <h1>스토어 관리 &gt; 등록상품관리</h1>

            <div id="search-area">
                <form action="search.AdminCs" method="get">
                    <input type="hidden" name="cpage" value="1">
                    <select name="condition">
                        <option value="writer">작성자</option>
                        <option value="title">제목</option>
                        <option  value="content">내용</option>
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
                    <c:forEach var="product" items="${productList}">
                        <tr>
                            <td>${product.id}</td>
                            <td>${product.category}</td>
                            <td>${product.name}</td>
                            <td>${product.date}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
          
        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>

</body>
</html>
