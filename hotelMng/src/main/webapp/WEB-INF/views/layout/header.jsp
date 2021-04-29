<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<html>
<head>
    <title>header</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/style_layout.css" type="text/css">
    <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
</head>
<body>
    <div class=header>
    <a href="/main"><img src="/resources/image/moon.png" width="100" height="100"></a>
    <div class=logo></div>
    <span class="topmenu">
	  <c:choose>
         <c:when test="${member != null}"><a href="/logout.do">로그아웃</a></c:when>
         <c:otherwise><a href="/login.do">로그인</a></c:otherwise>
      </c:choose>
	  <c:choose>
         <c:when test="${member == null}"><a href="/memeber/regist.do">회원가입</a></c:when>
	  	 <c:otherwise>
	  	 	<a href="/mypage/memberinfo">마이페이지</a>
	  	 </c:otherwise>
	  </c:choose>
      <a href="/mypage/reservation">예약 확인</a>
    </span>
    <nav>
        <span><a href="/intro.do">호텔 소개</a></span>
        <span><a href="/room_main.do">객실</a></span>
        <span><a href="/searchRoom.do">예약</a></span>
        <span><a href="/qna/list.do">고객문의</a></span>
        <span><a href="/facility_main.do">편의시설</a></span>
    </nav>
    </div>
</body>
</html>