

// bootstrap에 의한 css
document.addEventListener('DOMContentLoaded', function () {

     // 자동 폼 제출 관련 코드
     var urlParams = new URLSearchParams(window.location.search);
    if (!urlParams.has('submitted')) {
        var autoSubmitForm = document.getElementById('auto-submit-form');
        if (autoSubmitForm) {
            autoSubmitForm.submit();
        }
    }

    document.getElementById("sticky-container").style.zIndex = "10";

    //옵션 선택시 요소 추가
    $(document).ready(function() {
        var selectedOptions = {}; // 선택된 옵션을 저장하는 객체
    
        // 옵션 선택 시 이벤트 핸들러
        $('#select-option').on('change', function() {
            var selectedOption = $(this).find('option:selected');
            var optionId = selectedOption.val(); // 옵션의 고유 ID를 가져옵니다.
    
            if (!selectedOptions[optionId] && optionId) { // 이미 선택된 옵션이 아닌지 확인
                selectedOptions[optionId] = true; // 선택된 옵션으로 표시
                selectedOption.attr('disabled', true); // 드롭다운에서 옵션 비활성화
    
                var html = `
                    <div class="selected-option" id="selected-option-${optionId}">
                        <span class="option-name">${selectedOption.text()}</span>
                        <input type="number" value="1" min="1" class="option-quantity" data-id="${optionId}" style="width: 60px;">
                        <button class="delete-option btn btn-danger" data-id="${optionId}">삭제</button>
                    </div>
                `;
                $('#selected-options-container').append(html);
            }
            $(this).val(''); // 드롭다운 초기화
        });
    
        // 수량 조절 이벤트 핸들러
        $('#selected-options-container').on('input', '.option-quantity', function() {
            // 수량 업데이트 로직 추가 가능
        });
    
        // 삭제 버튼 이벤트 핸들러
        $('#selected-options-container').on('click', '.delete-option', function() {
            var id = $(this).data('id');
            $('#selected-option-' + id).remove(); // DOM에서 선택된 옵션 제거
            delete selectedOptions[id]; // 선택된 옵션 목록에서 제거
            $('#select-option').find(`option[value="${id}"]`).attr('disabled', false); // 드롭다운에서 옵션 다시 활성화
        });
    });
    
    
    
    

    //구매 페이지로 이동
    document.getElementById('product-buy-btn').onclick = function() {
        location.href = 'order.pd';
    };    

});


