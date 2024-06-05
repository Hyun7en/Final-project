function startCuration(){
    getQuestionList(function(data){
        drawCuration(data);
    });

    
}

function getQuestionList(callback){
    $.ajax({
        url: "getQuestionList.cu",
        type:"post",
        success: function(data){
            callback(data)
           
        },
        error: function(){
            console.log("ajax요청실패")
        }
    })
}

function drawCuration(data){
    let str = "";
    let Section = document.getElementById("main-div");

    str+= `
            <div id="cu-explain">
                <p>어울리는 물고기를 추천해드려요 !</p>
            </div>
            <div id="cu-img">
                <img src="${pageContext.request.contextPath}/resources/image/whale.png" alt="">
            </div>
            <div id="cu-sub-explain">
                <p>자신에게 맞는 물고기를 찾아보세요!</p>
            </div>
            <div id="cu-btn">
                <button onclick="startCuration();">시작하기</button>
            </div>
        `
}