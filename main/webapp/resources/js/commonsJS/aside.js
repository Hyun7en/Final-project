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