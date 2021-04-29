<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>

    <title>Customer Service</title>
 	
    <script type="text/javascript">
    	function getWorldTime(tzOffset) { // 24시간제
    	  var now = new Date();
    	  var tz = now.getTime() + (now.getTimezoneOffset() * 60000) + (tzOffset * 3600000);
    	  now.setTime(tz);


    	  var s =
    	    leadingZeros(now.getFullYear(), 4) + '-' +
    	    leadingZeros(now.getMonth() + 1, 2) + '-' +
    	    leadingZeros(now.getDate(), 2) + ' ' +

    	    leadingZeros(now.getHours(), 2) + ':' +
    	    leadingZeros(now.getMinutes(), 2) + ':' +
    	    leadingZeros(now.getSeconds(), 2);

    	  return s;
    	}


    	function leadingZeros(n, digits) {
    	  var zero = '';
    	  n = n.toString();

    	  if (n.length < digits) {
    	    for (i = 0; i < digits - n.length; i++)
    	      zero += '0';
    	  }
    	  return zero + n;
    	}
    	
    	function request(num) {
			var num = num;
			var RoomNo = 101;
			var text = null;
			var date = new Date();
			date = getWorldTime(+9);
			
			if(num == 1) text = "수건";
			if(num == 2) text = "물";
			if(num == 3) text = "어메니티";
			if(num == 4) text = "청소";
			if(num == 5) text = "연결";
			if(num == 6) text = "직원";
			var data = {"RoomNo" : RoomNo,
					"Request" : text,
					"Time" : date
			};

			$.ajax({
				type : "POST",
    			url : "/tabletAction",
    			data : data,
    			datatype : 'json',
    			success : function(data) {
    				var result = data["resultMsg"];
    				if(result == "success"){
        				if(text == "수건")
    						alert("수건을 10분 이내로 가져다 드리겠습니다.");
        				if(text == "물")
    						alert("물을 10분 이내로 가져다 드리겠습니다.");
        				if(text == "어메니티")
    						alert("어메니티를 10분 이내로 가져다 드리겠습니다.");
        				if(text == "청소")
    						alert("11시~4시 사이에 객실을 청소해 드리겠습니다.");
        				if(text == "연결"){
        					var confirm_test = confirm("전화 연결 하시겠습니까?");
    						if(confirm_test = true) {
    							alert("연결 중입니다.");
        					}
        				}
        				if(text == "직원")
    						alert("직원이 10분이내로 객실에 도착합니다.");
    					location.href="/tablet/room101";
    				}
				}
			})
        }

    </script>
    <style>
      /* common */

      body {
          /* margin-left:auto;
          margin-right: auto; */
          margin: 0px;
          padding:0px;
          background-color: white;
          font-family:나눔고딕;
          -ms-overflow-style: none;
      }
      ::-webkit-scrollbar {
        display: none;
      }
      a {
          color:#111111;
          text-decoration:none;

      }
      .flex-container {
          height: 100%;
          width: 100%;
          position: absolute;
          display: inline-flex;
          flex-direction: row;
          flex-wrap: wrap;
          justify-content: center;
          align-content: center;
          align-items: center;
          top: 50%;
          left: 50%;
          transform: translate(-50%, -50%);
          margin-top: 100px;
          margin-bottom: 100px;
      }

          /* button */
      .button-menu {
      	box-shadow:inset 0px 1px 0px 0px #ffffff;
      	background-color: #D4C1A1;
      	border-radius:5px;
      	border:1px solid #dcdcdc;
      	display: inline-block;
      	cursor:pointer;
      	color:#000000;
        width : 300px;
      	font-family:나눔고딕;
      	font-size:30px;
      	font-weight:bold;
      	padding: 90px;
          margin: 20px;
      	text-decoration:none;
          text-align: center;
      }
      .button-menu:hover {
      	background-color:#d1c7b6;
      }
      .button-menu:active {
      	position:relative;
      	top:1px;
      }
      .clear {
          clear: both;
          display: block;
          font-size: 0px;
          height: 0px;
          line-height: 0;
          width: 100%;
          overflow:hidden;
      }

    </style>
  </head>
<body>
    <div class="flex-container">
        <input type=button class="button-menu" onClick="request(1)" value="수건">
        <input type=button class="button-menu" onClick="request(2)" value="물">
        <div class="clear"></div>
        <input type=button class="button-menu" onClick="request(3)" value="어메니티">
        <input type=button class="button-menu" onClick="request(4)" value="청소 요청">
        <div class="clear"></div>
        <input type=button class="button-menu" onClick="request(5)" value="직원 연결">
        <input type=button class="button-menu" onClick="request(6)" value="직원 호출">
    </div>

</body>
</html>