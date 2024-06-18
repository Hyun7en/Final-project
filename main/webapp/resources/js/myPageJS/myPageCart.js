$(document).ready(function(){
    calculateTotalAmount();
});

// 총 상품금액 계산 함수
function calculateTotalAmount(){
    let totalAmount = 0;
    $(".product-amount").each(function() {      // 상품금액 반복 추출
        let amount = parseInt($(this).text().replace(',', '')); // 상품금액 텍스트 추출
        totalAmount += amount;      // 상품금액 총합 구하기
    });

    const formattedAmount = numberWithCommas(totalAmount);      // 총 상품금액에 3자리마다 콤마 추가
    $("$product-list-total-count p").text($('.product-amount'.length));   // 총 주문갯수 업데이트
    $("$product-list-total-amount p").text(formattedAmount);            // 총 상품금액 업데이트

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
