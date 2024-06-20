function leaveStore() {
    // confirm 창에서 '예'를 클릭한 경우에만 실행
    if (confirm("진짜 퇴점하시겠습니까?")) {
        let userNo = document.querySelector('#leaveStore').value;
        console.log(userNo);

        $.ajax({
            url: 'leaveStore.ax',
            method: 'POST',
            data: { userNo: userNo },
            success: function(response) {
                console.log("ajax 성공", response);
                // 로그아웃 URL로 리디렉션
                window.location.href = 'logout.me'; // 로그아웃 URL로 리디렉션
            },
            error: function(error) {
                console.log("ajax 실패", error);
            }
        });
    } else {
        console.log("퇴점 취소");
    }
}
