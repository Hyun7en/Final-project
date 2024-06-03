<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">

<title>Aquaqu</title>
<!-- Latest compiled and minified CSS -->

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/csCSS/csList.css">

<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/csJs/CsList.js"></script>

</head>
<body>
    <div class="wrap" >
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>

        <main id="community-normal" >
            
            <div id="com-nav" >
                    <ul>
                        <li>
                            <button class="com-nav-0" onclick="boCategory(0)"  style="border-radius: 22.5px;">
                            <!-- <img src="${pageContext.request.contextPath}/resources/image/iconQnA.png" style="width: 45px; height: 45px; position: relative; right: 100px; top: -5px;" alt="물음표 아이콘"> -->
                                <!-- <div style="width: 150px;"> -->
                                자주묻는 질문
                                <!-- </div> -->
                            
                            </button>
                        </li>
                            
                        <li><button class="com-nav-10" onclick="boCategory(1)" value="1" style="border-radius: 22.5px;">1:1 문의</button></li>
                        <!-- icon_onetoone.png 사용 -->
                        <li><button class="com-nav-20" onclick="boCategory(2)" value="2"style="border-radius: 22.5px;">신고센터</button></li>
                       <!-- icon_report.png 사용 -->
                    </ul>
            </div>
            
            <table class="com-list">
                <thead id="com-list-header">
                    <th style="width: 60px; border-radius: 10px 0 0 0;">No</th>
                    <th style="width: 450px; background-color: bl;">제목</th>
                    <th style="width: 135px;">글쓴이</th>
                    <th style="width: 135px;">작성일</th>
                    <th style="width: 120px; border-radius: 0 10px 0 0;">조회수</th>
                </thead>
                <tbody id="com-list-body">
                    <td>공지</td>
                    <td><b>신고 작성 시 주의사항</b></td>
                    <td>관리자</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>9</td>
                    <td><a href="">드립 칠 제목도 생각이 안 난다</a></td>
                    <td>할렐루야</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>8</td>
                    <td><a href="">액퍼 커뮤니티 사이트인 줄 알았는데</a></td>
                    <td>비바</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>7</td>
                    <td><a href="">낚시 관련 커뮤니티 사이트가 아니라고?</a></td>
                    <td>오예</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>6</td>
                    <td><a href="">제목 뭐 하지</a></td>
                    <td>지저스</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>5</td>
                    <td><a href="communityDetail.jsp">첫 관상어 소개</a></td>
                    <td>왓더</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>4</td>
                    <td><a href="">가즈아</a></td>
                    <td>호눌룰루</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>3</td>
                    <td><a href="">몰?루</a></td>
                    <td>요시</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td>2</td>
                    <td><a href="">첫 뻘글</a></td>
                    <td>아자</td>
                    <td>0000.00.00</td>
                    <td>0</td>
                </tbody>
                <tbody id="com-list-body">
                    <td style="border-radius: 0 0 0 10px;">1</td>
                    <td><a href="">첫 게시글</a></td>
                    <td>관리자</td>
                    <td>0000.00.00</td>
                    <td style="border-radius: 0 0 10px 0;">0</td>
                </tbody>
            </table>
            <div class="com-bottom1">
                <!-- <div class="com-bottom-left"> -->
                    <div class="com-bottom2">
                        이전 &nbsp; 1 &nbsp; 2 &nbsp; 3 &nbsp; 4 &nbsp; 5 &nbsp; 6 &nbsp; 7 &nbsp; 8 &nbsp; 9 &nbsp; 10 &nbsp; 다음
                    </div>
                    <div id="com-bottom-right">
                        <button id="com-blue-button">글쓰기</button>
                    </div>
                <!-- </div> -->
            </div>
      
        </main>
        
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>

    </div>
</body>
</html>