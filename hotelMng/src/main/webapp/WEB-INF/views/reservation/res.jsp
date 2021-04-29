<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
        <link rel="stylesheet" href="https://code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
        <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
        <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
        <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
        <title>Reservation STEP1</title>
        <style>
          body {
			  background-color: #fbfcf5;
		  }
          .res_content{
          display: inline-block;
          text-align: center;
          margin-left:120px;
          }
          .res_content2{
          margin-top: 50px;
          margin:0 auto;
          }
          button{
            cursor: pointer;
          }
          table{
            border-collapse: collapse;
          }
          #res2_tit{
            font-size: 20px;
            text-align: center;
          }
          .hang{
            border-top: 2px solid #f1f1f1;
            border-bottom: 2px solid #f1f1f1;
          }
          .hang td{
            width:200px;
            padding-top:30px;
            padding-bottom:20px;
            padding-left: 40px;
          }
          .empty{
            border-top: 2px solid #f1f1f1;
            border-bottom: 2px solid #f1f1f1;
          }
          .empty td{
            width:960px;
            padding-top:30px;
            padding-bottom:20px;
          }
          .res_romm b{
            font-size: 22px;
          }
          .res_search{
            margin-top: 50px;
            border-top:30pt solid  #D4C1A1;
            width:90%;
            border-radius:10px;
            border-bottom:6pt solid #f1f1f1;
            margin:0 auto;
          }
          .res_res{
            display: inline-block;
            text-align: center;
          }
          .res_table td{
            text-align:center;
          }
          #error {
            margin-top: 9px;
            font-size: 12px;
            color: red;
            display: none;
          }
          #hye_click{
            font-size: 15px;
            color:#D4C1A1;
            cursor: pointer;
          }
          #hidden_hye{
            display: none;
          }
          #hidden_ho1{
            display:none;
          }
          #hidden_ho2{
            display:none;
          }
          #hidden_ho3{
            display:none;
          }
          #hidden_ho4{
            display:none;
          }
          .hidden_ho p{
            margin-left:10px;
            text-align: left;
          }
          .hidden_ho button{
            margin-bottom: 13px;
            margin-left:10px;
          }
          #hidden_hye p{
            font-size:9px;
            color:#D4C1A1;
          }
          #count{
            border-style:none;
            padding-left: 9px;
            width:20px;
          }
          #minus{
            margin-left:50px;
            margin-right:7px;
            border-style:none;
            border-radius:3px;
            width:20px;
            height:20px;
            background-color: #D4C1A1;
          }
          #pl_m{
            margin-left:7px;
            margin-right:7px;
            border-style:none;
            border-radius:3px;
            width:20px;
            height:20px;
            background-color: #D4C1A1;
          }
          #test{
            background-color: #D4C1A1;
          }
          #reservationCheckIn{
            margin-left:30px;
            border-style:none;
            width:80px;
          }
          #res_checkout{
            margin-left:40px;
            border-style:none;
            width:80px;
          }
          #res_tit{
            font-size:30px;
            margin-top: 200px;
            margin-bottom:70px;
            font-weight: 10;
            text-align: center;
          }
          #res_btn{
            margin-left:70px;
            border-style:none;
            height:55px;
            width:70px;
            border-radius:5px;
            background-color: #D4C1A1;
          }
          .resroom_btn{
            width:100px;
            height:80px;
            border-style:none;
            border-radius:7px;
            background-color: #D4C1A1;
          }
          .resroom_btn_small{
			  width:100px;
			  height:40px;
			  border-style:none;
			  border-radius:7px;
			  background-color: #D4C1A1;
		  }
          #res_btn3{
            border-style:none;
            border-radius:5px;
          }
        </style>
        <script type="text/javascript">

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

         function searchRoom(room) {
           var SearchRoom = room;
           var SearchFrom = $('#reservationCheckIn').val();
           var SearchTo = $('#res_checkout').val();
           if(SearchFrom >= SearchTo){
             alert("체크아웃을 확인하세요.");
             return;
           }
         	SearchFrom = SearchFrom.substr(0,4) + SearchFrom.substr(5,2) + SearchFrom.substr(8,2);
         	SearchTo = SearchTo.substr(0,4) + SearchTo.substr(5,2) + SearchTo.substr(8,2);
         	SearchTo = dateAdd(SearchTo, 0);

         	location.href="/searchRoomAction.do?searchFrom="+SearchFrom+"&searchTo="+SearchTo+"&searchRoom="+SearchRoom;
       	}

        $(function() {
            //모든 datepicker에 대한 공통 옵션 설정
            $.datepicker.setDefaults({
                dateFormat: 'yy-mm-dd' //Input Display Format 변경
                ,showOtherMonths: true //빈 공간에 현재월의 앞뒤월의 날짜를 표시
                ,showMonthAfterYear:true //년도 먼저 나오고, 뒤에 월 표시
                ,changeYear: true //콤보박스에서 년 선택 가능
                ,changeMonth: true //콤보박스에서 월 선택 가능
                ,showOn: "both" //button:버튼을 표시하고,버튼을 눌러야만 달력 표시 ^ both:버튼을 표시하고,버튼을 누르거나 input을 클릭하면 달력 표시
                ,buttonImage: "http://jqueryui.com/resources/demos/datepicker/images/calendar.gif" //버튼 이미지 경로
                ,buttonImageOnly: true //기본 버튼의 회색 부분을 없애고, 이미지만 보이게 함
                ,buttonText: "선택" //버튼에 마우스 갖다 댔을 때 표시되는 텍스트
                ,yearSuffix: "년" //달력의 년도 부분 뒤에 붙는 텍스트
                ,monthNamesShort: ['1','2','3','4','5','6','7','8','9','10','11','12'] //달력의 월 부분 텍스트
                ,monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월'] //달력의 월 부분 Tooltip 텍스트
                ,dayNamesMin: ['일','월','화','수','목','금','토'] //달력의 요일 부분 텍스트
                ,dayNames: ['일요일','월요일','화요일','수요일','목요일','금요일','토요일'] //달력의 요일 부분 Tooltip 텍스트
                ,minDate: "-1M" //최소 선택일자(-1D:하루전, -1M:한달전, -1Y:일년전)
                ,maxDate: "+1Y" //최대 선택일자(+1D:하루후, -1M:한달후, -1Y:일년후)
            });

            //input을 datepicker로 선언
            $("#reservationCheckIn").datepicker();
            $("#res_checkout").datepicker();

            var checkIn = '${searchFrom}';
            var checkOut = dateAdd('${searchTo}',2);

            if(checkIn == null || checkIn == 'null' || checkIn == ""){
                //From의 초기값을 오늘 날짜로 설정
                $('#reservationCheckIn').datepicker('setDate', 'today'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)
                //To의 초기값을 내일로 설정
                $('#res_checkout').datepicker('setDate', '+1D'); //(-1D:하루전, -1M:한달전, -1Y:일년전), (+1D:하루후, -1M:한달후, -1Y:일년후)

            } else {
                checkIn = checkIn.substr(0,4) + "-" + checkIn.substr(4,2) + "-" + checkIn.substr(6,2);
                checkOut = checkOut.substr(0,4) + "-" + checkOut.substr(4,2) + "-" + checkOut.substr(6,2);
              $('#reservationCheckIn').datepicker('setDate', checkIn);
              $('#res_checkout').datepicker('setDate', checkOut);
            }

        });

        </script>
        <script type="text/javascript">
          var err = document.getElementById("error");
          function plus(){
            cnt = count.value;
            if (cnt<4){
              cnt++;
              count.value = cnt;
            }
            else{
              err.style.display = "block";
            }
          }
          function minus(){
            cnt = count.value;
            if (cnt > 1) {
              cnt--;
              count.value = cnt;
            }
          }
          function datediff(input, output) {
       	    var yyyyMMdd = String(input);
       	    var sYear = yyyyMMdd.substring(0,4);
       	    var sMonth = yyyyMMdd.substring(4,6);
       	    var sDate = yyyyMMdd.substring(6,8);
       	    var date1 = new Date(Number(sYear), Number(sMonth)-1, Number(sDate));
       	        
       	    var yyyyMMdd2 = String(output);
       	    var sYear2 = yyyyMMdd2.substring(0,4);
       	    var sMonth2 = yyyyMMdd2.substring(4,6);
       	    var sDate2 = yyyyMMdd2.substring(6,8);
       	    var date2 = new Date(Number(sYear2), Number(sMonth2)-1, Number(sDate2));
     	   
		  	var diff = date2.getTime() - date1.getTime();
		  	var currDay = 24 * 60 * 60 * 1000;
		  	return parseInt(diff/currDay);
          }
          function hye(){
            var con = document.getElementById("hidden_hye");
            var click = document.getElementById("hye_click");
            if(con.style.display=='none'){
              con.style.display = 'block';
              click.innerHTML="혜택 및 이용 안내 -";
            }
            else{
              con.style.display = 'none';
              click.innerHTML="혜택 및 이용 안내 +";
            }
          }
          function room_select1(){
            var con = document.getElementById("hidden_ho1");
            var click = document.getElementById("resroom_btn1");
            if(con.style.display=='none'){
              con.style.display = 'table-row';
              click.innerHTML="접기 -";
            }
            else{
              con.style.display = 'none';
              click.innerHTML="호실 선택 +";
            }
          }
          function room_select2(){
            var con = document.getElementById("hidden_ho2");
            var click = document.getElementById("resroom_btn2");
            if(con.style.display=='none'){
              con.style.display = 'table-row';
              click.innerHTML="접기 -";
            }
            else{
              con.style.display = 'none';
              click.innerHTML="호실 선택 +";
            }
          }
          function room_select3(){
            var con = document.getElementById("hidden_ho3");
            var click = document.getElementById("resroom_btn3");
            if(con.style.display=='none'){
              con.style.display = 'table-row';
              click.innerHTML="접기 -";
            }
            else{
              con.style.display = 'none';
              click.innerHTML="호실 선택 +";
            }
          }
          function room_select4(){
            var con = document.getElementById("hidden_ho4");
            var click = document.getElementById("resroom_btn4");
            if(con.style.display=='none'){
              con.style.display = 'table-row';
              click.innerHTML="접기 -";
            }
            else{
              con.style.display = 'none';
              click.innerHTML="호실 선택 +";
            }
          }
    </script>
    </head>
    <body>
        <%@include file = "/WEB-INF/views/layout/header.jsp" %>
        <table align=center><tr><td>
          <div class=res_content>
          	<div class=res_content2>
            <b id="res_tit"><h4>STEP 1<br>객실, 날짜 선택</h4></b>
            <div class=res_search>
              <div class=res_res>
                <form name="srchRoomFrm" id="res_form" method="post">
                  <table class="res_table">
                    <tr>
                      <td><b>객실</b></td>
                      <td><b>&emsp;체크인</b></td>
                      <td><b>&emsp;&emsp;&emsp;숙박일 수</b></td>
                      <td><b>&emsp;&emsp;체크아웃</b></td>
                      <td></td>
                    </tr>
                    <tr>
                      <td>
                    	   <select name="room_name" style="cursor:pointer;" id="selectRoom">
                    	   <c:choose>
                    	   <c:when test="${param.searchRoom eq 'all' || param.searchRoom eq null}">
                  		      	<option value="all">모든 객실</option>
                  		      	<option value="standard">Standard Room</option>
                    	       <option value="deluxe">Deluxe Room</option>
                    	       <option value="executive">Executive Room</option>
                  		       <option value="suite">Suite Room</option>
                  		   </c:when>
                    	   <c:when test="${param.searchRoom eq 'standard'}">
                  		      	<option value="all">모든 객실</option>
                  		      	<option value="standard" selected>Standard Room</option>
                    	       <option value="deluxe">Deluxe Room</option>
                    	       <option value="executive">Executive Room</option>
                  		       <option value="suite">Suite Room</option>
                  		   </c:when>
                  		   <c:when test="${param.searchRoom eq 'deluxe'}">
                  		      	<option value="all">모든 객실</option>
                  		      	<option value="standard">Standard Room</option>
                    	       <option value="deluxe" selected>Deluxe Room</option>
                    	       <option value="executive">Executive Room</option>
                  		       <option value="suite">Suite Room</option>
                  		   </c:when>
                  		   <c:when test="${param.searchRoom eq 'executive'}">
                  		      	<option value="all">모든 객실</option>
                  		      	<option value="standard">Standard Room</option>
                    	       <option value="deluxe">Deluxe Room</option>
                    	       <option value="executive" selected>Executive Room</option>
                  		       <option value="suite">Suite Room</option>
                  		   </c:when>
                  		   <c:when test="${param.searchRoom eq 'suite'}">
                  		      	<option value="all">모든 객실</option>
                  		      	<option value="standard">Standard Room</option>
                    	       <option value="deluxe">Deluxe Room</option>
                    	       <option value="executive">Executive Room</option>
                  		       <option value="suite" selected>Suite Room</option>
                  		   </c:when>
                  		   
                  		   </c:choose>
                    	   </select>
                      </td>
                      <td>
                        <input type="text" id="reservationCheckIn" value="">
                      </td>
                      <td>
                      	&emsp;&emsp;&emsp;
                      	<script type="text/javascript">
                      	document.write(datediff(${param.searchFrom},${param.searchTo})+1);
                      	</script>
                      	박
                      </td>
                      <td>
              		  	<input type="text" id="res_checkout" value="">
                      </td>
                      <!-- <td>
                        <button type="button" name="button" id="minus"onclick="minus()">-</button>
                        <input type="text" value="2" id="count">
                        <button type="button" name="button" id="pl_m" onclick="plus()">+</button>
                      </td> -->
                      <td><button type="button" id="res_btn" onclick="javaScript:searchRoom($('#selectRoom').val());">검색</button></td>
                    </tr>
                  </table>
                </form>
              </div>
            </div>
          <!--빈 객실 보여주기-->
          <br>
            <table class="res_room">
              <tbody>
                <c:choose>
             		<c:when test="${param.searchRoom eq 'all' || param.searchRoom eq 'standard'}">
             			<tr class="hang">
                  		<td><img src="/resources/image/standardroom.jpg" width="200" height="150"></td>
                  		<td>
	                    	<b>Standard room</b><br><br>
	                    	마일리지 1,000p 혜택<br>
	                    	<a href="javaScript:hye();" id="hye_click">혜택 및 이용 안내 +</a><br>
	                    	<div id="hidden_hye">
	                      		<p>무료 WIFI / 피트니스 센터 무료 이용 / 어메니티</p>
	                    	</div>
                  		</td>
                  		<td><b>100,000 원~</b><br> <!--1박 가격-->
	                    	<c:forEach items="${roomListCnt}" var="itemCnt">
	                    	<c:if test="${itemCnt.roomType eq 'standard'}">
	                    		${itemCnt.roomTypeCnt}
	                    	</c:if>
	                    	</c:forEach>
	                    	개의 객실이 있습니다.
	                  	</td>
                  		<td><button onclick="room_select1();" type="button" class="resroom_btn" id="resroom_btn1">호실 선택 +</button></td>
                		</tr>
                		<tr class="hidden_ho" id="hidden_ho1">
                		<td></td>
                		<td></td>
                		<td colspan="2" style="text-align: left">
                		<c:forEach items="${roomList}" var="item" varStatus="status">	
                			<c:if test="${item.roomType eq 'standard'}">
	                  			<br>&emsp;&emsp;⦁&emsp;${item.roomNo} 호
	                  			&emsp;&emsp;&emsp;&nbsp;${item.bedType} bed
	                  			<c:if test="${item.bedType eq 'single'}">
	                  			&emsp;&emsp;&emsp;&emsp;&emsp;<button type="button" class="resroom_btn_small" onclick="location.href='/reservate.do?checkIn=${searchFrom}&checkOut=${searchTo}&rno=${item.roomNo}'">이 방 예약하기</button>
	                  			</c:if>
	                  			<c:if test="${item.bedType eq 'twin'}">
	                  			&nbsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;<button type="button" class="resroom_btn_small" onClick="location.href='/reservate.do?checkIn=${searchFrom}&checkOut=${searchTo}&rno=${item.roomNo}'">이 방 예약하기</button>
	          					</c:if>
                  				<hr style="border: solid 1px #f3f3f3;" width=420px align="left">
	                  		</c:if>
	                  	</c:forEach>
	                  	</td>
	                  	</tr>
		         	</c:when>
		         </c:choose>
		         <c:choose>
		         	<c:when test="${param.searchRoom eq 'all' || param.searchRoom eq 'deluxe'}">
			         	<tr class="hang">
	                  	    <td><img src="/resources/image/deluxe room.jpg" width="200" height="150"></td>
	                  		<td>
	                    	<b>Deluxe room</b><br><br>
	                    	마일리지 1,600p 혜택<br>
	                    	<a href="javaScript:hye();" id="hye_click">혜택 및 이용 안내 +</a><br>
	                    	<div id="hidden_hye">
	                      		<p>무료 WIFI / 피트니스 센터 무료 이용 / 어메니티</p>
	                    	</div>
	                  		</td>
		                  	<td><b>160,000 원~</b><br> <!--1박 가격-->
		                    	<c:forEach items="${roomListCnt}" var="itemCnt">
		                    	<c:if test="${itemCnt.roomType eq 'deluxe'}">
		                    		${itemCnt.roomTypeCnt}
		                    	</c:if>
		                    	</c:forEach>
			                    개의 객실이 있습니다.
		                  	</td>
	                  		<td><button onclick="room_select2();" type="button" class="resroom_btn" id="resroom_btn2">호실 선택 +</button></td>
	                	</tr>
                	  	<tr class="hidden_ho" id="hidden_ho2">
                		<td></td>
                		<td></td>
                		<td colspan="2" style="text-align: left">
                		<c:forEach items="${roomList}" var="item">	
                			<c:if test="${item.roomType eq 'deluxe'}">
	                  			<br>&emsp;&emsp;⦁&emsp;${item.roomNo} 호
	                  			&emsp;&emsp;&emsp;&nbsp;${item.bedType} bed
	                  			<c:if test="${item.bedType eq 'single'}">
	                  			&emsp;&emsp;&emsp;&emsp;&emsp;<button type="button" class="resroom_btn_small" onclick="location.href='/reservate.do?checkIn=${searchFrom}&checkOut=${searchTo}&rno=${item.roomNo}'">이 방 예약하기</button>
	                  			</c:if>
	                  			<c:if test="${item.bedType eq 'twin'}">
	                  			&nbsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;<button type="button" class="resroom_btn_small" onclick="location.href='/reservate.do?checkIn=${searchFrom}&checkOut=${searchTo}&rno=${item.roomNo}'">이 방 예약하기</button>
	          					</c:if>
	                  			<hr style="border: solid 1px #f3f3f3;" width=420px align="left">
	                  		</c:if>
	                  	</c:forEach>
	                  	</td>
	                  	</tr>
                	</c:when>
		         </c:choose>
		         <c:choose>	                	
                	<c:when test="${param.searchRoom eq 'all' || param.searchRoom eq 'executive'}">
		        		<tr class="hang">
	                  		<td><img src="/resources/image/executive room.jpg" width="200" height="150"></td>
	                  		<td>
	                    	<b>Executive room</b><br><br>
	                    	마일리지 2,500p 혜택<br>
	                    	<a href="javaScript:hye();" id="hye_click">혜택 및 이용 안내 +</a><br>
	                    	<div id="hidden_hye">
	                      		<p>무료 WIFI / 피트니스 센터 무료 이용 / 어메니티</p>
	                      		<p>수영장 무료 이용 / 라운지바 이용 가능</p>
	                    	</div>
	                  		</td>
	                  		<td><b>250,000 원~</b><br> <!--1박 가격-->
		                    	<c:forEach items="${roomListCnt}" var="itemCnt">
		                    	<c:if test="${itemCnt.roomType eq 'executive'}">
		                    		${itemCnt.roomTypeCnt}
		                    	</c:if>
		                    	</c:forEach>
	                    		개의 객실이 있습니다.
	                  		</td>
	                  		<td><button onclick="room_select3();" type="button" class="resroom_btn" id="resroom_btn3">호실 선택 +</button></td>
	                	</tr>
	                	<tr class="hidden_ho" id="hidden_ho3">
                		<td></td>
                		<td></td>
                		<td colspan="2" style="text-align: left">
                		<c:forEach items="${roomList}" var="item">	
                			<c:if test="${item.roomType eq 'executive'}">
	                  			<br>&emsp;&emsp;⦁&emsp;${item.roomNo} 호
	                  			&emsp;&emsp;&emsp;&nbsp;${item.bedType} bed
	                  			<c:if test="${item.bedType eq 'single'}">
	                  			&emsp;&emsp;&emsp;&emsp;&emsp;<button type="button" class="resroom_btn_small" onclick="location.href='/reservate.do?checkIn=${searchFrom}&checkOut=${searchTo}&rno=${item.roomNo}'">이 방 예약하기</button>
	                  			</c:if>
	                  			<c:if test="${item.bedType eq 'twin'}">
	                  			&nbsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;<button type="button" class="resroom_btn_small" onclick="location.href='/reservate.do?checkIn=${searchFrom}&checkOut=${searchTo}&rno=${item.roomNo}'">이 방 예약하기</button>
	          					</c:if>
	                  			<hr style="border: solid 1px #f3f3f3;" width=420px align="left">
	                  		</c:if>
	                  	</c:forEach>
	                  	</td>
	                  	</tr>
	                </c:when>
		         </c:choose>
		         <c:choose>		                
	                <c:when test="${param.searchRoom eq 'all' || param.searchRoom eq 'suite'}">
		        		<tr class="hang">
                  			<td><img src="/resources/image/suiteroom.jpg" width="200" height="150"></td>
                  			<td>
                    		<b>Suite room</b><br><br>
                    			마일리지 3,500p 혜택<br>
                    		<a href="javaScript:hye();" id="hye_click">혜택 및 이용 안내 +</a><br>
                    		<div id="hidden_hye">
                      			<p>무료 WIFI / 피트니스 센터 무료 이용 / 어메니티</p>
                      			<p>수영장 무료 이용 / 라운지바 이용 가능</p>
                    		</div>
                 			</td>
                  			<td><b>350,000 원~</b><br> <!--1박 가격-->
		                    	<c:forEach items="${roomListCnt}" var="itemCnt">
		                    	<c:if test="${itemCnt.roomType eq 'suite'}">
		                    		${itemCnt.roomTypeCnt}
		                    	</c:if>
		                    	</c:forEach>
                    			개의 객실이 있습니다.
                  			</td>
                  			<td><button onclick="room_select4();" type="button" class="resroom_btn" id="resroom_btn4">호실 선택 +</button></td>
                		</tr>
                		<tr class="hidden_ho" id="hidden_ho4">
                		<td></td>
                		<td></td>
                		<td colspan="2" style="text-align: left">
                		<c:forEach items="${roomList}" var="item">	
                			<c:if test="${item.roomType eq 'suite'}">
	                  			<br>&emsp;&emsp;⦁&emsp;${item.roomNo} 호
	                  			&emsp;&emsp;&emsp;&nbsp;${item.bedType} bed
	                  			<c:if test="${item.bedType eq 'single'}">
	                  			&emsp;&emsp;&emsp;&emsp;&emsp;<button type="button" class="resroom_btn_small" onclick="location.href='/reservate.do?checkIn=${searchFrom}&checkOut=${searchTo}&rno=${item.roomNo}'">이 방 예약하기</button>
	                  			</c:if>
	                  			<c:if test="${item.bedType eq 'twin'}">
	                  			&nbsp;&nbsp;&nbsp;&emsp;&emsp;&emsp;&emsp;&emsp;<button type="button" class="resroom_btn_small" onclick="location.href='/reservate.do?checkIn=${searchFrom}&checkOut=${searchTo}&rno=${item.roomNo}'">이 방 예약하기</button>
	          					</c:if>
	                  			<hr style="border: solid 1px #f3f3f3;" width=420px align="left">
	                  		</c:if>
	                  	</c:forEach>
	                  	</td>
	                  	</tr>
                	</c:when>
                	<c:when test="${param.searchRoom eq null}">
		        		<tr class="empty">
                  			<td align="center">
								예약을 원하시는 객실, 날짜를 선택해주세요.
                  			</td>
                		</tr>
                	</c:when>
		        </c:choose>

              </tbody>
            </table>
            </div>
        </div>
        </td></tr>
        </table>

    </body>
</html>