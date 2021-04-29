<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/style_room.css" type="text/css">
    <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">

    <title>rooms</title>
</head>
<body>
<%@include file = "/WEB-INF/views/layout/header.jsp" %>
<div class=contain>
    <div class=left>
            <h2 class=tit><a href="/room_main.do">객실 소개</a></h2>
            <ul class=menu>
                <li class="m1">
                    <a href="/room_standard.do">
                        <span>Standard Room</span>
                    </a>
                </li>
                <li class="m2">
                    <a href="/room_deluxe.do">
                        <span>Deluxe Room</span>
                    </a>
                </li>
                <li class="m3">
                    <a href="/room_executive.do">
                        <span>Executive Room</span>
                    </a>
                </li>
                <li class="m4">
                    <a href="/room_suite.do">
                        <span>Suite Room</span>
                    </a>
                </li>
            </ul>
    </div>
    <div class=contents>
        <h2 id=gaeyo>감각적인 인테리어와 함께한 호텔 루시드의 객실은 품격 있는 라이프스타일 공간입니다.</h2>
        <div class=intbox>
            <div class=lbox>
                <h3><b>Standard Room</b></h3>
                <a href="/room_standard.do"><img src="/resources/image/standardroom.jpg" width="350" height="280"></a>
                <div class=topexp>
                    <p>아늑하고 깔끔한 분위기로 편안한 휴식을 취할 수 있습니다.<br></p>
                </div>
            </div>
            <div class=rbox>
                <h3><b>Deluxe Room</b></h3>
                <a href="/room_deluxe.do"><img src="/resources/image/deluxe room.jpg" width="350" height="280"></a>
                <div class=topexp>
                    <p>보다 더 넓은 객실에서 여유로운 휴식을 취할 수 있습니다.<br/></p>
                </div>
            </div>
            <div class=lbox>
                <h3><b>Executive Room</b></h3>
                <a href="/room_executive.do"><img src="/resources/image/executive room.jpg" width="350" height="280"></a>
                <div class=topexp>
                    <p>이그제큐티브 라운지 이용으로 특별한 여유를 즐길 수 있습니다.<br/></p>
                </div>
            </div>
            <div class=rbox>
                <h3><b>Suite Room</b></h3>
                <a href="/room_suite.do"><img src="/resources/image/suiteroom.jpg" width="350" height="280"></a>
                <div class=topexp>
                    <p>호텔 루시드만의 품격을 갖춘 공간으로 특별한 경험을 누릴 수 있습니다.<br/></p>
                </div>
            </div>
        </div>
    </div>
    <%@include file = "/WEB-INF/views/layout/final.jsp" %>
</div>
</body>
</html>