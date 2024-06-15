<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Aquaqu</title>

<!-- jQuery -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>

<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/commonsCSS/reset.css">
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/sellerCSS/productListView.css">


</head>
<body>
<div class="wrap">

    <!-- header -->
    <%@ include file="../commons/header.jsp" %>

    <main>
        <div>
            <table class="tbl_col prd">
                <caption class="hidden">주문상품</caption>
                <colgroup>
                    <col style="width:100px;">
                    <col>
                    <col style="width:18%;">
                    <col style="width:10%;">
                    <col style="width:10%;">
                    <col style="width:10%;">
                    <col style="width:10%;">
                    <col style="width:10%;">
                </colgroup>
                <thead>
                    <tr>
                        <th scope="col" colspan="2">상품명</th>
                        <th scope="col">옵션</th>
                        <th scope="col">가격</th>
                        <th scope="col">수량</th>
                        <th scope="col">추가금액</th>
                        <th scope="col">총 금액</th>
                        <th scope="col">적립금</th>
                    </tr>
                </thead>
                <tbody>
            <!-- 반복구문시작 -->
                    <tr>
                        <td class="img">{{$상품이미지(링크포함)}}</td>
                        <td class="tal">
                            {{$상품명(링크포함)}}
                            {{if(오늘출발)}}
                            <p class="today"><strong>오늘출발</strong><span>평일 {{$오늘출발주문마감시간}} 주문마감</span></p>
                            {{endif(오늘출발)}}
                        </td>
                        <td class="tal">{{$상품옵션정보(추가가격포함)}}<div>{{$기타메세지}}</div></td>
                        <td>{{$화폐단위전}}{{$옵션제외가격}}{{$화폐단위후}}</td>
                        <td>{{$구매수량}}</td>
                        <td>{{$화폐단위전}}{{$총옵션가격}}{{$화폐단위후}}</td>
                        <td>{{$화폐단위전}}{{$상품총가격}}{{$화폐단위후}}</td>
                        <td>{{$화폐단위전}}{{$상품총적립금}}{{$화폐단위후}}</td>
                    </tr>
            <!-- 반복구문끝 -->
                </tbody>
            </table>
        </div>

        <div>
            <section>
                <h3 class="title">주문자 입력</h3>
                <table class="tbl_order">
                    <caption class="hidden">주문자 입력</caption>
                    <colgroup>
                        <col style="width:18%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row"><label for="order_buyer_name">주문하시는 분</label></th>
                            <td><input type="text" name="buyer_name" value="{{$주문자명}}" id="order_buyer_name" class="form_input">{{$로그인전2}}</td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="buyer_phone">전화번호</label></th>
                            <td>
                                <input type="text" name="buyer_phone" id="buyer_phone" value="{{$전화번호}}" class="form_input remove_dash">
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="buyer_cell">휴대전화번호</label></th>
                            <td>
                                <input type="text" name="buyer_cell" id="buyer_cell" value="{{$휴대전화}}" class="form_input remove_dash">
                                <input type="checkbox" name="sms" id="sms" value="Y" checked><label for="sms" class="msg">주문관련 SMS를 수신합니다.</label>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="order_buyer_email">이메일</label></th>
                            <td><input type="text" name="buyer_email" value="{{$주문자이메일}}" id="order_buyer_email" class="form_input mail3"></td>
                        </tr>
                        {{$로그인후3}}
                    </tbody>
                </table>
            </section>

            <section>
                <div class="title_delivery">
                    <h3 class="title">배송지 정보</h3>
                    {{if(국내해외배송선택)}}
                    <span>{{$국내해외배송라디오}}</span>
                    {{endif(국내해외배송선택)}}
                    <label class="msg"><input type="checkbox" name="save_addr" value="Y"> 현재 배송지 정보를 회원정보로 저장</label>
                </div>
                <table class="tbl_order">
                    <caption class="hidden">배송지 정보</caption>
                    <colgroup>
                        <col style="width:18%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row">기존 배송지</th>
                            <td>
                                {{$배송지선택}}
                                <label class="msg"><input type="checkbox" name="copy_info" onClick="copyInfo(this.form)"> 주문인 정보와 동일</label>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row"><label for="order_addressee_name">받으시는 분</label></th>
                            <td><input type="text" name="addressee_name" value="" id="order_addressee_name" class="form_input"></td>
                        </tr>
                        {{$주소및전화입력박스(국내)}}
                        {{$주소및전화입력박스(해외)}}
                        <tr>
                            <th scope="row"><label for="order_dlv_memo">배송시요청사항</label></th>
                            <td><textarea type="text" name="dlv_memo" value="" id="order_dlv_memo" class="form_input block"></textarea></td>
                        </tr>
                        {{$주문추가항목리스트}}
                    </tbody>
                </table>
            </section>
        </div>

        <div>
            <section>
                <h3 class="title first">결제 정보</h3>
                <table class="tbl_order2">
                    <caption class="hidden">결제 가격정보</caption>
                    <colgroup>
                        <col style="width:60%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr>
                            <th scope="row">상품합계 금액</th>
                            <td>{{$화폐단위전}}{{$총상품구매금액}}{{$화폐단위후}}</td>
                        </tr>
                        <tr>
                            <th scope="row">배송료</th>
                            <td>(+) {{$화폐단위전}}<span id="delivery_prc2">{{$배송비}}</span>{{$화폐단위후}}</td>
                        </tr>
                        {{if(해외배송사용)}}
                        <tr>
                            <th scope="row">관세</th>
                            <td>(+) {{$화폐단위전}}<span id="tax_prc"></span>{{$화폐단위후}}</td>
                        </tr>
                        {{endif(해외배송사용)}}
                    </tbody>
                </table>
                <table class="tbl_order2 sale">
                    <caption class="hidden">결제 할인정보</caption>
                    <colgroup>
                        <col style="width:50%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr class="total order_area_total_sale_prc">
                            <th scope="row">할인 금액 합계 <a class="i_info p_cursor" onclick="$('#discount_info').toggle()"></a></th>
                            <td>
                                (-) {{$화폐단위전}}{{$총할인금액합계}}{{$화폐단위후}}
                                <div id="discount_info" class="view_info">
                                    <div class="order_area_event_prc">이벤트 할인금액<br>{{$화폐단위전}}{{$이벤트할인금액}}{{$화폐단위후}}</div>
                                    <div class="order_area_timesale">타임세일금액<br>{{$화폐단위전}}{{$타임세일금액}}{{$화폐단위후}}</div>
                                    <div class="order_area_member_prc">회원할인금액<br>{{$화폐단위전}}{{$회원할인금액}}{{$화폐단위후}}</div>
                                    <div class="order_area_cpn_prc">쿠폰할인금액<br>{{$화폐단위전}}{{$쿠폰할인금액}}{{$화폐단위후}}</div>
                                    <div class="order_area_prd_prc">상품금액별할인금액<br>{{$화폐단위전}}{{$상품금액별할인금액}}{{$화폐단위후}}</div>
                                    <div class="order_area_prdcpn_prc">상품별쿠폰 할인금액<br>{{$화폐단위전}}{{$개별상품쿠폰할인금액}}</span>{{$화폐단위후}}</div>
                                </div>
                            </td>
                        </tr>
                        <tr class="use_milage_field total_sale">
                            <th scope="row">적립금 사용</th>
                            <td>(-) {{$화폐단위전}}<span class="use_milage_prc"></span>{{$화폐단위후}}</td>
                        </tr>
                        <tr class="use_emoney_field total_sale">
                            <th scope="row">예치금 사용</th>
                            <td>(-) {{$화폐단위전}}<span class="use_emoney_prc"></span>{{$화폐단위후}}</td>
                        </tr>
                    </tbody>
                </table>
                <table class="tbl_order2">
                    <caption class="hidden">결제정보</caption>
                    <colgroup>
                        <col style="width:60%;">
                        <col>
                    </colgroup>
                    <tbody>
                        <tr class="total order_area_total_milage">
                            <th scope="row">총 적립금 <a class="i_info p_cursor" onclick="$('#milage_info').toggle()"></a></th>
                            <td>
                                {{$화폐단위전}}{{$총지급적립금}}{{$화폐단위후}}
                                <div id="milage_info" class="view_info">
                                    <div class="order_area_prd_milage">상품 적립금<br>{{$화폐단위전}}{{$상품적립금}}{{$화폐단위후}}</div>
                                    <div class="order_area_member_milage">회원 적립금<br>{{$화폐단위전}}{{$회원적립금}}{{$화폐단위후}}</div>
                                    <div class="order_area_event_milage">이벤트 적립금<br>{{$화폐단위전}}{{$이벤트적립금}}{{$화폐단위후}}</div>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <th scope="row">총 결제 금액</th>
                            <td>
                                <strong class="total_price">{{$화폐단위전}}{{$실결제금액}}{{$화폐단위후}}</strong>
                                {{if(참조화폐사용)}}<br>({{$참조화폐단위전}}<span id="total_r_order_price_div"></span>{{$참조화폐단위후}}){{endif(참조화폐사용)}}
                            </td>
                        </tr>
                    </tbody>
                </table>
            </section>

            <section>
                <h3 class="title line">결제수단</h3>
                <div class="method">
                    {{$결제방식선택}}
                </div>
                {{if(미입금주문취소일)}}<p class="order_cancel_msg">* 주문신청 후 <strong class="point_color">{{$미입금주문취소일}}</strong>일 이내에 입금 확인이 되지 않으면 자동취소 됩니다.</p>{{endif(미입금주문취소일)}}
                <div id="order1">
                    <label><input name="reconfirm" id="reconfirm" type="checkbox" value="Y"> 결제정보를 확인하였으며,<br>구매진행에 동의합니다.</label>
                    <span class="box_btn huge block"><a href="javascript:confirmOrder(); scroll_page();">주문하기</a></span>
                </div>
            </section>
        </div>
    </main>

    <!-- footer -->
    <%@ include file="../commons/footer.jsp" %>

</div>

</body>
</html>
