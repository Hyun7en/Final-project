let path; 

//모든 세팅함수
function init(pageType, contextPath, data){
    path = contextPath;
  switch(pageType){ 
    case 'storeSellersHome':
    case 'storeSellersCategory':
      orderSelected();
      checkAlarm(data.userNo, data.sellerPageNo);
      break;
    case 'communityDetail':
      callThumbup(data.boardNo, data.userNo);
      callReply(data.boardNo, `${path}/resources/image/Cancel.png`, data.boardLevel, data.nickname);
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
    case 'storeMain':
      break;
    case 'searchStoreMain':
      startMain(data.title);
      break;
    case 'productDetailView':
      productDetail(data.userNo)
      break;  
    case 'anotherFishAjax':
      anotherFishAjax(data);
      getFishProduct();
      break;
      
  }
    //기본 헤더 세팅
  headerSet(data.userNo);
  requestNotificationPermission();
}


//헤더 로딩 시 작동하는 함수
function headerSet(userNo){
  notification(userNo); //구독
  getAlarmList(userNo, function(alarmList){ //알람리스트 가져오기
    drawNotification(alarmList); //종모양선택
    drawAlarmList(alarmList); //알람리스트 div에 넣기
  })
}

//알람리스트 div에 다시 그리는 함수셋
function alarmListReset(userNo){
  getAlarmList(userNo, function(alarmList){ //알람리스트 가져오기
    drawNotification(alarmList); //종모양선택
    drawAlarmList(alarmList); //알람리스트 div에 넣기
  })
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

// 알람 수락, 거부 위해 만든 함수
async function requestNotificationPermission() {
  let permission = await Notification.requestPermission();
  // if (permission === 'granted') {
  //     console.log('Notification permission granted.');
  // } else if (permission === 'denied') {
  //     console.log('Notification permission denied.');
  // } else {
  //     console.log('Notification permission default.');
  // }
}

//구독설정 -> 알람 허용까지 되어있으면 알람 메세지 실행
function notification(userNo) {
  const eventSource = new EventSource(`http://localhost:8888/psvm/notifications/subscribe.pr/${userNo}`);

  


  eventSource.addEventListener('sse', event => {
      (async () => {
          const data = event.data; // Assuming event.data is a JSON string
          const showNotification = () => {
              const notification = new Notification('새로운 알림 도착', {
                  body: data.content
              });

              setTimeout(() => {
                  notification.close();
              }, 10 * 1000);


              // 클릭 시 알람보낸 스토어페이지로 이동
              notification.addEventListener('click', () => {
                  window.open(data, '_blank');
              });
          };

          if (Notification.permission === 'granted') {
              showNotification();
          } else if (Notification.permission !== 'denied') {
              let permission = await Notification.requestPermission();
              if (permission === 'granted') {
                  showNotification();
              }
          }
      })();
  });
}




//알람 리스트 가져오는 함수
function getAlarmList(userNo, callback){
  $.ajax({
    url: 'getAlarmList.al',
    data: {userNo : userNo},
    success: function(data){
      callback(data);
      console.log("알람리스트 ajax 성공")
    }, error: function(){
      console.log("알람리스트 ajax 실패");
    }
  })
}

//alarmCheck가 하나라도 false이면 빨간 종모양으로 변경 and for문 중지
function drawNotification(alarmList){
  //알람 버튼 빨간 점 띄울지 말지
  const nDiv = document.getElementById("notifi-bell");
  let str = "";
  for(const i of alarmList){
    if(i.alarmCheck == false){
      sDiv = "";
      str = `<img id="notification-img" style="margin-top: 0;" src="${path}/resources/image/notification-new.png" onclick="onNotification()" alt="">`
      nDiv.innerHTML = str;

      break;
    }
  }
}

// 알람들을 div에 채워넣는 함수
function drawAlarmList(data) {

  if(data ==  ""){
    document.getElementById("notification-div").innerHTML = `<p style="text-align: center;" class="notification-false">아무 알람도 오지 않았어요!</p>`
  } else{
    const aDiv = document.getElementById("notification-div");
    let str = "";

    for (const b of data) {
      const href = `checkAlarm.al?userNo=${b.userNo}&sellerPageNo=${b.sellerPageNo}&alarmNo=${b.alarmNo}`;
      if (b.alarmCheck == false) {
        str += `
          <a href="${href}" class="notification-false">
            ${b.storeName}에서 ${b.alarmContents}.
          </a>
        `;
      } else {
        str += `
          <a href="${href}" class="notification-true">
            ${b.storeName}에서 ${b.alarmContents}.
          </a>
        `;
      }
    }
    aDiv.innerHTML = str;
  }

}
//로그인 했을 시 이전 url을 보내는 함수
function getRecentURL(){
  const recentLink = document.querySelector('#recentLink');
  recentLink.value = (window.location.href);
  recentLink.form.submit();
}







//-------------------------------------------------폐기함수------------------------------------------------------

// //그려주는 함수, 클릭시 회색으로
// document.addEventListener("DOMContentLoaded", function() {
//   // 로컬 스토리지에서 클릭된 링크 상태를 복원
//   const clickedLinks = JSON.parse(localStorage.getItem('clickedLinks')) || [];

//   const notificationLinks = document.querySelectorAll(".notification-link");

//   notificationLinks.forEach(function(link) {
//     const href = link.getAttribute('href');

//     // 링크가 클릭된 상태인지 확인
//     if (clickedLinks.includes(href)) {
//       link.classList.add("clicked");
//     }

//     // 클릭 이벤트 리스너 추가
//     link.addEventListener("click", function(event) {
//       link.classList.add("clicked");

//       // 클릭된 링크를 로컬 스토리지에 저장
//       if (!clickedLinks.includes(href)) {
//         clickedLinks.push(href);
//         localStorage.setItem('clickedLinks', JSON.stringify(clickedLinks));
//       }
//     });
//   });
// });

// // drawAlarmList 함수 내에서도 클릭된 링크 상태를 복원
// const clickedLinks = JSON.parse(localStorage.getItem('clickedLinks')) || [];
// const notificationLinks = document.querySelectorAll(".notification-link");

// notificationLinks.forEach(function(link) {
//   const href = link.getAttribute('href');

//   // 링크가 클릭된 상태인지 확인
//   if (clickedLinks.includes(href)) {
//     link.classList.add("clicked");
//   }

//   // 클릭 이벤트 리스너 추가
//   link.addEventListener("click", function(event) {
//     link.classList.add("clicked");

//     // 클릭된 링크를 로컬 스토리지에 저장
//     if (!clickedLinks.includes(href)) {
//       clickedLinks.push(href);
//       localStorage.setItem('clickedLinks', JSON.stringify(clickedLinks));
//     }
//   });
// });

