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
                <form action="search.pd" method="get">
                    <input type="hidden" name="cpage" value="1">
                    <select name="condition">
                        <option value="category">카테고리</option>
                        <option value="productName">상품명</option>
                    </select>
                    <input id="search-keyword" type="text" name="keyword" value="${keyword }">
                    <button type="submit" >검색</button>
                </form>

            </div>

            <table>
                <thead>
                    <tr>
                        <th>문의 번호</th>
                        <th>카테고리</th>
                        <th>상품명</th>
                        <th>문의자명</th>
                        <th>등록일</th>
                    </tr>
                </thead>
                <c:choose>
                    <c:when test="${empty list}">
                        <tbody>
                            <td colspan="5" style="border-radius: 0 0 10px 10px;">등록 문의가 존재하지 않습니다.</td>
                        </tbody>
                    </c:when>
                    <c:otherwise>
                        <tbody>
                            <c:forEach var="pd" items="${list}">
                                <tr id="pdList">
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><button class="btn btn-primary" data-toggle="modal" data-target="#inquiry-answer-Modal">문의 답변</button></td>
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

            <!-- 문의 답변 modal -->
            <div class="modal fade" id="inquiry-answer-Modal">
                <div class="modal-dialog modal-lg">
                    <div class="modal-content" >

                        <!-- Modal Header -->
                        <div class="modal-header">
                            <h4 >리뷰쓰기</h4>
                            <button type="button" class="close" data-dismiss="modal">&times;</button>
                        </div>

                        <!-- Modal body -->
                        <div class="modal-body" >
                            <form id="modal-qna-content" action="" enctype="multipart/form-data" method="post">
                                <input type="hidden" name="writerNo" value=>
                                <input type="hidden" name="refProductNo" value=>
                                <div id="qna-product-name-header">
                                    ${spd.pdTitle}
                                </div>

                                <!-- 별점 -->
                                 <span class="star-rating-title">별점평가</span>
                                <div class ="star_rating">
                                    <span class="star on" value="1"> </span>
                                    <span class="star" value="2"> </span>
                                    <span class="star" value="3"> </span>
                                    <span class="star" value="4"> </span>
                                    <span class="star" value="5"> </span>
                                </div>


                                <div id="product-pic-container">
                                    <div >
                                        사진 첨부(선택)
                                    </div>
                                    <div >
                                        사진을 첨부해주세요.(최대 1장)
                                    </div>
                                    <div id="qna-pic-container">

                                    </div>
                                    <div id="add-qna-product-pic">
                                    
                                        <span >사진 첨부하기</span>
                                        <input type="file" name="reOriginName" id="file-input" >

                                    </div>
                                </div>

                                <div id="product-qna-content-container">
                                    <div >
                                        리뷰작성
                                        <div>필수 입력 항목입니다.</div>
                                    </div>
                                    <div id="product-qna-content-textarea">
                                        <textarea name="qnaContent" id="product-qna-content"
                                            placeholder="자세하고 솔직한 리뷰는 다른 고객과 스토어에게 큰 도움이 됩니다."></textarea>
                                    </div>
                                </div>

                                <div id="product-qna-enroll-btn-container">
                                    <button type="submit" id="product-qna-enroll-btn">리뷰 등록</button>
                                </div>
                            </form>
                        </div>


                    </div>
                </div>
            </div>


            
        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>

</body>
</html>
