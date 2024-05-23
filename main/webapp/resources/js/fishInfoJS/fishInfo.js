//시작함수
// $(document).ready(function(){
//     startFunction(1)
// })

function startFunction(cpage, cate){

    const searchValue = document.getElementById("fish-search").value;
		
    if(searchValue == "" && cate==null){
        getList({cpage: cpage}, function(data){
            drawList(data)
        })
    } else if(cate!=null  && searchValue == "") {
        console.log("cate 실행됨",cate);
        categorySearch({cpage : cpage, cate : cate}, function(data){
            drawList(data)
        })
    }else if(searchValue != "" && cate== null){
        getSearchList({cpage : cpage, searchValue : searchValue}, function(data){
            drawList(data)
        })
    }
}

//searchBar의 엔터를 감지하기 위한 함수
function enter(e){
	if(e.code=='Enter'){
		contentsFunction(1);
	}
}

//List = 즉 DB에서 ProductList를 가져오는 함수
function getList(data, callback){
	console.log("ajax 실행됨")
        $.ajax({
            url: "list.pr",
            dataType:"json",
            data: data,
            success: function(data){
                callback(data)
               
            },
            error: function(){
                console.log("ajax요청실패")
            }
    })
}

//search하는 함수
function getSearchList(data, callback){
    $.ajax({
            url: "search.pr",
            dataType:"json",
            data: data,
            success: function(data){
                callback(data)
               
            },
            error: function(){
                console.log("ajax요청실패")
            }
    })
}

function categorySearch(data, callback){
	$.ajax({
            url: "categorySearch.pr",
            dataType:"json",
            data: data,
            success: function(data){
				console.log("카테고리 에젝성공", data);
                callback(data)
            },
            error: function(){
                console.log("카테고리 ajax요청실패")
            }
    })
	
}

function categoryE(ths) {
	var cate = $(ths).text();
	console.log(cate)
    contentsFunction(1, cate);
}




//그려주는 함수
function drawList(data){
    let str = "";
    let Section = document.getElementById("main-container");

    for(const p of data.list){
        str += ` <a href="fishDetail.fi" id="main-info-a">
                    <div>
                    <div id="main-info-p">
                        <p>Guppy</p>
                    </div>
                    <div id="main-info-img">
                        <img src="${pageContext.request.contextPath}/resources/image/goopy.jpg" alt="">
                    </div>
                    <div id="main-info">
                        <p>이름 : `+p.fishname+`</p>
                        <p>종류 : 열대어</p>
                        <p>몸길이 : 3~4cm</p>
                        
                    </div>
                    </div>
                </a>
                `
    }
    Section.innerHTML = str;

    let pagi = document.getElementById("pagination");
                    
    let pagingStr = "";

    if (data.pi.currentPage != 1) {
        pagingStr += `<button onclick="contentsFunction(${data.pi.currentPage - 1 });">&lt;</button>`;
    }
    for (let p = data.pi.startPage; p <= data.pi.endPage; p++) {
        if (p == data.pi.currentPage) {
            pagingStr += `<button disabled>`+p+`</button>`;
        } else {
            pagingStr += `<button onclick="contentsFunction(${p});">`+p+`</button>`;
        }
    }
    if (data.pi.currentPage != data.pi.maxPage) {
        pagingStr += `<button onclick="contentsFunction(${data.pi.currentPage + 1 });">&gt;</button>`;
    }

    pagi.innerHTML = pagingStr;
}