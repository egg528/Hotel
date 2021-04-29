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
        <title>Reservation Detail</title>
        
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

			function rescancel(reservationCode) {
				var reservationCode = reservationCode;
				var data = {"reservationCode" : reservationCode};
				var confirm_test = confirm("예약을 취소하시겠습니까?");
				if(confirm_test == true) {
					location.href="/reservationCancel?rcode="+reservationCode;
					alert("취소되었습니다.");
					location.href="/admin/reservation.do?rno="+${reservationVo.roomCode};
				}
				else{
				location.href="/admin/reservationDetailAction.do?reservationCode=" + reservationCode;
				}
				
	        }
	        
		</script>

    </head>
<body>
	<%@include file = "/WEB-INF/views/admin/admin_header.jsp" %>

    <div class=contents>
    	<p style="text-align:center;">예약 상세</p>
    	<table class="table table-hover">
    		<thead>
		        <tr>
			        <td>Code</td>
			        <td>User ID</td>
			        <td>Room No</td>
			        <td>People Num</td>
			        <td>Check In</td>
			        <td>Check Out</td>
			        <td>Days</td>
			        <td>Breakfast</td>
			        <td>Reservation Date</td>
		        </tr>
			</thead>
			
			<tr>
			<td>${reservationVo.reservationCode}</td>
			<td><a href="/admin/memberDetail.do?userId=${reservationVo.userId}">${reservationVo.userId}</td>
			<td>${reservationVo.roomCode}</td>
			<td>${reservationVo.reservationPeopleNumber}</td>
			<td>${reservationVo.reservationCheckIn}</td>
			<td>
			<script type="text/javascript">
			document.write(dateAdd('${reservationVo.reservationCheckOut}',1));
			</script>
			</td>
			<td>${reservationVo.reservationDays}</td>
			<td>${reservationVo.breakfast}</td>
			<td>${reservationVo.reservationDate}</td>
			
			</tr>
			
		</table>
		<br><br>
		<p style="text-align:center;">요구사항</p>
		<table class="table table-hover">
			<tr>
				<td>${reservationVo.reservationMemo}</td>
			</tr>
		</table>
		
		<br><br><br>
		
		<p style="text-align:center;">결제 상세</p>
		<table class="table table-hover">
			<thead>
		        <tr>
		        	<td>Total Price</td>
			        <td>Card</td>
			        <td>Card Num</td>
			        <td>Card Valid</td>
			        <td>Mileage</td>
		        </tr>
			</thead>
			
			<tr>
			<td>${reservationVo.totalPrice}</td>
			<td>${reservationVo.card}</td>
			<td>${reservationVo.cardNum}</td>
			<td>${reservationVo.cardValid}</td>
			<td>${reservationVo.mileage}</td>
			</tr>
			
		</table>
		<br>
		<input type="button" value="예약취소" class="submit-btn" onClick="javascript:rescancel('${reservationVo.reservationCode}')">
    </div>

</body>
</html>