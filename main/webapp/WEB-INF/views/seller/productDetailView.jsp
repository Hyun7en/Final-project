<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aquaqu</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">

<!-- Popper JS -->
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- CSS -->
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/storeCSS/productDetailView.css">

</head>
<body>
<div class="wrap">
    <!-- header -->
    <%@ include file="../commons/header.jsp" %>
    
    <main>
        <!-- Product Header -->
        <div>
            
            <div id="seller-home-top">
                    <p>워터 박스</p>
            </div>
            <div id="seller-home-nav">
                <a href="#" style="margin-left: auto;">BEST</a>
                <a href="">전체상품</a>
                <a href="">특가판매</a>
                <a href="">주문제작</a>
                <a href="">어항</a>
                <a href="">어항용품</a>
                <a href="">수족관용품</a>
                <a href="" style="margin-right: auto;">기타</a>
            </div>
        </div>

        <section>
            <div class="prdimg">
                <div id="mimg_div" class="img">
                    <a href="{{$크게보기}}">{{$상품이미지}}</a>
                </div>
                <!-- <div class="addimg">
                    {{$상품부가이미지리스트}}
                </div> -->
            </div>

            <h3 class="name">{{$상품명}} {{$상품아이콘}}</h3>

            <div class="price">
                
                {{if(소비자가격)}}<del>{{$화폐단위전}}{{$소비자가격}}{{$화폐단위후}}</del>{{endif(소비자가격)}}
                <span class="sell">
                    {{$화폐단위전}}<strong>{{$판매가격}}</strong>{{$화폐단위후}}
                    {{if(참조화폐사용)}}({{$참조화폐단위전}}<strong>{{$참조판매가격}}</strong>{{$참조화폐단위후}}){{endif(참조화폐사용)}}
                </span>
                
            </div>
            <p class="summary">{{$상품요약설명}}</p>

            <table class="list">
                <colgroup>
                    <col style="width:30%;">
                    <col>
                </colgroup>
                <tbody>
                    {{if(회원할인가격)}}
                    <tr>
                        <th scope="row">회원할인 가격</th>
                        <td>{{$화폐단위전}}{{$회원할인가격}}{{$화폐단위후}}</td>
                    </tr>
                    {{endif(회원할인가격)}}
                    {{if(이벤트금액)}}
                    <tr>
                        <th scope="row">이벤트 금액</th>
                        <td>{{$화폐단위전}}{{$이벤트금액}}{{$화폐단위후}}</td>
                    </tr>
                    {{endif(이벤트금액)}}
                    {{if(총적립금)}}
                    <tr>
                        <th scope="row">적립금</th>
                        <td>
                            {{$화폐단위전}}{{$총적립금}}{{$화폐단위후}}
                            <div class="milage_info">
                                <span class="i_info"></span>
                                <div class="info">
                                    {{if(상품적립금)}}상품적립금 : {{$화폐단위전}}{{$상품적립금}}{{$화폐단위후}}<br>{{endif(상품적립금)}}
                                    {{if(회원적립금)}}회원적립금 : {{$화폐단위전}}{{$회원적립금}}{{$화폐단위후}}<br>{{endif(회원적립금)}}
                                    {{if(이벤트적립금)}}이벤트적립금 : {{$화폐단위전}}{{$이벤트적립금}}{{$화폐단위후}}{{endif(이벤트적립금)}}
                                </div>
                            </div>
                        </td>
                    </tr>
                    {{endif(총적립금)}}
                    {{if(상품별배송비)}}
                    <tr>
                        <th scope="row">배송비</th>
                        <td>{{$화폐단위전}}{{$상품별배송비}}{{$화폐단위후}}</td>
                    </tr>
                    {{endif(상품별배송비)}}
                    {{if(상품항목리스트)}}
                    {{$상품항목리스트}}
                    {{endif(상품항목리스트)}}
                    <tr>
                        <th scope="row">수량</th>
                        <td>
                            <div class="box_qty">
                                <input type="text" name="buy_ea" value="{{$최소주문수량}}" class="form_input">
                                <div class="btn_ea">
                                    <a href="javascript:eaChg(1);" class="ea_up"></a>
                                    <a href="javascript:eaChg(2);" class="ea_down"></a>
                                </div>
                            </div>
                        </td>
                    </tr>
                    {{$상품옵션리스트}}
                </tbody>
            </table>

            <!-- 반복문시작 -->
            <div class="multi_opt">
                <ul id="detail_multi_option" class="selected_list">
            <!-- 반복구문시작 -->
                    <li>
                        <span class="name">{{$옵션명(간략)}}{{$옵션데이터}}</span>
                        <div class="box_qty">
                            <input type="text" name="m_buy_ea[{{$옵션세트번호}}]" value="{{$주문수량}}" onchange="multiTotalPrc();" class="form_input">
                            <div class="btn_ea">
                                <a href="#" onclick="{{$수량더하기}}" class="ea_up"></a>
                                <a href="#" onclick="{{$수량빼기}}" class="ea_down"></a>
                            </div>
                        </div>
                        <div class="price">
                            <span>{{$화폐단위전}}{{$옵션별가격}}{{$화폐단위후}}</span>
                            <span class="del"><a href="#" onclick='{{$옵션삭제}}'><img src="{{$이미지경로}}/button/delete_s.png" alt="삭제"></a></span>
                        </div>
                    </li>
            <!-- 반복구문끝 -->
                </ul>
                <div class="opt_total">
                    <span class="title">총금액</span>
                    {{if(쿠폰적용대상상품목록)}}
                    <span class="coupon" onclick="showPrdCpnList(1);">쿠폰적용</span>
                    {{endif(쿠폰적용대상상품목록)}}
                    <strong>{{$화폐단위전}}{{$총멀티옵션금액}}{{$화폐단위후}}</strong>
                    {{if(참조화폐사용)}}({{$참조화폐단위전}}<span id="detail_multi_r_option_prc">{{$참조총멀티옵션금액}}</span>{{$참조화폐단위후}}){{endif(참조화폐사용)}}
                </div>
            </div>
            <!-- 반복문끝 -->
            <!-- 데이터없음시작 -->
            <div class="multi_opt">
                <div class="opt_total">
                    <span class="title">총금액</span>
                    {{if(쿠폰적용대상상품목록)}}
                    <span class="coupon" onclick="showPrdCpnList(1);">쿠폰적용</span>
                    {{endif(쿠폰적용대상상품목록)}}
                    <strong>{{$화폐단위전}}<span class="sell_prc_str_total"></span>{{$화폐단위후}}</strong>
                    {{if(참조화폐사용)}}({{$참조화폐단위전}}<span id="sell_r_prc_str"></span>{{$참조화폐단위후}}){{endif(참조화폐사용)}}
                </div>
            </div>
            <script type="text/javascript">
            totalCal(document.prdFrm);
            </script>
            <!-- 데이터없음끝 -->


            <div class="btn">
                <span class="box_btn large cart"><a href="javascript:addCart(document.prdFrm,1);">장바구니</a></span>
                <span class="box_btn large gray buy"><a href="javascript:addCart(document.prdFrm,2);">
                {{if(정상판매시내용)}}바로구매{{endif(정상판매시내용)}}
                {{if(품절시내용)}}품절{{endif(품절시내용)}}
                </a></span>
                <span class="box_btn large white wish {{$위시리스트담김}}"><a href="javascript:addWish(document.prdFrm);"></a></span>
                <div class="pay">
                    {{$네이버체크아웃버튼}}
                    {{$페이코즉시구매버튼}}
                </div>
            </div>

        </section>

        <div class="tab_area">
            <ul class="tab tab_detail">
                <li><a onclick="tabmove('0')" class="active">Details</a></li>
                <li><a onclick="tabmove('1')">Review</a></li>
                <li><a onclick="tabmove('2')">Q&A</a></li>
                <li><a onclick="tabmove('3')">Order info.</a></li>
            </ul>
        </div>

        <section>
            <h4>상품 상세 설명</h4>
            <div class="detail_info">{{$상품상세설명}}</div>
        </section>

        <section>
            <h4>상품 리뷰</h4>
            <!-- Button to Open the Modal -->
            <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">
                Open modal
            </button>
        

            <!-- The Modal -->
            <div class="modal" id="myModal">
                <section class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
            
                    <!-- Modal Header -->
                    
                    <h2 class="modal-title">Modal Heading</h2>
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    
            
                    <!-- Modal body -->
                    <div class="modal-body">
                        
                    </div>
            
                    <!-- Modal footer -->
                    <div class="modal-footer">
                    <button type="button" class="btn btn-danger" data-dismiss="modal">Close</button>
                    </div>
            
                </div>
                </section>
            </div>
        </section>

        <section>
            <h4>상품 문의</h4>

        </section>

        <section>
            <h4>배송 안내</h4>
            
        </section>
    </main>

    
    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>
</body>
</html>
