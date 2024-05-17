<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storeCSS/storeMain.css">
	
    <style>
        main{
            background: #E0F1FF;
        }
        #descript{
            padding-top: 80px;
            padding-left: 150px;
            font-weight: bolder;
        }

        #descript #page-title{
            font-size: 35px;
            padding-bottom: 20px;
        }

        #descript #page-descript{
            font-size: 30px;
            color: #0089FF;
        }

    </style>
</head>
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main style="height: 2000px">
            
            <section>
                
                    <div id="descript">
                        <div id="page-title">
                            스토어
                        </div>
                        <div id="page-descript">
                            사랑하는 반려어를 위해 <br> 
                            이건 어떠신가요?
                        </div>
                    </div>

                <div>

                </div>
            </section>

            <section>

            </section>

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