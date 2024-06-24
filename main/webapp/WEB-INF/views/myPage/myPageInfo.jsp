<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보</title>
	
    <!-- jQuery library -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    
    <!-- css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageCSS/myPageInfo.css">
    
    <!-- javaScript -->
    <script src="${pageContext.request.contextPath}/resources/js/myPageJS/myPageInfo.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

    <!-- Popper JS -->
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

    <!-- alert 메세지 -->
	<link rel="stylesheet" href="//cdn.jsdelivr.net/npm/alertifyjs@1.13.1/build/css/alertify.min.css"/>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>

</head>
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
    <c:if test="${ not empty errorMessage}">
		<script>
			var errorMessage = "${errorMessage}";
		    if (errorMessage) {
		        Swal.fire({
		            icon: 'error',
		            title: 'Error!',
		            html: errorMessage
		        });
		    }
		</script>
		<c:remove var="errorMessage" scope="session"/>
	</c:if>
	<div class="wrap">
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        <main>
            <div id="myPageInfo-wrapper" >
                <div id="myPage-sidebar">
                    <div id="myPage-sidebar-profile-area">
                        <div id="myPage-sidebar-profile-img">
                            <img src="${ma.changeName}" alt="">
                        </div>
                        <div id="myPage-sidebar-profile-nickName"><b>${loginUser.nickname}</b>님 환영합니다.</div>
                    </div>
                    <div id="myPage-category-area"> 
                        <div class="myPage-category"><a style="color: #0089FF;" href="myPage.my?userNo=${loginUser.userNo}">내 정보</a></div>
                        <div class="myPage-category"><a href="interestProduct.my?userNo=${loginUser.userNo}&cpage=1">관심상품</a></div>
                        <div class="myPage-category"><a href="cart.my?userNo=${loginUser.userNo}">장바구니</a></div>
                        <div class="myPage-category"><a href="orderHistory.my?userNo=${loginUser.userNo}&cpage=1">주문내역</a></div>
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
                                        <img id="myPage-profile-img" src="">
                                    </c:when>
                                    <c:otherwise>
                                        <img id="myPage-profile-img" src="${ma.changeName}">  <!-- header에있는 프로필 태그의 id도 profile-img로 동일해서 myPage를 붙임 -->
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
                                    <th>비밀번호</th>
                                    <td>
                                            <input type="password" id="userPwd" name="userPwd" style="width: 70%;" placeholder="기존의 비밀번호 입력">
                                            <button type="button" class="change-btn" style="width: 110px;" onclick="passwordCheck()">비밀번호 변경</button>
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
                                        <input type="text" id="nickname" name="nickname" value="${loginUser.nickname}" readonly>
                                        <button type="button" class="change-btn" id="nickname-btn" onclick="change_nickname()">변경</button>
                                        <button type="button" class="change-btn" id="nickname-btn-cancel" style="display: none;" onclick="cancel_btn(this)">취소</button>
                                    </td>
                                </tr>

                                <tr>
                                    <th>한줄소개</th>
                                    <td>
                                        <input type="text" id="userIntro" name="userIntro" readonly value="${loginUser.userIntro}">
                                        <button type="button" class="change-btn" id="userIntro-btn" onclick="change_userIntro()">변경</button>
                                        <button type="button" class="change-btn" id="intro-btn-cancel" style="display: none;" onclick="cancel_btn(this)">취소</button>
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
                                        <button type="button" class="change-btn" id="phone-btn-cancel" style="display: none;" onclick="cancel_btn(this)">취소</button>
                                    </td>
                                </tr>
                                <tr>
                                    <th>이메일</th>
                                    <td>
                                        <input type="text" id="email" name="email" readonly value="${loginUser.email}">
                                        <button type="button" class="change-btn" id="email-btn" onclick="change_email()">변경</button>
                                        <button type="button" class="change-btn" id="email-btn-cancel" style="display: none;" onclick="cancel_btn(this)">취소</button>
                                    </td>
                                </tr>
                                <tr id="address-area">
                                    <th>주소</th>
                                    <td>
                                        <input type="text" id="address" name="address" readonly value="${loginUser.address}" onclick="callDaumService()">
                                        <button type="button" class="change-btn" id="address-btn" onclick="change_address()">변경</button>
                                        <button type="button" class="change-btn" id="address-btn-cancel" style="display: none;" onclick="cancel_btn(this)">취소</button>
                                    </td>
                                    <!-- <td>
                                        <input type="hidden" id="address2" name="address2">
                                    </td> -->
                                </tr>
                            </table>

                            <div id="myPageInfo-modify-delete-button-area">
                                <button type="submit" id="modify-btn" disabled style="background-color: #eee;">정보수정</button>
                                <button type="button" onclick="delete_member_modal()">회원탙퇴</button>
                            </div>
                        </div>
                    </form>

                    <div id="delete-member-modal">
                        <div id="delete-member-modal-content">
                            <h3>회원 탈퇴 확인</h3>
                            <div id="password-check-area">
                                <div>
                                    <span>현재 비밀번호</span>
                                    <div>
                                        <input type="text" id="inputPwd" name="inputPwd" value="">
                                        <input type="hidden" id="loginUserPwd" name="loginUserPwd" value="${loginUser.userPwd}">
                                        <button type="button" onclick="password_check()">확인</button>
                                    </div>
                                </div>
                                <span id="warning-text">* 회원 탈퇴 시, 복구가 불가능합니다.</span>
                            </div>
                            <div id="modal-btn-area">
                                <!-- <form id="form-area" action="deleteMember.my?userNo=${loginUser.userNo}"></form> -->
                                    <button type="button" id="delete-btn" onclick="delete_member('${loginUser.userNo}')" disabled style="color: #d0d0d0;">탈퇴하기</button>
                                <!-- </form> -->
                                <button type="button" id="close-modal" onclick="close_modal()">닫기</button>
                            </div>
                        </div>
                    </div>  
 
                </div>
            </div>
        </main>
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %> 
     </div>
</body>
</html>