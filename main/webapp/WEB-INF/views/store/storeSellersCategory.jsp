<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Header</title>

    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <!-- Latest compiled JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
    
    <!-- alertify -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">

    <script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/storeJS/storeSellersCategory.js"></script>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storeCSS/storeSellersCategory.css">

</head>
<body onload="orderSelected(); contextPath(`${pageContext.request.contextPath}`); checkAlarm(`${loginUser.userNo}`, `${si.sellerPageNo}`);">
    <c:if test="${ not empty successMessage}">
		<script>
            var successMessage = '${successMessage}';
            if (successMessage) {
                Swal.fire({
                    icon: 'success',
                    title: 'success!',
                    html: successMessage
                });
            }
		</script>
		<c:remove var="successMessage" scope="session"/>
	</c:if>
    <c:if test="${ not empty infoMessage}">
		<script>
            var infoMessage = '${infoMessage}';
            if (infoMessage) {
                Swal.fire({
                    icon: 'info',
                    title: 'Notice',
                    html: infoMessage
                });
            }
		</script>
		<c:remove var="infoMessage" scope="session"/>
	</c:if>
    <div id="wrap">
        <%@ include file="../commons/header.jsp" %>
        <main id="seller-home">
            <div id="seller-home-top">
                <c:choose>
                    <c:when test="${empty loginUser}">
                        <!-- 로그인 전 -->
                        <div id="seller-grey-img"><img src="${pageContext.request.contextPath}/resources/image/mdi_bell-outline.png" alt=""></div>
                        <button id="seller-grey-button" disabled>알람설정</button>
                    </c:when>
                    <c:otherwise>
                        <!-- 로그인 후 -->
                        <div class="alarmDiv" id="seller-blue-img" onclick="getAlarmOn(`${loginUser.userNo}`,`${si.sellerPageNo}`)"><img src="${pageContext.request.contextPath}/resources/image/mdi_bell-outline.png" alt=""></div>
                        <button class="alarmButton" id="seller-blue-button" onclick="getAlarmOn(`${loginUser.userNo}`,`${si.sellerPageNo}`)">알람설정</button>
                    </c:otherwise>
                </c:choose>
                <p>${si.storeName}</p>
            </div>
            <div id="seller-home-catchphrase"><p>${si.sellerExplain}</p></div>
            <div id="seller-home-nav"> <!--c:forEach로 카테고리 작성-->
                <a href="sellersStore.st?sellerPageNo=${si.sellerPageNo}&order=1&cpage=1" class="category-0" style="margin-left: auto;">전체상품</a>
                <c:forEach var="sl" items="${siList}" varStatus="order">
                    <c:choose>
                        <c:when test="${order.last}">
                        	<a href="sellersCategory.st?sellerPageNo=${si.sellerPageNo}&pCategory=${sl.prCategory}&order=1&cpage=1" style="margin-right: auto;">${sl.prCategory}</a>
                        </c:when>
                        <c:otherwise>
                        	<a href="sellersCategory.st?sellerPageNo=${si.sellerPageNo}&pCategory=${sl.prCategory}&order=1&cpage=1">${sl.prCategory}</a>
                        </c:otherwise>
                    </c:choose>
                </c:forEach>
            </div>
            <div id="seller-home-banner" style="background-image: url(${si.spChangeName}); background-size: 1120px;"></div>
            <div id="seller-home-list">
                <p>${prCategory}</p>
                <div id="seller-home-listnav">
                    <button onclick="order(`${si.sellerPageNo}`, `${prCategory}`, 0)" class="list-order" value="0" style="border-left: 0;">인기도순</button>
                    <button onclick="order(`${si.sellerPageNo}`, `${prCategory}`, 1)" class="list-order" value="1">최신등록순</button>
                    <button onclick="order(`${si.sellerPageNo}`, `${prCategory}`, 2)" class="list-order" value="2">낮은 가격순</button>
                    <button onclick="order(`${si.sellerPageNo}`, `${prCategory}`, 3)" class="list-order" value="3">높은 가격순</button>
                    <button onclick="order(`${si.sellerPageNo}`, `${prCategory}`, 4)" class="list-order" value="4" style="border-right: 0;">리뷰 많은순</button>
                </div>
                <div id="seller-home-products">
                    <c:forEach var="pr" items="${prList}">
                        <div id="seller-home-goods">
                            <div id="seller-home-goodsimg" style="background-image: url(${pr.prChangeName}); background-size: 250px 250px"></div>
                            <div id="seller-home-goodsinfo">
                                <a href="">
                                    <b>${pr.prTitle}</b>
                                    <strong>${pr.prPrice} 원</strong>
                                    <br>
                                    <p>&#9733; ${pr.prStar} 리뷰 ${pr.reviewCount}</p>
                                </a>
                                <button id="bookmarkgrey">
                                    <img src="${pageContext.request.contextPath}\resources\image\bookmarkfishgrey.png" alt="북마크 회색" >
                                </button>
                            </div>
                        </div>
                    </c:forEach>    
                </div>
                <div id="seller-home-pagenum">
                    <div id="pagination-div">
                        <ul class="pagination">
                            <c:choose>
                                <c:when test="${ pi.currentPage eq 1 }">
                                    <li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="sellersCategory.st?sellerPageNo=${si.sellerPageNo}&pCategory=${sl.prCategory}&order=${order}&cpage=${pi.currentPage - 1}">&laquo;</a></li>
                                </c:otherwise>
                            </c:choose>
                            <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
                                <li class="page-item ${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="sellersCategory.st?sellerPageNo=${si.sellerPageNo}&pCategory=${sl.prCategory}&order=${order}&cpage=${p}">${p}</a></li>
                            </c:forEach>
                            <c:choose>
                                <c:when test="${ pi.currentPage eq pi.maxPage }">
                                    <li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>
                                </c:when>
                                <c:otherwise>
                                    <li class="page-item"><a class="page-link" href="sellersCategory.st?sellerPageNo=${si.sellerPageNo}&pCategory=${sl.prCategory}&order=${order}&cpage=${pi.currentPage + 1}">&raquo;</a></li>
                                </c:otherwise>
                            </c:choose>
                        </ul>
                    </div>
                </div>
            </div>
        </main>
        <%@ include file="../commons/footer.jsp" %>
    </div>
</body>
</html>