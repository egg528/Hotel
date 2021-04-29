<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/style_admin.css" type="text/css">
<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
<title>Staff 01</title>

<script type="text/javascript">
var sessionLevel = '${member.userLevel}';

if(sessionLevel == null || sessionLevel == 'null' || sessionLevel=="" || sessionLevel == "1"){
	alert("관리자 권한이 없습니다.");
	location.href="/main";
}
	
	function update(no) {
		var no = no;
		var con = null;
		var confirm_test = confirm("요청완료 하시겠습니까?");
		  if(confirm_test == true) {
			  confirm = 'Y';
		  }
		var data = {"No" : no,
					"Confirm" : con
		};
		$.ajax({
			type : "POST",
			url : "/staff01/update",
			data : data,
			datatype : 'json',
			success : function(data) {
				var result = data["resultMsg"];
				if(result == "success"){
					location.href="/staff01";
				}
			}
		})
	}

</script>
</head>
<body>
	<div class header>
		<c:choose>
           <c:when test="${member != null}"><a href="/logout.do">로그아웃</a></c:when>
           <c:otherwise><a href="/login.do">로그인</a></c:otherwise>
        </c:choose>
    </div>
	<table align=center><tr><td>
	<div class=contents>
		<br><p style="text-align:center;">Request LIST</p>
		<!-- search{s} -->
	      	<table class="table table-hover">
		<thead>
		<br><br>
		<tr>
			<td>No</td>
			<td>Room No</td>
			<td>Request</td>
			<td>Time</td>
			<td>Confirm</td>
	
			<td></td>
		</tr>
		</thead>
	
		<c:forEach items="${List}" var="item" >
		<tr>
			<td>${item.no}</td>
			<td>${item.roomNo}</td>
			<td>${item.request}</td>
			<td>${item.time}</td>
			<c:choose>
				<c:when test = "${item.confirm == 'N'}">
					<td><input type="button" value="Update" class="submit-btn" onClick="javaScript:update('${item.no}');"></td>
				</c:when>
				<c:otherwise><td>&nbsp;완료</td></c:otherwise>
			</c:choose>
		</tr>
		</c:forEach>
		</table>
	</div>
	</td></tr></table>
</body>
</html>