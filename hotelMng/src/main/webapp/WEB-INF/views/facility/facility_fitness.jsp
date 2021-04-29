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

    <title>Fitness</title>
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
        <h2 id=gaeyo>Fitness</h2>
        <p> 다양하고 쾌적한 피트니스 시설과 함께 건강한 휴식을 취할 수 있습니다.<br/>
            문의전화 02-0000-0000<br/>
        </p>
        <div class=intbox>
            <div class=lbox>
                <h3><b>Indoor Swimming Pool</b></h3>
                <img src="${pageContext.request.contextPath}/resources/image/indoor%20pool.jpg" width="300" height="220">
                <div class=topexp>
                    <p>자연과 함께 수영과 휴식을 함께 즐길 수 있습니다.<br/>
                        별도의 락커룸을 제공합니다.<br/>
                    </p>
                </div>
            </div>
            <div class=rbox>
                <h3><b>Indoor Gym</b></h3>
                <img src="${pageContext.request.contextPath}/resources/image/gym.jpg" width="300" height="220">
                <div class=topexp>
                    <p>체력 관리를 위한 기능별 공간이 조성되어 운동과 휴식을 조화롭게 즐길 수 있습니다.<br/></p>
                </div>
            </div>
            <div class=lbox>
                <h3><b>Indoor Golf Course</b></h3>
                <img src="${pageContext.request.contextPath}/resources/image/golf.jpg" width="300" height="220">
                <div class=topexp>
                    <p>다양한 디지털 장비와 함께 드라이빙, 퍼팅, 자세교정 등의 Solution을 제공합니다.<br/></p>
                </div>
            </div>
            <div class=rbox>
                <h3><b>Indoor Sauna</b></h3>
                <img src="${pageContext.request.contextPath}/resources/image/sauna.jpg" width="300" height="220">
                <div class=topexp>
                    <p>고급스러운 사우나 시설과 서비스로 여유로운 휴식을 즐길 수 있습니다.<br/>
                        개인 샤워 부스 및 세신실 등의 시설을 갖추고 있습니다.<br/>
                        다양한 온도와 크기의 사우나 및 탕을 구비하고 있습니다.<br/>
                    </p>
                </div>
            </div>
        </div>
    </div>
    <%@include file = "/WEB-INF/views/layout/final.jsp" %>
</div>
</body>
</html>