


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
  // 주소 검색 api
  function searchAddress() {
    new daum.Postcode({
      oncomplete: function (data) {
        console.log(data);
  
        let zonecode = document.querySelector("#zonecode");
        let address = document.querySelector("#address");
  
        zonecode.innerHTML = data.zonecode;
        address.innerHTML = data.roadAddress;
  
      }
    }).open();
  }