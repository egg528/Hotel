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
        <title>Member Detail</title>
        
         <script type="text/javascript">
			
         	
	       	var sessionLevel = '${member.userLevel}';
	
			if(sessionLevel == null || sessionLevel == 'null' || sessionLevel=="" || sessionLevel == "1"){
				alert("관리자 권한이 없습니다.");
				location.href="/main";
			}

			function dateAdd(sDate, nNum) {
	    		var yyyy = parseInt(sDate.substr(0, 4), 10);
	    		var mm = parseInt(sDate.substr(4, 2), 10) - 1;
	    		var dd = parseInt(sDate.substr(6, 2), 10);

	    		nNum *= 1;
	    		nNum = nNum;
	    		var newDt = new Date(yyyy,mm,dd);
	    		newDt.setDate( newDt.getDate() + nNum );
	    	    var year = newDt.getFullYear();
	    	    var month = newDt.getMonth()+1;
	    	    var day = newDt.getDate();
	    	    if(month < 10){
	    	        month = "0"+month;
	    	    }
	    	    if(day < 10){
	    	        day = "0"+day;
	    	    }
	    	 
	    	    var today = year+""+month+""+day;
				return today;
	        } 

	        function memberDelete(userId) {
				var UserId = userId;
				var confirm_test = confirm("회원을 삭제하시겠습니까?");
				if(confirm_test == true) {
					location.href="/admin/memberDelete?userId=${memberDetail.userId}";
					alert("삭제되었습니다.");
					location.href="/admin/memberList";
				}
				else{
				location.href="/admin/memberDetail.do?userId=${memberDetail.userId}";
				}
		    }
	        
		</script>

    </head>
<body>
	<%@include file = "/WEB-INF/views/admin/admin_header.jsp" %>
    <div class=contents>
    	<p style="text-align:center;">회원 정보</p>
    	<table class="table table-hover">
	    	<thead>
		        <tr>
			        <td>User ID</td>
			        <td>User Name</td>
			        <td>Grade</td>
			        <td>Phone Num</td>
			        <td>Email</td>
			        <td>Mileage</td>
			        <td>Birth</td>
		        </tr>
	        </thead>
			<tr>
			<td>${memberDetail.userId}</td>
			<td>${memberDetail.userName}</td>
			<td>${memberDetail.userGrade}</td>
			<td>${memberDetail.userPhone}</td>
			<td>${memberDetail.userEmail}</td>
			<td>${memberDetail.userMile}</td>
			<td>${memberDetail.userBirth}</td>
			</tr>
		</table>
		<br>
		<input type="button" value="회원삭제" class="submit-btn" onClick="javaScript:memberDelete('${memberDetail.userId}')">
		<br><br>
		<p style="text-align:center;">예약 정보</p>
		<table class="table table-hover">
			<thead>
		        <tr>
		        	<td>Reservation Code</td>
			        <td>CheckIn</td>
			        <td>CheckOut</td>
			        <td>PeopleNum</td>
			        <td>Days</td>
			        <td>Breakfast</td>
			        <td>Total Price</td>
			        <td>Memo</td>
		        </tr>
	        </thead>
	        
			<c:forEach items="${resDetail}" var="item" varStatus="idx">
			<tr>
			<td><a href="/admin/reservationDetailAction.do?reservationCode=${item.reservationCode}";>${item.reservationCode}</td>
			<td>${item.reservationCheckIn}</td>
			<td>${item.reservationCheckOut}</td>
			<td>${item.reservationPeopleNumber}</td>
			<td>${item.reservationDays}</td>
			<td>${item.breakfast}</td>
			<td>${item.totalPrice}</td>
			<td>${item.reservationMemo}</td>
			</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>