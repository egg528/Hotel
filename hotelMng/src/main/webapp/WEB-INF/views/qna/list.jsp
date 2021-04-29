<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<style>
		* {
			font-family: 'Noto Sans KR', sans-serif;
		}
		body {
			background-color: #EEEFF1;
		}
	</style>
	<meta charset="UTF-8">
	<title>QnA list</title>
	<link rel="stylesheet" href="/resources/css/style_qna.css" type="text/css">

	<script type="text/javascript">
		function list(page){
			location.href="/qna/list.do?curPage="+page
		}
	</script>

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
		<h1>게시판</h1>
		<%-- ${map.count}개의 문의사항이 있습니다. --%>
		<table class="table table-hover">
			<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>이름</th>
				<th>날짜</th>
				<th>조회수</th>
			</tr>
			</thead>

			<c:forEach var="row" items="${map.list}">
				<tr>
					<td>${row.QNACODE}</td>
					<td><a href = "/qna/view.do?QNACODE=${row.QNACODE}&curPage=${map.pager.curPage}">${row.QNATITLE}</a></td>
					<td>${row.QNAWRITER}</td>
					<td>${row.QNAREGISTERDATE}</td>
					<td>${row.QNAVIEWCOUNT}</td>
				</tr>
			</c:forEach>

			<!-- 페이지 네비게이션 -->
			<tr>
				<td colspan="5" align="center">
					<c:if test="${map.pager.curBlock > 1}">
						<a href="javascript:list('1')">[처음]</a>
					</c:if>
					<c:if test = "${map.pager.curBlock > 1}">
						<a href= "javascript:list('${map.pager.blockBegin}')">[이전]</a>
					</c:if>

					<c:forEach var="num" begin="${map.pager.blockBegin}" end="${map.pager.blockEnd}">
						<c:choose>
							<c:when test="${num==map.pager.curPage}">
								<span style="color:red;">${num}</span>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="javascript:list('${num}')">${num}</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${map.pager.curBlock <= map.pager.totBlock}">
						<a href="javascript:list('${map.pager.nextPage}')">[다음]</a>
					</c:if>
					<c:if test="${map.pager.curPage <= map.pager.totPage}">
						<a href="javascript:list('${map.pager.totPage}')">[끝]</a>
					</c:if>
				</td>
			</tr>

		</table>
		<button type="button" id="btnWrite" onclick="location.href='/qna/write.do'">글쓰기</button>
	</div>
	<%@include file = "/WEB-INF/views/layout/final.jsp" %>
</div>
</body>
</html>