<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
   
   <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
   <!-- Latest compiled and minified CSS -->

   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
   <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/fishInfoCSS/fishInfo.css">
   <script src="${pageContext.request.contextPath}/resources/js/fishInfoJS/fishInfo.js"></script>
   <!-- Popper JS -->
   <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
   <!-- Latest compiled JavaScript -->
   <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
   
   
<body>
   <div class="wrap">
   
      <!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main>
            <div id="main-div">
               <div id="info-explain">
                  <p>어떤 종류의 <br>
                     물고기를 찾고 계신가요?</p>
               </div>

               <hr width="100%"; color="black"; size="3">

               <div id="fish-search">
                  <form action="">
                     <input type="submit" id="inputSubmit" value="" style="background-color: #E0F1FF; background-image:url(${pageContext.request.contextPath}/resources/image/searchBtn.png); width:26px; height:26px; position:absolute; left:0px; top: 23px;">
                     <input type="text" id="searchArea" style=" background-color: #E0F1FF; width: 90%; border-width: 0; height: inherit; font-size:18px;"  placeholder="물고기 이름을 검색해주세요">
                  </form>
               </div>

               <div class="fish-atag">
               
                    <ul class="menu align-center expanded text-center SMN_effect-45">
                      <li><a href="">해수어</a></li>
                      <li style="margin-left: 45px;"><a href="">담수어</a></li>
                      <li style="margin-left: 45px;"><a href="">기수어</a></li>
                      <li style="margin-left: 45px;"><a href="">열대어</a></li>
                    </ul>
              
                </div>

               <div id="fish-sub-explain">
                  <div>
                     <p>물고기 데이터 260종</p>
                  </div>
                  <div>
                     <a href="#">인기순</a>|
                     <a href="#">최신순</a>
                  </div>
               </div>

              
               <div id="main-container">
              		<c:forEach var="b" items="${list}">
              			<a href="fishDetail.fi" id="main-info-a">
	                     <div>
		                     <div id="main-info-p">
		                         <p>${b.fishName }</p>
		                     </div>
		                     <div id="main-info-img">
		                         <img src="${pageContext.request.contextPath}/resources/image/goopy.jpg" alt="">
		                     </div>
		                     <div id="main-info">
		                         <p>종류 : ${b.fishType}</p>
		                         <p>식성 : ${b.tasteType }</p>
		                         <p>성격 : ${b.tendency }</p>
                         
	                    	 </div>
	                     </div>
                	 </a>
              		</c:forEach>



                  
               </div>
               

               <!-- 페이징 처리 들어오는 곳-->
               <div id="pagination">

               </div>
               
            </div>
        </main>
                
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
     </div>
</body>
</html>