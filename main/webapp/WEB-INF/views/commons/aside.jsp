<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/aside.css">
	
<script>
    $(document).ready(function(){
        // 메뉴 항목 클릭 시 드롭다운 메뉴 슬라이드 토글
        $('aside ul li div').click(function(){
            // 모든 하위 메뉴를 닫고 selected 클래스 제거
            $('aside ul li .sub-menu').slideUp();
            $('aside ul li div').removeClass('selected');

            // 클릭한 요소의 하위 메뉴를 슬라이드 토글
            if (!$(this).siblings('.sub-menu').is(':visible')) {
                $(this).siblings('.sub-menu').slideDown();
                $(this).addClass('selected');
            }
        });

        // 현재 URL을 기반으로 메뉴 상태 설정
        var currentUrl = window.location.pathname + window.location.search;
        $('.sub-menu li a').each(function() {
            if (this.href === window.location.href) {
                $(this).addClass('selected');
                $(this).parents('.sub-menu').slideDown();
                $(this).parents('li').children('div').addClass('selected');
            }
        });
    });
</script>

</head>
<body>
    <aside>
        <ul>
            <li>
                <div>판매자 정보 <img src="${pageContext.request.contextPath}/resources/image/triangle.png"></div>
                <ul class="sub-menu">
                    <li><a href="info.sr">판매자 정보</a></li>
                </ul>
            </li>
            <li>
                <div>스토어 관리 <img src="${pageContext.request.contextPath}/resources/image/triangle.png"></div>
                <ul class="sub-menu">
                    <li><a href="enrollForm.pd">상품 등록</a></li>
                    <li><a href="list.pd">등록 상품 관리</a></li>
                    <li><a href="detail.srh">판매자 홈 관리</a></li>
                </ul>
            </li>
            <li>
                <div>주문/배송 <img src="${pageContext.request.contextPath}/resources/image/triangle.png"></div>
                <ul class="sub-menu">
                    <li><a href="#">세부사항 1</a></li>
                    <li><a href="#">세부사항 2</a></li>
                    <li><a href="#">세부사항 3</a></li>
                </ul>
            </li>
            <li>
                <div>취소/반품/교환 <img src="${pageContext.request.contextPath}/resources/image/triangle.png"></div>
                <ul class="sub-menu">
                    <li><a href="#">추후 기재</a></li>
                    <li><a href="#">추후 기재</a></li>
                    <li><a href="#">추후 기재</a></li>
                </ul>
            </li>
            <li>
                <div>고객 문의 <img src="${pageContext.request.contextPath}/resources/image/triangle.png"></div>
                <ul class="sub-menu">
                    <li><a href="#">추후 기재</a></li>
                    <li><a href="#">추후 기재</a></li>
                    <li><a href="#">추후 기재</a></li>
                </ul>
            </li>
            <li>
                <div>정산 관리 <img src="${pageContext.request.contextPath}/resources/image/triangle.png"></div>
                <ul class="sub-menu">
                    <li><a href="#">추후 기재</a></li>
                    <li><a href="#">추후 기재</a></li>
                    <li><a href="#">추후 기재</a></li>
                </ul>
            </li>
        </ul>
    </aside>
</body>
</html>