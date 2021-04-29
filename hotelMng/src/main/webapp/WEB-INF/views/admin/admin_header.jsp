<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>header</title>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="/resources/css/style_admin.css.css" type="text/css">
    <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
</head>
<body>
<div class=header>
    <a href="/admin"><img src="/resources/image/moon.png" width="100" height="100"></a>
    <div class=logo></div>
    <nav>
        <span><a></a></span>
        <span><a href="/admin/staffList">직원 List</a></span>
        <span><a href="/admin/memberList">회원 List</a></span>
        <span><a href="/admin/roomList">객실 List</a></span>
        <span><a href="/admin/reservationList">예약 List</a></span>
        <span><a href="/admin/qnaList">문의 List</a></span>
        <span>
            <c:choose>
                <c:when test="${member != null}"><a href="/logout.do">로그아웃</a></c:when>
                <c:otherwise><a href="/login.do">로그인</a></c:otherwise>
            </c:choose>
        </span>
    </nav>
</div>
</body>
</html> 