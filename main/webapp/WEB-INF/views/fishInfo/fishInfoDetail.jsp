<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fishInfoCSS/fishInfoDetail.css">
	<script src="${pageContext.request.contextPath}/resources/js/fishInfoJS/fishInfoDetail.js"></script>
   
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main>
        <div id="main-div">
            <section id="scientific-name">
                <p>학명 Hepsetus</p>
            </section>

            <section id="fish-name">
                아프리칸 파이크
            </section>

            <section id="fish-img-info">
                <div id="fish-img">
                    <img src="${pageContext.request.contextPath}/resources/image/fish1.png" alt="">
                </div>

                <div id="short-div">
                    <div id="short-info">
                        <div class="short-info-1234">
                            <div class="info-char">
                                <img src="${pageContext.request.contextPath}/resources/image/fishIcon.png" alt="" style="width: 30px; height: 19px;">
                            </div>
                            <div class="short-info-inside">
                                <p class="short-title">서식지 및 특징</p> <br>
                                <p>아프리카 전역에 널리 서식</p>
                            </div>
                        </div>

                        <div class="short-info-1234">
                            <div class="info-char">
                                <img src="${pageContext.request.contextPath}/resources/image/growIcon.png" alt="" style="width: 19px; height: 19px;">
                            </div>
                            <div class="short-info-inside">
                                <p class="short-title">최대 성장 크기</p> <br>
                                <p>최대 70cm</p>
                            </div>
                        </div>

                        <div class="short-info-1234">
                            <div class="info-char">
                                <img src="${pageContext.request.contextPath}/resources/image/tempIcon.png" alt="">
                            </div>
                            <div class="short-info-inside">
                                <p class="short-title">적정 수온</p> <br>
                                <p>25~28 &#8451;</p>
                            </div>
                        </div>

                        <div class="short-info-1234">
                            <div class="info-char">
                                <img src="${pageContext.request.contextPath}/resources/image/phIcon.png" alt="" >
                            </div>
                            <div class="short-info-inside">
                                <p class="short-title">선호 수질(Ph)</p> <br>
                                <p>6 ~ 7.5</p>
                            </div>
                        </div>
                    </div>
                    <section id="long-info">
                        아프리카 전역에 널리 퍼져있는 아프리칸 파이크 입니다. 석호나 강 호수 늪 다양한 환경에서
                        서식하며 움직임을 감지해 사냥하는 아프리카식 포식자입니다. 같은 포식하는 타이거피쉬가 업슨ㄴ 곳에서만 사냥한다고 합니다.
                        아프리칸 파이크는 어식성 어류로 생먹이를 잘 사냥하지만 순치가 매우 쉬운 어종입니다. 매장에서 냉짱을 주로먹고 있으며 동성사료도 혼합하여 급여 가능합니다.
                        합사는 덩치가 큰 캣피쉬들이나 플레코 및 순한 큰 어류들을 추천해드립니다.
                    </section>
                </div>
                
            </section>

            <section id="fish-div-two">
                <div id="two-p">
                    <p>해당 물고기에 대해 자세히 알아보기</p>
                </div>

                <div id="two-btn">
                    <a href="#"><div class="two-btn-div-1">서식환경 및 특징</div></a>
                    <a href="#"><div class="two-btn-div">먹이</div></a>
                    <a href="#"><div class="two-btn-div">조명</div></a>
                    <a href="#"><div class="two-btn-div-4">같이 키우면 <br> 좋은 생물</div></a>
                </div>

                <div id="two-img-explain">
                    <div id=two-img>
                        <img src="${pageContext.request.contextPath}/resources/image/fishbowl.png" alt="">
                    </div>
                    <div >
                        <div class="two-explain">
                            <p class="two-explain-title">서식환경</p> <br>
                            <p class="two-explain-contents">아프리카 전역에 널리 서식하며 덩치는 야생에서 60~70cm 정도로 육식성이라서 먹이로
                                는 다른 물고기를 주로 사냥한다.</p>
                        </div>
                        <div class="two-explain">
                            <p class="two-explain-title">특징</p> <br>
                            <p class="two-explain-contents">길고 모양이 창처럼 생긴 이 열대어는 이마가 납작하며 몸의 측면은 평평하지 않다 입은 깊게 찢어져 있으며 턱은 부리처럼 생겼다. 각각의 턱에는 두 줄의 치아가 있으며, 위턱은
                                위로 움직일 수 있다. 지느러미들은 비교적 작은 편이다. 꼬리지느러미는 깊게 갈라져 
                                있으며 기름지느러미는 매우 작다. 석호나 강 호수 늪 다양한 환경에서 서식하며 움직임을 감지해 사냥하는 아프리카 포식자입니다.</p>
                        </div>
                    </div>
                </div>
            </section>

            <section id="go-store">
                <div id="go-store-info">
                    <p>해당 물고기를 키우는데 필요한 것이 있으신가요?</p>
                    <a href="#">스토어 추천 바로가기</a>
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

                <div class="store-product">
                    <a href="#">
                        <div class="product-info">
                            <img src="${pageContext.request.contextPath}/resources/image/fishNeon.png" alt="">
                            <p>네온 테트라</p>
                        </div>
                    </a>

                    <a href="#">
                        <div class="product-info">
                            <img src="${pageContext.request.contextPath}/resources/image/fishNeon.png" alt="">
                            <p>네온 테트라</p>
                        </div>
                    </a>

                    <a href="#">
                        <div class="product-info">
                            <img src="${pageContext.request.contextPath}/resources/image/fishNeon.png" alt="">
                            <p>네온 테트라</p>
                        </div>
                    </a>

                    <a href="#">
                        <div class="product-info">
                            <img src="${pageContext.request.contextPath}/resources/image/fishNeon.png" alt="">
                            <p>네온 테트라</p>
                        </div>
                    </a>

                    <a href="#">
                        <div class="product-info">
                            <img src="${pageContext.request.contextPath}/resources/image/fishNeon.png" alt="">
                            <p>네온 테트라</p>
                        </div>
                    </a>
                </div>
                
            </section>

            <section id="go-youtube">
                <div>
                    <p>
                        물고기 키우는데 도움이 되는 꿀팁 영상들!
                    </p>
                </div>

                <div id="youtube-btn">
                    <a href="#"><div class="two-btn-div-1">물갈이 하는 방법</div></a>
                    <a href="#"><div class="two-btn-div-1">먹이주는 방법</div></a>
                    <a href="#"><div class="two-btn-div-5">물고기가 힘들어보일 때</div></a>
                    <a href="#"><div class="two-btn-div-1">인테리어</div></a>
                    <a href="#"><div class="two-btn-div-5">수온/수질 맞추는 방법</div></a>
                    <a href="#"><div class="two-btn-div-4">물고기 키우는 꿀팁</div></a>

                </div>

               
                <div class="youtube-contents">
                    <div class="vedio">
                        <iframe width="475" height="260" src="https://www.youtube.com/embed/LtL4BLlLNko?si=7wYvDVZFE0UBE6c6" title="YouTube video player"
                        frameborder="16" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen style="border-radius: 16px;"></iframe>
                    </div>
                    <div class="container">
                        <ul id="result"></ul>
                    </div>
                </div>

                <div class="youtube-contents">
                    <div class="vedio">
                        <iframe width="475" height="260" src="https://www.youtube.com/embed/OzGbT1jBQ84?si=rewbx7a0nc8Ym9a0" title="YouTube video player" 
                        frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" referrerpolicy="strict-origin-when-cross-origin" allowfullscreen style="border-radius: 16px;"></iframe>
                    </div>
                    <div class="container">
                        <ul id="result2"></ul>
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
                    <a href="">
                        <div class="go-quration-community">
                            <p>큐레이션으로 가기</p>
                        </div>
                     </a>
                    <a href="">
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