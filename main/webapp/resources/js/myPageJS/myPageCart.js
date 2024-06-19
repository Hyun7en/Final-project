$(document).ready(function(){
    calculateTotalOrder();
});

// 총 주문 가격 계산 결과 함수
function calculateTotalOrder(){
    let totalPrice = 0;            // 총 상품 가격
    $(".product-price").each(function() {      // 상품 가격 반복 추출
        let price = parseInt($(this).text().replace(',', '')); // 상품 가격 텍스트 추출
        totalPrice += price;      // 상품 가격 총합 구하기
    });
    const formattedPrice = numberWithCommas(totalPrice);        // 총 상품 가격에 3자리마다 콤마 추가
    $("#product-list-total-price span").text(formattedPrice);            // 총 상품 가격 업데이트

    let totalSale = 0;                          // 총 상품 할인 가격
    $(".product-price").each(function() {      // 상품 가격 반복 추출
        let sale = parseInt($(this).text().replace(',', '')) * 0.1; // 상품 가격 10%할인 텍스트 추출
        totalSale += sale;      // 상품 할인 가격 총합 구하기
    });
    const formattedSale = numberWithCommas(totalSale);        // 총 상품 가격 3자리마다 콤마 추가
    $("#product-list-total-sale span").text(formattedSale);            // 총 상품 가격 업데이트

    const totalOrderAmount = numberWithCommas(totalPrice - totalSale); // 총 주문 금액 3자리마다 콤마 추가
    $("#product-list-total-order-amount span").text(totalOrderAmount);         // 총 주문 금액 업데이트
}

// 숫자 3자리마다 콤마(,) 추가하는 함수
function numberWithCommas(x){
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

// 전체삭제 버튼 눌렀을 때 (수정필요)
function allProductRemove(){
    const allProduct = document.querySelectorAll(".product");
    console.log(allProduct);

    allProduct.forEach(function(product) {
        const userNo = $(product).find(".userNo").text();
        const poNo = $(product).find(".poNo").text();
        console.log(userNo);
        console.log(poNo);

        // location.href="deleteCartProduct.my?userNo=" + userNo + "&poNo=" + poNo;
    })
}

// 선택상품 삭제 버튼 눌렀을 때 (확인필요)
function selectProductRemove(){
    const checkboxes = document.querySelectorAll(".checkbox:checked");  // 체크된 체크박스들 가져오기
    checkboxes.forEach(function(checkbox) {     // 체크된 체크박스 하나씩 기능 수행시키기
        const userNo = $(checkbox).closest("tr").find(".userNo").text();
        const poNo = $(checkbox).closest("tr").find(".poNo").text();  // 체크된 체크박스 행의 product-option-no클래스의 text가져오기

        // var index = $(checkbox).closest("tr").index();  // 체크된 체크박스 행의 인덱스 가져오기
        // var modal = $(".seller-info-modal").eq(index);  // 해당 인덱스의 모달 가져오기(리스트(행)에는 userNo이 없고 모달에 userNo이 있어 모달 가져옴)
        // var pdNo = modal.find(".pdNo").text();      // 해당 모달안의 class이름이 userNo인 태그안의 값 가져옴
        
        location.href="deleteCartProduct.my?userNo=" + userNo + "&poNo=" + poNo;
    });
}

// 전체 주문 눌렀을 때

// 선택상품 주문 버튼 눌렀을 때 (확인필요)
function selectProductOrder(){
    const checkboxes = document.querySelectorAll('.checkbox:checked');  // 체크된 체크박스들 가져오기
    checkboxes.forEach(function(checkbox) {     // 체크된 체크박스 하나씩 기능 수행시키기
        const poNo = $(checkbox).closest("tr").find(".product-option-no").text();

        // var index = $(checkbox).closest("tr").index();  // 체크된 체크박스 행의 인덱스 가져오기
        // var modal = $(".seller-info-modal").eq(index);  // 해당 인덱스의 모달 가져오기(리스트(행)에는 userNo이 없고 모달에 userNo이 있어 모달 가져옴)
        // var pdNo = modal.find(".pdNo").text();      // 해당 모달안의 class이름이 userNo인 태그안의 값 가져옴
        
        location.href="deleteCartProduct.my?pdNo=" + poNo;
    });
}
