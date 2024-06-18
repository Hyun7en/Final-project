


document.addEventListener("DOMContentLoaded", function(){
    // 로그인 유저 정보 넣는 이벤트
    document.querySelector("#put-myInfo").addEventListener("click", function(){
      document.querySelector("#input-buyer-name").value = document.querySelector("#information-loginUser-name").value;
      document.querySelector("#input-buyer-email").value = document.querySelector("#information-loginUser-email").value;
      document.querySelector("#input-buyer-phone").value = document.querySelector("#information-loginUser-phone").value;
    });
  
    // 구매하기 버튼 클릭 시 컨트롤러로 정보 보내는 ajax 함수 실행하기 위한 이벤트 핸들러
    // 주문 정보 JSON 형태로 취합 후 컨트롤러로 submit하는 함수
    document.querySelector("#buy_btn").addEventListener("click", function(event){
      event.preventDefault();
  
    // 구매자 및 배송지 정보
    const orderInfo = {
        buyerName: document.querySelector("#input-buyer-name").value,
        buyerEmail: document.querySelector("#input-buyer-email").value,
        buyerPhone: document.querySelector("#input-buyer-phone").value,
        deliveryAddressName: document.querySelector("#input-delivery-name").value,
        recipientName: document.querySelector("#input-delivery-recipient").value,
        recipientAddress: document.querySelector("#address").innerHTML + document.querySelector("#input-delivery-detailAddress").value,
        recipientPhone:  document.querySelector("#input-delivery-phone").value,
        requirements: document.querySelector("#requirement-select").options[document.querySelector("#requirement-select").selectedIndex].value,
        payment: document.querySelector(".payment.selected > div").innerHTML,
        totalPrice: document.querySelector(".totalPrice").innerHTML.replace(/,/g, "")
    }
    // 주문 상품 정보 저장 위한 배열 선언
    const orderOpts = [];
    // 제품 div
    document.querySelectorAll(".order-product-container").forEach(function(ev){
      // 옵션 div
      ev.querySelectorAll(".order-productOpt-container").forEach(function(e){
          // JSON
        orderOpts.push({
          optNo: e.querySelector(".input-order-optNo").value,
          optQuantity: e.querySelector(".order-product-quantity").innerHTML,
          orderPdOptPrice: e.querySelector(".order-product-saled-price").innerHTML.replace(/,/g, "")
        });
      })
    });
  
    const orderDataJson = {
      orderInfo: orderInfo,
      orderOpts: orderOpts
    };
    
    console.log(orderDataJson);
  
    // JSON 형태의 데이터를 input.value 에 입력
    document.querySelector("#order-input-orderInfo").value = JSON.stringify(orderDataJson);
    // 제출
    document.querySelector("#buy_btn_container").submit();
    });
  
    calculateTotalProductPrice();
  
    calculateTotalPrice();
  
   })
  
  // 상품 총 금액, 배송비 계산
  function calculateTotalProductPrice() {
    const orderContainerElements = document.querySelectorAll('.order-product-container');
    const totalProductPriceEl = document.querySelector('#total-product-price');
    let totalPrice = 0;
    let totalShipmentCost = 0;
    orderContainerElements.forEach(function(orderContainerElement) {
      totalShipmentCost += parseInt(orderContainerElement.querySelector(".shipping-cost").innerText.replace(/,/g, ''));
      const pdoptContainerEl = orderContainerElement.querySelectorAll(".order-productOpt-container");
      pdoptContainerEl.forEach(function(ev){
        const productPrice = parseInt(ev.querySelector('.order-product-saled-price').innerText.replace(/,/g, ''));
        totalPrice += productPrice;
      })
    })
    totalProductPriceEl.innerText = totalPrice.toLocaleString();
    document.querySelector("#total-delivery-charge").innerText = totalShipmentCost.toLocaleString();
  
  }
  
  
  // 결제해야 할 총 금액 계산
  function calculateTotalPrice() {
    const totalProductPrice = parseInt(document.querySelector('#total-product-price').innerText.replace(/,/g, ''));
    const totalDeliveryCharge = parseInt(document.querySelector('#total-delivery-charge').innerText.replace(/,/g, ''));
    const totalPriceElements = document.querySelectorAll('.totalPrice');
    const totalPrice = totalProductPrice + totalDeliveryCharge;
  
    totalPriceElements.forEach(function(totalPriceElement) {
      totalPriceElement.innerText = totalPrice.toLocaleString();
    })
  
  }
  // 클릭한 결제수단 경계 색칠 및 카드 결제 클릭 시 동적 요소 생성 위한 메소드
  function clickPayment(element, type) {
  
    const payments = document.querySelectorAll(".payment");
  
    payments.forEach(function(payment) {
      payment.classList.remove('selected');
  
      element.classList.add('selected');
  
      const selectCardArea = document.querySelector("#select-card-area");
  
      if(type === 'card') {
        selectCardArea.style.display = "flex";
        selectCardArea.classList.add('displayFlex');
      } else {
        selectCardArea.style.display = "none";
  
      }
    })
  
  }

  
  function sample6_execDaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }

            // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
            if(data.userSelectedType === 'R'){
                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                // 조합된 참고항목을 해당 필드에 넣는다.
                document.getElementById("sample6_extraAddress").value = extraAddr;
            
            } else {
                document.getElementById("sample6_extraAddress").value = '';
            }

            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('sample6_postcode').value = data.zonecode;
            document.getElementById("sample6_address").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("sample6_detailAddress").focus();
        }
    }).open();
}
var themeObj = { //다음 주소 API 테마
  bgColor: "#E0F1FF", //바탕 배경색
  //searchBgColor: "", //검색창 배경색
  //contentBgColor: "", //본문 배경색(검색결과,결과없음,첫화면,검색서제스트)
  pageBgColor: "#E0F1FF", //페이지 배경색
  textColor: "", //기본 글자색
  queryTextColor: "", //검색창 글자색
  postcodeTextColor: "#0089FF", //우편번호 글자색
  emphTextColor: "#008BD3", //강조 글자색
  outlineColor: "#0089FF" //테두리
};
