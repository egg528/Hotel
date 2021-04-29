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

    <title>Restaurant</title>
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
            <h2 id=gaeyo>Restaurant</h2>
            <img src="${pageContext.request.contextPath}/resources/image/restaurant.jpg" width="800" height="500">
            <p> 루시드 호텔 뷔페에서 특별한 미각의 즐거움을 만날 수 있습니다.<br/>
                가족, 친구, 연인, 동료 등 함께하는 사람과의 즐거움이 두 배가 되는 경험을 만들 수 있습니다.<br/>
                운영시간 [조식] 06:00 - 10:00 | [중식] 11:30 - 14:00 | [석식] 17:30 - 21:00<br/>
                문의전화 02-0000-0000<br/>
            </p>
          </div>
    <%@include file = "/WEB-INF/views/layout/final.jsp" %>
</div>
</body>
</html>