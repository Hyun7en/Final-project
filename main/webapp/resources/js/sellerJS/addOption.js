$(document).ready(function() {
    let options = [];

    // 엔터 키 이벤트를 처리하는 함수
    function addOption() {
        let optionName = $('#enroll-option').val().trim();
        let pdCount = parseInt($('#enroll-pdCount').val().trim(), 10);

        if (optionName && !isNaN(pdCount) && pdCount >= 0) {
            let option = { optionName: optionName, pdCount: pdCount };
            
            if (options.some(opt => opt.optionName.toLowerCase() === optionName.toLowerCase())) {
                alert('이미 추가된 옵션입니다.');
            } else {
                options.push(option);
                $('#optionList').append('<div data-option="' + optionName + '"><li>' + optionName + ' - ' + pdCount + '</li><button class="removeBtn">x</button></div>');
                $('#enroll-option').val('');
                $('#enroll-pdCount').val(''); // 입력 필드 초기화
                console.log(options);
                alert('옵션이 성공적으로 추가되었습니다.');
            }
        } else {
            alert('옵션과 수량을 모두 올바르게 입력하세요.');
        }
    }

    // 클릭 이벤트에 addOption 함수를 연결
    $('#add-optionBtn').click(addOption);

    // 입력 필드에서 엔터 키 입력 처리
    $('#enroll-option, #enroll-pdCount').keypress(function(event) {
        if (event.which == 13) {  // 엔터 키의 키 코드는 13
            event.preventDefault();  // 폼 제출을 방지
            addOption();  // 옵션 추가 함수 실행
        }
    });

    $(document).on('click', '.removeBtn', function() {
        let optionDiv = $(this).parent();
        let optionName = optionDiv.data('option');
        options = options.filter(opt => opt.optionName !== optionName);
        optionDiv.remove();
        console.log(options);
        alert('옵션이 성공적으로 제거되었습니다.');
    });

    $('#enrollForm').submit(function(event) {
        let optionsInput = $('<input>').attr('type', 'hidden').attr('name', 'optionsJson').val(JSON.stringify(options));
        $(this).append(optionsInput);
    });

    $('#productImage').change(function(event) {
        let reader = new FileReader();
        reader.onload = function(e) {
            $('#preview-image').attr('src', e.target.result);
        };
        reader.readAsDataURL(event.target.files[0]);
    });
});
