<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aquaqu</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/productListView.css">

<style>
    main {
        background-color: #E0F1FF;
        min-height: 100vh;
        display: flex;
        justify-content: center;
        align-items: center;
        padding: 20px;
    }
    .order-complete-container {
        text-align: center;
        padding: 50px;
        background-color: #fff;
        border-radius: 10px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        max-width: 600px;
        width: 100%;
    }

    .order-complete-container h1 {
        font-size: 36px;
        color: #333;
        margin-bottom: 20px;
    }

    .order-complete-container p {
        font-size: 18px;
        color: #555;
        margin-bottom: 30px;
    }

    .order-actions {
        margin-top: 30px;
    }

    .order-actions button {
        font-size: 16px;
        padding: 10px 20px;
        margin: 0 10px;
        cursor: pointer;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 5px;
        transition: background-color 0.3s;
    }

    .order-actions button:hover {
        background-color: #0056b3;
    }
</style>

</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>
        <div class="order-complete-container">
            <h1>결제 완료</h1>
            <p>주문해주셔서 감사합니다. 결제가 성공적으로 완료되었습니다.</p>

            <div class="order-actions">
                <button onclick="window.location.href='orderHistory.my?userNo=${loginUser.userNo}'">주문 내역 보기</button>
                <button onclick="window.location.href='list.spd'">메인 스토어로 이동</button>
            </div>
        </div>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>

</body>
</html>
