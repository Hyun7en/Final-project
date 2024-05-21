<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Seller Information</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/sellerInfo.css">


</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>
        
    <!-- aside -->
    <%@ include file="../commons/aside.jsp" %>

       
        <section>
            <h1>판매자 정보</h1>

            <div>
                <h4>*사업자 등록번호</h4>
                <span id="business-number">경기도 서울특별시 대구동 부산아파트</span>
            </div>

            <div>
                <h4>*대표자 성명</h4>
                <span id="ceo-name">ddd</span>
            </div>

            <div>
                <h4>*대표자 성명2</h4>
                <span id="ceo-name2">ddd</span>
            </div>

            <div>
                <h4>*개업일자</h4>
                <span id="business-type">ddd</span>
            </div>

            <div>
                <h4>*상호</h4>
                <span id="company-name">ddd</span>
            </div>

            <div>
                <h4>*업태명</h4>
                <span id="business-classification">ddd</span>
            </div>

            <div>
                <h4>*종목명</h4>
                <span id="business-category">dd</span>
            </div>

            <div>
                <h4>*사업장 주소</h4>
                <span id="business-address">ddd</span>
            </div>

            <div>
                <h4>*정산대금 입금계좌 예금주</h4>
                <span id="account-holder">ddd</span>
            </div>

            <div>
                <h4>*정산대금 입금계좌번호</h4>
                <span id="account-number">ddd</span>
            </div>

            <a href="#">수정 신청</a>
        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>

</body>
</html>
