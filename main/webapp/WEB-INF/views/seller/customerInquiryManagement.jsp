<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aquaqu</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">


<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/customerInquiryManagement.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>
        
        <!-- aside -->
        <%@ include file="../commons/aside.jsp" %>

        <section>
            <h1>고객 관리 &gt; 고객 문의</h1>

            <div id="search-area">
                <form action="searchInquiry.sr" method="get">
                    <input type="hidden" name="cpage" value="1">
                    <select name="condition">
                        <option value="productName">상품명</option>
                    </select>
                    <input id="search-keyword" type="text" name="keyword" value="${keyword}">
                    <button type="submit" >검색</button>
                </form>

            </div>
           
            <table>
                <thead>
                    <tr>
                        <th>문의 번호</th>
                        <th>상품명</th>
                        <th>문의자명</th>
                        <th>등록일</th>
                        <th>문의 상세</th>
                    </tr>
                </thead>
                <c:choose>
                    <c:when test="${empty inquiryList}">
                        <tbody>
                            <td colspan="5" style="border-radius: 0 0 10px 10px;">등록 문의가 존재하지 않습니다.</td>
                        </tbody>
                    </c:when>
                    <c:otherwise>
                        <tbody>
                            <c:forEach var="inquiry" items="${inquiryList}">
                                <tr id="pdList">
                                    <td>${inquiry.faqNo}</td>
                                    <td>${inquiry.pdTitle}</td>
                                    <td>${inquiry.nickName}</td>
                                    <td>${inquiry.inquiryDate}</td>
                                    <td><button class="btn btn-primary" data-toggle="modal" data-target="#inquiry-answer-Modal-${inquiry.faqNo}">문의 답변</button></td>
                                </tr>

                                    <!-- 문의 modal -->
                                    <div class="modal fade" id="inquiry-answer-Modal-${inquiry.faqNo}">
                                        <div class="modal-dialog modal-lg">
                                            <div class="modal-content">

                                                <!-- Modal Header -->
                                                <div class="modal-header">
                                                    <h4>문의하기</h4>
                                                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                                                </div>

                                                <!-- Modal body -->
                                                <div class="modal-body">
                                                    <div id="product-name-container">
                                                        <div id="inquiry-product-name">
                                                            ${inquiry.pdTitle}
                                                        </div>
                                                    </div>

                                                    <div id="product-inquiry-content-container">
                                                        <div class="inquiry-info">
                                                            <span>문의제목</span>
                                                        </div>
                                                        <div class="inquiry-detail">
                                                            <span>${inquiry.inquiryTitle}</span>
                                                            <span>${inquiry.inquiryDate}</span>
                                                        </div>
                                                        <div>
                                                            <span>문의내용</span>
                                                        </div>
                                                        <div id="product-inquiry-content-textarea">
                                                            ${inquiry.inquiryContents}
                                                        </div>
                                                    </div>
                                                    <form id="modal-inquiry-content" action="insertInquiryAnswer.spd" enctype="multipart/form-data" method="post">
                                                        <input type="hidden" name="faqNo" value="${inquiry.faqNo}">
                                                        <input type="hidden" name="userNo" value="${loginUser.userNo}">
                                                        <div>
                                                            <span>문의 답변</span>
                                                        </div>
                                                        <div id="inquiry-answer-textarea">
                                                            <textarea name="answerContents" required></textarea>
                                                        </div>

                                                        <div id="product-inquiry-enroll-btn-container">
                                                            <button type="submit" id="product-inquiry-enroll-btn">완료</button>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
                            <li class="page-item"><a class="page-link" href="customerInquiry.sr?cpage=${pi.currentPage - 1}">&laquo;</a></li>
                        </c:otherwise>
                </c:choose>

            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="customerInquiry.sr?cpage=${p}">${p}</a></li>
            </c:forEach>
                
            <c:choose>
                    <c:when test="${ pi.currentPage eq pi.maxPage }">
                        <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="customerInquiry.sr?cpage=${pi.currentPage + 1}">&raquo;</a></li>
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
