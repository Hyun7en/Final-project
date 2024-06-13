<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aquaqu</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storeCSS/productDetailView.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://kit.fontawesome.com/67d7db2dea.js" crossorigin="anonymous"></script>

<script src="${pageContext.request.contextPath}/resources/js/storeJS/productDetailView.js"></script>
    
</head>
<body>
<div class="wrap">
    <!-- header -->
    <%@ include file="../commons/header.jsp" %>
    
    <main>
        
        <div id="seller-home-top">
            <p>${si.storeName}</p>
        </div>
        <div id="seller-home-catchphrase"><p>${si.sellerExplain}</p></div>
        <div id="seller-home-nav"> <!--c:forEach로 카테고리 작성-->
            <a href="" class="category-0" style="margin-left: auto;">전체상품</a>
            <!-- <c:forEach var="sl" items="${siList}" varStatus="order">
                <c:choose>
                    <c:when test="${order.last}">
                        <a href="sellersCategory.st?sellerPageNo=${si.sellerPageNo}&pCategory=${sl.prCategory}&order=1&cpage=1" style="margin-right: auto;">${sl.prCategory}</a>
                    </c:when>
                    <c:otherwise>
                        <a href="sellersCategory.st?sellerPageNo=${si.sellerPageNo}&pCategory=${sl.prCategory}&order=1&cpage=1">${sl.prCategory}</a>
                    </c:otherwise>
                </c:choose>
            </c:forEach> -->
        </div>

        <!-- 상품 구매 -->
        <section class="product-info">
            <input type="hidden" id="pno" value="">

            <div class="product-img-container">
                <img class="product-img" src="" alt="">
            </div>

            <div class="product-information">
                <div class="product-name-area">
                    <span class="product-name">상품명</span>
                    <span class="dibs">
                        <i class="fa-regular fa-heart"></i>
                    </span>
                </div>
                <div class="product_grade_area">
                    <span class="product_grade">평점</span>
                    <div>
                        <span class="product_review_quantity">리뷰</span><span class="review_quantity">${spd.reviewCount}개</span>
                    </div>
                </div>
              
                <div class="product-price">
                    <div>
                        <span class="product-price"><fmt:formatNumber value="${p.salePrice}" type="number"/></span>
                        <span >원</span>
                    </div>
                </div>
                <div id="product_etc">
                    <table>
                        <tbody>
                            <tr>
                                <td>판매자</td>
                                <td></td>
                            </tr>
                            <tr>
                                <td>배송</td>
                                <td></td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div class="product-buy-area">
                    <div class="product_buy_info">
                        <div><span>상품 선택</span></div>
                        <div id="product-opt-form-wrapper">
                            <form action="" id="product-opt-form" method="post">
                                <div class="product-opts">
                                    <div class="product-opt-select">
                                        <div><span>상품을 선택해주세요</span></div>
                                        <ul class="product-opts-list">

                                        </ul>
                                    </div>
                                </div>
                                <div id="product_quantity_area">
                                </div>
                                <div id="price-area">
                                    <div >주문금액</div>
                                    <div >
                                        <span class="product-price"></span>원
                                    </div>
                                </div>
                                <div id="product-price-btn-wrapper">
                                    <div class="product_buy_btn_container">
                                        <button class="cart-btn">장바구니</button>
                                        <button class="buy-btn" id="product-buy-btn">바로구매</button>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 상품 디테일 네비 -->
         <div class="sticky-container" id="sticky-container" style="position: sticky; top: 85px; transition: top 0.1s ease 0s;">
            <div >
                <nav class="navbar navbar-expand-sm bg-light justify-content-center">
                    <ul class="navbar-nav">
                      <li class="nav-item">
                        <a class="nav-link" href="#product-detail">상품정보</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#product-review">리뷰</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#product-inquiry">문의</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#product-delivery">배송/교환/환불</a>
                      </li>
                    </ul>
                </nav>
            </div>
        </div>

        <!-- 상품 정보-->
        <section class="product-detail" id="product-detail">
            <div id="area_left">
                <h1>
                    상품정보
                </h1>
                <div id="product_description_area">

                </div>

            </div>

            <div id="area_right">
            </div>
        </section>

        <!-- 리뷰 -->
        <section class="product-review" id="product-review">
            <div class="product-review-area">
                    <div class="review-top">
                    <h1 class="description-title">
                        리뷰
                    </h1>
                    <button id="review-btn" class="btn btn-primary" data-toggle="modal" data-target="#review-Modal">
                        리뷰쓰기
                    </button>
                </div>
            </div>

            <!-- 페이징 처리 들어오는 곳-->
            <div id="pagination-div">
                <ul class="pagination">
                    <c:choose>
                        <c:when test="${ pi.currentPage eq 1 }">
                            <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="?cpage=${pi.currentPage - 1}">&laquo;</a></li>
                        </c:otherwise>
                </c:choose>

            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="?cpage=${p}">${p}</a></li>
            </c:forEach>
                
            <c:choose>
                    <c:when test="${ pi.currentPage eq pi.maxPage }">
                        <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                    </c:when>
                    <c:otherwise>
                        <li class="page-item"><a class="page-link" href="?cpage=${pi.currentPage + 1}">&raquo;</a></li>
                    </c:otherwise>
                </c:choose>
                </ul>
            </div>
        </section>

        <!-- 리뷰 modal -->
        <div class="modal fade" id="review-Modal">
            <div class="modal-dialog">
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
                            <div id="product_name_container">
                                <div id="qna_product_name_header">
                                    상품명
                                </div>
                                <select name="refPdoptNo" id="qna_product_name">
                                </select>
                            </div>
                            <div id="product_pic_container">
                                <div >
                                    사진 첨부(선택)
                                </div>
                                <div >
                                    사진을 첨부해주세요.(최대 1장)
                                </div>
                                <div id="qna_pic_container">

                                </div>
                                <div id="add_qna_product_pic">
                                   
                                    <span >사진 첨부하기</span>
                                    <input type="file" name="qnaPhotoUpfile" id="file-input" accept="image/*">

                                </div>
                            </div>

                            <div id="product_qna_content_container">
                                <div >
                                    리뷰작성
                                    <div>필수 입력 항목입니다.</div>
                                </div>
                                <div id="product_qna_content_textarea">
                                    <textarea name="qnaContent" id="product_qna_content"
                                        placeholder="자세하고 솔직한 리뷰는 다른 고객과 스토어에게 큰 도움이 됩니다."></textarea>
                                </div>
                            </div>

                            <div id="product_qna_enroll_btn_container">
                                <button type="submit" id="product_qna_enroll_btn">완료</button>
                            </div>
                        </form>
                    </div>


                </div>
            </div>
        </div>

        <!-- 문의 -->
        <section class="product-inquiry" id="product-inquiry">
            <div class="product-inquiry-area">
                <div class="inquiry-top">
                    <h1 class="description-title">
                        문의
                    </h1>
                    <button id="inquiry-btn" class="btn btn-primary" data-toggle="modal" data-target="#inquiry-Modal">
                        문의하기
                    </button>
                </div>

                <table id="qna_content">
                    <thead>
                        <tr>
                            <td class="qna_title">제목</td>
                            <td class="qna_writer">작성자</td>
                            <td class="qna_create_date">작성일</td>
                            <td class="qna_status">답변상태</td>
                        </tr>
                    </thead>
                    <tbody>
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
                                <li class="page-item"><a class="page-link" href="?cpage=${pi.currentPage - 1}">&laquo;</a></li>
                            </c:otherwise>
                    </c:choose>

                <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                    <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="?cpage=${p}">${p}</a></li>
                </c:forEach>
                    
                <c:choose>
                        <c:when test="${ pi.currentPage eq pi.maxPage }">
                            <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                        </c:when>
                        <c:otherwise>
                            <li class="page-item"><a class="page-link" href="?cpage=${pi.currentPage + 1}">&raquo;</a></li>
                        </c:otherwise>
                    </c:choose>
                    </ul>
                </div>
            </div>
        </section>


        <!-- 문의 modal -->
        <div class="modal fade" id="inquiry-Modal">
            <div class="modal-dialog">
                <div class="modal-content" >

                    <!-- Modal Header -->
                    <div class="modal-header">
                        <h4 >상품 문의하기</h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                    </div>

                    <!-- Modal body -->
                    <div class="modal-body" >
                        <form id="modal-qna-content" action="" enctype="multipart/form-data" method="post">
                            <input type="hidden" name="writerNo" value=>
                            <input type="hidden" name="refProductNo" value=>
                            <div id="product_name_container">
                                <div id="qna_product_name_header">
                                    상품명
                                </div>
                                <select name="refPdoptNo" id="qna_product_name">
                                </select>
                            </div>

                            <div id="product_qna_content_container">
                                <div >
                                    문의내용
                                </div>
                                <div id="product_qna_content_textarea">
                                    <textarea name="qnaContent" id="product_qna_content"
                                        placeholder="문의 내용을 입력하세요."></textarea>
                                </div>
                            </div>

                            <div id="product_qna_enroll_btn_container">
                                <button type="submit" id="product_qna_enroll_btn">완료</button>
                            </div>
                        </form>
                    </div>


                </div>
            </div>
        </div>

        <section class="product-delivery" id="product-delivery">
            <h1>배송/교환/환불</h1>
        </section>
       
    </main>

    
    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>
</body>
</html>
