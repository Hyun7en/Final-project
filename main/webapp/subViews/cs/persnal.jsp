<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>persnal</title>
<link rel="stylesheet" href="../../resources/css/csCSS/persnal.css">
</head>
<body>

    <input type="text" name="category" value="자주묻는 질문" onclick="showDiv(this);" id="title" >
        
        <label for="title" >
        </label>&nbsp; &nbsp;
    <input type="text" name="category" value="date" onclick="showDiv(this);" id="date">
        <label for="date"></label>&nbsp; &nbsp;
    <input type="text" name="category" value="writer" onclick="showDiv(this);" id="writer">
        <label for="writer"></label>&nbsp; &nbsp;

	<div class="content">
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
    </div>
</body>
</html>