$(document).ready(function(){

    // 회원 정보를 보기 위해 상세보기 버튼 눌렀을 때
    $(".sellerInfo-detailView-btn").click(function(){
        var index = $(this).closest("tr").index(); // 클릭된 버튼이 있는 행의 인덱스 가져오기
        var modal = $(".sellerInfo-modal").eq(index); // 해당 인덱스의 모달 찾기
        modal.css("display", "flex"); // 모달 표시

        // 판매자탈퇴 버튼 눌렀을 때
        modal.find(".deleteSeller-btn").click(function(){
            var userNo = modal.find(".userNo").text(); // 해당 모달안의 class이름이 userNo인 태그의 text 가져옴
            // location.href="deleteSeller.ma?userNo=" + userNo; // 판매자탈퇴하는 메서드로 이동(아직 안만들었음 병현님이 만들실것같음)
        })

        // 닫기 버튼 눌렀을 때
        modal.find(".close-btn").click(function(){
            modal.css("display", "none"); // 모달 숨김
        })
    });
});

// 시작 날짜 선택했을 때
function syncDate(){
    var startDate = document.getElementById("start-date").value;
    var endDate = document.getElementById("end-date");
    endDate.value = startDate; // 시작 날짜를 선택했을 때 끝 날짜도 자동으로 시작 날짜로 변경(시작날짜만 선택하고 검색하는것을 방지)
    endDate.readOnly = false; // 시작 날짜를 선택해야 끝 날짜를 선택할 수 있음(끝 날짜 먼저 선택 불가)
}

// 검색 버튼 눌렀을 떄
function submitForm() {
    var searchKeyword = document.getElementById("search-bar").value;
    var startDate = document.getElementById("start-date").value
    if (searchKeyword.trim() === "" && startDate.trim() === "") { // 검색값이 공백인지 확인
        document.getElementById('search-form').action = 'sellerList.ma'; // 값이 없을 경우 memberList.ma로 변경
    }
}