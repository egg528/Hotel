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
        <title>Staff List</title>
        
        
  <script type="text/javascript">
			
	var sessionLevel = '${member.userLevel}';
	
	if(sessionLevel == null || sessionLevel == 'null' || sessionLevel=="" || sessionLevel == "1"){
		alert("관리자 권한이 없습니다.");
		location.href="/main";
	}
	

	  function memberDetail(id) {
		var UserId = id;
		location.href="/admin/memberDetail.do?userId=" + id;
	  }
  
		$(document).on('click', '#btnSearch', function(e){
			e.preventDefault();
	
			var url = "${pageContext.request.contextPath}/board/getBoardList";
	
			url = url + "?searchType=" + $('#searchType').val();
	
			url = url + "&keyword=" + $('#keyword').val();
	
			location.href = url;
	
			console.log(url);
		});
	</script>
  
  
    </head>
    <body>
        <%@include file = "/WEB-INF/views/admin/admin_header.jsp" %>

        <div class=contents>
			<br><p style="text-align:center;">STAFF LIST</p>
			<!-- search{s} -->
			<!-- search{e} -->
			<br>
        	<table class="table table-hover">
			<thead>
			<tr>
				<td>No</td>
				<td>Staff ID</td>
				<td>Staff Name</td>
				<td>Birth</td>
				<td>phone</td>
				<td>Email</td>
				<td>Gender</td>
				<td>Address</td>
				<td>Floor</td>
				<td></td>
			</tr>
			</thead>

			<c:forEach items="${staffList}" var="item" varStatus="idx">
			<tr>
				<td>${idx.index+1}</td>
				<td>${item.staffId}</td>
				<td>${item.staffName}</td>
				<td>${item.staffBirth}</td>
				<td>${fn:substring(item.staffPhone,0,3)} - ${fn:substring(item.staffPhone,3, 7)} - ${fn:substring(item.staffPhone,7,11)}</td>
				<td>${item.staffEmail}</td>
				<td>${item.staffSex}</td>
				<td>${item.staffAddress}</td>
				<td>${item.floor}</td>
				<td>
				</td>
			</tr>
			</c:forEach>
		</table>
        </div>
    <!-- pagination{e} -->

</body>

</html>