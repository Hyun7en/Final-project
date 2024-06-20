
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
					key: 'AIzaSyClqfDmaU_wDRL_Jk0Yn8Kl10BKv5mdI0w'
				},
				function (data) { 

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
                key: 'AIzaSyClqfDmaU_wDRL_Jk0Yn8Kl10BKv5mdI0w'
            },
            function (data) { 
  
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
        drawInfo(data1, data2,'서식환경', '특징', 'fishbowl.png')
    } else if(name=='feed'){
        drawInfo(data1 ,data2, '먹이주기', '식성', 'fishFeed2.png' )
    } else if(name=='light'){
        drawInfo(data1, data2, '조명', '온도', 'fishLight.png')
    } else if(name=='growTogeter'){
        drawInfo(data1, data2, '같이 키우면 좋은 생물', '수명', 'fishGrow.png')
    }
}

function drawInfo(data1, data2, data3, data4, data5){
    
    let str ="";
    let Section = document.getElementById("two-img-explain");
    const img = `${data5}`
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
            `;
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
    let Section = document.querySelector("#store-another-fish");
    for(const b of data){
        const url = path + `/resources/image/${b.url}` //빽팁을 써야 스크립트에서는 변수라고 알아먹는다.

    str += `
                <a href="fishDetail.fi?fishName=${b.fishName}">
                    <div class="product-info">
                        <img src="${url}" alt="">
                        <p>${b.fishName}</p>
                    </div>
                </a>
            `;

    
    }
    Section.innerHTML = str;
    
}







function drawYoutube(name){
    if(name=='t1'){
        drawYoutubeList('hNv-O1zmqkA?si=RjKi2DwRLNywBKc-', '2FZf6xqlNt0?si=jAEyxceiS4_f9-J2');
    }else if(name=='t2'){
        drawYoutubeList('8qbb4wPEnos?si=23ksW_fcM5vk-psC', 'c5d_bZ4eZj4?si=WImukpJrKF1KfDmN');
    }else if(name=='t3'){
        drawYoutubeList('EPNP-cq0sxE?si=LoCZkLwvKJ-dwoqUs', 'ebRWww2p3p4?si=mZ9WF-552St3t6IL');
    }else if(name=='t4'){
        drawYoutubeList('4DGO3PcvjBo?si=oWLEnjDrYT3KG5gX', 'GU8oH-buCiU?si=4HQXs0yN6m_cwUQz');
    }else if(name=='t5'){
        drawYoutubeList('Pw8tXSD-uXs?si=u8YRNQQPlf1C1HwC', 'PLw5_kDMFpQ?si=a_nTHGiuAXma2por');
    }else if(name=='t6'){
        drawYoutubeList('dZd_FPSU9GM?si=4F_UMJlaFvOLmA9s', 'jlc2ULfwQD8?si=17O_7V7RF9jUdt6F');
    }
}
function drawYoutubeList(url1, url2){
    let str ="";
    let str2 = "";
    let section = document.querySelector(".youtube-contents");
    str = `
            <div class="vedio">
                <iframe width="475" height="260" src="https://www.youtube.com/embed/${url1}" title="YouTube video player"
                frameborder="16" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen style="border-radius: 16px;"></iframe>
            </div>
            <div class="vedio">
                <iframe width="475" height="260" src="https://www.youtube.com/embed/${url2}" title="YouTube video player"
                frameborder="16" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen style="border-radius: 16px;"></iframe>
            </div>
            `;

    section.innerHTML = str;
}

function getFishProduct(){
    $.ajax({
        url : 'getFishProductList.cu',
        type:"post",
        dataType : 'Json',
        success : function(data){
            drawFishProduct(data)
            console.log("ajax성공")
        }, error : function(){
            console.log("ajax실패")
        }
    })
}

function drawFishProduct(data){
    const pDiv = document.querySelector(".store-product");
    let str = "";
    
    for(const b of data){
        const url = path + `/${b.pdChangeName}`

        str +=
        `
        <a href="detail.spd?pno=${b.pdNo}">
            <div class="product-info">
                <img src="${url}" alt="">
                    <p>${b.pdTitle}</p>
                <p>${b.pdPrice} 원</p>
            </div>
        </a>
        `;

    }
    pDiv.innerHTML = str;
}



