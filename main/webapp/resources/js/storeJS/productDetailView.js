


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
                        console.log('장바구니 담기 성공.',response);
                    },
                    error: function(error) {
                        alert('로그인을 부탁드립니다');
                        console.error('장바구니 담기 실패',error);
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

    // 별점 등록(이미지로 바꾸기)

    getReviewList(1, pno);
    getInquiryList(1,pno);
}

      //리뷰 불러오기
      function getReviewList(cpage,pno){
        console.log("ajax실행");
        $.ajax({
            url: 'getReviewList.ax',
            method: 'GET',
            data: {
                cpage: cpage,
                pno: pno
            },
            success: function(data){
                console.log("리뷰 불러오기 성공" + data.reviewList[0].nickName);
                drawReviewList(data);

            },
            error: function(){
                console.log("리뷰 불러오기 실패");


            }
        })
      }

      function drawReviewList(data) {
        const rDiv = document.getElementById("review-container");
        rDiv.innerText = "";
        
        let str = "";
    
        for( const review of data.reviewList) {
            str += `
                <table id="review-table">
                    <tr>
                        ${review.changeName ? `
                            <td colspan="2">
                                <img class="buyer-img" src="${review.changeName}" alt="">
                                ${review.nickName}
                            </td>
                        ` : `
                            <td colspan="2">
                                <img class="buyer-img" src="" alt="">
                                ${review.nickName}
                            </td>
                        `}
                    </tr>
                    <tr>
                        <td width="100px">${review.reviewDibs}</td>
                        <td>${review.reviewDate}</td>
                    </tr>
                    <tr>
                        <td id="review-product-title" colspan="2">| ${review.pdTitle}</td>
                    </tr>
                    ${review.reChangeName ? `
                        <tr>
                            <td colspan="2"><img src="${review.reChangeName}" alt=""></td>
                        </tr>
                    ` : ''}
                    <tr>
                        <td colspan="2">${review.reviewContents}</td>
                    </tr>
                </table>

                <hr>
                    
                
            `;

        };
        console.log(str);

        rDiv.innerHTML = str;
        

        let pagi = document.getElementsByClassName("pagination")[0]; // 첫 번째 요소 선택
    
        let pagingStr = "";
        
        if (data.ipi.currentPage != 1) {
            pagingStr += `<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getReviewList(${data.ipi.currentPage - 1}, '${data.reviewList[0].pdNo}');">&laquo;</a></li>`;
        } else {
            pagingStr += `<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>`;
        }

        for (let p = data.ipi.startPage; p <= data.ipi.endPage; p++) {
            pagingStr += `<li class="page-item ${p == data.ipi.currentPage ? 'active' : ''}"><a class="page-link" href="javascript:void(0);" onclick="getReviewList(${p}, '${data.reviewList[0].pdNo}')">${p}</a></li>`;
        }
        
        if (data.ipi.currentPage != data.ipi.maxPage) {
            pagingStr += `<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getReviewList(${data.ipi.currentPage + 1}, '${data.reviewList[0].pdNo}')">&raquo;</a></li>`;
        } else {
            pagingStr += `<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>`;
        }

        pagi.innerHTML = pagingStr;
    }

    
    

      //문의 불러오기
      
      function getInquiryList(cpage,pno){

        $.ajax({
            url: 'getInquiryList.ax',
            method: 'GET',
            data: { 
                    cpage:cpage,
                    pno:pno
                  },
            success: function(data){
                console.log("문의 불러오기 성공");
                drawInquiryList(data);


            },
            error: function(){
                console.log("문의 불러오기 실패");

                
            }

        })

      }

      function drawInquiryList(data) {
        const rDiv = document.getElementById("inquiry-container");
        rDiv.innerText = "";
        
        let str = "";
    
        for( const inquiry of data.inquiryList) {
            str += `
                <table class="inquiry-table">
                    <tr>
                        <td>
                            문의자명
                            <span>${inquiry.inquiryDate}</span>
                        </td>
                        
                    </tr>
                    <tr>
                        <td >
                            <span style="font-weight: bolder; color: #0089FF;">Q</span>
                        </td>
                    </tr>
                    <tr>
                        <td >
                            <span style="font-weight: bolder; color: #0089FF;">A</span>
                        </td>
                    </tr>
                </table>

                <hr>
                    
                
            `;

        };
        console.log(str);

        rDiv.innerHTML = str;
        

        let pagi = document.getElementsByClassName("pagination")[1]; // 두 번째 요소 선택
    
        let pagingStr = "";

        
        if (data.ipi.currentPage != 1) {
            pagingStr += `<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getinquiryList(${data.ipi.currentPage - 1}, '${data.inquiryList[0].pdNo}');">&laquo;</a></li>`;
        } else {
            pagingStr += `<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>`;
        }

        for (let p = data.ippi.startPage; p <= data.ipi.endPage; p++) {
            pagingStr += `<li class="page-item ${p == data.ipi.currentPage ? 'active' : ''}"><a class="page-link" href="javascript:void(0);" onclick="getinquiryList(${p}, '${data.inquiryList[0].pdNo}')">${p}</a></li>`;
        }
        
        if (data.ipi.currentPage != data.ipi.maxPage) {
            pagingStr += `<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="getinquiryList(${data.ipi.currentPage + 1}, '${data.inquiryList[0].pdNo}')">&raquo;</a></li>`;
        } else {
            pagingStr += `<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>`;
        }

        pagi.innerHTML = pagingStr;
    }
     

