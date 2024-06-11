<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fishInfoCSS/fishInfoDetail.css">
	<script src="${pageContext.request.contextPath}/resources/js/fishInfoJS/fishInfoDetail.js"></script>
   
<body onload="InfoInit('${pageContext.request.contextPath}'), anotherFishAjax({fishType: '${fish.fishType}', tendency: '${fish.tendency}', tasteType: '${fish.tasteType}'});">
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main>
        <div id="main-div">
            <section id="scientific-name">
                <p>${fish.scientificName}</p>
            </section>


            <section id="fish-name">
                ${fish.fishName}
            </section>

            <section id="fish-img-info">
                <div id="fish-img">
                    <img src="${pageContext.request.contextPath}/resources/image/${fish.url}" alt="">
                </div>

                <div id="short-div">
                    <div id="short-info">
                        <div class="short-info-1234">
                            <div class="info-char">
                                <img src="${pageContext.request.contextPath}/resources/image/fishIcon.png" alt="" style="width: 30px; height: 19px;">
                            </div>
                            <div class="short-info-inside">
                                <p class="short-title">먹이</p> <br>
                                <p>${fish.tasteType}</p>
                            </div>
                        </div>

                        <div class="short-info-1234">
                            <div class="info-char">
                                <img src="${pageContext.request.contextPath}/resources/image/growIcon.png" alt="" style="width: 19px; height: 19px;">
                            </div>
                            <div class="short-info-inside">
                                <p class="short-title">수명</p> <br>
                                <p>약2년</p>
                            </div>
                        </div>

                        <div class="short-info-1234">
                            <div class="info-char">
                                <img src="${pageContext.request.contextPath}/resources/image/tempIcon.png" alt="">
                            </div>
                            <div class="short-info-inside">
                                <p class="short-title">적정 수온</p> <br>
                                <p>${fish.temperature} &#8451;</p>
                            </div>
                        </div>

                        <div class="short-info-1234">
                            <div class="info-char">
                                <img src="${pageContext.request.contextPath}/resources/image/phIcon.png" alt="" >
                            </div>
                            <div class="short-info-inside">
                                <p class="short-title">선호 수질(Ph)</p> <br>
                                <p>${fish.field} ph</p>
                            </div>
                        </div>
                    </div>
                    <section id="long-info">
                        <p>${fish.caution}</p>
                    </section>
                </div>
                
            </section>

            <section id="fish-div-two">
                <div id="two-p">
                    <p>해당 물고기에 대해 자세히 알아보기</p>
                </div>
                
                
                <div id="two-btn">
                    <a href="javascript:void(0);" onclick="detailDraw(`${fish.environment}`, `${fish.caution}`, 'field')"><div class="two-btn-div-1">서식환경 및 특징</div></a>
                    <a href="javascript:void(0);" onclick="detailDraw(`${fish.rationTime}`,`${fish.feedType}` ,'feed')"><div class="two-btn-div">먹이</div></a>
                    <a href="javascript:void(0);" onclick="detailDraw(`${fish.light}`,`${fish.temperature}` ,'light')"><div class="two-btn-div">조명</div></a>
                    <a href="javascript:void(0);" onclick="detailDraw(`${fish.growTogether}`,`${fish.lifeSpan}`,'growTogeter')"><div class="two-btn-div-4">같이 키우면 <br> 좋은 생물</div></a>
                </div>

                <div id="two-img-explain">
                    <div id=two-img>
                        <img src="${pageContext.request.contextPath}/resources/image/fishbowl.png" alt="">
                    </div>
                    <div >
                        <div class="two-explain">
                            <p class="two-explain-title">서식환경</p> <br>
                            <p class="two-explain-contents">${fish.environment}</p>
                        </div>
                        <div class="two-explain">
                            <p class="two-explain-title">특징</p> <br>
                            <p class="two-explain-contents">${fish.caution}</p>
                        </div>
                    </div>
                </div>
            </section>

            <section id="go-store">
                <div id="go-store-info">
                    <p>해당 물고기를 키우는데 필요한 것이 있으신가요?</p>
                    <a href="storeMain.ma">스토어 추천 바로가기</a>
                </div>

                <div class="store-product">
                    <a href="#">
                        <div class="product-info">
                            <img src="${pageContext.request.contextPath}/resources/image/suzo.png" alt="">
                            <p>프리미엄 수조</p>
                            <p>36,000 원</p>
                        </div>
                    </a>

                    <a href="#">
                        <div class="product-info">
                            <img src="${pageContext.request.contextPath}/resources/image/suzo.png" alt="">
                            <p>프리미엄 수조</p>
                            <p>36,000 원</p>
                        </div>
                    </a>

                    <a href="#">
                        <div class="product-info">
                            <img src="${pageContext.request.contextPath}/resources/image/suzo.png" alt="">
                            <p>프리미엄 수조</p>
                            <p>36,000 원</p>
                        </div>
                    </a>

                    <a href="#">
                        <div class="product-info">
                            <img src="${pageContext.request.contextPath}/resources/image/suzo.png" alt="">
                            <p>프리미엄 수조</p>
                            <p>36,000 원</p>
                        </div>
                    </a>

                    <a href="#">
                        <div class="product-info">
                            <img src="${pageContext.request.contextPath}/resources/image/suzo.png" alt="">
                            <p>프리미엄 수조</p>
                            <p>36,000 원</p>
                        </div>
                    </a>
                </div>
                
            </section>

            <section id="another-fish">
                <div id="go-store-info">
                    <p>해당 물고기가 속한 종의 다른 물고기가 궁금하신가요?</p>
                </div>

                <div id="store-another-fish" >
                    
                </div>
                
            </section>

            <section id="go-youtube">
                <div>
                    <p>
                        물고기 키우는데 도움이 되는 꿀팁 영상들!
                    </p>
                </div>

                <div id="youtube-btn">
                    <a href="javascript:void(0);" onclick="drawYoutube('t1');"><div class="two-btn-div-1">물갈이 하는 방법</div></a>
                    <a href="javascript:void(0);" onclick="drawYoutube('t2');"><div class="two-btn-div-1">먹이주는 방법</div></a>
                    <a href="javascript:void(0);" onclick="drawYoutube('t3');"><div class="two-btn-div-5">물고기가 힘들어보일 때</div></a>
                    <a href="javascript:void(0);" onclick="drawYoutube('t4');"><div class="two-btn-div-1">인테리어</div></a>
                    <a href="javascript:void(0);" onclick="drawYoutube('t5');"><div class="two-btn-div-5">수온/수질 맞추는 방법</div></a>
                    <a href="javascript:void(0);" onclick="drawYoutube('t6');"><div class="two-btn-div-4">물고기 키우는 꿀팁</div></a>

                </div>

            
                <div class="youtube-contents">
                    <div class="vedio">
                        <iframe width="475" height="260" src="https://www.youtube.com/embed/hNv-O1zmqkA?si=RjKi2DwRLNywBKc-" title="YouTube video player"
                        frameborder="16" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen style="border-radius: 16px;"></iframe>
                    </div>
                    <div class="vedio">
                        <iframe width="475" height="260" src="https://www.youtube.com/embed/2FZf6xqlNt0?si=jAEyxceiS4_f9-J2" title="YouTube video player" 
                        frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen style="border-radius: 16px;"></iframe>
                    </div>
                </div>


            </section>

            <section id="quration-community">
                <div id="q-c-title">
                    <p>어떤 종류의 물고기를 키우실지 고민이라면?</p>
                </div>
                
                <div class="q-c-info">
                    <p>문답을 통해 내 취향에 딱 맞는 물고기를 키워보자!</p>
                    <p>다양한 사람들의 의견을 보자!</p>
                </div>

                <div id="goto-q-c">
                    <a href="gotoCuration.cu">
                        <div class="go-quration-community">
                            <p>큐레이션으로 가기</p>
                        </div>
                     </a>
                    <a href="list.co?category=0&cpage=1">
                        <div class="go-quration-community">
                            <p>커뮤니티로 가기</p>
                        </div>
                    </a>
                </div>
            </section>

        </div>
		    
        </main>
                
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
     </div>
</body>
</html>