<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<!DOCTYPE html>
<html>
<head>
        <meta charset="UTF-8">
        <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
        <link rel="stylesheet" href="/resources/css/style_admin.css" type="text/css">
        <style>
            * {
                font-family: 'Noto Sans KR', sans-serif;
            }
        </style>
        <title>Staff Detail</title>
        
         <script type="text/javascript">
			
         	
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
    	<p style="text-align:center;">직원 정보</p>
    	<table class="table table-hover">
	    	<thead>
		        <tr>
			        <td>Staff ID</td>
			        <td>Name</td>
			        <td>Birth</td>
			        <td>Phone</td>
			        <td>Email</td>
			        <td>Gender</td>
			        <td>Address</td>
			        <td>Floor</td>
		        </tr>
	        </thead>
			<tr>
			<td>${staffDetail.staffId}</td>
			<td>${staffDetail.staffName}</td>
			<td>${staffDetail.staffBirth}</td>
			<td>${staffDetail.staffPhone}</td>
			<td>${staffDetail.staffEmail}</td>
			<td>${staffDetail.staffSex}</td>
			<td>${staffDetail.staffAddress}</td>
			<td>${staffDetail.floor}</td>
			</tr>
		</table>
	</div>
</body>
</html>