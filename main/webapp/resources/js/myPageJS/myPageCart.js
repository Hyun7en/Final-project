$(document).ready(function(){   // 페이지가 다 로드된 후에 실행할 함수
    calculateTotalOrder();
    productPriceCommas();
});

function productPriceCommas(){
    const allProductPrice = document.querySelectorAll(".product-price");  // class가 "product-price"인 요소(상품가격) 전부 가져옴
    allProductPrice.forEach(function(productPrice) {                      // 가져온 요소 반복문 실행
        const p = parseInt($(productPrice).text());                       // 각 요소안에 text를 가져와서 int형으로 변환
        const formattedProductPrice = numberWithCommas(p);                // 숫자 3자리마다 콤마(,) 붙여줌
        $(productPrice).text(formattedProductPrice + "원");                      // 변환된 값을 class가 "product-price"인 요소의 text에 대입
    })
}

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

// 전체 체크박스 눌렀을 때
function clickAllCheckboxes() {
    const checkboxes = document.querySelectorAll(".checkbox");    // 전체 체크박스 가져옴
    const allCheckbox = document.querySelector('.all-checkbox');  // 전체선택 체크박스 가져옴

    checkboxes.forEach(function(checkbox) {         // 전체 체크박스 forEach반복문으로 기능 수행
        checkbox.checked = allCheckbox.checked;     // 전체선택 체크박스에 checked된 값을 checkbox에 대입 
    });
}

// 전체삭제 버튼 눌렀을 때
function allProductRemove(){                              // 방법 1
    const allProduct = document.querySelectorAll(".product");   // class가 "product"인 요소 전부 가져옴
    console.log(allProduct);

    allProduct.forEach(function(product) {                      // 가져온 요소 반복문 실행, function() 안에 product : 전부 가져온 요소의 각 요소
        const poNo = $(product).find(".poNo").text();           // 각 요소안에 class가 "poNo"인 요소를 찾고 안에 text가져옴
        console.log(userNo);
        console.log(poNo);

        location.href="deleteCartProduct.my?&poNo=" + poNo;
    })

    // $(".product").each(function() {                    // 방법 2, 코드가 좀 더 간결해짐
    //     const userNo = $(this).find(".userNo").text();
    //     const poNo = $(this).find(".poNo").text();
    //     console.log(userNo);
    //     console.log(poNo);

    //     location.href="deleteCartProduct.my?userNo=" + userNo + "&poNo=" + poNo;
    // })
}

// 선택상품 삭제 버튼 눌렀을 때
function selectProductRemove(){
    const checkboxes = document.querySelectorAll(".checkbox:checked");  // 체크된 체크박스들 가져옴
    checkboxes.forEach(function(checkbox) {     // 체크된 체크박스 요소 반복문 실행
        const poNo = $(checkbox).closest("tr").find(".poNo").text();  // 체크된 체크박스 요소에서 가장 가까운 "<tr>" 요소에서 class가 "poNo"인 요소를 찾고 안에 text가져옴
        console.log(userNo);
        console.log(poNo);

        location.href="deleteCartProduct.my?&poNo=" + poNo;
    });
}

// 전체 주문 눌렀을 때
function allProductOrder(){
    const allProduct = document.querySelectorAll(".product");   // class가 product인 요소 가져옴(상품 전부 다 가져오기)
    const allPoNoList = Array.from(allProduct).map(product => { // Array.form() : allProduct를 자바스크립트의 배열로 변환, .map : class가 ".product"인 각 요소들에 대해 콜백 함수를 실행
        return $(product).find(".poNo").text();                 // 각 요소(class가 ".product"인 요소)안의 class가 "poNo"인 요소의 text를 반환
    })
    console.log(allPoNoList);

    location.href="orderCartProduct.my?poNo=" + allPoNoList;
}

// 선택상품 주문 눌렀을 때
function selectProductOrder() {
    const checkboxes = document.querySelectorAll('.checkbox:checked');  // 체크된 체크박스들 가져오기
    const checkedCheckbox = Array.from(checkboxes).map(checkbox => {    // Array.form() : checkboxes를 자바스크립트의 배열로 변환, .map : 각 체크된 체크박스에 대해 콜백 함수를 실행
        return $(checkbox).closest("tr").find(".poNo").text();          // 체크된 체크박스가 있는 요소를 기준으로 가장 가까운 "<tr>" 요소를 찾고, 그안에서 클래스가  "poNo"인 요소의 text를 반환
    });
    console.log(checkedCheckbox);

    location.href="orderCartProduct.my?poNo=" + checkedCheckbox;
}

// 상품 리스트에 있는 주문하기 눌렀을 때
function productOrder(poNo){        // 주문하기 버튼을 눌렀을 때 넘겨준 옵션번호 매개변수
    const poNoList = [poNo];        // 받아온 매개변수 값 자바스크립트에서 배열로 변환
    console.log(poNoList);                  // 배열로 바꾸는 이유는 orderCartProduct.my 컨트롤러의 poNo의 매개변수 타입이 리스트여서 변환해야 함

    location.href="orderCartProduct.my?poNo=" + poNoList;
}

