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

    <title>Executive Rounge</title>
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
        <h2 id=gaeyo>Executive Rounge</h2>
        <img src="${pageContext.request.contextPath}/resources/image/rounge.jpg" width="800" height="500">
        <p> 세계 최고 수준의 이그제큐티브 라운지입니다.<br/>
            호텔의 최상층에 위한 이그제큐티브 라운지에서의 전경과 함께 특별한 다이닝 경험을 체험할 수 있습니다.<br/>
            문의전화 02-0000-0000<br/>
        </p>
    </div>
    <%@include file = "/WEB-INF/views/layout/final.jsp" %>
</div>
</body>
</html>