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

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storeCSS/productDetailView.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://kit.fontawesome.com/67d7db2dea.js" crossorigin="anonymous"></script>

<script>
    // JSP에서 JavaScript로 변수 전달
    const pno = '${param.pno}'; // JSP 변수를 JavaScript 변수로 할당

</script>

<script src="${pageContext.request.contextPath}/resources/js/storeJS/productDetailView.js"></script>
<script src="${pageContext.request.contextPath}/resources/js/sellerJS/showOption.js"></script>
    
</head>
<body onload="init('productDetailView', `${pageContext.request.contextPath}`, {userNo : `${loginUser.userNo}`});">
<div class="wrap">    

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>
    
    <main>
        
        <div id="store-name-container">
            <div id="store-name">
                <a href="sellersStore.st?sellerPageNo=${spd.sellerPageNo}&order=1&cpage=1">
                    <h1>${spd.storeName}</h1>
                </a>
            </div>
            <button type="button" class="btn btn-danger" onclick="location.href='list.cs'">상품신고</button>
        </div>

        <!-- 상품 구매 -->
        <section class="product-info">
            
            <div class="product-img-container">
                <img class="product-img" src="${spd.pdChangeName}" alt="">
            </div>

            <div class="product-information">
                <div class="product-name-area">
                    <span class="product-name">${spd.pdTitle}</span>
                    <span class="dibs">
                        
                    </span>
                </div>
                <div class="product-grade-area">
                    <div>
                        <span class="product-grade">평점</span><span>${spd.averReviewDibs}</span>
                    </div>
                    <div>
                        <span class="product-review-quantity">리뷰</span><span id="review-count">${spd.reviewCount}</span>
                    </div>
                </div>
              
                <div class="product-price-area">
                    <div>
                        <span class="product-price">${spd.pdPrice}</span>원
                    </div>
                </div> 
                <div class="product-etc">
                    <span>배송 업체직접배송</span>
                </div>
                <div class="top-product-buy-area">
                    <div class="product-buy-info">
                        <form action="" id="product-opt-form" method="post">
                            <div class="product-opts">
                                <div class="product-opt-select">
                                    <div><span>옵션을 선택해주세요(필수)</span></div>
                                    <select class="select-option" name="optionName">

                                    </select>
                                </div>
                            </div>
                            <!-- 선택된 옵션과 수량 입력을 위한 컨테이너 -->
                            <div class="selected-options-container">

                            </div>
                    
                            <div class="price-area">
                                <div >주문금액</div>
                                <div >
                                    <span class="order-price">원</span>
                                </div>
                            </div>
                            <div class="product-buy-btn-container">
                                <button type="button" class="cart-btn" id="product-cart-btn">장바구니</button>
                                <button type="button" class="buy-btn" id="product-buy-btn" >바로구매</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </section>

        <!-- 상품 디테일 네비 -->
         <div class="sticky-container" id="sticky-container" style="position: sticky; top: 85px; transition: top 0.1s ease 0s;">
                <nav class="navbar navbar-expand-sm bg-light justify-content-center">
                    <ul class="navbar-nav">
                      <li class="nav-item">
                        <a class="nav-link" href="#go-product-detail" aria-label="상품정보로 이동">상품정보</a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#go-product-review" aria-label="리뷰로 이동">리뷰 <span id="nav-review-count">${spd.reviewCount}</span></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#go-product-inquiry" aria-label="문의로 이동">문의 <span id="nav-inquiry-count"></span></a>
                      </li>
                      <li class="nav-item">
                        <a class="nav-link" href="#go-seller-info" aria-label="판매자 정보로 이동">판매자 정보</a>
                      </li>
                    </ul>
                </nav>
        </div>

        <div class="about-product-container">
            <div class="about-product">

                <div class="go" id="go-product-detail"></div>

                <!-- 상품 정보-->
                 <div class="product-detail-container">
                    <section class="product-detail" id="product-detail">

                            <h1>
                                상품정보
                            </h1>
                            <div class="product-description-area">
                                ${spd.pdContent}
                            </div>
                        
                    </section>
                </div>   
                <div class="go" id="go-product-review"></div>

                <!-- 리뷰 -->
                <div >     
                    <section class="product-review" id="product-review">
                        <div class="product-review-area">
                            <div class="review-top">
                                <h1 class="description-title">
                                    <span>리뷰</span> <span id="review-count">${spd.reviewCount}</span>
                                </h1>
                                <c:set var="canWriteReview" value="false" />
                                <c:forEach var="review" items="${userNoList}">
                                    <c:if test="${review.userNo eq loginUser.userNo}">
                                        <c:set var="canWriteReview" value="true" />
                                    </c:if>
                                </c:forEach>

                                <c:choose>
                                    <c:when test="${canWriteReview}">
                                            <button id="review-btn" class="btn btn-primary" data-toggle="modal" data-target="#review-Modal">
                                                리뷰쓰기
                                            </button>
                                    </c:when>
                                    <c:otherwise>

                                    </c:otherwise>    
                                </c:choose>
                            </div>

                            <div>
                             <c:choose >

                                <c:when test="${not empty reviewList}">
                                    <div id="review-container">

                                        
                                    
                                    </div>    
                                </c:when>

                                <c:otherwise>
                                    <table>
                                        <tr>
                                            등록된 리뷰가 없습니다
                                        </tr>
                                    </table>

                                    <hr>
                                </c:otherwise>
                            </c:choose>
                            </div>

                        </div>

                        <!-- 리뷰 페이징 처리 들어오는 곳-->
                        <div id="pagination-div">
                            <ul class="pagination">
                                <c:choose>
                                    <c:when test="${ rpi.currentPage eq 1 }">
                                        <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getReviewList(`${rpi.currentPage - 1}`,`${spd.pdNo}`);">&laquo;</a></li>
                                    </c:otherwise>
                            </c:choose>

                        <c:forEach var="p" begin="${ rpi.startPage }" end="${ rpi.endPage }">
                            <li class="page-item ${p == rpi.currentPage ? 'active' : ''}"><a class="page-link" href="javascript:void(0);" onclick="getReviewList(`${p}`,`${spd.pdNo}`);">${p}</a></li>
                        </c:forEach>
                            
                        <c:choose>
                                <c:when test="${ rpi.currentPage eq rpi.maxPage }">
                                    <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getReviewList(`${rpi.currentPage + 1}`,`${spd.pdNo}`);">&raquo;</a></li>
                                </c:otherwise>
                            </c:choose>
                            </ul>
                        </div>
                    </section>
                </div>    

                <!-- 리뷰 modal -->
                <div class="modal fade" id="review-Modal">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content" >

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 >리뷰쓰기</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body" >
                                <form id="modal-qna-content" action="insertReview.spd" method="post" enctype="multipart/form-data">
                                    <input type="hidden" name="pno" value=${param.pno}>
                                    <input type="hidden" name="userNo" value=${loginUser.userNo}>
                                    <div id="qna-product-name-header">
                                        ${spd.pdTitle}
                                    </div>

                                    <!-- 별점 -->
                                    <span class="star-rating-title">별점평가</span>
                                    <div id="reply-dibs" class ="star_rating">
                                        <span class="star on" value="1" onclick="starClick(1);"> </span>
                                        <span class="star" value="2" onclick="starClick(2);"> </span>
                                        <span class="star" value="3" onclick="starClick(3);"> </span>
                                        <span class="star" value="4" onclick="starClick(4);"> </span>
                                        <span class="star" value="5" onclick="starClick(5);"> </span>
                                    </div>
                                
                                    <div id="hidden-sub">

                                    </div>

                                    <div id="product-pic-container">
                                        <div >
                                            사진 첨부(선택)(최대 1장)
                                        </div>
                                        <div id="add-qna-product-pic">
                                            <span >사진 첨부하기</span>
                                            <input type="file" name="reOriginName" id="reOriginName" >
                                        </div>
                                        <div id="preview-img-container" >
                                            <img id="preview-img" src="" alt="">
                                        </div>
                                    </div>

                                    <div id="product-review-container">
                                        <div >
                                            *리뷰작성(필수)
                                        </div>
                                        <div id="product-review-textarea">
                                            <textarea name="reviewContents" id="product-qna-content"
                                                placeholder="자세하고 솔직한 리뷰는 다른 고객과 스토어에게 큰 도움이 됩니다." required></textarea>
                                        </div>
                                    </div>

                                    <div id="product-review-enroll-btn-container">
                                        <button type="submit" id="product-review-enroll-btn" onclick="aaa();">리뷰 등록</button>
                                    </div>
                                </form>
                            </div>


                        </div>
                    </div>
                </div>

                <div class="go" id="go-product-inquiry"></div>

                <!-- 문의 -->
                <div >     
                    <section class="product-inquiry" id="product-inquiry">
                        <div class="product-inquiry-area">
                            <div class="inquiry-top">
                                <h1 class="description-title">
                                    문의
                                </h1>
                                <c:choose>
                                    <c:when test="${loginUser != null}">
                                        <button id="inquiry-btn" class="btn btn-primary" data-toggle="modal" data-target="#inquiry-Modal">
                                            문의하기
                                        </button>
                                    </c:when>
                                    <c:otherwise>
                                    </c:otherwise>    
                                </c:choose>
                            </div>

                            <div>
                                <c:choose>

                                    <c:when test="${not empty inquiryList}"> 
                                        <div id="inquiry-container">

                                        </div>
                                    </c:when>

                                    <c:otherwise>
                                        <table>
                                            <tr>
                                                등록된 문의가 없습니다
                                            </tr>
                                        </table>

                                        <hr>

                                    </c:otherwise>
                                </c:choose>
                            </div>
                            
                        </div>

                         <!-- 문의 페이징 처리 들어오는 곳-->
                         <div id="pagination-div">
                            <ul id="inquiry-pagination" class="pagination">
                                <c:choose>
                                    <c:when test="${ ipi.currentPage eq 1 }">
                                        <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                                    </c:when>
                                    <c:otherwise>
                                        <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getInquiryList(`${ipi.currentPage - 1}`,`${spd.pdNo}`);">&laquo;</a></li>
                                    </c:otherwise>
                            </c:choose>

                        <c:forEach var="p" begin="${ ipi.startPage }" end="${ ipi.endPage }">
                            <li class="page-item ${p == ipi.currentPage ? 'active' : ''}"><a class="page-link" href="javascript:void(0);" onclick="getInquiryList(`${p}`,`${spd.pdNo}`);">${p}</a></li>
                        </c:forEach>
                            
                        <c:choose>
                                <c:when test="${ ipi.currentPage eq ipi.maxPage }">
                                    <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getInquiryList(`${ipi.currentPage + 1}`,`${spd.pdNo}`);">&raquo;</a></li>
                                </c:otherwise>
                            </c:choose>
                            </ul>
                        </div>
                    </section>
                </div>    


                <!-- 문의 modal -->
                <div class="modal fade" id="inquiry-Modal">
                    <div class="modal-dialog modal-lg">
                        <div class="modal-content" >

                            <!-- Modal Header -->
                            <div class="modal-header">
                                <h4 >문의하기</h4>
                                <button type="button" class="close" data-dismiss="modal">&times;</button>
                            </div>

                            <!-- Modal body -->
                            <div class="modal-body" >
                                <div id="product-name-container">
                                    <div id="inquiry-product-name">
                                        ${spd.pdTitle}
                                    </div>
                                </div>
                                <form id="modal-inquiry-content" action="insertInquiry.spd" enctype="multipart/form-data" method="post">
                                    <input type="hidden" name="pno" value=${param.pno}>
                                    <input type="hidden" name="userNo" value=${loginUser.userNo}>
                                    <div id="product-inquiry-content-container">
                                        <div>
                                            문의제목
                                        </div>
                                        <div>
                                            <input type="text" name="inquiryTitle" required>
                                        </div>
                                        <div >
                                            *문의내용
                                        </div>
                                        <div id="product-inquiry-content-textarea">
                                            <textarea name="inquiryContents" id="product-inquiry-content"
                                                placeholder="문의 내용을 입력하세요." required></textarea>
                                        </div>
                                    </div>

                                    <div id="product-inquiry-enroll-btn-container">
                                        <button type="submit" id="product-inquiry-enroll-btn">완료</button>
                                    </div>
                                </form>
                            </div>


                        </div>
                    </div>
                </div>

                <div class="go" id="go-seller-info"></div>

                <div id="seller-info-container" >
                    <section class="seller-info" id="seller-info">
                        <h1>판매자 정보</h1>

                        <div>
                            <table>
                                <tr>
                                    <th>
                                        상호
                                    </th>
                                    <td>
                                        ${spd.mainBusinessName}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        대표자
                                    </th>
                                    <td>
                                        ${spd.businessName}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        사업장 소재지
                                    </th>
                                    <td>
                                        ${spd.businessAddress}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        전화번호
                                    </th>
                                    <td>
                                        ${spd.phone}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                       이메일
                                    </th>
                                    <td>
                                        ${spd.email}
                                    </td>
                                </tr>
                                <tr>
                                    <th>
                                        사업자 번호
                                    </th>
                                    <td>
                                        ${spd.businessNo}
                                    </td>
                                </tr>
                            </table>
                        </div>

                    </section>
                </div>

            </div>

            <div class="bottom-product-buy-area-container">
                <div class="bottom-product-buy-area" style="position: sticky; top: 185px; transition: top 0.1s ease 0s;">
                    <div>    
                        <form action="" id="product-opt-form" method="post">
                            <div class="product-opts">
                                <div class="product-opt-select">
                                    <div><span>옵션을 선택해주세요(필수)</span></div>
                                    <select class="select-option" name="optionName">

                                    </select>
                                </div>
                            </div>
                            <!-- 선택된 옵션과 수량 입력을 위한 컨테이너 -->
                            <div class="selected-options-container">

                            </div>
                    
                            <div class="bottom-price-area">
                                <div >주문금액</div>
                                <div >
                                    <span class="order-price">원</span>
                                </div>
                            </div>
                            <div class="bottom-btn-container">
                                <button type="button" class="cart-btn" id="product-cart-btn">장바구니</button>
                                <button type="button" class="buy-btn" id="product-buy-btn" >바로구매</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        
    </main>

    
    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>
</body>
</html>
