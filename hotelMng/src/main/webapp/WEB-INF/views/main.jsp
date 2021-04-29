<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
      <style>
            * {
                font-family: 'Noto Sans KR', sans-serif;
            }
            body {
                margin-left:auto;
                margin-right: auto;
                padding:0px;
                background-color: #fbfcf5;
                font-family:나눔고딕;
                overflow-x: hidden;
            }
            ::-webkit-scrollbar {
                display: none;
            }
            a {
                color:#111111;
                text-decoration:none
            }
            .banner_main{
                background-image: url(/resources/image/outdoor.jpg);
                background-size: 1920px 850px;
                margin-top: auto;
                min-width: 700px;
                height: 770px;
                padding: 8px;
            }
            .contain{
                width: 100%;
            	margin-top:30px;
                min-height: 700px;
                background-color: #fbfcf5;
                font-size: 18px;
                color: #333333
            }
            .index_contents {
                margin-left: 45px;
            }
            .intro{
               margin-top: 10px;
               border-top:1px solid #D4C1A1;
               width:100%;
               text-align:center;
               border-bottom: none;
               border-right: none;
               margin-left:-50px;
               display: inline-block;    
            }
            .intro_facility{
               font-size: 20px;
            }
            .intro_facility a{
             position: relative;
             display: inline-block;
             margin-right: 20px;
             margin-left: 10px;
             padding: 10px;
         }
         .intro_facility a:first-child::before{
             content: '';
         }
         .intro_facility a::before {
             position: absolute;
             top: 2px;
             left: -15px;
             content: '|';
             display: inline-block;
             width: 1px;
             height: 10px;
         }
         .floor_guide {
             width: 100%;
             border-collapse: separate;
             border-spacing: 1px;
             text-align: center;
             line-height: 1.5;
             border-top: 1px solid #D4C1A1;
             margin : 20px 5px;
             margin-left: -5px;
             margin-bottom: 100px;
         }
         .floor_guide th {
             width: 150px;
             padding: 20px;
             font-weight: bold;
             vertical-align: middle;
             border-bottom: 1px solid #D4C1A1;
             color: #dbb790;
         }
         .floor_guide td {
            width: 100px;
            padding: 10px;
            border-bottom: 1px solid #D4C1A1;
            border-right: 1px solid #D4C1A1;
         }
         .floor_guide td.right {
             width: 350px;
             padding: 10px;
             text-align: center;
             vertical-align: middle;
             border-bottom: 1px solid #D4C1A1;
             border-right: none;
         }
        </style>
        <style>
          button{
            cursor: pointer;
          }
          table{
            border-collapse: collapse;
          }
          .res_romm b{
            font-size: 22px;
          }
          .res_search{
            margin-top: 50px;
            border-top:6pt solid #f1f1f1;
            width:90%;
            align:center;
            border-radius:10px;
            border-bottom:6pt solid #f1f1f1;
            margin:0 auto;
            padding-left:35%;
          }
          .res_res{
            display: inline-block;
            text-align:center;
          }
          .res_table td{
            text-align:center;
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
          #res_btn:hover {
           background-color:#dbb790;
          }
        #res_btn:active {
          position:relative;
         top:1px;
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
           var diff = output - input;
           var currDay = 24 * 60 * 60 * 1000;
           return parseInt(diff/currDay);
          }
    </script>
        <title>Welcome Hotel Lucid!</title>

    </head>
    <body>
        <%@include file = "/WEB-INF/views/layout/header.jsp" %>
        <div class=banner_main></div>
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
        <div class=contain>
           <div class=index_contents>
                 <div class=intro>
                   <span class=intro_facility>
                     <a><img src="/resources/image/stair.png" width= 25px>  층수 14  </a>
                     <a><img src="/resources/image/bed.png" width=25px>  객실 60  </a>
                     <a><img src="resources/image/parking.png" width =25px>  주차 100대  </a>
                  </span>
                  <table class=floor_guide>
                     <tr>
                     <th>연회장</th>
                     <td>13F</td>
                     <td class=right>13F Lucid Hall</td>
                     </tr>
                     <tr>
                     <th>라운지</th>
                     <td>13F-14F</td>
                     <td class=right>13F Executive Rounge</td>
                     </tr>
                     <tr>
                     <th>일반층</th>
                     <td>1F-12F</td>
                     <td class=right>12F-10F 스위트룸 / 9F-7F 이그제큐티브룸 / 6F-4F 디럭스룸 <br> 3F-1F 스탠다드룸 / 8F, 4F 흡연실 / 1F 레스토랑, 로비</td>
                     </tr>
                     <tr>
                     <th>부대시설</th>
                     <td>B1</td>
                     <td class=right>B1F 실내 체육관, 실내 수영장</td>
                     </tr>
                     <tr>
                     <th>부대시설</th>
                     <td>B2</td>
                     <td class=right>B2F 실내 골프장, 사우나</td>
                  </table>
               </div>
               <br><br><br><br><br><br><br>
               <table align=center><tr><td>
               <p> 호텔 루시드는 언제나 한결같이 품격있는 서비스와 시설로 고객에게 깊은 감동을 주는 브랜드를 지향하고 있습니다.</p>   
               <p> 균형 있는 라이프스타일을 추구하며 품격의 가치를 아는 고객분들을 위해 세련되고 안락한 객실과 세심한 배려가 묻어나는 고품격 호텔 서비스를 준비하고 있습니다.</p>   
               <p> 호텔 레스토랑과 라운지에서 제공되는 최고급 요리는 즐거운 경험을 제공하며 다양한 시설은 비즈니스와 레저를 모두 즐기고 싶어하시는 고객분들을 만족시키는데 부족함이 없습니다.</p>
               <p> 지금, 호텔 루시드에서 특별한 경험을 즐기세요</p>   
          	   </td></tr></table>
          </div>
          <%@include file = "/WEB-INF/views/layout/final.jsp" %>
        </div>
    </body>
</html>