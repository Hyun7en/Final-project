<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/myPageCSS/myPageCart.css">
	
   
<body>
	<div class="wrap">
	
		<!-- header -->
        <%@ include file="../commons/header.jsp" %>
        
        <main>
            <div id="myPageCart-wrapper">
                <div id="myPage-sidebar">
                    <div id="myPage-sidebar-profile-area">
                        <div id="myPage-sidebar-profile-img">
                            <img src="https://previews.123rf.com/images/ann24precious/ann24precious1602/ann24precious160200015/53140153-%EA%B7%80%EC%97%AC%EC%9A%B4-%EB%AC%BC%EA%B3%A0%EA%B8%B0.jpg" alt="">
                        </div>
                        <div id="myPage-sidebar-profile-nickName"><b>${loginUser.nickname}</b>님 환영합니다.</div>
                    </div>
                    <div id="myPage-category-area">
                        <div class="myPage-category"><a href="myPage.me">내 정보</a></div>
                        <div class="myPage-category"><a href="interestProduct.my">관심상품</a></div>
                        <div class="myPage-category"><a href="orderHistory.my">주문내역</a></div>
                        <div class="myPage-category"><a href="writePost.my">작성한 글</a></div>
                        <div class="myPage-category"><a style="color: #0089FF;" href="cart.my">장바구니</a></div>
                        <div class="myPage-category"><a href="inquiry.my">1:1 문의</a></div>
                        <div class="myPage-category"><a href="sellerConversion.my">판매자 신청</a></div>
                    </div>
                </div>
                <div id="myPageCart-info-area">
                    <div id="myPage-category-select-title"><h3>장바구니</h3></div>
                    <table>
                        <thead>
                            <th width="5%"><input type="checkbox"></th>
                            <th width="30%">상품정보</th>
                            <th width="15%">수량</th>
                            <th width="15%">상품금액</th>
                            <th width="15%">배송비용</th>
                            <th width="20%">선택</th>
                        </thead>
                        <tbody>
                            <tr>
                                <td width="5%"><input type="checkbox"></td>
                                <td id="product-info" width="30%">
                                    <div id="product-info-img"><img src="https://i.namu.wiki/i/N3gQsM4taoIPfKiZuNnJUvDARi1QbgYR4TfRMhkSby12H0fJLHrPxh9daOI45qakLWnVAx67MU2Kn4M0UWLFkQ.webp" alt=""></div>
                                    <div id="product-info-name">비단잉어</div>
                                </td>
                                <td width="15%">
                                    <div id="count-btn">
                                        <button onclick="count('minus')">-</button>
                                        <p id="product-count">1</p>
                                        <button onclick="count('plus')">+</button>
                                    </div>
                                </td>
                                <td width="15%"><p>amount</p></td>
                                <td width="15%">delivery-cost</td>
                                <td width="20%">
                                    <div id="product-btn">
                                        <button>주문하기</button>
                                        <button>삭제</button>
                                    </div>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                    <div id="myPageCart-product-list-amount-area">
                        <div id="myPageCart-product-list-amount">
                            <div class="product-list-amount">
                                <b>총 주문 갯수</b>
                                <p>total-count</p>
                            </div>
                            <div class="product-list-amount">
                                <b>상품금액</b>
                                <p>total-amount</p>
                            </div>
                            <div class="operator">+</div>
                            <div class="product-list-amount">
                                <b>배송비용</b>
                                <p>total-delivery-cost</p>
                            </div>
                            <div class="operator">-</div>
                            <div class="product-list-amount">
                                <b>할인금액</b>
                                <p>total-discount-amount</p>
                            </div>
                            <div class="operator">=</div>
                            <div class="product-list-amount">
                                <b>총 주문 금액</b>
                                <p>total-order-amount</p>
                            </div>
                        </div>
                    </div>
                    <div id="select-btn-area">
                        <div id="select-btn">
                            <div id="delete-btn-area">
                                <button>전체삭제</button>
                                <button>선택상품 삭제</button>
                            </div>
                            <div id="order-btn-area">
                                <button>선택상품 주문</button>
                                <button>전체 주문</button>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </main>
                
        <!-- footer -->
        <%@ include file="../commons/footer.jsp" %>
        
     </div>

     <script>
        function count(type){
            const result = document.getElementById("product-count");

            let number = result.innerText;

            if(type === 'minus') {
                if(number != 1){
                    number = parseInt(number) -1;
                }
            } else if(type === 'plus') {
                number = parseInt(number) + 1;
            }

            result.innerText = number;
        }
     </script>
</body>
</html>