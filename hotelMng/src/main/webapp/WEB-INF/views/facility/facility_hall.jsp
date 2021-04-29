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

    <title>Banquet Hall</title>
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
        <h2 id=gaeyo>Banquet Hall</h2>
        <img src="${pageContext.request.contextPath}/resources/image/banquet hall.jpg" width="800" height="500">
        <p> 호텔 루시드의 연회장에서 특별한 시간을 보내십시오.<br/>
            웨딩, 기업 연회, 가족 연회 등 다양하게 연출을 변화할 수 있습니다.<br/>
            문의전화 02-0000-0000<br/>
            크기 : 400m^2 | 수용인원 : 정찬(코스) 기준 200석<br/>
        </p>
    </div>
    <%@include file = "/WEB-INF/views/layout/final.jsp" %>
</div>
</body>
</html>