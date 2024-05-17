<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body>
	<div id="a">
        asdf
    </div>
    <script>
        window.onload = function(){
            geta();
        }

        function geta(){
            $.ajax({
                url: "test.bo",
                success : function(list){
                    const test =  document.querySelector('#a');
                    test.innerHTML = list[0].a;
                    console.log("실행됨")
                    console.log(list)
                },
                error : function(){
                    console.log("ajax실패")
                }
            })
        }

    </script>
</body>
</html>