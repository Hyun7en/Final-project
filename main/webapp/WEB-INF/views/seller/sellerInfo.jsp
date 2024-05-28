<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 정보</title>

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
            <h1>판매자 정보 &gt; 판매자 정보</h1>

            <div>
                <h4>*사업자 등록번호</h4>
                <span id="business-number">${sr.businessNo}</span>
            </div>

            <div>
                <h4>*대표자 성명</h4>
                <span id="ceo-name">${sr.businessName}</span>
            </div>

            <div>
                <h4>*대표자 성명2</h4>
                <span id="ceo-name2">${sr.subBusinessName}</span>
            </div>

            <div>
                <h4>*개업일자</h4>
                <span id="business-type">${sr.openBusinessDate}</span>
            </div>

            <div>
                <h4>*상호</h4>
                <span id="company-name">${sr.storeName}</span>
            </div>

            <div>
                <h4>*법인 등록 번호</h4>
                <span id="crn">${sr.crn}</span>
            </div>

            <div>
                <h4>*업태명</h4>
                <span id="business-classification">${sr.mainBusinessName}</span>
            </div>

            <div>
                <h4>*종목명</h4>
                <span id="business-category">${sr.mainItemName}</span>
            </div>

            <div>
                <h4>*사업장 주소</h4>
                <span id="business-address">${sr.businessAddress}</span>
            </div>

            <div>
                <h4>*정산대금 입금계좌 예금주</h4>
                <span id="account-holder">${sr.businessName}</span>
            </div>

            <div>
                <h4>*정산대금 입금계좌번호</h4>
                <span id="account-number">${sr.businessAccount}</span>
            </div>

            <div>
                <button>수정 신청</button>
            </div>

        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>

</body>
</html>
