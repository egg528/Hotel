<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<style>
 * {
    font-family: 'Noto Sans KR', sans-serif;
   }
</style>

<meta charset="utf-8">
<link rel="stylesheet" href="/resources/css/styleintro.css" type="text/css">
<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">


<title>Hotel Lucid Introduction</title>

</head>

<body>
	<%@include file = "/WEB-INF/views/layout/header.jsp" %>

	<div class=contain>
		<div class=left>
			<h2 class=tit>호텔 소개</h2>
			<ul class=menu>
				<li class="m1"><a href="/intro.do"> <span>그룹 루시드</span>
				</a></li>
				<li class="m2"><a href="/intro_hotel.do"> <span>호텔 루시드</span>
				</a></li>
			</ul>
		</div>

		<div class=contents>
			<h2 id=gaeyo>Group Lucid</h2>
			<img src="/resources/image/hotel.jpg" width=650px height=400>
			<h3>
				<b>루시드 GROUP AFFILIATE</b>
			</h3>
			<p>
				호텔 루시드는 수많은 국빈의 방문과 국제행사를 치러내며 ‘루시드 그룹을 대표하는 얼굴’, ‘한국을 대표하는 호텔’<br>로서
				자부심과 책임감을 가지고 우리나라 서비스 산업의 견인차 역할을 해오고 있습니다.<br> 호텔 루시드는 천년
				역사와 함께 가장 찬란한 문화예술의 꽃을 피웠던 신라 왕조의 이름에서 유래하였으며,<br> 홍길동 회장의 뜻에
				따라 2000년 0월 개관하였습니다.<br> <br>
			</p>
			<h3>
				<b>THE BEST HOSPITALITY COMPANY</b>
			</h3>
			<p>
				호텔 루시드는 ‘최고의 호스피탈리티 기업’을 목표로 오랜 세월동안 품위와 전통을 유지하며<br> 고객들의
				마음을 사로잡아 왔습니다.<br> <br>
			</p>
			<h3>
				<b>VISION</b>
			</h3>
			<p>
				최고의 품격과 신뢰를 바탕으로 고객이 꿈꾸는 라이프스타일을 제공하는 글로벌 선도기업<br> <br>
			</p>
			<h3>
				<b>MISSION</b>
			</h3>
			<p>
				우리는 최고의 라이프스타일 전문가로서 더 많은 인류에게 품격과 자부심을 경험케 한다.<br> <br>
			</p>
		</div>
		<%@include file = "/WEB-INF/views/layout/final.jsp" %>
	</div>
</body>
</html>