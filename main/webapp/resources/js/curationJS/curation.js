    let path;
    function fishInfoInit(contextPath){
        path = contextPath;
    }

// 중복 호출 방지용 플래그 변수
let isRequestInProgress = false;
    function startCuration(count){
        // 요청이 진행 중인 경우 함수 실행 중단
        if (isRequestInProgress) {
            return;
        }
    
        // 요청 진행 중으로 설정
        isRequestInProgress = true;
    
        getQuestionList(count, function(count, data){
            getListDetail(count, data, function(count, listData){
                drawCuration(count, listData);
    
                // 요청이 완료되면 플래그를 false로 재설정
                isRequestInProgress = false;
            });
        });
    }

    function getQuestionList(count, callback){
        $.ajax({
            url: "getQuestionList.cu",
            type:"post",
            success: function(data){
                console.log(data);
                callback(count, data);
            
            },
            error: function(){
                console.log("ajax요청실패")
            }
        })
    }

    function getListDetail(count, data, callback){

        let Qtitle1 = "", Qtitle2 = "", Qtitle3 = "", Qtitle4 = "";
        let Q1 = "", Q2 = "", Q3 = "", Q4 = "";

            for(let a = 0 ; a < data.length; a++){
                if(data[a].bigQ == "키우고싶은 종류가 있나요 ?"){
                    Qtitle1 = data[a].bigQ;
                    Q1 += `
                        <div class="p-div"><p class="smallQ " onclick="startCuration(1);"> ${data[a].smallQ} </p></div>    
                        `;
                } else if(data[a].bigQ == "성체가 됐을 때 어느정도 크기였으면 좋겠나요?"){
                    Qtitle2 = data[a].bigQ;
                    Q2 += `
                        <div class="p-div"><p class="smallQ " onclick="startCuration(2);"> ${data[a].smallQ} </p></div>
                        `;
                } else if(data[a].bigQ == "집에 있는 시간이 어느정도 되나요 ?"){
                    Qtitle3 = data[a].bigQ;
                    Q3 += `
                        <div class="p-div"><p class="smallQ " onclick="startCuration(3);"> ${data[a].smallQ} </p></div>
                        `;
                } else {
                    Qtitle4 = data[a].bigQ;
                    Q4 += `
                        <div class="p-div"><p class="smallQ onclick="startCuration(4);"> ${data[a].smallQ} </p></div>   
                        `;
                }
            }

            
            callback(count, 
                [
                    [Qtitle1, Q1],
                    [Qtitle2, Q2],
                    [Qtitle3, Q3],
                    [Qtitle4, Q4]
                ]
            );
        
    }


    function drawCuration(count, listData){

        const url = path + `/resources/image/whale.png`
        let str = "";
        let Section = document.getElementById("main-div");

        str+= `
                <div class="cu-explain">
                    <p>${listData[count][0]}</p>
                </div>
                <div id="cu-question-div">
                    <div id="cu-img-change">
                        <img src="${url}" alt="">
                    </div>
                    <div id="cu-sub-explain-change">
                        ${listData[count][1]}
                    </div>
                </div>
            `;

        Section.innerHTML = str;
        
    }




    function result(clickedTexts){
        const queryString = clickedTexts.join(','); // 쉼표로 구분된 문자열로 변환
        location.href = "detailCuration.cu?clickedTexts=" + encodeURIComponent(queryString);
    }

    // 클릭 이벤트 리스너를 전역 변수로 선언
    let clickListener;

    document.addEventListener("DOMContentLoaded", function() {
        const clickedTexts = []; // 클릭된 텍스트를 저장할 배열

        clickListener = function(event) {
            if (event.target.classList.contains("smallQ")) {
                const clickedText = event.target.textContent;
                clickedTexts.push(clickedText.trim()); // 배열에 클릭된 텍스트 추가, 자꾸 양쪽에 공백 들어가서 제거
                console.log(clickedTexts); // 배열 출력

                

                // 부모 div 요소에 애니메이션 클래스 부여
                event.target.parentElement.classList.add('animate__animated', 'animate__fadeOutLeft');
                
                document.querySelector(".cu-explain").classList.add('animate__animated', 'animate__fadeIn');
                
                // count 값 증가 및 4인지 확인
                let currentCount = clickedTexts.length;
                if (currentCount >= 4) {
                    // 클릭 이벤트 리스너 제거
                    document.getElementById("main-div").removeEventListener("click", clickListener);
                    result(clickedTexts);
                } else {
                    startCuration(currentCount);
                }
            }





        };

        document.getElementById("main-div").addEventListener("click", clickListener);

    });
