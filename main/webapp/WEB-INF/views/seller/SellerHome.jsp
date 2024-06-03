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

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/sellerHome.css">

</head>
<body>
    <div id="wrap">
        <%@ include file="../commons/header.jsp" %>
        <main id="seller-home">
            <div id="seller-home-top">
                <button id="seller-blue-button"><img src="${pageContext.request.contextPath}/resources/image/mdi_bell-outline.png" alt="">알림받기</button>
                <p>워터 박스</p>
            </div>
            <div id="seller-home-nav"> <!-- 전체상품, 어항, 어항받침대, 어항뚜껑, 기타 -->
                <a href="" style="margin-left: auto;">BEST</a>
                <a href="">전체상품</a>
                <a href="">특가판매</a>
                <a href="">주문제작</a>
                <a href="">어항</a>
                <a href="">어항용품</a>
                <a href="">수족관용품</a>
                <a href="" style="margin-right: auto;">기타</a>
            </div>
            <div id="seller-home-banner">
                <img src="${pageContext.request.contextPath}\resources\image\seller_banner.png" alt="">
            </div>
            <div id="seller-home-list">
                <p>전체상품</p>
                <div id="seller-home-listnav"> <!--인기도, 최신등록, 가격순, 리뷰-->
                    <a href="">인기도순</a>|
                    <a href="" style="color: #0089FF; font-weight: bold;">최신등록순</a>|
                    <a href="">낮은 가격순</a>|
                    <a href="">높은 가격순</a>|
                    <a href="">할인율순</a>|
                    <a href="">누적 판매순</a>|
                    <a href="">리뷰 많은순</a>|
                    <a href="">평점 높은순</a>
                </div>
                <div id="seller-home-products">
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
                        </a>
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
                        </a>
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
                        </a>
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
                        </a>
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
                        </a>
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
                        </a>
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
                        </a>
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
                        </a>
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
                        </a>
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
                        </a>
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
                        </a>
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
                        </a>
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