let path;
function contextPath(contextPath){
    path = contextPath;
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




// function startNotification(){
//   notification(userNo, function(userNo){
//     getAlarmList(userNo, function(data){
//       drawAlarmList(data);
//     })
//   })
// }

//구독알람 설정, 이벤트 대기
function notification(userNo){
  console.log("notification함수 실행")
  getAlarmList(userNo);
  const eventSource = new EventSource(`http://localhost:8888/psvm/notifications/subscribe.pr/${userNo}`);

  eventSource.addEventListener('sse', event => {
      drawNotification();
      console.log("이벤트 도착");
});
}

function drawNotification(){
    console.log("draw함수 실행")
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
      console.log("ajax성공" + data[0].storeName);
      drawAlarmList(data);
    }, error: function(){
      console.log("ajax실패");
    }
  })
}

function drawAlarmList(data) {
  const aDiv = document.getElementById("notification-div");
  let str = "";
  for (const b of data) {
    str += `
      <a href="sellersStore.st?sellerPageNo=${b.sellerPageNo}&order=1&cpage=1" id="main-info-a">
        ${b.storeName}에서 새로운 상품이 추가되었습니다.
      </a>
     
    `;
  }
  aDiv.innerHTML = str;
}

