let path;

let count;

function fishInfoInit(contextPath){
    path = contextPath;
}


function startCuration(){
    getQuestionList(function(data){
        getListDetail(count, data, function(listData){
            drawCuration(listData);
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

function getListDetail(count, data,callback){
    
        let Qtitle = "";
        let Q = "";
        for(let a = 0 ; a < data.length; a++){
            if(data[a].bigQ == "키우고싶은 종류가 있나요 ?"){
                Qtitle = data[a].bigQ;
                Q += `
                        <p class="smallQ" onclick="getListDetail"> ${data[a].smallQ} </p>    
                    `
            } else if(data[a].bigQ == "성체가 됐을 때 어느정도 크기였으면 좋겠나요?"){
                Qtitle = data[a].bigQ;
                Q += `
                        <p class="smallQ" onclick="getListDetail"> ${data[a].smallQ} </p>    
                    `
            } else if(data[a].bigQ == "집에 있는 시간이 어느정도 되나요 ?"){
                Qtitle = data[a].bigQ;
                Q += `
                         <p class="smallQ" onclick="getListDetail"> ${data[a].smallQ} </p>    
                    `
            } else {
                Qtitle = data[a].bigQ;
                Q += `
                         <p class="smallQ" onclick="getListDetail"> ${data[a].smallQ} </p>    
                    `
            }
        }
    callback(Qtitle, Q);
}


function drawCuration(listData){
    const url = path + `/resources/image/whale.png`
    let str = "";
    let Section = document.getElementById("main-div");

    str+= `
            <div id="cu-explain-change">
                <p>${data[0].bigQ}</p>
            </div>
            <div id="cu-question-div">
                <div id="cu-img-change">
                    <img src="${url}" alt="">
                </div>
                <div id="cu-sub-explain-change">
                    <p>${data[0].smallQ}</p>
                </div>
            </div>
            <div id="cu-btn-change">
                <button onclick="startCuration();">시작하기</button>
            </div>
        `

    Section.innerHTML = str;
}