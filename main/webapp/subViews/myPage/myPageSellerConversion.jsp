<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>판매자 신청</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageCSS/myPageSellerConversion.css">

<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main>
		    <div id="myPageSellerConversion-wrapper">
                <div id="myPage-sidebar">
                    <div id="myPage-sidebar-profile-area">
                        <div id="myPage-sidebar-profile-img">
                            <img src="https://previews.123rf.com/images/ann24precious/ann24precious1602/ann24precious160200015/53140153-%EA%B7%80%EC%97%AC%EC%9A%B4-%EB%AC%BC%EA%B3%A0%EA%B8%B0.jpg" alt="">
                        </div>
                        <div id="myPage-sidebar-profile-nickName"><b>${loginUser.nickName}홍길동</b>님 환영합니다.</div>
                    </div>
                    <div id="myPage-category-area">
                        <div class="myPage-category"><a href="">내 정보</a></div>
                        <div class="myPage-category"><a href="">관심상품</a></div>
                        <div class="myPage-category"><a href="">주문내역</a></div>
                        <div class="myPage-category"><a href="">작성한 글</a></div>
                        <div class="myPage-category"><a href="">장바구니</a></div>
                        <div class="myPage-category"><a href="">1:1 문의</a></div>
                        <div class="myPage-category"><a style="color: #0089FF;" href="">판매자 신청</a></div>
                    </div>
                </div>
                <div id="mypageSellerConversion-info-area">
                    <div id="myPage-category-select-title">
                        <h3>판매자 전환 신청</h3>
                    </div>
                    <form action="sellerConversion.my">
                        <div id="mypageSellerConversion-input-area">
                            <div id="mypageSellerConversion-input">
                                <div class="info-input-area">
                                    <div class="info-input-title"><b>사업자등록번호</b></div>
                                    <div><input type="text" name="buisnessNo"></div>
                                </div>
                                <div class="info-input-area">
                                    <div class="info-input-title"><b>대표자 성명</b></div>
                                    <div><input type="text" name="buisnessName"></div>
                                </div>
                                <div class="info-input-area">
                                    <div class="info-input-title"><b>대표자 성명2</b></div>
                                    <div><input type="text" name="subBusinessName"></div>
                                </div>
                                <div class="info-input-area">
                                    <div class="info-input-title"><b>개업일자</b></div>
                                    <div><input type="date" name="openBusinessDate"></div>
                                </div>
                                <div class="info-input-area">
                                    <div class="info-input-title"><b>상호</b></div>
                                    <div><input type="text" name="storeName"></div>
                                </div>
                                <div class="info-input-area">
                                    <div class="info-input-title"><b>법인등록번호</b></div>
                                    <div><input type="text" name="crn"></div>
                                </div>
                                <div class="info-input-area">
                                    <div class="info-input-title"><b>주 업태명</b></div>
                                    <div><input type="text" name="mainBusinessName"></div>
                                </div>
                                <div class="info-input-area">
                                    <div class="info-input-title"><b>주 종목명</b></div>
                                    <div><input type="text" name="mainItemName"></div>
                                </div>
                                <div class="info-input-area">
                                    <div class="info-input-title"><b>사업장 주소</b></div>
                                    <div><input type="text" name="businessAddress"></div>
                                </div>
                                <div class="info-input-area" id="deposit-account-area">
                                    <div class="info-input-title" ><b>정산대금 <br> 입금계좌</b></div>
                                    <div>
                                        <div id="bank-select-area">
                                            <select name="" id="">
                                                <option value="">국민</option>
                                                <option value="">신한</option>
                                                <option value="">농협</option>
                                                <option value="">기업</option>
                                            </select>
                                        </div>
                                        <div>
                                            <input type="text" name="" placeholder="예금주명">
                                            <input type="text" name="businessAccount" placeholder="계좌번호(-없이 입력)">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div id="btn-area">
                            <button type="reset">초기화</button>
                            <button type="submit">신청하기</button>
                        </div>

                    </form>
                </div>
            </div>
        </main>
                
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
     </div>
</body>
</html>