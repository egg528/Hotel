<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
	<head>

		<style>
			* {
				font-family: 'Noto Sans KR', sans-serif;
			}
		</style>

		<meta charset="UTF-8">
		<link rel="stylesheet" href="/resources/css/style_qna.css" type="text/css">
		<title>QnA Rewrite</title>

		<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
		<script type="text/javascript" src='/resources/js/jquery.form.js'></script>
		<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
		<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/190107/1546836247227/190107.js"></script>

	</head>

<body>
	<%@include file = "/WEB-INF/views/layout/header.jsp" %>
	<div class=contain>
		<div class=left>
			<h2 class=tit>문의 사항</h2>
			<ul class=menu>
				<li class="m1">
					<a href="/qna/list.do">
						<span>게시판</span>
					</a>
				</li>
				<li class="m2">
					<a href="/qna/write.do">
						<span>문의하기</span>
					</a>
				</li>
			</ul>
		</div>

		<div class=contents>
			<h2>게시물 보기</h2>
			<form action="/qna/update.do" method="get">

				<h3 class="tit_">● 작성자 정보</h3>
				<div class="col_one_third">
					<h3 class="join_title">작성자</h3>
					<div class="d_form large">${dto.QNAWRITER}</div>
				</div>

				<div class="col_one_third">
					<h3 class="join_title">작성일자</h3>
					<div class="d_form large">${dto.QNAREGISTERDATE}</div>
				</div>

				<div class="clear"></div>

				<h3 class="tit_">● 문의사항</h3>

				<div class="col_two_third">
					<h3 class="join_title">제목</h3>
					<input class="d_form large" name="QNATITLE" id="QNATITLE"  value = "${dto.QNATITLE}">
				</div>

				<div class="clear"></div>

				<div class="col_full">
					<h3 class="join_title_write">내용</h3>
					<textarea class="d_form large_write" name="QNACONTENT" id="QNACONTENT">${dto.QNACONTENT}</textarea>
				</div>

				<div>
					<input type="hidden" name = "QNACODE" value="${dto.QNACODE}">
					<button type ="submit" class="btn_sbm"m id = "btnUpdate" onclick="location.href='/qna/update.do?QNACODE=${dto.QNACODE}'">수정</button>
					<button type ="button" class="btn_sbm" id = "btnDelete" onclick="location.href='/qna/delete.do?QNACODE=${dto.QNACODE}'">삭제</button>
					<button type ="button" class="btn_sbm" id = "btnList" onclick="location.href='/qna/list.do'">목록</button>
				</div>

			</form>
		</div>
	</div>
</body>
</html>