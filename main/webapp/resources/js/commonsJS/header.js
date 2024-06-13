function headerShow(){
    const s = document.getElementById("click-menu");
    if(s.style.visibility === 'visible') {
        s.style.visibility = 'hidden';
      }else {
        s.style.visibility = 'visible';
      }
}

function notification(userNo){
  console.log("notification함수 실행")
  const eventSource = new EventSource(`http://localhost:8888/psvm/notifications/subscribe.pr/${userNo}`);

  eventSource.addEventListener('sse', event => {
      console.log(event);
});
}
