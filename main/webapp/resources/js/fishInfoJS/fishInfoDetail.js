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

function detailDraw(data, name){
    if(name=='field'){
        drawInfo(data.field, data.caution)
    } else if(name=='feed'){
        drawInfo(data.feed)
    } else if(name=='light'){
        drawInfo(data.light)
    } else if(name=='growTogeter'){
        drawInfo(data.grow)
    }
}





