<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="style.css" type="text/css">
        <title>Welcome Delluna!</title>
        <style>
          table{
            border-collapse: collapse;
          }
          .res_room tr{
            border-bottom: 2px solid #f1f1f1;
          }
          .res_room td{
            width:200px;
            padding-top:30px;
            padding-bottom:20px;
            padding-left: 40px;
          }
          .res_romm b{
            font-size: 22px;
          }
        </style>
        <script type="text/javascript">
          function plus(){
            var result = document.getgetElementById('num');
            result++;
            num.value = result;
          }
          function minus(){
            var result = document.getgetElementById('num');
            if (result > 1) {
              result--;
              num.value = count;
            }
          }
        </script>
    </head>
    <body>
        <div class=header>
            <a href="index.html"><img src="moon.png" width="80" height="80s"></a>
            <div class=logo></div>
            <span class=topmenu>
              <a href="login.html">로그인</a>
              <a>마이페이지</a>
              <a href="res_confirm.html">예약 확인</a>
            </span>
            <nav>
                <span><a href="intro.html">호텔 소개</a></span>
                <span><a href="room.html">객실</a></span>
                <span><a href="restaurant.html">레스토랑</a></span>
                <span><a href="res.html">예약</a></span>
                <span><a href="res_confirm.html">예약 확인</a></span>
                <span><a href="qna.html">고객문의</a></span>
                <span><a href="facility.html">편의시설</a></span>
                <span><a href="login.html">로그인</a></span>
            </nav>

        </div>
        <center>
          <div class=res_content>
            <p>Direct Hotel</p>
            <h2>객실</h2>
            <div class=res_search>
              <div class=res_res>
                <form name="srchRoomFrm" id="res_form" method="post">
                  <table class="res_table">
                    <tr>
                      <td><b>객실</b></td>
                      <td><b>기간</b></td>
                      <td><b>성인</b></td>
                      <td><b>어린이</b></td>
                    </tr>
                    <tr>
                      <td>
                        <td class="res_selectRoom">
                    	     <select name="room_name" style="cursor:pointer;">
                    		       <option>모든 객실</option>
                    		       <option value="standard">Standard Room</option>
                    		       <option value="deluxe">Deluxe Room</option>
                    		       <option value="executive">Executive Room</option>
                    		       <option value="suite">Suite Room</option>
                    	      </select>
                        </td>
                      </td>
                      <td>
                        <span class="btnCalShow" id="ckoutDateInfo" tabindex="0">2020.11.23 (월)</span>
                        <input type="hidden" name="ckoutYmd" id="ckoutYmd" title="체크아웃 날짜 입력" value="2020-11-23" autocomplete="off">
                      </td>
                      <td>
                        <button type="button" name="button"onclick="minus()">-</button>
                        <span id="num">2</span>
                        <button type="button" name="button"onclick="plus()">+</button>
                      </td>
                      <td><input type="text" id="res_child" value="1" title="어린이"></td>
                      <td><button type="button" id="res_btn" onclick="alert('클릭이벤트 발생')">검색</button></td>
                    </tr>
                  </table>
                </form>
              </div>
            </div>
          </center>
          <center>
          <!--빈 객실 보여주기-->
            <br><br><br>
            <table class="res_room">
              <tbody>
                <tr class="hang">
                  <td><img src="../img/standard room.jpg" width="200" height="150"></td>
                  <td>
                    <b>Standard room</b><br><br>
                    리워즈 3,000p 혜택<br>
                    혜택 및 이용 안내
                  </td>
                  <td><b>78,000 원~</b><br> <!--1박 가격-->
                    1박<br>
                    n개의 객실이 있습니다.
                  </td>
                  <td><button type="button" id="res_btn" onclick="location.href='res2.html'">호실 선택</button></td>
                </tr>
                <tr class="hang">
                  <td><img src="../img/deluxe room.jpg" width="200" height="150"></td>
                  <td>
                    <b>Deluxe room</b><br><br>
                    리워즈 5,000p 혜택<br>
                    혜택 및 이용 안내
                  </td>
                  <td><b>98,000 원~</b><br> <!--1박 가격-->
                    1박<br>
                    n개의 객실이 있습니다.
                  </td>
                  <td><button type="button" id="res_btn" onclick="location.href='res2.html'">호실 선택</button></td>
                </tr>
                <tr class="hang">
                  <td><img src="../img/executive room.jpg" width="200" height="150"></td>
                  <td>
                    <b>Executive room</b><br><br>
                    리워즈 7,000p 혜택<br>
                    혜택 및 이용 안내
                  </td>
                  <td><b>118,000 원~</b><br> <!--1박 가격-->
                    1박<br>
                    n개의 객실이 있습니다.
                  </td>
                  <td><button type="button" id="res_btn" onclick="location.href='res2.html'">호싵 선택</button></td>
                </tr>
                <tr class="hang">
                  <td><img src="../img/suite room.jpg" width="200" height="150"></td>
                  <td>
                    <b>Suite room</b><br><br>
                    리워즈 9,000p 혜택<br>
                    혜택 및 이용 안내
                  </td>
                  <td><b>138,000 원~</b><br> <!--1박 가격-->
                    1박<br>
                    n개의 객실이 있습니다.
                  </td>
                  <td><button type="button" id="res_btn" onclick="location.href='res2.html'">호실 선택</button></td>
                </tr>
              </tbody>
            </table>
          </center>
        </div>
        <div class="finish">
            <p> 사업자 번호: 110-10-12345<br/>
                사업장소재지: 경기도 이천시 마장면 장암리<br/>
                대표자: 홍길동<br/>
                Copyright ⓒ 2020 Hotel Group. All rights reserved.
            </p>
        </div>
    </body>
</html>