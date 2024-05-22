<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>hellow</title>
<link rel="stylesheet" href="../../resources/css/csCSS/hello.css">
</head>
<body>
    <div id="wrap">

        <!-- header -->
        <%@ include file="../commons/header.jsp" %>
        <main id="community-normal">

            <div class="head">
                <input type="text" name="category" value="자주묻는 질문" onclick="showDiv(this);" id="title" >
                    <label for="title" ></label>&nbsp; &nbsp;
                <input type="text" name="category" value="1:1 문의" onclick="showDiv(this);" id="date">
                    <label for="date"></label>&nbsp; &nbsp;
                <input type="text" name="category" value="신고센터" onclick="showDiv(this);" id="writer">
                    <label for="writer"></label>&nbsp; &nbsp;
            </div>
                    <!-- <div>                
                        <table class="table table-hover table-striped">
                            <thead class="thead-dark">
                                <tr>
                                    
                                </tr>
                            </thead>
                        </table>
                    </div> -->
            <div id="center01">
                <table class="center">
                    <thead class="center-list"><a href=""><b>아이디, 비밀번호 잊어버렸습니다.</b></a></thead>
                </table>
                <table class="center">
                    <thead class="center-list"><a href=""><b>(뻐끔뻐끔뻐끔뻐끔)</b></a></thead>
                </table>
                <table class="center">
                    <thead class="center-list"><a href=""><b>(꼬로로록)</b></a></thead>
                </table>
                <table class="center">
                    <thead class="center-list"><a href=""><b>소... 솔직히 디자인 하면서 장난치는 건 선넘는다고 생각해요...</b>
                    <br>디자이너야 그게 무슨 소리니</a></thead>
                </table>
                <table class="center">
                    <thead class="center-list"><a href=""><b>말말말</b></a></thead>
                </table>
                <table class="center">
                    <thead class="center-list"><a href=""><b>말말말</b></a></thead>
                </table>
                <table class="center">
                    <thead class="center-list"><a href=""><b>말말말</b></a></thead>
                </table>
                <table class="center">
                    <thead class="center-list"><a href=""><b>말말말</b></a></thead>
                </table>
                <table class="center">
                    <thead class="center-list"><a href=""><b>금붕어의 기억력은 정말로 3초 인가요?</b></a></thead>
                </table>
                <table class="center">
                    <thead class="center-list"><a href=""><b>물고기의 피는 무슨 색이냐!</b></a></thead>
                </table> 
            </div>        
        </main>
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>                   
    </div>
</body>
</html>