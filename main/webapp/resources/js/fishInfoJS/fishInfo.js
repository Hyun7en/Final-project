// 클릭 상태를 저장하기 위한 객체
const clickStates = {
    "담수어": false,
    "기수어": false,
    "열대어": false,
    "해수어": false
};

// 메뉴 항목 클릭 핸들러
function menuClickHandler(cpage, key) {
   
    
    clickStates[key] = !clickStates[key]
    // console.log(JSON.stringify(clickStates))
    let isKey = false;
    for(let k in clickStates){
        
        if (key !== k) {
            clickStates[k] = false;
        } 

        if(clickStates[k]){
            isKey = true;
        }
    }

    const searchValue = document.getElementById("searchArea").value;

    if (searchValue === "" && !isKey) {
        getList(function (data) {
            drawList(data, isKey ? key : null)
        })
    } else if (isKey && searchValue === "") {
        categorySearch({ cpage: cpage, cate: key }, function (data) {
            drawList(data, isKey ? key : null)
        })
    } else if (searchValue !== "") {
        getSearchFish({ cpage: cpage, fishName: searchValue }, function (data) {
            drawList(data, isKey ? key : null)
        })
    }
}

// contentsFunction 수정
function contentsFunction(cpage, cate) {
    if (event) {
        event.preventDefault();
    }
    const searchValue = document.getElementById("searchArea").value;
    if (searchValue === "" && cate === undefined) {
        getList(function (data) {
            drawList(data)
        })
    } else if (cate != null && searchValue === "") {
        categorySearch({ cpage: cpage, cate: cate }, function (data) {
            drawList(data)
        })
    } else if (searchValue !== "") {
        getSearchFish({ cpage: cpage, fishName: searchValue }, function (data) {
            drawList(data)
        })
    }
}

// searchBar의 엔터를 감지하기 위한 함수
function enter(e) {
    if (e.code === 'Enter') {
        contentsFunction(1);
    }
}

// List = 즉 DB에서 ProductList를 가져오는 함수
function getList(callback) {
    console.log("ajax 실행됨")
    $.ajax({
        url: "getList.fi",
        type: "post",
        dataType: "json",
        success: function (data) {
            callback(data);
        },
        error: function () {
            console.log("ajax요청실패")
        }
    })
}

// search하는 함수
function getSearchFish(data, callback) {
    $.ajax({
        url: "search.fi",
        type: "post",
        dataType: "json",
        data: data,
        success: function (data) {
            callback(data)

        },
        error: function () {
            console.log("ajax요청실패")
        }
    })
}

function categorySearch(data, callback) {
    $.ajax({
        url: "categorySearch.fi",
        type: "post",
        dataType: "json",
        data: data,
        success: function (data) {
            console.log("카테고리 에젝성공");
            callback(data)
        },
        error: function () {
            console.log("카테고리 ajax요청실패")
        }
    })

}

function categoryE(ths) {
    var cate = $(ths).text();
    contentsFunction(1, cate);
}

// 그려주는 함수
function drawList(data, key) {
    let str = "";
    let Section = document.getElementById("main-container");

    for (const b of data.list) {
        const url = path + `/resources/image/${b.url}` //백틱을 써야 스크립트에서는 변수라고 알아먹는다.
        str += `
                <a href="fishDetail.fi?fishName=${b.fishName}" id="main-info-a">
                    <div>
                        <div id="main-info-p">
                            <p>${b.fishName}</p>
                        </div>
                        <div id="main-info-img">
                        
                            <img src="${url}"; alt="">
                        
                        </div>
                        <div id="main-info">
                            <p>종류 : ${b.fishType}</p>
                            <p>식성 : ${b.tasteType}</p>
                            <p>성격 : ${b.tendency}</p>
                    
                        </div>
                    </div>
                </a>
                `
    }
    Section.innerHTML = str;

    let pagi = document.getElementsByClassName("pagination")[0]; // 첫 번째 요소 선택

    let pagingStr = "";

    if (data.pi.currentPage !== 1) {
        pagingStr += `<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="contentsFunction(${data.pi.currentPage - 1}, '${data.list[0].fishType}');">&laquo;</a></li>`;
    } else {
        pagingStr += `<li class="page-item disabled"><a class="page-link" href="#">&laquo;</a></li>`;
    }

    for (let p = data.pi.startPage; p <= data.pi.endPage; p++) {
        pagingStr += `<li class="page-item ${p === data.pi.currentPage ? 'active' : ''}"><a class="page-link" href="javascript:void(0);" onclick="contentsFunction(${p}, '${data.list[0].fishType}')">${p}</a></li>`;
    }

    if (data.pi.currentPage !== data.pi.maxPage) {
        pagingStr += `<li class="page-item"><a class="page-link" href="javascript:void(0);" onclick="contentsFunction(${data.pi.currentPage + 1}, '${data.list[0].fishType}')">&raquo;</a></li>`;
    } else {
        pagingStr += `<li class="page-item disabled"><a class="page-link" href="#">&raquo;</a></li>`;
    }

    pagi.innerHTML = pagingStr;

    document.getElementById("show-fish-category").innerHTML = key ? `<p>현재 적용된 카테고리 : ${key}</p>` : "";
}
