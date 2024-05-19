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

<style>

    main {
        display: flex;
        flex: 1;
        background-color: #f9f9f9;
    }

    aside {
        width: 250px;
        background-color: #333;
        color: #fff;
        padding: 20px;
        box-shadow: 2px 4px 12px rgba(0, 0, 0, 0.1);
    }

    aside h2 {
        font-size: 18px;
        margin-bottom: 15px;
    }

    aside ul {
        list-style-type: none;
        padding: 0;
    }

    aside ul li {
        margin-bottom: 10px;
    }

    aside ul li a {
        text-decoration: none;
        color: #fff;
    }

    aside ul li a:hover {
        color: #0089FF;
    }

    .content {
        flex: 1;
        padding: 20px;
        background-color: #fff;
        box-shadow: 2px 4px 12px rgba(0, 0, 0, 0.1);
    }

    .content h1 {
        font-size: 24px;
        margin-bottom: 20px;
    }

    .content form {
        display: flex;
        flex-direction: column;
    }

    .content form label {
        margin-bottom: 5px;
        font-weight: bold;
    }

    .content form input {
        margin-bottom: 15px;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }

    .content form button {
        padding: 10px;
        background-color: #0089FF;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .content form button:hover {
        background-color: #005bb5;
    }
</style>

</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>

        <aside>
            <h2>판매자 정보</h2>
            <ul>
                <li><a href="#">판매자 정보</a></li>
                <li><a href="#">스토어 관리</a></li>
                <li><a href="#">주문 내역</a></li>
                <li><a href="#">취소/반품/교환</a></li>
                <li><a href="#">고객 문의</a></li>
                <li><a href="#">정보 관리</a></li>
            </ul>
        </aside>

        <div class="content">
            <h1>판매자 정보</h1>
            <form action="#" method="post">
                <label for="business-info">사업자 정보</label>
                <input type="text" id="business-info" name="business-info" value="">

                <label for="business-number">사업자 등록번호</label>
                <input type="text" id="business-number" name="business-number" value="">

                <label for="ceo-name">대표자 성명</label>
                <input type="text" id="ceo-name" name="ceo-name" value="">

                <label for="business-type">업종</label>
                <input type="text" id="business-type" name="business-type" value="">

                <label for="company-name">상호</label>
                <input type="text" id="company-name" name="company-name" value="">

                <label for="business-classification">업태명</label>
                <input type="text" id="business-classification" name="business-classification" value="">

                <label for="business-category">종목명</label>
                <input type="text" id="business-category" name="business-category" value="">

                <label for="business-address">사업장 주소</label>
                <input type="text" id="business-address" name="business-address" value="">

                <label for="account-holder">정산대금 입금계좌 예금주</label>
                <input type="text" id="account-holder" name="account-holder" value="">

                <label for="account-number">정산대금 입금계좌번호</label>
                <input type="text" id="account-number" name="account-number" value="">

                <button type="submit">수정 신청</button>
            </form>
        </div>
        
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>

</body>
</html>
