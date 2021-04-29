<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <style>
        * {
            font-family: 'Noto Sans KR', sans-serif;
        }
    </style>

    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/style_facility.css" type="text/css">
    <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">

    <title>Outdoor Pool</title>
</head>
<body>
<%@include file = "/WEB-INF/views/layout/header.jsp" %>
<div class=contain>
    <div class=left>
        <h2 class=tit><a href="/facility_main.do">시설 소개</a></h2>
        <ul class=menu>
            <li class="m1">
                <a href="/facility_rounge.do">
                    <span>The Executive Rounge</span>
                </a>
            </li>
            <li class="m2">
                <a href="/facility_pool.do">
                    <span>Outdoor Pool</span>
                </a>
            </li>
            <li class="m3">
                <a href="/facility_fitness.do">
                    <span>Fitness</span>
                </a>
            </li>
            <li class="m4">
                <a href="/facility_hall.do">
                    <span>Banquet Hall</span>
                </a>
            </li>
            <li class="m5">
            	<a href="/facility_restaurant.do">
            		<span>Restaurant</span>
            	</a>
            </li>
        </ul>
    </div>
    <div class=contents>
        <h2 id=gaeyo>Outdoor Pool</h2>
        <img src="${pageContext.request.contextPath}/resources/image/pool.jpg" width="800px" height="500px">
        <p> 계절마다 색다른 테마로 계절마다 새로운 경험을 제공합니다.<br/>
            온수풀, 자쿠지, 루프탑, 카바나 등 다양한 라이프 스타일을 즐기실 수 있습니다.<br/>
            문의전화 02-0000-0000<br/><br/><br/>
            운영방침:<br>
            - 야외 수영장은 투숙객 전용 시설입니다.<br/>
            - 야외 수영장은 입장 혜택이 포함된 상품 외에는 이용 시 입장료가 부과됩니다.<br/>
            - 야외 수영장은 사전 예약이 불가합니다. (카바나의 경우, 사전 예약 가능합니다. 문의 전화 02-0000-0000)
            - 쾌적하고 안전한 운영을 위해 적정 인원 초과 시 입장이 제한될 수 있습니다.<br/>
            - 야외 수영장의 모든 구역은 금연 구역입니다.<br/>
            - 선베드는 선착순 배정입니다.<br/>
            안전:<br/>
            - 신장 140cm 미만 고객은 보호자의 보호 하에 구명조끼 착용 시 이용 가능합니다.<br/>
            - 다이빙은 금지입니다.<br/>
            - 기상 상황에 따라 야외 수영장 이용이 제한될 수 있습니다.<br/>
            - 수영장 소독물질이 알레르기를 일으킬 수 있습니다. 관련 알레르기가 있는 고객은 이용을 삼가주십시오.<br/>
            복장:<br/>
            - 수영복 착용 시에만 수영장 이용이 가능합니다.<br/>
            - 36개월 미만 유아는 방수 기저귀 착용 후 이용이 가능합니다.<br/>
            장비:<br/>
            - 지름 1m 이내 사이즈의 튜브만 반입이 허용되며, 키즈풀에서만 사용 가능합니다.<br/>
            - 비치볼을 제외한 오리발, 물총 등 불편을 줄 수 있는 장비를 사용 불가입니다.<br/>
            식음료:<br/>
            - 외부 식음료의 반입은 삼가주십시오.<br/>
            - 식음료 주문은 운영 마감시간 및 중간 정비시간의 1시간 전까지 가능합니다.<br/>
            에티켓:<br/>
            - 수영장에 들어가기 전 반드시 샤워를 해주시기 바랍니다.<br/>
            - 선탠 오일 등의 태닝 제품을 바르신 경우, 클렌징 후 수영장을 이용해주십시오.<br/>
            - 샤워실 및 탈의실 이용시 만 5세 이상 어린이는 혼성 입장이 불가합니다.<br/>
        </p>
    </div>
    <%@include file = "/WEB-INF/views/layout/final.jsp" %>
</div>
</body>
</html>