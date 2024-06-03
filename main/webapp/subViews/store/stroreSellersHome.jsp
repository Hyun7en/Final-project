<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>

    <!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storeCSS/stroreSellersHome.css">

</head>
<body>
    <div id="wrap">
        <%@ include file="../commons/header.jsp" %>
        <main id="seller-home">
            <div id="seller-home-top">
                <button id="seller-blue-button"><img src="${pageContext.request.contextPath}/resources/image/mdi_bell-outline.png" alt="알림 아이콘">알림받기</button>
                <p>워터 박스</p>
            </div>
            <div id="seller-home-catchphrase"><p>-안성맞춤의 공간-</p></div>
            <div id="seller-home-nav"> <!--c:forEach로 카테고리 작성-->
                <a href="" class="category-0" style="margin-left: auto;">전체상품</a>
                <a href="" class="category-1">어항</a>
                <a href="" class="category-2">어항받침대</a>
                <a href="" class="category-3">어항뚜껑</a>
                <a href="" class="category-4" style="margin-right: auto;">기타</a>
            </div>
            <div id="seller-home-banner" style="background-image: url(${pageContext.request.contextPath}/resources/image/fishTank.png); background-size: 1120px;"></div>
            <div id="seller-home-list">
                <p>전체상품</p>
                <div id="seller-home-listnav">
                    <a href="" class="order-0" style="border-left: 0;">인기도순</a>
                    <a href="" class="order-1" id="seller-home-selected" style="color: #0089FF; font-weight: bold;">최신등록순</a>
                    <a href="" class="order-2">낮은 가격순</a>
                    <a href="" class="order-3">높은 가격순</a>
                    <a href="" class="order-4" style="border-right: 0;">리뷰 많은순</a>
                </div>
                <div id="seller-home-products">
                    <div id="seller-home-goods">
                        <a href="">
                            <img src="${pageContext.request.contextPath}/resources/image/seller_sample1.png" id="seller_sample1" alt="상품사진 샘플1">
                        </a>
                        <div>
                            <a href="">
                                <b>슬라이딩 어항뚜껑 35 × 45 어항 수조 뚜껑</b>
                                <strong>7,800원</strong>
                                <br>
                                <p>&#9733; 4.7 리뷰 15,191</p>
                            </a>
                            <button id="bookmarkgrey">
                                <img src="${pageContext.request.contextPath}\resources\image\bookmarkfishgrey.png" alt="북마크 회색" >
                            </button>
                        </div>
                    </div>
                    <div id="seller-home-goods">
                        <a href="">
                            <img src="${pageContext.request.contextPath}\resources\image\seller_sample1.png" id="seller_sample1" alt="상품사진 샘플1">
                        </a>
                        <div>
                            <a href="">
                                <b>슬라이딩 어항뚜껑 60 × 45 어항 수조 뚜껑</b>
                                <strong>7,800원</strong>
                                <br>
                                <p>&#9733; 4.7 리뷰 15,191</p>
                            </a>
                            <button id="bookmarkblue">
                                <img src="${pageContext.request.contextPath}\resources\image\bookmarkfishblue.png" alt="북마크 파란색" >
                            </button>
                        </div>
                    </div>
                    <div id="seller-home-goods">
                        <a href="">
                            <img src="${pageContext.request.contextPath}\resources\image\seller_sample1.png" id="seller_sample1" alt="상품사진 샘플1">
                        </a>
                        <div>
                            <a href="">
                                <b>슬라이딩 어항뚜껑 35 × 45 어항 수조 뚜껑</b>
                                <strong>7,800원</strong>
                                <br>
                                <p>&#9733; 4.7 리뷰 15,191</p>
                            </a>
                            <button id="bookmarkgrey">
                                <img src="${pageContext.request.contextPath}\resources\image\bookmarkfishgrey.png" alt="북마크 회색" >
                            </button>
                        </div>
                    </div>
                    <div id="seller-home-goods">
                        <a href="">
                            <img src="${pageContext.request.contextPath}\resources\image\seller_sample1.png" id="seller_sample1" alt="상품사진 샘플1">
                        </a>
                        <div>
                            <a href="">
                                <b>슬라이딩 어항뚜껑 60 × 45 어항 수조 뚜껑</b>
                                <strong>7,800원</strong>
                                <br>
                                <p>&#9733; 4.7 리뷰 15,191</p>
                            </a>
                            <button id="bookmarkblue">
                                <img src="${pageContext.request.contextPath}\resources\image\bookmarkfishblue.png" alt="북마크 파란색" >
                            </button>
                            
                        </div>
                    </div>
                    <div id="seller-home-goods">
                        <a href="">
                            <img src="${pageContext.request.contextPath}\resources\image\seller_sample1.png" id="seller_sample1" alt="상품사진 샘플1">
                        </a>
                        <div>
                            <a href="">
                                <b>슬라이딩 어항뚜껑 35 × 45 어항 수조 뚜껑</b>
                                <strong>7,800원</strong>
                                <br>
                                <p>&#9733; 4.7 리뷰 15,191</p>
                            </a>
                            <button id="bookmarkgrey">
                                <img src="${pageContext.request.contextPath}\resources\image\bookmarkfishgrey.png" alt="북마크 회색" >
                            </button>
                        </div>
                    </div>
                    <div id="seller-home-goods">
                        <a href="">
                            <img src="${pageContext.request.contextPath}\resources\image\seller_sample1.png" id="seller_sample1" alt="상품사진 샘플1">
                        </a>
                        <div>
                            <a href="">
                                <b>슬라이딩 어항뚜껑 60 × 45 어항 수조 뚜껑</b>
                                <strong>7,800원</strong>
                                <br>
                                <p>&#9733; 4.7 리뷰 15,191</p>
                            </a>
                            <button id="bookmarkblue">
                                <img src="${pageContext.request.contextPath}\resources\image\bookmarkfishblue.png" alt="북마크 파란색" >
                            </button>
                            
                        </div>
                    </div>
                    <div id="seller-home-goods">
                        <a href="">
                            <img src="${pageContext.request.contextPath}\resources\image\seller_sample1.png" id="seller_sample1" alt="상품사진 샘플1">
                        </a>
                        <div>
                            <a href="">
                                <b>슬라이딩 어항뚜껑 35 × 45 어항 수조 뚜껑</b>
                                <strong>7,800원</strong>
                                <br>
                                <p>&#9733; 4.7 리뷰 15,191</p>
                            </a>
                            <button id="bookmarkgrey">
                                <img src="${pageContext.request.contextPath}\resources\image\bookmarkfishgrey.png" alt="북마크 회색" >
                            </button>
                        </div>
                    </div>
                    <div id="seller-home-goods">
                        <a href="">
                            <img src="${pageContext.request.contextPath}\resources\image\seller_sample1.png" id="seller_sample1" alt="상품사진 샘플1">
                        </a>
                        <div>
                            <a href="">
                                <b>슬라이딩 어항뚜껑 60 × 45 어항 수조 뚜껑</b>
                                <strong>7,800원</strong>
                                <br>
                                <p>&#9733; 4.7 리뷰 15,191</p>
                            </a>
                            <button id="bookmarkblue">
                                <img src="${pageContext.request.contextPath}\resources\image\bookmarkfishblue.png" alt="북마크 파란색" >
                            </button>
                            
                        </div>
                    </div>
                    <div id="seller-home-goods">
                        <a href="">
                            <img src="${pageContext.request.contextPath}\resources\image\seller_sample1.png" id="seller_sample1" alt="상품사진 샘플1">
                        </a>
                        <div>
                            <a href="">
                                <b>슬라이딩 어항뚜껑 35 × 45 어항 수조 뚜껑</b>
                                <strong>7,800원</strong>
                                <br>
                                <p>&#9733; 4.7 리뷰 15,191</p>
                            </a>
                            <button id="bookmarkgrey">
                                <img src="${pageContext.request.contextPath}\resources\image\bookmarkfishgrey.png" alt="북마크 회색" >
                            </button>
                        </div>
                    </div>
                    <div id="seller-home-goods">
                        <a href="">
                            <img src="${pageContext.request.contextPath}\resources\image\seller_sample1.png" id="seller_sample1" alt="상품사진 샘플1">
                        </a>
                        <div>
                            <a href="">
                                <b>슬라이딩 어항뚜껑 60 × 45 어항 수조 뚜껑</b>
                                <strong>7,800원</strong>
                                <br>
                                <p>&#9733; 4.7 리뷰 15,191</p>
                            </a>
                            <button id="bookmarkblue">
                                <img src="${pageContext.request.contextPath}\resources\image\bookmarkfishblue.png" alt="북마크 파란색" >
                            </button>
                            
                        </div>
                    </div>
                    <div id="seller-home-goods">
                        <a href="">
                            <img src="${pageContext.request.contextPath}\resources\image\seller_sample1.png" id="seller_sample1" alt="상품사진 샘플1">
                        </a>
                        <div>
                            <a href="">
                                <b>슬라이딩 어항뚜껑 35 × 45 어항 수조 뚜껑</b>
                                <strong>7,800원</strong>
                                <br>
                                <p>&#9733; 4.7 리뷰 15,191</p>
                            </a>
                            <button id="bookmarkgrey">
                                <img src="${pageContext.request.contextPath}\resources\image\bookmarkfishgrey.png" alt="북마크 회색" >
                            </button>
                        </div>
                    </div>
                    <div id="seller-home-goods">
                        <a href="">
                            <img src="${pageContext.request.contextPath}\resources\image\seller_sample1.png" id="seller_sample1" alt="상품사진 샘플1">
                        </a>
                        <div>
                            <a href="">
                                <b>슬라이딩 어항뚜껑 60 × 45 어항 수조 뚜껑</b>
                                <strong>7,800원</strong>
                                <br>
                                <p>&#9733; 4.7 리뷰 15,191</p>
                            </a>
                            <button id="bookmarkblue">
                                <img src="${pageContext.request.contextPath}\resources\image\bookmarkfishblue.png" alt="북마크 파란색" >
                            </button>
                            
                        </div>
                    </div>
                </div>
                <div id="seller-home-pagenum">
                    <img src="${pageContext.request.contextPath}\resources\image\pagingbar.png" alt="페이징 임시">
                </div>
            </div>
        </main>
        <%@ include file="../commons/footer.jsp" %>
    </div>
</body>
</html>