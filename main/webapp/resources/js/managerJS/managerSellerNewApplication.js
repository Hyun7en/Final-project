$(document).ready(function(){
    // 판매자 신규신청을 승인하기 위해 승인 버튼 눌렀을 때
    $(".application-approve-btn").click(function(){
        var index = $(this).closest("tr").index(); // 클릭된 버튼이 있는 행의 인덱스 가져오기
        var modal = $(".seller-info-modal").eq(index); // 해당 인덱스의 모달 찾기
        modal.css("display", "flex"); // 모달 표시

        // 신청승인 버튼 눌렀을 때
        modal.find(".approve-btn").click(function(){
            var userNo = modal.find(".userNo").text(); // 해당 모달안의 class이름이 userNo인 태그안의 text 가져옴
            location.href="sellerNewApplicationApprove.ma?userNo=" + userNo;
        })

        // 신청거부 버튼 눌렀을 때
        modal.find(".reject-btn").click(function(){
            var userNo = modal.find(".userNo").text(); // 해당 모달안의 class이름이 userNo인 태그안의 text 가져옴
            location.href="sellerNewApplicationReject.ma?userNo=" + userNo;
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
        document.getElementById('search-form').action = 'sellerNewApplication.ma'; // 값이 없을 경우 memberList.ma로 변경
    }
}

// 전체 체크박스 눌렀을 때
function clickAllCheckboxes() {
    var checkboxes = document.querySelectorAll(".checkbox");    // 전체 체크박스 가져옴
    var allCheckbox = document.querySelector('.all-checkbox');  // 전체선택 체크박스 가져옴

    checkboxes.forEach(function(checkbox) {         // 전체 체크박스 forEach반복문으로 기능 수행
        checkbox.checked = allCheckbox.checked;     // 전체선택 체크박스에 checked된 값을 checkbox에 대입 
    });
}

// 선택 신청승인 버튼 눌렀을 때
function selectApplicationApprove(){
    var checkboxes = document.querySelectorAll('.checkbox:checked');  // 체크된 체크박스들 가져오기
    checkboxes.forEach(function(checkbox) {     // 체크된 체크박스 하나씩 기능 수행시키기
        var index = $(checkbox).closest("tr").index();  // 체크된 체크박스 행의 인덱스 가져오기
        var modal = $(".seller-info-modal").eq(index);  // 해당 인덱스의 모달 가져오기(리스트(행)에는 userNo이 없고 모달에 userNo이 있어 모달 가져옴)
        var userNo = modal.find(".userNo").text();      // 해당 모달안의 class이름이 userNo인 태그안의 값 가져옴
        location.href="sellerNewApplicationApprove.ma?userNo=" + userNo;
    });
}

// 선택 신청거부 버튼 눌렀을 때
function selectApplicationReject(){
    var checkboxes = document.querySelectorAll('.checkbox:checked');  // 체크된 체크박스들 가져오기
    checkboxes.forEach(function(checkbox) {     // 체크된 체크박스 하나씩 기능 수행시키기
        var index = $(checkbox).closest("tr").index();  // 체크된 체크박스 행의 인덱스 가져오기
        var modal = $(".seller-info-modal").eq(index);  // 해당 인덱스의 모달 가져오기(리스트(행)에는 userNo이 없고 모달에 userNo이 있어 모달 가져옴)
        var userNo = modal.find(".userNo").text();      // 해당 모달안의 class이름이 userNo인 태그안의 값 가져옴
        location.href="sellerNewApplicationReject.ma?userNo=" + userNo;
    });
}