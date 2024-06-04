let path;
let count =0 ;
function fishInfoInit(contextPath){
    path = contextPath;
}


function startCuration(){
    getQuestionList(function(data){
        getListDetail(data, function(listData){
            drawCuration(count, listData);
        });
    });

    
}

function getQuestionList(callback){
    $.ajax({
        url: "getQuestionList.cu",
        type:"post",
        success: function(data){
            console.log(data);
            callback(data);
           
        },
        error: function(){
            console.log("ajax요청실패")
        }
    })
}

function getListDetail(data,callback){
    
    let Qtitle1 = "", Qtitle2 = "", Qtitle3 = "", Qtitle4 = "";
    let Q1 = "", Q2 = "", Q3 = "", Q4 = "";

        for(let a = 0 ; a < data.length; a++){
            if(data[a].bigQ == "키우고싶은 종류가 있나요 ?"){
                Qtitle1 = data[a].bigQ;
                Q1 += `
                        <p class="smallQ" onclick="drawCuration(count + 1, listData);"> ${data[a].smallQ} </p>    
                    `;
            } else if(data[a].bigQ == "성체가 됐을 때 어느정도 크기였으면 좋겠나요?"){
                Qtitle2 = data[a].bigQ;
                Q2 += `
                        <p class="smallQ" onclick="drawCuration(count + 1, listData);"> ${data[a].smallQ} </p>    
                    `;
            } else if(data[a].bigQ == "집에 있는 시간이 어느정도 되나요 ?"){
                Qtitle3 = data[a].bigQ;
                Q3 += `
                         <p class="smallQ" onclick="drawCuration(count + 1, listData);"> ${data[a].smallQ} </p>    
                    `;
            } else {
                Qtitle4 = data[a].bigQ;
                Q4 += `
                         <p class="smallQ" onclick="drawCuration(count + 1, listData);"> ${data[a].smallQ} </p>    
                    `;
            }
        }

        
        callback([
            [Qtitle1, Q1],
            [Qtitle2, Q2],
            [Qtitle3, Q3],
            [Qtitle4, Q4]
        ]);
}


function drawCuration(count, listData){
    const url = path + `/resources/image/whale.png`
    let str = "";
    let Section = document.getElementById("main-div");
    console.log(count)
    console.log(listData[count])
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