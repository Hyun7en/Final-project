document.addEventListener("DOMContentLoaded", function() {
  // 구매하기 버튼 클릭 시 컨트롤러로 정보 보내는 ajax 함수 실행하기 위한 이벤트 핸들러
  document.querySelector("#buy_btn").addEventListener("click", function(event) {
      event.preventDefault();


    

      const deliveryName = document.querySelector("#input-delivery-name").value;
        const recipient = document.querySelector("#input-delivery-recipient").value;
        const deliveryPhone = document.querySelector("#input-delivery-phone").value;
        const deliveryAddress = document.querySelector("#sample6_address").value;

        // 폼 검증
        if (!deliveryName || !recipient || !deliveryPhone || !deliveryAddress) {
            alert("필수 정보를 입력해 주세요.");
            return; // 폼 제출 막기
        }

        // 구매자 및 배송지 정보
        const orderInfo = {
            deliveryName: deliveryName,
            businessNo: document.querySelector("#businessNo").value,
            recipient: recipient,
            deliveryAddress: deliveryAddress,
            deliveryDetailAddress: document.querySelector("#sample6_detailAddress").value,
            recipientPhone: deliveryPhone,
            totalPrice: document.querySelector(".totalPrice").innerHTML.replace(/,/g, "")
        };

      // 주문 상품 정보 저장 위한 배열 선언
      const orderOpts = [];
      // 제품 div
      document.querySelectorAll(".order-product-container").forEach(function(ev) {
          // 옵션 div
          ev.querySelectorAll(".order-productOpt-container").forEach(function(e) {
              // JSON
              orderOpts.push({
                  optNo: e.querySelector(".input-order-optNo").value,
                  optQuantity: e.querySelector(".order-product-quantity").innerHTML
              });
          });
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

  // 페이지 로드 시 총 상품 금액과 결제 금액 계산
  calculateTotalPrice();
});

function calculateTotalPrice() {
  let totalPrice = 0;

  // 각 상품의 금액을 합산
  document.querySelectorAll('.order-product-info').forEach(function(item) {
      let price = parseFloat(item.getAttribute('data-price'));
      let quantity = parseInt(item.getAttribute('data-quantity'));
      if (!isNaN(price) && !isNaN(quantity)) {
          totalPrice += price * quantity;
      }
  });

  // 총 상품 금액과 결제 금액을 업데이트
  document.querySelector('#total-product-price').textContent = totalPrice.toLocaleString();
  document.querySelector('.totalPrice').textContent = totalPrice.toLocaleString();

  // 결제 버튼에 금액 표시
  document.querySelector('#buy_btn span.totalPrice').textContent = totalPrice.toLocaleString();
}

// 주소 API
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