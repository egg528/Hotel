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
	<link rel="stylesheet" href="/resources/css/style_admin.css" type="text/css">

	<script type="text/javascript">
		function list(page){
			location.href="/admin/qnaList?curPage="+page
		}
	</script>

</head>

<body>
<%@include file = "/WEB-INF/views/admin/admin_header.jsp" %>
<div class=contain>
	<div class=left>
	
	</div>

	<div class=contents>
		<br><p style="text-align:center;">QNA LIST</p><br>
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
					<td><a href = "/admin/qnaview.do?QNACODE=${row.QNACODE}&curPage=${map.pager.curPage}">${row.QNATITLE}</a></td>
					<td><a href="/admin/memberDetail.do?userId=${row.QNAWRITER}">${row.QNAWRITER}</td>
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
	</div>
</div>
</body>
</html>