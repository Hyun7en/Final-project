<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
	
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageCSS/myPageInfo.css">

<body>
    <c:if test="${ not empty successMessage}">
		<script>
	    var successMessage = "${successMessage}";
    	if (successMessage) {
        Swal.fire({
            icon: 'success',
            title: 'success!',
            html: successMessage
        });
    }
		</script>
		<c:remove var="successMessage" scope="session"/>
	</c:if>

	<div class="wrap">
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        <main>
            <div id="myPageInfo-wrapper" >
                <div id="myPage-sidebar">
                    <div id="myPage-sidebar-profile-area">
                        <div id="myPage-sidebar-profile-img">
                            <img src="https://previews.123rf.com/images/ann24precious/ann24precious1602/ann24precious160200015/53140153-%EA%B7%80%EC%97%AC%EC%9A%B4-%EB%AC%BC%EA%B3%A0%EA%B8%B0.jpg" alt="">
                        </div>
                        <div id="myPage-sidebar-profile-nickName"><b>${loginUser.nickname}</b>님 환영합니다.</div>
                    </div>
                    <div id="myPage-category-area"> 
                        <div class="myPage-category"><a style="color: #0089FF;" href="myPage.me?userNo=${loginUser.userNo}">내 정보</a></div>
                        <div class="myPage-category"><a href="interestProduct.my?userNo=${loginUser.userNo}">관심상품</a></div>
                        <div class="myPage-category"><a href="cart.my?userNo=${loginUser.userNo}">장바구니</a></div>
                        <div class="myPage-category"><a href="orderHistory.my?userNo=${loginUser.userNo}">주문내역</a></div>
                        <div class="myPage-category"><a href="writePost.my?userNo=${loginUser.userNo}">작성한 글</a></div>
                        <div class="myPage-category"><a href="inquiry.my?userNo=${loginUser.userNo}">1:1 문의</a></div>
                        <div class="myPage-category"><a href="sellerConversionPage.my?userNo=${loginUser.userNo}">판매자 신청</a></div>
                    </div>
                </div>

                <div id="myPageInfo-info-area">
                    <div id="myPage-category-select-title">
                        <b>내 정보</b>
                    </div>
                    
                    <form action="modifyInfo.my" method="POST" enctype="multipart/form-data">
                        <input type="hidden" name="userNo" value="${loginUser.userNo}">
                        <div id="myPageInfo-profile-area">
                            <div id="myPageInfo-profile-img">
                                <c:choose>
                                    <c:when test="${empty ma.changeName}">
                                        <img id="profile-img" src="">
                                    </c:when>
                                    <c:otherwise>
                                        <img id="profile-img" src="${ma.changeName}">
                                    </c:otherwise>
                                </c:choose>
                                <c:if test="${not empty ma.originName}">
                                    <input type="hidden" name="originName" value="${ma.originName }">
                       			    <input type="hidden" name="changeName" value="${ma.changeName }">
                                </c:if>
                                
                            </div>
                            <div id="myPageInfo-profile-edit">
                                <label id="profile-edit-btn" for="file" onclick="change_profileImage()">프로필 변경</label>
                            </div>
                            <div style="display: none;">
                                <input type="file" name="file" id="file" value="12354.jpg" onchange="loadImg(this)">
                            </div>
                        </div>

                        <div id="myPageInfo-no-changeInfo-area">
                            <table>
                                <tr>
                                    <th>레벨</th>
                                    <td>${loginUser.userLv}</td>
                                </tr>
                                <tr>
                                    <th>아이디</th>
                                    <td>
                                        ${loginUser.userId}
                                    </td>
                                </tr>
                                <tr>
                                    <th>비밀번호</th>
                                    <td>
                                        ${loginUser.userPwd}
                                    </td>
                                </tr>
                            </table>
                        </div>
                         
                        <div id="myPageInfo-changeInfo-area">
                            <table>
                                <tr>
                                    <th>닉네임</th>
                                    <td>
                                        <!-- button 태그에 type="button"을 안쓰면 버튼을 눌렀을때 페이지가 새로고침이 되서 써야한다.-->
                                        <input type="text" id="nickname" name="nickname" readonly value="${loginUser.nickname}">
                                        <button type="button" class="change-btn" id="nickname-btn" onclick="change_nickname(this)">변경</button>
                                    </td>
                                </tr>

                                <tr>
                                    <th>성별</th>
                                    <td id="gender-area">
                                        <c:choose>
                                            <c:when test="${loginUser.gender eq 'M'}">
                                                <input type="text" id="gender-display" name="gender-display" readonly value="남">
                                                <input type="hidden" id="gender" name="gender" value="M">
                                            </c:when>
                                            <c:otherwise>
                                                <input type="text" id="gender-display" name="gender-display" readonly value="여">
                                                <input type="hidden" id="gender" name="gender" value="F">
                                            </c:otherwise>
                                        </c:choose>
                                        <button type="button" class="change-btn" id="gender-change-btn" onclick="change_gender()">변경</button>
                                    </td>
                                </tr>

                                <tr>
                                    <th>연락처</th>
                                    <td>
                                        <input type="text" id="phone" name="phone" readonly value="${loginUser.phone}">
                                        <button type="button" class="change-btn" id="phone-btn" onclick="change_phone()">변경</button>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>
                                        <input type="text" id="email" name="email" readonly value="${loginUser.email}">
                                        <button type="button" class="change-btn" id="email-btn" onclick="change_email()">변경</button>
                                    </td>
                                </tr>
                                <tr>
                                    <th>주소</th>
                                    <td>
                                        <input type="text" id="address" name="address" readonly value="${loginUser.address}">
                                        <button type="button" class="change-btn" id="address-btn" onclick="change_address()">변경</button>
                                    </td>
                                </tr>
                            </table>

                            <div id="myPageInfo-modify-delete-button-area">
                                <button type="submit" id="modify-btn" disabled style="background-color: #eee;">정보수정</button>
                                <!-- 초기화 버튼을 만들지 말지 -->
                                <button onclick="location.href='deleteMember.my'">회원탙퇴</button>
                            </div>
                            
                        </div>
                    </form>
                </div>
            </div>
        </main>          
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %> 
     </div>

     <script>

        function change_profileImage(){
            document.getElementById("modify-btn").disabled = false;
            document.getElementById("modify-btn").style.backgroundColor = "#000";
        }

        function change_nickname() {
            document.getElementById("nickname").readOnly = false;
            document.getElementById("nickname").style.backgroundColor = "white";
            document.getElementById("nickname-btn").innerText = "확정";
            document.getElementById("nickname-btn").style.backgroundColor = "#96E6FF";
            document.getElementById("nickname-btn").setAttribute("onclick", "confirm_nickname()");
	    }

        function confirm_nickname() {
            document.getElementById("modify-btn").disabled = false;
            document.getElementById("modify-btn").style.backgroundColor = "#000";
            document.getElementById("nickname").readOnly = true;
            document.getElementById("nickname").style.backgroundColor = "#96E6FF";
            document.getElementById("nickname-btn").disabled = true;
            document.getElementById("nickname-btn").innerText = "확정됨";
            document.getElementById("nickname-btn").style.backgroundColor = "#96E6FF";
            document.getElementById("nickname-btn").style.color = "#000";
        }

        // function change_intro() {
        //     document.getElementById("intro").disabled = false;
        //     document.getElementById("intro-btn").innerText = "확정";
        //     document.getElementById("intro-btn").setAttribute("onclick", "confirm_intro()");
	    // }

        // function confirm_intro() {
        //     document.getElementById("modify-btn").disabled = false;
        //     document.getElementById("modify-btn").style.backgroundColor = "#000";
        //     document.getElementById("intro").disabled = true;
        //     document.getElementById("intro").style.backgroundColor = "#9AE2AA";
        //     document.getElementById("intro-btn").disabled = true;
        //     document.getElementById("intro-btn").innerText = "확정됨";
        //     document.getElementById("intro-btn").style.color = "#bbb";
        // }

        function change_gender() {
            document.getElementById("gender-display").style.display = "none";
            document.getElementById("gender-change-btn").style.display = "none";
            document.getElementById("gender").disabled = true;

            document.querySelector("#gender-area").innerHTML = "";

            let radios = ('<input type="radio" class="gender" id="gender1" name="gender" checked value="M"> 남'
                         + '<input type="radio" class="gender" id="gender2" name="gender" value="F"> 여'
                         + '<button type="button" class="change-btn" id="gender-confirm-btn" onclick="confirm_gender()">확정</button>');
            document.querySelector("#gender-area").innerHTML = radios;

            document.getElementById("gender-confirm-btn").style.backgroundColor = "#96E6FF";
	    }

        function confirm_gender() {
            document.getElementById("modify-btn").disabled = false;
            document.getElementById("modify-btn").style.backgroundColor = "#000";

            const selectedGender = document.querySelector('input[name="gender"]:checked').value;
            document.querySelector("#gender-area").innerHTML = "";

            if(selectedGender === 'M'){
                let text = ('<input type="text" id="gender-display" name="gender-display" value="남">'
                         + '<input type="hidden" id="gender" name="gender" value="M">'
                         + '<button type="button" class="change-btn" id="gender-confirmed-btn">확정됨</button>');
                document.querySelector("#gender-area").innerHTML = text;
            } else if(selectedGender === 'F'){
                let text = ('<input type="text" id="gender-display" name="gender-display" value="여">'
                         + '<input type="hidden" id="gender" name="gender" value="F">'
                         + '<button type="button" class="change-btn" id="gender-confirmed-btn">확정됨</button>');
                document.querySelector("#gender-area").innerHTML = text;
            }

            document.getElementById("gender-display").readOnly= true;
            document.getElementById("gender-display").style.backgroundColor = "#96E6FF";
            document.getElementById("gender-confirmed-btn").style.backgroundColor = "#96E6FF";
        }

        function change_phone() {
            document.getElementById("phone").readOnly = false;
            document.getElementById("phone").style.backgroundColor = "white";
            document.getElementById("phone-btn").innerText = "확정";
            document.getElementById("phone-btn").style.backgroundColor = "#96E6FF";
            document.getElementById("phone-btn").setAttribute("onclick", "confirm_phone()");
	    }

        function confirm_phone() {
            document.getElementById("modify-btn").disabled = false;
            document.getElementById("modify-btn").style.backgroundColor = "#000";
            document.getElementById("phone").readOnly = true;
            document.getElementById("phone").style.backgroundColor = "#96E6FF";
            document.getElementById("phone-btn").disabled = true;
            document.getElementById("phone-btn").innerText = "확정됨";
            document.getElementById("phone-btn").style.color = "#000";
        }

        function change_email() {
            document.getElementById("email").readOnly = false;
            document.getElementById("email").style.backgroundColor = "white";
            document.getElementById("email-btn").innerText = "확정";
            document.getElementById("email-btn").style.backgroundColor = "#96E6FF";
            document.getElementById("email-btn").setAttribute("onclick", "confirm_email()");
	    }

        function confirm_email() {
            document.getElementById("modify-btn").disabled = false;
            document.getElementById("modify-btn").style.backgroundColor = "#000";
            document.getElementById("email").readOnly = true;
            document.getElementById("email").style.backgroundColor = "#96E6FF";
            document.getElementById("email-btn").disabled = true;
            document.getElementById("email-btn").innerText = "확정됨";
            document.getElementById("email-btn").style.color = "#000";
        }

        function change_address() {
            document.getElementById("address").readOnly = false;
            document.getElementById("address").style.backgroundColor = "white";
            document.getElementById("address-btn").innerText = "확정";
            document.getElementById("address-btn").style.backgroundColor = "#96E6FF";
            document.getElementById("address-btn").setAttribute("onclick", "confirm_address()");
	    }

        function confirm_address() {
            document.getElementById("modify-btn").disabled = false;
            document.getElementById("modify-btn").style.backgroundColor = "#000";
            document.getElementById("address").readOnly = true;
            document.getElementById("address").style.backgroundColor = "#96E6FF";
            document.getElementById("address-btn").disabled = true;
            document.getElementById("address-btn").innerText = "확정됨";
            document.getElementById("address-btn").style.color = "#000";
        }

        function loadImg(imgInputFile){
            console.log(imgInputFile.files.length)
            if(imgInputFile.files.length == 1){
                //파일을 읽어들일 FileReader객체생성
                const reader = new FileReader();

                //파일을 읽어들이는 메소드
                //해당파일을 읽어들이는 순간 해당 파일만의 고유한 url부여
                reader.readAsDataURL(imgInputFile.files[0]);

                //파일 읽어들이기 완료했을 때 실행할 함수 정의
                reader.onload = function(ev){
                    
                    document.getElementById("profile-img").src = ev.target.result;
                    console.log(ev.target.result)
                }
            } else{
                document.getElementById("profile-img").src = null;
            }
        }


     </script>
</body>
</html>