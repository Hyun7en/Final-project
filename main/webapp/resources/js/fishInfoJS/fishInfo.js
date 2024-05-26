//시작함수
// $(document).ready(function(){
//     startFunction(1)
// })

function contentsFunction(cpage, cate){
    event.preventDefault()
    const searchValue = document.getElementById("searchArea").value;
    console.log(searchValue);
    console.log(cate);
    // if(searchValue == "" && cate==null){
    //     getList({cpage: cpage}, function(data){
    //         drawList(data)
    //     })
    // } else if(cate!=null  && searchValue == "") {
    //     console.log("cate 실행됨",cate);
    //     categorySearch({cpage : cpage, cate : cate}, function(data){
    //         drawList(data)
    //     })
    // }else if(searchValue != ""){
        getSearchFish({cpage : cpage, fishName: searchValue}, function(data){
            drawList(data)
        })
    // }
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
function getSearchFish(data, callback){
    $.ajax({
            url: "search.fi",
            type:"post",
            dataType: "json",
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
    console.log(data);
    for(const b of data.list){
        const url = '${pageContext.request.contextPath}/resources/image/${b.url}'
        console.log(url);
        str += `
                <a href="fishDetail.fi" id="main-info-a">
                    <div>
                        <div id="main-info-p">
                            <p>${b.fishName }</p>
                        </div>
                        <div id="main-info-img">
                        
                            <img src="${url}"; alt="">
                        
                        </div>
                        <div id="main-info">
                            <p>종류 : ${b.fishType}</p>
                            <p>식성 : ${b.tasteType }</p>
                            <p>성격 : ${b.tendency }</p>
                    
                        </div>
                    </div>
                </a>
                `
    }
    Section.innerHTML = str;

    let pagi = document.getElementsByClassName("pagination");
                    
    let pagingStr = "";

    if (data.pi.currentPage != 1) {
        pagingStr += `<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="contentsFunction(\${pi.currentPage - 1});">&laquo;</a></li>`;
    } else{
        pagingStr +=`<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>`;
    }
    for (let p = data.pi.startPage; p <= data.pi.endPage; p++) {
            pagingStr += `<li class="page-item \${p == pi.currentPage ? 'active' : ''}"><a class="page-link" href="javascript:void(0);" onclick="contentsFunction(\${p})">\${p}</a></li>`;
    }
    if (data.pi.currentPage != data.pi.maxPage) {
        pagingStr += `<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="contentsFunction(\${pi.currentPage + 1})">&raquo;</a></li>`;
    }else{
        pagingStr +=`<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>`;
    }

    pagi.innerHTML = pagingStr;
}