<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
    <link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
    <script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storeCSS/storeMain.css">
	
    <style>
        main{
            background: #E0F1FF;
        }

        #descript-quick{
            display: flex;
            justify-content: space-between;
        }
        #descript-quick #descript{
            padding-top: 80px;
            padding-left: 150px;
            font-weight: bolder;
        }

        #descript-quick #descript #page-title{
            font-size: 35px;
            padding-bottom: 20px;
        }

        #descript-quick #descript #page-descript{
            font-size: 30px;
            color: #0089FF;
        }

        #descript-quick #askn-quick-move{
            padding-top: 80px;
            padding-right: 50px;
            display: flex;
        }
        #descript-quick #askn-quick-move #ask{

        }
        #descript-quick #askn-quick-move #ask img{
            height: 45px;
            width: 45px;
        }
        #descript-quick #askn-quick-move #quick-move{

        }
    </style>
</head>
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main style="height: 2000px">
            
            <section id="descript-quick">
                
                    <div id="descript">
                        <div id="page-title">
                            스토어
                        </div>
                        <div id="page-descript">
                            사랑하는 반려어를 위해 <br> 
                            이건 어떠신가요?
                        </div>
                    </div>

                <div id="askn-quick-move">
                    <div id="ask">
                        <img src="../../resources/image/octopus-303622_1280.png" alt="">
                        <div>
                            문의사항이 있으신가요? <br>
                            <span>
                                관리자에게 문의해보세요.
                            </span>
                        </div>
                    </div>

                    <div id="quick-move">
                        <ul>
                            <li>
                                빠른이동
                            </li>

                            <li>
                                <a href="">관심상품</a>
                            </li>

                            <li>
                                <a href="">주문 내역</a>
                            </li>

                            <li>
                                <a href="">장바구니</a>
                            </li>

                            <li>
                                <a href="">최근검색</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </section>

            <section>

            </section>
                <div class="your-class">
                    <div>내용1</div>
                    <div>내용2</div>
                    <div>내용3</div>
                </div>

                <script>
                    $(document).ready(function(){
                        $('.your-class').slick({
                            infinite: true,
                            slidesToShow: 3,
                        });
                    });

                  </script>
            <section>

            </section>

            <section>

            </section>

            <section>

            </section>

            <section>

            </section>

		    
        </main>
                
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
     </div>
</body>
</html>