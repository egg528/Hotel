<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
        <style>
            * {
                font-family: 'Noto Sans KR', sans-serif;
            }
            body {
                margin-left:auto;
                margin-right: auto;
                padding:0px;
                background-color: white;
                font-family:나눔고딕;
            }
            a {
                color:#111111;
            }
            a { text-decoration:none } 
            .header{
                margin-left:auto;
                margin-right: auto;
                background-color: #D4C1A1;
                position: fixed;
                top: 0;
                left: 0;
                right: 0;
                height: 50px;
                text-align: center;
                padding: 8px;
                color: #111111;
                font-size: 5px;
                display: flex;
                justify-content: space-between;
                align-items: center;
            }
            .header nav {
                list-style-type: none;
                text-align: center;
                margin: 0;
                padding: 0;
            }
            .header nav span {
                display:inline-block;
                font-size: 15px;
                padding: 20px;
            }
            .banner{
                background-image: url("/resources/image/oria-hotel-4636405_1280.jpg");
                background-size: cover;
                margin-top: auto;
                width: auto;
                height: 700px;
            }
            
            .contents{
                width: 1200px;
                margin-left:auto;
                margin-right: auto;
                min-height: 500px;
                padding: 50px;
                background-color: white;
                font-size: 18px;
                color: #333333
            }
            .finish {
                width: 1200px;
                margin-left:auto;
                margin-right: auto;
                padding: 50px;
                background-color: white;
                font-size: 18px;
                color: #333333
            }

        </style>       
	<style TYPE="text/css">
		body {
		scrollbar-face-color: #F6F6F6;
		scrollbar-highlight-color: #bbbbbb;
		scrollbar-3dlight-color: #FFFFFF;
		scrollbar-shadow-color: #bbbbbb;
		scrollbar-darkshadow-color: #FFFFFF;
		scrollbar-track-color: #FFFFFF;
		scrollbar-arrow-color: #bbbbbb;
		margin-left:"0px"; margin-right:"0px"; margin-top:"0px"; margin-bottom:"0px";
		}

		td {font-family: "돋움"; font-size: 9pt; color:#595959;}
		th {font-family: "돋움"; font-size: 9pt; color:#000000;}
		select {font-family: "돋움"; font-size: 9pt; color:#595959;}


		.divDotText {
		overflow:hidden;
		text-overflow:ellipsis;
		}

		A:link { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
		A:visited { font-size:9pt; font-family:"돋움";color:#000000; text-decoration:none; }
		A:active { font-size:9pt; font-family:"돋움";color:red; text-decoration:none; }
		A:hover { font-size:9pt; font-family:"돋움";color:red;text-decoration:none;}
		.day{
			width:100px; 
			height:30px;
			font-weight: bold;
			font-size:15px;
			font-weight:bold;
			text-align: center;
		}
		.sat{
			color:#529dbc;
		}
		.sun{
			color:red;
		}
		.today_button_div{
			float: right;
		}
		.today_button{
			width: 100px; 
			height:30px;
		}
		.calendar{
			width:80%;
			margin:auto;
		}
		.navigation{
			margin-top:100px;
			margin-bottom:30px;
			text-align: center;
			font-size: 25px;
			vertical-align: middle;
		}
		.calendar_body{
			width:100%;
			background-color: #FFFFFF;
			border:1px solid white;
			margin-bottom: 50px;
			border-collapse: collapse;
		}
		.calendar_body .today{
			border:1px solid white;
			height:120px;
			background-color:#c9c9c9;
			text-align: left;
			vertical-align: top;
		}
		.calendar_body .date{
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		.calendar_body .sat_day{
			border:1px solid white;
			height:120px;
			background-color:#EFEFEF;
			text-align:left;
			vertical-align: top;
		}
		.calendar_body .sat_day .sat{
			color: #529dbc; 
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		.calendar_body .sun_day{
			border:1px solid white;
			height:120px;
			background-color:#EFEFEF;
			text-align: left;
			vertical-align: top;
		}
		.calendar_body .sun_day .sun{
			color: red; 
			font-weight: bold;
			font-size: 15px;
			padding-left: 3px;
			padding-top: 3px;
		}
		.calendar_body .normal_day{
			border:1px solid white;
			height:120px;
			background-color:#EFEFEF;
			vertical-align: top;
			text-align: left;
		}
		.before_after_month{
			margin: 10px;
			font-weight: bold;
		}
		.before_after_year{
			font-weight: bold;
		}
		.this_month{
			margin: 10px;
		}
	</style>
        
        
        <title>Reservation View</title>
        
  <script type="text/javascript">
  var sessionUserId = '${member.userId}';
  var sessionLevel = '${member.userLevel}';
  if(sessionUserId == null || sessionUserId == 'null' || sessionUserId=="" || sessionUserId == "1"){
		alert("로그인 후 이용해주세요.");
		location.href="/login/login";
  }

function reservation(roomNo, resdate) {
	var reservationRoom = roomNo;
	var reservationDate = resdate;

	var data = {"roomNo" : reservationRoom,
				"resdate" : reservationDate
	};

	var confirm_test = confirm("예약하시겠습니까?");
	
	if(confirm_test == true) {
		location.href="/admin/reservate.do?roomNo=${roomNo}&resdate="+reservationDate;
	}
/* 
	$.ajax({
		type : "POST",
		url : "/admin/reservationCheck.do",
		data : data,
		datatype : 'json',
		success : function(data) {
			var result = data["resultMsg"];
			if(result == 0){
				var confirm_test = confirm("예약하시겠습니까?");
		
				if(confirm_test == true) {
					location.href="/admin/reservate.do?roomNo=${roomNo}&resdate="+reservationDate;
				}
			} else {
				alert("이미 예약되어 있는 방입니다.");
			}
		}

	})
 */	  
}

function detail(reservationCode) {
	location.href="/admin/reservationDetailAction.do?reservationCode=" + reservationCode;
}

  </script>

</head>
    <body>
        <div class=header>
 
        </div>
        <!-- 달력 -->
		  <form name="calendarFrm" id="calendarFrm" action="" method="GET">
		
		<div class="calendar" >
		
			<!--날짜 네비게이션  -->
			<div class="navigation">
				<a class="before_after_year" href="/admin/reservation.do?rno=${roomNo}&year=${today_info.search_year-1}&month=${today_info.search_month-1}">
					&lt;&lt;
				<!-- 이전해 -->
				</a> 
				<a class="before_after_month" href="/admin/reservation.do?rno=${roomNo}&year=${today_info.before_year}&month=${today_info.before_month}">
					&lt;
				<!-- 이전달 -->
				</a> 
				<span class="this_month">
					&nbsp;${today_info.search_year}. 
					<c:if test="${today_info.search_month<10}">0</c:if>${today_info.search_month}
				</span>
				<a class="before_after_month" href="/admin/reservation.do?rno=${roomNo}&year=${today_info.after_year}&month=${today_info.after_month}">
				<!-- 다음달 -->
					&gt;
				</a> 
				<a class="before_after_year" href="/admin/reservation.do?rno=${roomNo}&year=${today_info.search_year+1}&month=${today_info.search_month-1}">
					<!-- 다음해 -->
					&gt;&gt;
				</a>
			</div>
		
		<!-- <div class="today_button_div"> -->
		<!-- <input type="button" class="today_button" onclick="javascript:location.href='/admin/reservation.do'" value="go today"/> -->
		<!-- </div> -->
		<table class="calendar_body">
		
		<thead>
			<tr bgcolor="#CECECE">
				<td class="day sun" >
					일
				</td>
				<td class="day" >
					월
				</td>
				<td class="day" >
					화
				</td>
				<td class="day" >
					수
				</td>
				<td class="day" >
					목
				</td>
				<td class="day" >
					금
				</td>
				<td class="day sat" >
					토
				</td>
			</tr>
		</thead>
		<tbody>
			<tr>
				<c:forEach var="dateList" items="${dateList}" varStatus="date_status"> 
				<fmt:formatNumber var="Listdate" minIntegerDigits="2" value="${dateList.date}"/>
				<c:set var="curDate" value="${dateList.year}${dateList.month+1}${Listdate}" />
				
				<c:set var="chkDate" value="0"/>
				<c:set var="chkblank" value="0"/>
					<c:choose>
						<c:when test="${dateList.value=='today'}">
						<c:if  test="${date_status.index%7==0}">			
			</tr>
			<tr>
						</c:if>
							<td class="today">
								<div class="date">
									${dateList.date}<br><br><br>
									<c:forEach var="item" items="${reservationList}" varStatus="idx">										
										<c:choose>
										<c:when test="${curDate ge item.reservationCheckIn}">
											<c:if test="${curDate le item.reservationCheckOut}">
												<c:out value="${item.userId}"/><br>
												<c:set var="chkDate" value="1"/>
												<c:set var="reservationCode" value="${item.reservationCode}"/>
											</c:if>
										</c:when>
										<c:when test="${curDate eq '1'}">
											<c:set var="chkblank" value="1"/>
										</c:when>									
										</c:choose>
									</c:forEach>
									<c:choose>
									<c:when test="${chkblank eq '1'}">										
									</c:when>
									<c:when test="${chkDate eq '1'}">
										<p><a href="javaScript:detail('${reservationCode}');">예약완료</a></p> <br>
									</c:when>									
										<c:otherwise><input type="button" value="예약" class="submit-btn" onClick="javaScript:reservation('${roomNo}','${curDate}');">
										</c:otherwise>
									</c:choose>	
								</div>
								<div>
								</div>
							</td>
						</c:when>
						<c:when test="${date_status.index%7==6}">
							<td class="sat_day">
								<div class="sat">
									${dateList.date}<br><br><br>
									
									<c:forEach var="item" items="${reservationList}" varStatus="idx">											
										<c:choose>
										<c:when test="${curDate ge item.reservationCheckIn}">
											<c:if test="${curDate le item.reservationCheckOut}">
												<c:out value="${item.userId}"/><br>
												<c:set var="chkDate" value="1"/>
												<c:set var="reservationCode" value="${item.reservationCode}"/>
											</c:if>
										</c:when>
										<c:when test="${curDate eq '1'}">
											<c:set var="chkblank" value="1"/>
										</c:when>									
										</c:choose>
									</c:forEach>
									<c:choose>
									<c:when test="${chkblank eq '1'}">										
									</c:when>
									<c:when test="${chkDate eq '1'}">
										<p><a href="javaScript:detail('${reservationCode}');">예약완료</a></p> <br>
									</c:when>									
										<c:otherwise><input type="button" value="예약" class="submit-btn" onClick="javaScript:reservation('${roomNo}','${curDate}');">
										</c:otherwise>
									</c:choose>									
								</div>
								<div>
								</div>
							</td>
						</c:when>
						<c:when test="${date_status.index%7==0}">
			</tr>
			<tr>	
				<td class="sun_day">
					<div class="sun">
						${dateList.date}<br><br><br>
									<c:forEach var="item" items="${reservationList}" varStatus="idx">									
										<c:choose>
										<c:when test="${curDate ge item.reservationCheckIn}">
											<c:if test="${curDate le item.reservationCheckOut}">
												<c:out value="${item.userId}"/><br>
												<c:set var="chkDate" value="1"/>
												<c:set var="reservationCode" value="${item.reservationCode}"/>
											</c:if>
										</c:when>
										<c:when test="${curDate eq '1'}">
											<c:set var="chkblank" value="1"/>
										</c:when>									
										</c:choose>
									</c:forEach>
									<c:choose>
									<c:when test="${chkblank eq '1'}">										
									</c:when>
									<c:when test="${chkDate eq '1'}">
										<p><a href="javaScript:detail('${reservationCode}');">예약완료</a></p> <br>
									</c:when>									
										<c:otherwise><input type="button" value="예약" class="submit-btn" onClick="javaScript:reservation('${roomNo}','${curDate}');">
										</c:otherwise>
									</c:choose>	
					</div>
					<div>
					</div>
				</td>
						</c:when>
						<c:otherwise>
				<td class="normal_day">
					<div class="date">
						${dateList.date}<br><br><br>
									<c:forEach var="item" items="${reservationList}" varStatus="idx">										
										<c:choose>
										<c:when test="${curDate ge item.reservationCheckIn}">
											<c:if test="${curDate le item.reservationCheckOut}">
												<c:out value="${item.userId}"/><br>
												<c:set var="chkDate" value="1"/>
												<c:set var="reservationCode" value="${item.reservationCode}"/>
											</c:if>
										</c:when>
										<c:when test="${curDate eq '1'}">
											<c:set var="chkblank" value="1"/>
										</c:when>									
										</c:choose>
									</c:forEach>
									<c:choose>
									<c:when test="${chkblank eq '1'}">										
									</c:when>
									<c:when test="${chkDate eq '1'}">
										<p><a href="javaScript:detail('${reservationCode}');">예약완료</a></p> <br>
									</c:when>									
										<c:otherwise><input type="button" value="예약" class="submit-btn" onClick="javaScript:reservation('${roomNo}','${curDate}');"></c:otherwise>
									</c:choose>	
					</div>
					<div>
					
					</div>
				</td>
						</c:otherwise>
					</c:choose>
				</c:forEach>
		</tbody>
		
		</table>
		</div>
		</form> 
		<!-- 달력 -->     
    </body>
</html>