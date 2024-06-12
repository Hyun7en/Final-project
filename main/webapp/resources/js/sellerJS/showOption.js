    // JSP에서 pno 변수를 JavaScript로 전달
    const pno = '${pd.pdNo}';
    console.log("pno: " + pno); // pno 값이 제대로 전달되었는지 확인
    
    $(function() {
    // 페이지 로드 시 옵션 목록을 가져오고, 그리기
    selectOptions();

    function selectOptions() {
        $.ajax({
            url: "options.ax", // 서버 URL
            method: "GET",
            data: { pno: pno },
            success: function(res) {
                drawOptions(res);
            },
            error: function() {
                console.log("options.ax 통신 실패");
                alert("옵션을 가져오는 데 실패했습니다. 페이지를 새로고침해주세요.");
            }
        });
    }

    function drawOptions(options) {
        let $selectOption = $('#select-option');
        $selectOption.empty(); // 기존의 옵션들을 초기화

        if (!options || options.length === 0) {
            console.log('No options received or options array is empty');
            return;
        }

        // 옵션 목록의 각 항목에 대해 option 요소를 생성하여 추가
        options.forEach(function(option) {
            if (option) {
                $selectOption.append($('<option>').text(option.pdOptionName).val(option.pdOptionName)); // 값을 옵션 이름으로 사용
            } else {
                console.log('Invalid option data', option);
            }
        });

        // 첫 번째 옵션 항목을 선택
        if ($selectOption.find('option').length > 0) {
            $selectOption.val($selectOption.find('option:first').val());
        }
    }
});