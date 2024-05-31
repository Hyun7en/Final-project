// 옵션

$(document).ready(function() {
    // 페이지 로드 시 카테고리 목록을 가져오고, 그리기
    selectOptions(function(options){
        drawOptions(options);
    });

    function drawOptions(options) {
        let $selectOption = $('#select-option');
        $selectOption.empty(); // 기존의 옵션들을 초기화

        if (!options || options.length === 0) {
            console.log('No options received or options array is empty');
            return;
        }

        // 카테고리 목록의 각 항목에 대해 option 요소를 생성하여 추가
        options.forEach(function(option) {
            if (option) {
                $selectOption.append($('<option>').text(option.pdOptionName).val(option.pdOptionName)); // 값을 카테고리 이름으로 사용
            } else {
                console.log('Invalid option data', option);
            }
        });

        // 첫 번째 카테고리 항목을 선택
        if ($selectOption.find('option').length > 0) {
            $selectOption.val($selectOption.find('option:first').val());
        }
    }

    // 카테고리 목록을 서버로부터 가져오는 함수
    function selectOptions(callback) {
        $.ajax({
            url: "options.ax", // 서버 URL
            method: "GET",
            success: function(res) {
                callback(res);
            },
            error: function() {
                console.log("options.ax 통신 실패");
            }
        });
    }
});