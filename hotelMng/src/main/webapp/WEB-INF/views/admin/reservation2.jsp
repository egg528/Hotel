<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="/resources/css/style.css" type="text/css">

        <style>
			body {
				margin-left:auto;
				margin-right: auto;
				padding:0px;
				background-color: #fbfcf5;
			}
			.contain{
				background-color: #fbfcf5;
			}
			.res_content{
			  display: inline-block;
			  margin-left:100px;
			}
			.res_content2{
			  margin:0 auto;
			}
			#res_tit{
			  font-size:30px;
			  margin-bottom:30px;
			  font-weight: bolder;
			  text-align: center;
			}
			.res2_tit{
			  font-size:20px;
			  margin-top:20px;
			}
			#res2_tit{
			  padding-bottom:7px;
			  border-bottom:7px solid  #D4C1A1;
			}
			.msgBox{
			  font-size:15px;
			  border:3px solid #ECE6CC;
			  border-radius:8px;
			  background-color:#ECE6CC;
			  margin-bottom:10px;
			  text-align:center;
			  width:975px;
			}
			#msg{
			  height:50px;
			}
			table{
			  border-collapse: collapse;
			}
			.table{
				border-top:7px solid  #D4C1A1;
				border-radius:5px;
			}
			.table tr{
			  border-bottom: 2px solid #f1f1f1;
			}
			.table th{
			  padding-top:20px;
			  padding-bottom:20px;
			  background-color:#f1f1f1;
			}
			.table td{
			  padding-left:10px;
			  padding-top:20px;
			  padding-bottom:20px;
			}
			.card_com{
			  width:200px;
			}
			.card_num{
			  width:35px;
			}
			.card_term{
			  width:70px;
			}
			.scroll {
			  overflow-x: hidden;
			  overflow-y: scroll;
			  border: solid 1px #aaa;
			  padding-left: 8px;
			  font-size: 14px;
			  box-sizing: border-box;
			  height:145px;
			  width:975px;
			}
			#res2_btn{
			  width:100px;
			  height:55px;
			  margin-left:450px;
			  margin-top: 30px;
			  background-color:#D4C1A1;
			  border:none;
			  border-radius:7px;
			}
			.totalPricefield{
			  background-color:#ECE6CC;
			}
        </style>
 		<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
  		<link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
  		<meta http-equiv="X-UA-Compatible" content="IE=edge">

        <title>Reservation</title>
		<script type="text/javascript">
			var sessionLevel = '${member.userLevel}';
			if(sessionLevel == null || sessionLevel == 'null' || sessionLevel=="" || sessionLevel == "1"){
				alert("관리자 권한이 없습니다.");
				location.href="/main";
			}
		</script>
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
    	$(document).ready(function() {
			$('#ReservationDays').on('mouseup', function(e) {
				var price = ('${room.fee}' * $('#ReservationDays').val());
				$('#RoomPrice').html("<span id='RoomPrice'>" + price + " 원</span>");
				var total = parseInt($('#RoomPrice').text()) + parseInt($('#AddPrice').text());
				var tax = Math.floor(parseInt(total) * 0.1);
				var finish = parseInt(tax) + parseInt(total);
				var Mileage = Math.floor(parseInt(finish) * 0.01);
				var checkout = dateAdd('${resdate}',parseInt($('#ReservationDays').val())+1);
				$('#AdditionalTax').html("<span id='AdditionalTax'>" + tax + " 원</span>");
				$('#TotalPrice').html("<span id='TotalPrice'>" + finish + " 원</span>");
				$('#Mileage').html("<span id='Mileage'>" + Mileage + " p</span>");
				$('#CheckOut').html("<span id='CheckOut'>"+checkout+"</span>");
			});
	 		$("#Breakfast").click(function() {
				if($("#Breakfast").is(":checked")) {
					var price = ($('#ReservationPeopleNumber').val() * 20000);
					$('#AddPrice').html("<span id='AddPrice'>" + price + " 원</span>");
				} else {
					var price = 0;
					$('#AddPrice').html("<span id='AddPrice'>" + price + " 원</span>");
				}
				var total = parseInt($('#RoomPrice').text()) + parseInt($('#AddPrice').text());
				var tax = Math.floor(parseInt(total) * 0.1);
				var finish = parseInt(tax) + parseInt(total);
				var Mileage = Math.floor(parseInt(finish) * 0.01);
				$('#AdditionalTax').html("<span id='AdditionalTax'>" + tax + " 원</span>");
				$('#TotalPrice').html("<span id='TotalPrice'>" + finish + " 원</span>");
				$('#Mileage').html("<span id='Mileage'>" + Mileage + " p</span>");
			});
			$('#ReservationPeopleNumber').on('mouseup', function(e) {
				if($("#Breakfast").is(":checked")) {
					var price = ($('#ReservationPeopleNumber').val() * 20000);
					$('#AddPrice').html("<span id='AddPrice'>" + price + " 원</span>");
				} else {
					var price = 0;
					$('#AddPrice').html("<span id='AddPrice'>" + price + " 원</span>");
				}
				var total = parseInt($('#RoomPrice').text()) + parseInt($('#AddPrice').text());
				var tax = Math.floor(parseInt(total) * 0.1);
				var finish = parseInt(tax) + parseInt(total);
				var Mileage = Math.floor(parseInt(finish) * 0.01);
				$('#AdditionalTax').html("<span id='AdditionalTax'>" + tax + " 원</span>");
				$('#TotalPrice').html("<span id='TotalPrice'>" + finish + " 원</span>");
				$('#Mileage').html("<span id='Mileage'>" + Mileage + " p</span>");
			});
		});
        function reservation() {
        	var Id = $('#UserId').val();
        	var ReservationDays = $('#ReservationDays').val();
        	var ReservationPeopleNumber = $('#ReservationPeopleNumber').val();
        	var ReservationCheckIn = '${resdate}';
        	var RoomCode = '${roomNo}';
        	var ReservationMemo = $('#ReservationMemo').val();
			var ReservationCheckOut = dateAdd(ReservationCheckIn, ReservationDays);
			var Card = $('#Card').val();
			var CardNum = $('#card_no1').val() + $('#card_no2').val() + $('#card_no3').val() + $('#card_no4').val();
			var CardValid = $('#CardYY').val() + $('#CardMM').val();
			var Breakfast = "N";
			var TotalPrice = parseInt($('#TotalPrice').text());
			var Mileage = parseInt($('#Mileage').text());
			if($("#Breakfast").is(":checked")) {
				Breakfast = "Y";
			}
			var agree1 = $('#agree1').val();
			var agree2 = $('#agree2').val();
			var RoomType = '${room.roomType}';
        	var data = {"UserId" : Id,
                	"ReservationDays" : ReservationDays,
                	"ReservationPeopleNumber" : ReservationPeopleNumber,
                	"ReservationCheckIn" : ReservationCheckIn,
                	"ReservationCheckOut" : ReservationCheckOut,
                	"RoomCode" : RoomCode,
                	"ReservationMemo" : ReservationMemo,
                	"Breakfast" : Breakfast,
                    "TotalPrice" : TotalPrice,
                    "Mileage" : Mileage,
                    "Card" : Card,
                    "CardNum" : CardNum,
                    "CardValid" : CardValid,
                    "RoomType" : RoomType
        	};
        	if(ReservationDays == "-박") {
        		alert("숙박일 수를 입력해주세요.");
    			$('#ReservationDays').focus();
    			return false;
            } else if (ReservationPeopleNumber == "-인") {
            	alert("숙박 인원을 입력해주세요.");
    			$('#ReservationPeopleNumber').focus();
    			return false;
            } else if (!$("#agree1").is(":checked")) {
            	alert("개인정보 수집에 동의해주세요.");
            	return false;
            } else if (!$("#agree2").is(":checked")) {
            	alert("결제 취소 규정에 동의해주세요.");
            	return false;
            }
            $.ajax({
            	type : "POST",
    			url : "/admin/reservateAction.do",
    			data : data,
    			datatype : 'json',
    			success : function(data) {
    				var result = data["resultMsg"];
    				if(result == "success"){
    					alert("예약되었습니다!");
    					location.href="/admin/reservation.do?rno=${roomNo}";
    				}else {
    					alert("이미 예약된 날짜입니다.");
    				}
        		}
            }
          )
        }
        </script>
    </head>
    <body>
      <%@include file = "/WEB-INF/views/admin/admin_header.jsp" %>
      <table align=center><tr><td>
      <div class=contain>
        <div class=res_content>
          <div class=res_content2>
            <h3 id="res_tit">2. 정보 입력 및 결제하기</h3>
            <form method="get" action="write_action.php" enctype="multipart/form-data"> <!--예약 작성하는 폼-->
   			      <h3 class="res2_tit">요청사항</h3>
					    <div class="msgBox">
						    <p>별도의 요청 사항은 호텔의 상황에 따라 제공이 어려울 경우가 있으니 양해 부탁 드립니다.</p>
						  </div>
				      <table class="table">
						    <colgroup><col width="175px"><col width="800px"></colgroup>
						    <tbody>
						     <tr>
						      <th scope="row">기타 남기실 말씀</th>
						      <td class="fm">
						      	<textarea title="기타 남기실 말씀" placeholder="내용을 입력해 주세요." name="msg" id="ReservationMemo" maxlength="200"></textarea>
					      	</td>
					       </tr>
			       	  </tbody>
			         </table>

				<!-- 예약 정보 // -->
				<h3 class="res2_tit">예약 정보</h3>
				<table class="table">
					<colgroup><col width="175px"><col width="800px"></colgroup>
					<tbody>
						<tr>
							<th scope="row">이름</th>
							<td class="fm" colspan="3">
								<span><input type="text" id="UserId" size="20"></span>
							</td>
						</tr>
						<tr>
							<th scope="row">연락처</th>
							<td class="fm" colspan="3">
								<span><input type="text" id="UserPhone" size="20"></span>
							</td>
						</tr>
						<tr>
							<th scope="row">이메일</th>
							<td class="fm" colspan="3">
								<span><input type="text" id="UserEmail" size="20"></span>
							</td>
						</tr>
						<tr>
							<th scope="row">객실</th>
							<td class="fm" colspan="3">
								<span id="RoomNo">${roomNo}</span>
							</td>
						</tr>
						<tr>
							<th scope="row">객실 Type</th>
							<td class="fm" colspan="3">
								<span id="RoomType">${room.roomType}</span>
							</td>
						</tr>
						<tr>
							<th scope="row">체크인</th>
							<td class="fm" colspan="3">
								<span id="ReservationCheckIn">${resdate}</span>
							</td>
						</tr>
						<tr>
							<th scope="row">숙박일 수</th>
							<td class="fm" colspan="3">
								<select id ="ReservationDays" class="sel">
			                		<option>-박</option>
			                		<option value="1">1박</option>
			                		<option value="2">2박</option>
			                		<option value="3">3박</option>
			                		<option value="4">4박</option>
			                		<option value="5">5박</option>
		                		</select>
							</td>
						</tr>
						<tr>
							<th scope="row">체크아웃</th>
							<td class="fm" colspan="3">
								<span id="CheckOut"></span>
							</td>
						</tr>
						<tr>
							<th scope="row">조식</th>
							<td class="fm" colspan="3">
								<span>
									<input type="checkbox" id="Breakfast">
									*인당 2만원
								</span>
							</td>
						</tr>
						<tr>
							<th scope="row">인원</th>
							<td class="fm" colspan="3">
								<select id ="ReservationPeopleNumber" class="sel">
			                		<option>-인</option>
		                    		<option value="1">1인</option>
		                    		<option value="2">2인</option>
		                    		<option value="3">3인</option>
		                    		<option value="4">4인</option>
		                		</select>
							</td>
						</tr>
					</tbody>
				</table>

				<!-- 결제 정보 // -->
				<h3 class="res2_tit">결제정보</h3>
				<table class="table">
					<colgroup><col width="175px"><col width="400px"><col width="175px"><col width="225"></colgroup>
					<tbody>
						<tr>
							<th scope="row">카드회사</th>
							<td colspan="3" class="fm">
								<select class="card_com" title="카드회사" id="Card" name="card_com">
									<option value="">카드사 선택</option>
									<option value="광주카드">광주카드</option>
									<option value="기타">기타</option>
									<option value="농협NH카드">농협NH카드</option>
									<option value="롯데카드">롯데카드</option>
									<option value="비씨카드">비씨카드</option>
									<option value="산업은행카드">산업은행카드</option>
									<option value="삼성카드">삼성카드</option>
									<option value="수협카드">수협카드</option>
									<option value="신한카드">신한카드</option>
									<option value="씨티카드">씨티카드</option>
									<option value="외환카드">외환카드</option>
									<option value="우리카드">우리카드</option>
									<option value="저축은행(체크카드)">저축은행(체크카드)</option>
									<option value="전북은행카드">전북은행카드</option>
									<option value="제주은행카드">제주은행카드</option>
									<option value="하나(BC)카드">하나(BC)카드</option>
									<option value="하나SK카드">하나SK카드</option>
									<option value="한미카드">한미카드</option>
									<option value="현대카드">현대카드</option>
									<option value="American Express">American Express</option>
									<option value="JCB">JCB</option>
									<option value="KB카드">KB카드</option>
									<option value="MASTER">MASTER</option>
									<option value="NH비씨카드">NH비씨카드</option>
									<option value="VISA">VISA</option>
								</select>
							</td>
						</tr>
						<tr>
							<th scope="row">카드번호</th>
							<td class="fm">
								<input type="text" class="card_num" title="첫번째 자리" id="card_no1" name="CardNo1" maxlength="4" style="ime-mode:disabled" onkeyup="nextF(this,'card_no2')">
								<span class="fmTxt-3">-</span>
								<input type="text" class="card_num" title="두번째 자리" id="card_no2" name="CardNo2" maxlength="4" style="ime-mode:disabled" onkeyup="nextF(this,'card_no3')">
								<span class="fmTxt-3">-</span>
								<input type="password" class="card_num" title="세번째 자리" id="card_no3" name="CardNo3" maxlength="4" autocomplete="new-password" style="ime-mode:disabled" onkeyup="nextF(this,'card_no4')">
								<span class="fmTxt-3">-</span>
								<input type="text" class="card_num" title="네번째 자리" id="card_no4" name="CardNo4" maxlength="4" style="ime-mode:disabled" onkeyup="nextF(this,'card_termYY')">
							</td>
							<th scope="row">유효기간</th>
							<td class="fm">
								<select class="card_term" title="년" name="card_termYY" id="CardYY">
								<option value="2020">2020</option><option value="2021">2021</option><option value="2022">2022</option><option value="2023">2023</option><option value="2024">2024</option><option value="2025">2025</option><option value="2026">2026</option><option value="2027">2027</option><option value="2028">2028</option><option value="2029">2029</option><option value="2030">2030</option></select>
								<span class="fmTxt-1">년</span>
								<select class="card_term" title="월" name="card_termMM" id="CardMM">
								<option value="01">01</option><option value="02">02</option><option value="03">03</option><option value="04">04</option><option value="05">05</option><option value="06">06</option><option value="07">07</option><option value="08">08</option><option value="09">09</option><option value="10">10</option><option value="11" selected="">11</option><option value="12">12</option></select>
								<span class="fmTxt-1">월</span>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- // 결제 정보 -->

				<!-- 결제 금액 // -->
				<h3 class="res2_tit">결제 금액</h3>
				<table class="table">
					<colgroup><col width="175px"><col width="200px"><col width="175px"><col width="225px"><col width="200px"></colgroup>
					<tbody>
						<tr>
								<th scope="row">객실 가격</th>
								<td colspan="3">
									<span id="RoomPrice">0 원</span>
								</td>
								<td rowspan="4" class="totalPricefield">
								<dl class="totalPrice">
									<dt class="total">&nbsp;&nbsp;&nbsp;&nbsp;최종 결제 금액</dt>
									<dd class="total">
										<br><span id="TotalPrice">0 원</span>
									</dd>
								</dl>
							</td>
						</tr>
						<tr>
							<th scope="row">추가 금액</th>
							<td class="fm" colspan="3">
								<span id="AddPrice">0 원</span>
							</td>
						</tr>
						<tr>
							<th scope="row">부가세</th>
							<td class="fm" colspan="3">
								<span id="AdditionalTax">0 원</span>
							</td>
						</tr>
						<tr>
							<th scope="row">적립 예정 마일리지</th>
							<td class="fm" colspan="3">
								<span id="Mileage">0 p</span>
							</td>
						</tr>
					</tbody>
				</table>
				<!-- // 결제 금액 -->


				<!-- 이용 약관 및 결제 취소 규정 동의 // -->
				<div class="cHead chw-3 line">
					<h3 class="res2_tit" id="res2_tit">이용 약관 및 결제 취소 규정 동의</h3>
				</div>
				<!-- 개인정보 -->
				<div class="cHead chw-5">
					<h3 class="title-5 chwTit">개인정보 수집 항목 및 이용 동의</h3>
					<span class="fR chwChk">
						<span class="chkFm ty-3"><input type="checkbox" class="chk" id="agree1" name="chkAgree1" value="Y"><span class="act"></span><label for="chkAgree1">동의(필수)</label></span>
					</span>
				</div>
				<div class="scroll">
					<div class="agrCont">
						<h6 class="agrTit-1">[개인정보 수집항목 및 이용목적]</h6>
						<p class="agrTxt">서비스 이용에 필요한 고객 응대 및 각종 서비스 제공을 위해 아래와 같은 개인정보를 수집하고 있습니다.</p>
						<ul class="agrList-2">
							<li>1. 개인정보 수집 항목</li>
							<li>- 이름, 성별, 연락처, 이메일 주소, 카드번호, 카드유효기간</li>
							<li>2. 개인정보 수집 목적</li>
							<li>- 서비스 이용에 따른 본인 식별, 서비스 이행을 위한 연락 및 안내, 고지사항 전달 등 원활한 양질의 서비스 제공을 위함</li>
							<li>3. 개인정보 보유 및 이용 기간</li>
							<li>- 원칙적으로 개인정보의 수집 목적 또는 제공받은 목적이 달성되면 지체 없이 파기합니다. 다만, 전자상거래 등에서의 소비자보호에 관한 법률 등 관계 법률에 의해 보존할 필요가 있는 경우에는 대금결제 및 재화 등의 공급에 관한 기록은 5년간 보존합니다. 취소하신 예약 건에 대해서도 정보는 동일하게 5년간 보존합니다. </li>
							<li>4. 동의를 거부할 권리 및 동의를 거부할 경우의 불이익</li>
							<li>- 개인정보의 제공에 관한 동의는 원활한 서비스제공을 위함이고 거부할 경우 서비스 제공이 되지 않을 수 있습니다. </li>
						</ul>
						<h6 class="agrTit-1">[개인정보의 보유 및 이용 기간]</h6>
						<ul class="agrList-2">
							<li>원칙적으로 개인정보의 수집목적 또는 제공받은 목적이 달성되면 지체 없이 파기합니다.</li>
							<li>불량회원 관리 및 소비자보호에 관한 법률 등 타 법률에 의해 보존해야 할 필요가 있는 경우에는 일정기간 보유합니다.</li>
						</ul>
					</div>
				</div>

				<!-- 결제 취소 -->
				<div class="cHead chw-5">
					<h3 class="title-5 chwTit">결제 취소 규정 동의</h3>
					<span class="fR chwChk">
						<span class="chkFm ty-3"><input type="checkbox" class="chk" id="agree2" name="chkAgree2" value="Y"><span class="act"></span><label for="chkAgree2">동의(필수)</label></span>
					</span>
				</div>
				<div class="scroll">
					<div class="agrCont">
						<h6 class="agrTit-1">결제 취소 규정 동의</h6>
						<ul class="agrList-2">
							<li>현재 입력하시는 신용카드 정보는 예약 보증을 위해 사용되며 객실 투숙 비용 지불과는 상관이 없습니다. 단, Hotdeal 및 결제 취소/변경 불가 예약의 경우 예약과 동시에 입력하신 신용카드로 객실료가 청구되며, 취소/변경 및 환불은 불가능 합니다.</li>
							<li>선결제 예약의 경우 체크인 시 동일한 결제 카드 지참을 부탁 드립니다.</li>
							<li>사용할 수 없는 카드 번호 입력 시, 고객님의 예약이 사전 통보 없이 임의로 취소될 수 있음을 알려드립니다.</li>
							<li>취소 가능 상품인 경우, 취소는 체크인 1일전 6pm까지 이며, 그 이후에 취소하시거나 연락 없이 안 오실 경우 1박의 비용이 예약 보증된 신용카드로 청구됩니다.</li>
							<!-- <li>패키지 예약 취소는 체크인 1일전까지 가능합니다.</li> -->
						</ul>
					</div>
				</div>

				<div class="btnArea-1">
          <button type="button" id="res2_btn" onClick="reservation();"><span>결제하기</span></button>
				</div>
			</form>
          </div>
        </div>
      </div>
      </td></tr>
      </table>
        <%@include file = "/WEB-INF/views/layout/final.jsp" %>
    </body>
</html>