<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
		<link rel="stylesheet" href="/resources/css/style_admin.css" type="text/css">
        <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
        <style>
            * {
                font-family: 'Noto Sans KR', sans-serif;
            }
        </style>
        <title>Reservation List</title>
        
        
  <script type="text/javascript">

  		function list(page){
			location.href="/admin/reservationList?curPage="+page
		}
		
		var sessionLevel = '${member.userLevel}';
		
		if(sessionLevel == null || sessionLevel == 'null' || sessionLevel=="" || sessionLevel == "1"){
			alert("관리자 권한이 없습니다.");
			location.href="/main";
		}
	</script>

    </head>
    <body>
        <%@include file = "/WEB-INF/views/admin/admin_header.jsp" %>

        <div class=contents>
			<br><p style="text-align:center;">RESERVATION LIST</p>
			<!-- search{s} -->
			<!-- search{e} -->
			<br>
        	<table class="table table-hover">
			<thead>
				<tr>
					<td>No</td>
					<td>Room Code</td>
					<td>USER ID</td>
					<td>Reservation Check IN</td>
					<td>Reservation Check OUT</td>
					<td>People Num</td>
					<td>Reservation Date</td>
				</tr>
			</thead>

			<c:forEach items="${list}" var="item" varStatus="idx">
			<tr>
				<td>${item.reservationCode}</td>
				<td><a href="/admin/roomDetail.do?rno=${item.roomCode}">${item.roomCode}</td>
				<td><a href="/admin/memberDetail.do?userId=${item.userId}">${item.userId}</td>
				<td>${item.reservationCheckIn}</td>
				<td>${item.reservationCheckOut}</td>
				<td>${item.reservationPeopleNumber}</td>
				<td>${item.reservationDate}</td>
			</tr>
			</c:forEach>
			
			<tr>
				<td colspan="7" align="center">
					<c:if test="${pager.curBlock > 1}">
						<a href="javascript:list('1')">[처음]</a>
					</c:if>
					<c:if test = "${pager.curBlock > 1}">
						<a href= "javascript:list('${pager.blockBegin}')">[이전]</a>
					</c:if>

					<c:forEach var="num" begin="${pager.blockBegin}" end="${pager.blockEnd}">
						<c:choose>
							<c:when test="${num==pager.curPage}">
								<span style="color:red;">${num}</span>&nbsp;
							</c:when>
							<c:otherwise>
								<a href="javascript:list('${num}')">${num}</a>&nbsp;
							</c:otherwise>
						</c:choose>
					</c:forEach>
					<c:if test="${pager.curBlock <= pager.totBlock}">
						<a href="javascript:list('${pager.nextPage}')">[다음]</a>
					</c:if>
					<c:if test="${pager.curPage <= pager.totPage}">
						<a href="javascript:list('${pager.totPage}')">[끝]</a>
					</c:if>
				</td>
			</tr>
		</table>
        </div>
    <!-- pagination{e} -->

</body>

</html>