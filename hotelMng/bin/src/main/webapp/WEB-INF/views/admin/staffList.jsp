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
	
	  }

	  function memberDetail(id) {
		var UserId = id;
		location.href="/admin/memberDetail.do?userId=" + id;
	  }
  </script>

		<script>
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
			<p style="text-align:center;">Staff LIST</p>
			<!-- search{s} -->
			<div class="form-group row justify-content-center">
				<div class="w100" style="text-align: center">
					<select class="form-control form-control-sm" name="searchType" id="searchType">
						<option value="ManagerName">이름</option>
						<option value="ManagerCode">code</option>
					</select>
					<input type="text" class="form-control form-control-sm" name="keyword" id="keyword">
					<button class="btn btn-sm btn-primary" name="btnSearch" id="btnSearch">검색</button>
				</div>
				<br>

			</div>
			<!-- search{e} -->
        	<table class="table table-hover">
			<thead>
			<tr>
				<td>No</td>
				<td>Staff ID</td>
				<td>Staff Name</td>
				<td>Gender</td>
				<td>Enter Date</td>
				<td></td>
			</tr>
			</thead>

			<c:forEach items="${staffList}" var="item" varStatus="idx">
			<tr>
				<td>${idx.index+1}</td>
				<td>${item.managerCode}</td>
				<td>${item.managerName}</td>
				<td>${item.managerSex}</td>
				<td>${item.managerEnterDate}</td>
				<td>
				</td>
			</tr>
			</c:forEach>
		</table>
        </div>
    <!-- pagination{e} -->

</body>

</html>