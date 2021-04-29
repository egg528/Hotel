<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="/resources/css/style.css" type="text/css">
<title>QnA</title>
<style>
body {
	background-color: #EEEFF1;
}

.contain {
	background-color: #EEEFF1;
}

.finish {
	background-color: #EEEFF1;
}

textarea {
	overflow: auto;
	vertical-align: top;
	padding: 8px;
	box-sizing: border-box;
	border: solid 1px #aaa;
}

table {
	border-collapse: collapse;
	border-spacing: 0;
	table-layout: fixed;
	border-spacing: 0;
	width: 100%;
}

.tbData td {
	padding: 14px 20px 14px 20px;
}

.tbData tbody th:first-child {
	border-left: none;
}

.tb-1 td.fm {
	padding-top: 16px;
	padding-bottom: 16px;
}
</style>
</head>

<body>
	<div class=header>
		<a href="/main"><img src="/resources/image/moon.png" width="100" height="100"></a>
		<nav>
			<span><a href="intro.html">호텔 소개</a></span> <span><a
				href="room.html">객실</a></span> <span><a href="restaurant.html">레스토랑</a></span>
			<span><a href="res.html">예약</a></span> <span><a
				href="res_confirm.html">예약 확인</a></span> <span><a href="qna.html">고객문의</a></span>
			<span><a href="facility.html">편의시설</a></span>
			<span>
            	<c:choose>
					<c:when test="${member != null}"><a href="/logout.do">로그아웃</a></c:when>
					<c:otherwise><a href="/login.do">로그인</a></c:otherwise>
				</c:choose>
            </span>
		</nav>
	</div>

	<div class=contain>
		<div class=left>
				<h2 class=tit>문의 사항</h2>
				<ul class=menu>
					<li class="m1"><a href="qna.html"> <span>자주 하는 질문</span>
					</a></li>
					<li class="m2"><a href="write_qna.html"> <span>문의하기</span>
					</a></li>
				</ul>
		</div>
		<div class=contents>
			<h1>자주 하는 질문</h1>
		</div>
		<div class="finish">
			<p>
				사업자 번호: 110-10-12345<br /> 사업장소재지: 경기도 이천시 마장면 장암리<br /> 대표자: 홍길동<br />
				Copyright ⓒ 2020 Hotel Group. All rights reserved.
			</p>
		</div>
	</div>

</body>
</html>