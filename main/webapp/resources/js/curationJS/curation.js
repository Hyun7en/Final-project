let path;
function fishInfoInit(contextPath){
    path = contextPath;
}


function startCuration(count){
    getQuestionList(count, function(count, data){
        getListDetail(count, data, function(count, listData){
            drawCuration(count, listData);
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
                        <p class="smallQ" onclick="startCuration(1);"> ${data[a].smallQ} </p>    
                    `;
            } else if(data[a].bigQ == "성체가 됐을 때 어느정도 크기였으면 좋겠나요?"){
                Qtitle2 = data[a].bigQ;
                Q2 += `
                        <p class="smallQ" onclick="startCuration(2);"> ${data[a].smallQ} </p>    
                    `;
            } else if(data[a].bigQ == "집에 있는 시간이 어느정도 되나요 ?"){
                Qtitle3 = data[a].bigQ;
                Q3 += `
                         <p class="smallQ" onclick="startCuration(3);"> ${data[a].smallQ} </p>    
                    `;
            } else {
                Qtitle4 = data[a].bigQ;
                Q4 += `
                         <p class="smallQ" onclick="startCuration(4);"> ${data[a].smallQ} </p>    
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
    if(count==4){
        resultAjax();
    }

    str+= `
            <div id="cu-explain-change">
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




function resultAjax(){
    const url = path + `/resources/image/whale.png`
    let str = "";
    let Section = document.getElementById("main-div");

    str+= `
            ㄲㅡㅌ
        `;

    Section.innerHTML = str;
}

document.addEventListener("DOMContentLoaded", function() {
    const clickedTexts = []; // 클릭된 텍스트를 저장할 배열

    document.getElementById("main-div").addEventListener("click", function(event) {
        if (event.target.classList.contains("smallQ")) {
            const clickedText = event.target.textContent;
            console.log(clickedText);
            clickedTexts.push(clickedText); // 배열에 클릭된 텍스트 추가
            console.log(clickedTexts); // 배열 출력
        }
    });
});
