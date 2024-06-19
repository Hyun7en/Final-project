


function productDetail(userNo){

    // z-index 추가
    document.getElementById("sticky-container").style.zIndex = "10";
    
    // 옵션 선택 시 이벤트 핸들러
        let selectedOptions = {}; // 선택된 옵션을 저장하는 객체
        let productPrice = parseInt($('.product-price').text().replace(/[^0-9.-]+/g,"")); // 상품 가격을 가져옵니다.
    
        // 옵션 선택 시 이벤트 핸들러
        $('#select-option').on('change', function() {
            let selectedOption = $(this).find('option:selected');
            let optionId = selectedOption.val(); // 옵션의 고유 ID를 가져옵니다.
    
            if (!selectedOptions[optionId] && optionId) { // 이미 선택된 옵션이 아닌지 확인
                selectedOptions[optionId] = {
                    optionName: selectedOption.text(),
                    buyCount: 1,
                    optionPrice: productPrice // 옵션의 가격을 상품 가격으로 설정합니다.
                }; // 선택된 옵션으로 표시
                selectedOption.hide(); // 드롭다운에서 옵션 숨기기
    
                let html = `
                    <div class="selected-option" id="selected-option-${optionId}">
                        <span class="option-name">${selectedOption.text()}</span>
                        <input type="number" value="1" min="1" class="option-quantity" data-id="${optionId}" style="width: 60px;">
                        <button class="delete-option btn btn-danger" data-id="${optionId}">삭제</button>
                    </div>
                `;
                $('#selected-options-container').append(html);
                updateTotalPrice();
            }
            $(this).val(''); // 드롭다운 초기화
        });
    
        // 수량 조절 이벤트 핸들러
        $('#selected-options-container').on('input', '.option-quantity', function() {
            let optionId = $(this).data('id');
            let newQuantity = parseInt($(this).val());
    
            if (newQuantity > 0) {
                selectedOptions[optionId].buyCount = newQuantity;
                updateTotalPrice();
            }
        });
    
        // 삭제 버튼 이벤트 핸들러
        $('#selected-options-container').on('click', '.delete-option', function() {
            let id = $(this).data('id');
            $('#selected-option-' + id).remove(); // DOM에서 선택된 옵션 제거
            delete selectedOptions[id]; // 선택된 옵션 목록에서 제거
            $('#select-option').find(`option[value="${id}"]`).show(); // 드롭다운에서 옵션 다시 보이기
            updateTotalPrice();
        });
    
        // 총 가격 업데이트 함수
        function updateTotalPrice() {
            let totalPrice = 0; // 총 가격 초기화
            for (let id in selectedOptions) {
                let option = selectedOptions[id];
                option.totalPrice = option.buyCount * option.optionPrice; // 옵션별 총 가격 계산
                totalPrice += option.totalPrice; // 전체 총 가격 계산
            }
            $('.order-price').text(totalPrice.toLocaleString() + ' 원');
        }
    
        // 장바구니 버튼 클릭 이벤트 핸들러
        $('#product-cart-btn').on('click', function() {
            // 선택된 옵션 데이터를 배열로 변환
            let options = [];
            for (let id in selectedOptions) {
                options.push({
                    pdOptionNo: parseInt(id),
                    buyCount: selectedOptions[id].buyCount,
                    optionPrice: selectedOptions[id].optionPrice, // 옵션별 가격 추가
                    userNo: parseInt(userNo)
                });
            }
            console.log(options);

            if(options.length != 0){
        
                // AJAX 요청으로 서버에 데이터 전송
                $.ajax({
                    url: 'insertCart.ax',
                    method: 'POST',
                    contentType: 'application/json',
                    data: JSON.stringify(options), // 데이터를 JSON 형식으로 변환하여 전송
                    success: function(response) {
                        alert("장바구니 등록 완료!");
                        console.log('장바구니 담기 성공.');
                        console.log(response);
                    },
                    error: function(error) {
                        alert('로그인을 부탁드립니다');
                        console.error('장바구니 담기 실패');
                        console.error(error);
                    }
                });

            }else{
                alert("옵션을 선택해주세요");
            }

    });

     //구매 페이지로 이동
      
     document.getElementById('product-buy-btn').onclick = function() {


         if (userNo > 0) {
             location.href = 'order.spd';
         } else {
             location.href = 'orderlogin.me';
         }
     };  


    //  별점
    $('.star_rating > .star').click(function() {
        $(this).parent().children('span').removeClass('on');
        $(this).addClass('on').prevAll('span').addClass('on');
      })
     
}
