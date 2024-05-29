let path;
function InfoInit(contextPath){
    path = contextPath;
}


var playlist = 'LtL4BLlLNko';
        //https://www.youtube.com/watch?v=유튜브 영상 고유번호
		//playlist만 원하는 재생목록에 따라 가져오면 됨

		//maxResult는 50 이하
		$(document).ready(function () {
			$.get(
				"https://www.googleapis.com/youtube/v3/videos", {
					part: 'snippet',
					maxResults: 50,
					id: playlist,
					key: ''
				},
				function (data) { 
                    console.log(data)
					var output;
					$.each(data.items, function (i, item) {
						vTitle = item.snippet.title;
						vTh = item.snippet.channelTitle;
						
						output = '<h1>' + vTitle + '<br>' + '<h6>' +'by.' +  vTh ;
						/*output= '<li>'+vTitle+'<iframe src=\"//www.youtube.com/embed/'+vId+'\"></iframe></li>';*/
						$("#result").append(output);
					})
				}
			);
            getYoutube();
		}); 

var playlist2 = 'OzGbT1jBQ84';
    function getYoutube() {
        $.get(
            "https://www.googleapis.com/youtube/v3/videos", {
                part: 'snippet',
                maxResults: 50,
                id: playlist2,
                key: ''
            },
            function (data) { 
                console.log(data)
                var output;
                $.each(data.items, function (i, item) {
                    v2Title = item.snippet.title;
                    v2Th = item.snippet.channelTitle;
                    
                    output2 = '<h1>' + v2Title + '<br>' + '<h6>' +'by.' +  v2Th ;
                    /*output= '<li>'+vTitle+'<iframe src=\"//www.youtube.com/embed/'+vId+'\"></iframe></li>';*/
                    $("#result2").append(output2);
                })
            }
        );

    };

function detailDraw(data1, data2, name){
    if(name=='field'){
        drawInfo(data1, data2,'서식환경', '특징')
    } else if(name=='feed'){
        drawInfo(data1 ,data2, '먹이주기', '식성' )
    } else if(name=='light'){
        drawInfo(data1, data2, '조명', '온도')
    } else if(name=='growTogeter'){
        drawInfo(data1, data2, '같이 키우면 좋은 생물', '수명')
    }
}

function drawInfo(data1, data2, data3, data4){
    
    let str ="";
    let Section = document.getElementById("two-img-explain");
    const img = "fishbowl.png";
    const url = path + `/resources/image/${img}`;

    str += `
            <div id=two-img>
                <img src="${url}"어항사진">
            </div>
            <div >
                <div class="two-explain">
                    <p class="two-explain-title">${data3}</p> <br>
                    <p class="two-explain-contents">${data1}</p>
                </div>
                <div class="two-explain">
                    <p class="two-explain-title">${data4}</p> <br>
                    <p class="two-explain-contents">${data2}</p>
                </div>
            </div>
            `
    Section.innerHTML = str;
}



function anotherFishAjax(data){
    $.ajax({
        url: "anotherFishAjax.fi",
        type:"post",
        contentType: "application/json",
        dataType:"json",
        data: data,
        data: JSON.stringify(data),
        success: function(result){
            console.log("카테고리 에젝성공", result);
            anotherFish(result)
        },
        error: function(){
            console.log("카테고리 ajax요청실패")
        }
    })
}


function anotherFish(data){
    let str ="";
    let Section = document.getElementById("store-product");
    for(const b of data){
        const url = path + `/resources/image/${b.url}` //빽팁을 써야 스크립트에서는 변수라고 알아먹는다.
        console.log(url);

    str += `
                <a href="fishDetail.fi?fishName=${b.fishName}">
                    <div class="product-info">
                        <img src="${url}" alt="">
                        <p>${b.fishName}</p>
                    </div>
                </a>
            `
    }

    Section.innerHTML = str;
}



