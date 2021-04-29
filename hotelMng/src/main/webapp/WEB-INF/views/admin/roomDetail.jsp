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
        <title>Room Detail</title>
        
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
    	<p style="text-align:center;">객실 상세</p>
    	<table class="table table-hover">
    		<thead>
		        <tr>
			        <td>Room No</td>
			        <td>Room Type</td>
			        <td>Bed Type</td>
			        <td>Max People</td>
			        <td>Room View</td>
			        <td>Composition</td>
			        <td>Things</td>
			        <td>Fee</td>
			        <td>Manager</td>
		        </tr>
			</thead>
			<tr>
			<td>${roomDetail.roomNo}</td>
			<td>${roomDetail.roomType}</td>
			<td>${roomDetail.bedType}</td>
			<td>${roomDetail.roomMaxPeople}</td>
			<td>${roomDetail.roomView}</td>
			<td>${roomDetail.composition}</td>
			<td>${roomDetail.things}</td>
			<td>${roomDetail.fee}</td>
			<td><a href="/admin/staffDetail.do?staff=${roomDetail.staffId}">${roomDetail.staffId}</a></td>
			</tr>
			
		</table>
		
		
    </div>

</body>
</html>