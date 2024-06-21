<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aquaqu</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/sellerInfo.css">

<script src="${pageContext.request.contextPath}/resources/js/sellerJS/leaveStore.js"></script>
</head>
<body>
<div class="wrap">

    <input type="hidden" id="leaveStore" value="${loginUser.userNo}">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>
        
    <!-- aside -->
    <%@ include file="../commons/aside.jsp" %>

        <section>
            <h1>판매자 정보 &gt; 판매자 정보</h1>

            <table>
                <tr>
                    <th>
                        사업자 등록번호
                    </th>
                    <td>
                        ${sr.businessNo}
                    </td>
                </tr>
                <tr>
                    <th>
                        대표자 성명
                    </th>
                    <td>
                        ${sr.businessName}
                    </td>
                </tr>
                <tr>
                    <th>
                        대표자 성명2
                    </th>
                    <td>
                        ${sr.subBusinessName}
                    </td>
                </tr>
                <tr>
                    <th>
                        개업일자
                    </th>
                    <td>
                        ${sr.openBusinessDate}  
                    </td>
                </tr>
                <tr>
                    <th>
                        상호
                    </th>
                    <td>
                        ${sr.storeName}
                    </td>
                </tr>
                <tr>
                    <th>
                        법인 등록 번호
                    </th>
                    <td>
                        ${sr.crn}
                    </td>
                </tr>
                <tr>
                    <th>
                        업태명
                    </th>
                    <td>
                        ${sr.mainBusinessName}
                    </td>
                </tr>
                <tr>
                    <th>
                        종목명
                    </th>
                    <td>
                        ${sr.mainItemName}
                    </td>
                </tr>
                <tr>
                    <th>
                        사업장 주소
                    </th>
                    <td>
                        ${sr.businessAddress}
                    </td>
                </tr>
                <tr>
                    <th>
                        정산대금 입금계좌 예금주
                    </th>
                    <td>
                        ${sr.businessName}
                    </td>
                </tr>
                <tr style="border-bottom: 1px solid #ccc;">
                    <th>
                        정산대금 입금계좌번호
                    </th>
                    <td>
                        ${sr.businessAccount}
                    </td>
                </tr>
            </table>

            <div>
                <button onclick="leaveStore();">퇴점</button>
            </div>

        </section>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>

</body>
</html>
