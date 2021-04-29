<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/resources/css/style_mypage.css" type="text/css">
    <title>My Reservation</title>
    
    <script type="text/javascript">
	    var sessionUserId = '${member.userId}';
	    if(sessionUserId == null || sessionUserId == 'null' || sessionUserId=="" || sessionUserId == "1"){
	      alert("로그인 후 이용해주세요.");
	      location.href="/login.do";
	    }
    
    	function rescancel(reservationCode) {
    		var reservationCode = reservationCode;
			var data = {"reservationCode" : reservationCode};
			var confirm_test = confirm("예약을 취소하시겠습니까?");
			if(confirm_test == true) {
				location.href="/reservationCancel?rcode="+reservationCode;
				alert("취소되었습니다.");
			}
			location.href="/mypage/reservation";
			
        }
        
    	function dateAdd(sDate, nNum) {
    		var yyyy = parseInt(sDate.substr(0, 4), 10);
    		var mm = parseInt(sDate.substr(4, 2), 10) - 1;
    		var dd = parseInt(sDate.substr(6, 2), 10);

    		nNum *= 1;
    		nNum = nNum -1;
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
    </script>

  </head>

<body>
  <%@include file = "/WEB-INF/views/layout/header.jsp" %>

  <div class=contain>
    <div class=left>
          <h2 class=tit>마이 페이지</h2>
            <ul class=menu>
          	  <li class="m1">
                <a href="/mypage/memberinfo">
                  <span>개인 정보</span>
                </a>
              </li>
              <li class="m2">
                <a href="/mypage/reservation">
                  <span>예약 확인/취소</span>
                </a>
              </li>
              <li class="m3">
                <a href="/mypage/mylist">
                  <span>문의 내역</span>
                </a>
              </li>
	          <li class="m4">
	            <a href="/mypage/myreward">
	            	<span>Lucid 리워즈</span>
	            </a>
	          </li>
          </ul>
    </div>
    <div class=contents>
      <h1>예약 확인/취소</h1>
      <h5>*당일 취소 불가</h5>
      <table class="table table-hover">
       	<thead>
      	<tr>
      	<td>No</td>
      	<td>체크인</td>
      	<td>체크아웃</td>
      	<td>숙박일 수</td>
      	<td>예약 날짜</td>
      	<td>예약 호실</td>
      	<td>조식 여부</td>
      	<td>결제 금액</td>
      	<td></td>
      	</tr>
      	</thead>
      	<c:forEach items="${reservation}" var="item" varStatus="idx"> 
      	<tr>
      		<td>${idx.index+1}</td>
      		<td>${item.reservationCheckIn}</td>
      		<td>
			<script type="text/javascript">
			document.write(dateAdd('${item.reservationCheckOut}',2));
			</script>
			</td>
      		<td>${item.reservationDays}</td>
      		<td>${item.reservationDate}</td>
      		<td>${item.roomCode}</td>
      		<td>${item.breakfast}</td>
      		<td>${item.totalPrice}</td>
			<c:set var="now" value="<%=new java.util.Date()%>" />
			<c:set var="today"><fmt:formatDate value="${now}" pattern="yyyyMMdd" /></c:set> 
      		<c:set var="CheckIn" value="${item.reservationCheckIn}"/>
      		<c:if test="${CheckIn > today}">
      			<td><input type="button" value="예약취소" class="submit-btn" onClick="javascript:rescancel('${item.reservationCode}')"></td>
			</c:if>
			<c:if test="${CheckIn <= today}">
      			<td><input type="button" value="취소불가" class="submit-btn" onClick="javascript:alert('당일 취소는 불가합니다!')"></td>
			</c:if>
      	</tr>
      	</c:forEach>
      </table>
    </div>
    <%@include file = "/WEB-INF/views/layout/final.jsp" %>
  </div>

</body>
</html>