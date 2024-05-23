<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>persnal</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
  
<link rel="stylesheet" href="../../resources/css/csCSS/persnal.css">

</head>
<body>
    <div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        <main id="community-normal">

            <!-- main -->
            <div class="head">
    
                <input type="text" name="category" value="자주묻는 질문" onclick="showDiv(this);" id="title" >
                    
                    <label for="title" >
                    </label>&nbsp; &nbsp;
                <input type="text" name="category" value="1:1 문의" onclick="showDiv(this);" id="date">
                    <label for="date"></label>&nbsp; &nbsp;
                <input type="text" name="category" value="신고센터" onclick="showDiv(this);" id="writer">
                    <label for="writer"></label>&nbsp; &nbsp;
            </div>
    
            <!-- <div class="content">
                <br><br>
                <div class="innerOuter" style="padding:5% 10%;">
    
                    <table class="table table-hover table-striped">
                            <thead class="thead-dark">
                                <tr>
                                    <th>NO</th>
                                    <th>제목</th>
                                    <th>글쓴이</th>
                                    <th>작성일</th>
                                    <th>조회수</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="b" items="${list}">
                                    <tr onclick = "">
                                        <td>${b.boardNo }</td>
                                        <td>${b.boardTitle }</td>
                                        <td>${b.boardWriter }</td>
                                        <td>${b.createDate }</td>
                                        <td>${b.count }</td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                    </table>
                </div>
            </div> -->
            <div class="center">
    
                <table class="content-02">
                    <b>대충 문의 제목1</b><br>
                    	대충 문의 내용 1 <br>
                   		 어쩌구 저쩌구
                </table>
                <table class="content-02">
                    <b>대충 문의 제목2</b><br>
                    대충 문의 내용 2 <br>
                    어쩌구 저쩌구
                </table>
                <table class="content-02">
                    <b>대충 문의 제목3</b><br>
                    대충 문의 내용 3 <br>
                    어쩌구 저쩌구
                </table>
                <table class="content-02">
                    <b>대충 문의 제목4</b><br>
                    대충 문의 내용 4 <br>
                    어쩌구 저쩌구
                </table>
            </div>
            
            <div class="com-bottom1">
                <div id="com-bottom-right">
                    <button id="com-blue-button">글쓰기</button>
                </div>
                <div class="com-bottom2">
                    &lt;  1  2  3  4  5  6  7  8  9  10  &gt;
                </div>
            </div>
    
        </main>

         <!-- footer -->
         <%@ include file="../commons/footer.jsp" %>
        
        </div>

     


</body>
</html>