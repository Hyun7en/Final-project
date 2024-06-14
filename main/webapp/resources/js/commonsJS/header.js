function startHeader(contextPath, userNo){
  contextPath(contextPath);
  
}

let path; 

function init(pageType, contextPath, data){
    path = contextPath;
  switch(pageType){ 
    case 'storeSellersHome','storeSellersCategory':
      orderSelected();
      checkAlarm(data.loginUser, data.sellerPageNo);
      break;
    case 'communityDetail':
      callThumbup(data.boardNo, data.userNo);
      callReply(data.boardNo, `${path}+/resources/image/Cancel.png`, data.boardLevel);
      categorySelectedsc(data.boardLevel);
      conditionSelected(data.condition);
      break;
    case 'communityEdit':
      communityInit(data.boardLevel, data.boardContents);
      break;
    case 'CommunityList':
      categorySelected();
      break;
    case 'CommunitySearchList':
      categorySelected(data.boardLevel);
      conditionSelected(data.condition);
      break;
    
    
  }
// `${pageContext.request.contextPath}`
  //head세팅
}

function headerSet(){

}
//header의 프로필 클릭시 div 등장
function headerShow(){
    const s = document.getElementById("click-menu");
    if(s.style.visibility === 'visible') {
        s.style.visibility = 'hidden';
      }else {
        s.style.visibility = 'visible';
      }
}

//header의 종모양(알림) 클릭 시 div 등장
function onNotification(){
  const s = document.getElementById("notification-div");
  if(s.style.visibility === 'visible') {
      s.style.visibility = 'hidden';
    }else {
      s.style.visibility = 'visible';
    }
}

//구독알람 설정, 이벤트 대기
function notification(userNo){
  getAlarmList(userNo, function(hasAlarms) {
    if (hasAlarms) {
      drawNotification();
    }
  });

  const eventSource = new EventSource(`http://localhost:8888/psvm/notifications/subscribe.pr/${userNo}`);

  eventSource.addEventListener('sse', event => {
      drawNotification();
  });
}

function drawNotification(){
    const nDiv = document.getElementById("notifi-bell");
    let str = "";

    str = `<img id="notification-img" style="margin-top: 0;" src="${path}/resources/image/notification-new.png" onclick="onNotification()" alt="">`

    nDiv.innerHTML = str;
}

function getAlarmList(userNo, callback){
  $.ajax({
    url: 'getAlarmList.se',
    data: {userNo : userNo},
    success: function(data){
      drawAlarmList(data);
      callback(data.length > 0); // 알림 데이터가 있는지 확인하여 콜백 호출
    }, error: function(){
      callback(false); // 에러 발생 시 콜백 호출
    }
  })
}

//그려주는 함수, 클릭시 회색으로
document.addEventListener("DOMContentLoaded", function() {
  // 로컬 스토리지에서 클릭된 링크 상태를 복원
  const clickedLinks = JSON.parse(localStorage.getItem('clickedLinks')) || [];

  const notificationLinks = document.querySelectorAll(".notification-link");

  notificationLinks.forEach(function(link) {
    const href = link.getAttribute('href');

    // 링크가 클릭된 상태인지 확인
    if (clickedLinks.includes(href)) {
      link.classList.add("clicked");
    }

    // 클릭 이벤트 리스너 추가
    link.addEventListener("click", function(event) {
      link.classList.add("clicked");

      // 클릭된 링크를 로컬 스토리지에 저장
      if (!clickedLinks.includes(href)) {
        clickedLinks.push(href);
        localStorage.setItem('clickedLinks', JSON.stringify(clickedLinks));
      }
    });
  });
});

function drawAlarmList(data) {
  const aDiv = document.getElementById("notification-div");
  let str = "";
  for (const b of data) {
    str += `
      <a href="sellersStore.st?sellerPageNo=${b.sellerPageNo}&order=1&cpage=1" id="main-info-a" class="notification-link">
        ${b.storeName}에서 새로운 상품이 추가되었습니다.
      </a>
    `;
  }
  aDiv.innerHTML = str;

  // drawAlarmList 함수 내에서도 클릭된 링크 상태를 복원
  const clickedLinks = JSON.parse(localStorage.getItem('clickedLinks')) || [];
  const notificationLinks = document.querySelectorAll(".notification-link");

  notificationLinks.forEach(function(link) {
    const href = link.getAttribute('href');

    // 링크가 클릭된 상태인지 확인
    if (clickedLinks.includes(href)) {
      link.classList.add("clicked");
    }

    // 클릭 이벤트 리스너 추가
    link.addEventListener("click", function(event) {
      link.classList.add("clicked");

      // 클릭된 링크를 로컬 스토리지에 저장
      if (!clickedLinks.includes(href)) {
        clickedLinks.push(href);
        localStorage.setItem('clickedLinks', JSON.stringify(clickedLinks));
      }
    });
  });
}
