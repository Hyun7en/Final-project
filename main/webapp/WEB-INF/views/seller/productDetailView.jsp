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

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storeCSS/productDetailView.css">

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
            <input type="hidden" id="product-no" value="">

            <div id="product-img-container">
                <img class="product-thumbnail" src=""
                    alt="">
            </div>
            <div id="product-Information">
                <div id="product_brand">
                    <span>가게명</span>
                </div>
                <div class="product_name_area">
                    <span class="product_name"></span>
                    <span class="dibs">
                        <i class="fa-regular fa-heart fa-xl"></i>
                    </span>
                </div>
                <div class="product_grade_area">
                    <span class="product_grade">평점</span>
                    <div>
                        <span class="product_review_quantity">리뷰</span><span class="review_quantity">100개</span>
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
                <div id="product_buy_info_area">
                    <div id="product_buy_info">
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
                                <div id="product-price-btn-wrapper">
                                    <div id="price-area">
                                        <div >총금액</div>
                                        <div >
                                            <span class="product-price"></span>원
                                        </div>
                                    </div>
                                    <div class="product_buy_btn_container">
                                        <button class="cart-btn">장바구니</button>
                                        <button class="buy-btn" id="product-buy-btn">바로구매</button>
                                    </div>
                                </div>
                                <input type="hidden" id="input-productSeller" value="${p.seller}">
                                <input type="hidden" id="input-productBrand" value="${p.productBrand}">
                                <input type="hidden" id="input-productName" value="${p.productName}">
                                <input type="hidden" id="input-mainImg" value="${p.mainImg}">
                                <input type="hidden" id="input-shipmentType" value="${p.shipmentType}">
                                <input type="hidden" id="input-shipmentCost" value="${p.shippingPrice}" >
                                <input type="hidden" id="productDetail-input-hidden" name="selectedOptList">
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </section>

        <!-- 상품 디테일 네비 -->
        <nav id="product_info_nav">
            <ul>
                <li>
                    <a class="product-selling-navigation" href="#product-detail">상품정보</a>
                </li>
                <li>
                    <a class="product-selling-navigation" href=".product-review">리뷰</a>
                </li>
                <li>
                    <a class="product-selling-navigation" href=".product-inquery">문의</a>
                </li>
                <li>
                    <a class="product-selling-navigation" href=".product-delivery">배송/교환/환불</a>
                </li>
            </ul>
        </nav>

        <!-- 상품 설명-->
        <section id="product-detail">
            <div id="area_left">

                <div id="product_description_area">

                </div>

            </div>

            <div id="area_right">
            </div>
        </section>

        <!-- 리뷰 -->
        <section id="product-review">
            <div id="product_review_area">
                <div class="description_title">상품 후기</div>
            </div>
        </section>

        <!-- 리뷰 modal -->
        <div class="modal fade" id="qna_Modal">
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

        <!-- 문의 -->
        <section id=".product-inquery">
            <div id="product_qna_area">
                <div id="qna_top">
                    <div class="description_title">상품 문의</div>
                    <button id="btn_qna" class="btn btn-primary"
                        
                        data-toggle="modal" data-target="#qna_Modal">문의하기</button>
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
                <div id="qna_pagination_area" >
                    <div id="qna_pagination">
                        <a href="#">&lt;</a>
                        <a href="#">1</a>
                        <a href="#">2</a>
                        <a href="#">&gt;</a>
                    </div>
                </div>
            </div>
        </section>

        <!-- 문의 modal -->
        <div class="modal fade" id="qna_Modal">
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

        <section id="product-delivery">

        </section>
       
    </main>

    
    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>
</body>
</html>
