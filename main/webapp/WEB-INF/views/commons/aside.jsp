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
        $('aside ul li div').click(function(e){
            e.preventDefault();
            
            // 모든 하위 메뉴를 닫고 selected 클래스 제거
            $('aside ul li .sub-menu').slideUp();
            $('aside ul li div').removeClass('selected');
    
            // 클릭한 요소의 하위 메뉴를 슬라이드 토글
            if (!$(this).siblings('.sub-menu').is(':visible')) {
                $(this).siblings('.sub-menu').slideDown();
                $(this).addClass('selected');
            }
        });
    
        // 하위 메뉴의 링크 클릭 시
        $('.sub-menu li a').click(function(e) {
            e.preventDefault();
            
            // 모든 링크에서 selected 클래스 제거
            $('.sub-menu li a').removeClass('selected');
            
            // 클릭한 링크에 selected 클래스 추가
            $(this).addClass('selected');
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
                    <li><a href="enroll.pd">상품 등록</a></li>
                    <li><a href="list.pd">등록 상품 관리</a></li>
                    <li><a href="enroll.srh">판매자 홈 등록</a></li>
                    <li><a href="manage.srh">판매자 홈 관리</a></li>
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