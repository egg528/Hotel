<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lnag="ko">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
        <title>회원가입</title>
        <style>
          body {
              background-color: #EEEFF1;
              margin: 0;
              height: 100%;
              font-family: 나눔고딕;
          }

          #content {
              position: absolute;
              left: 50%;
              transform: translate(-50%);
              width: 460px;
          }
        </style>
        
    <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
	<script type="text/javascript" src='/resources/js/jquery.form.js'></script>
	<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js?autoload=false"></script>
	<script charset="UTF-8" type="text/javascript" src="http://t1.daumcdn.net/postcode/api/core/190107/1546836247227/190107.js"></script>
	
    <script type="text/javascript">

	function register() {
		var UserId = $('#UserId').val();
		var UserPassword = $('#UserPassword').val();
		var UserName = $('#UserName').val();
		var UserBirth = $('#bir_yy').val()+$('#bir_mm').val()+$('#bir_dd').val();
		var UserPhone = $('#UserPhone').val();
		var UserAddressState = $('#UserAddressState').val();
		var UserAddressCity = $('#UserAddressCity').val();
		var UserAddressStreet = $('#UserAddressStreet').val();
		var UserAddressDetail = $('#UserAddressDetail').val();
		var passwordCheck = $('#passwordCheck').val();
		var UserGender = $('#UserGender').val();
		var UserEmail = $('#UserEmail').val();

		var data = {"UserId" : UserId, 
				"UserPassword" : UserPassword,
				"UserName" : UserName,
				"UserBirth" : UserBirth,
				"UserPhone" : UserPhone,
				"UserEmail" : UserEmail,
				"UserAddressState" : "",
				"UserAddressCity" : "",
				"UserAddressStreet" : "",
				"UserAddressDetail" : "",
				"UserLevel" : "1",
				"UserGrade" : "0",
				"UserMile" : "0",
				"UserGender" : UserGender
		};

		if(UserId == "") {
			alert("아이디를 입력해주세요.");
			$('#UserId').focus();
			return false;
		} else if (UserPassword == "") {
			alert("비밀번호를 입력해주세요.");
			$('#UserPassword').focus();
			return false;
		} else if (UserPassword != passwordCheck) {
			alert("비밀번호를 다시 확인해주세요.")
			$('#passwordCheck').focus();
			return false;
		} else if (UserName == "") {
			alert("이름을 입력해주세요.");
			$('#UserName').focus();
			return false;
		} /* else if (UserBirth == "") {
			alert("생일을 입력해주세요.");
			$('#UserBirth').focus();
			return false; 
		} */else if (UserPhone == "") {
			alert("핸드폰 번호를 입력해주세요.");
			$('#UserPhone').focus();
			return false;
		} /* else if (UserAddressState == "" || UserAddressCity == "" || UserAddressStreet == "" || UserAddressDetail == "") {
			alert("주소를 입력해주세요.");
			return false;
		} */

		$.ajax({
			type : "POST",
			url : "/memeber/registAction.do",
			data : data,
			datatype : 'json',
			success : function(data) {
				var result = data["resultMsg"];
				if(result == "success"){
					alert("회원가입이 완료되었습니다!");
					location.href="/login.do";
				}else if(result == "IDDup"){
					alert("이미 사용중인 아이디입니다.");
					$('#UserId').focus();
				}
			}
		})
	}
		
	</script>
	  
	</head>


    <body>
        <!-- header -->
        <div class=header>
            <a href="index.html"><img src="/resources/image/moon.png" width="80" height="80s"></a>
            <nav>
              <span><a href="intro.html">호텔 소개</a></span>
              <span><a href="room.html">객실</a></span>
              <span><a href="restaurant.html">레스토랑</a></span>
              <span><a href="res.html">예약</a></span>
              <span><a href="res_confirm.html">예약 확인</a></span>
              <span><a href="qna.html">고객문의</a></span>
              <span><a href="facility.html">편의시설</a></span>
              <span>
	        	<c:choose>
	  				<c:when test="${member != null}"><a href="/logout.do">로그아웃</a></c:when>
	   				<c:otherwise><a href="/login.do">로그인</a></c:otherwise>
	   			</c:choose>
	          </span>
            </nav>
        </div>

        <!-- wrapper -->
        <div id="wrapper">
            <!-- content-->
            <div id="content">
                <!-- ID -->
                <h4 class="mini_title">웹사이트 정보 입력</h4>
                <div>
                    <h3 class="join_title">
                        <label for="id">아이디</label>
                    </h3>
                    <span class="box int_id">
                        <input type="text" id="UserId" class="int" maxlength="20">
                        <input type="button" id="id" onclick="__" class="btn_idcheck" value="중복 체크">
                    </span>
                </div>

                <!-- PW1 -->
                <div>
                    <h3 class="join_title"><label for="pswd1">비밀번호</label></h3>
                    <span class="box int_pass">
                        <input type="password" id="UserPassword" class="int" maxlength="20">
                    </span>
                </div>

                <!-- PW2 -->
                <div>
                    <h3 class="join_title"><label for="pswd2">비밀번호 재확인</label></h3>
                    <span class="box int_pass_check">
                        <input type="password" id="passwordCheck" class="int" maxlength="20">
                    </span>
                </div>


                <h4 class="mini_title">회원정보 입력</h4>
                <!-- NAME -->
                <div>
                    <h3 class="join_title"><label for="name">이름</label></h3>
                    <span class="box int_name">
                        <input type="text" id="UserName" class="int" maxlength="20">
                    </span>
                </div>

                <!-- BIRTH -->
                <div>
                    <h3 class="join_title"><label for="yy">생년월일</label></h3>

                    <div id="bir_wrap">
                        <!-- BIRTH_YY -->
                        <div id="bir_yy">
                            <span class="box">
                                <input type="text" id="yy" class="int" maxlength="4" placeholder="년(4자)">
                            </span>
                        </div>

                        <!-- BIRTH_MM -->
                        <div id="bir_mm">
                            <span class="box">
                                <select id="mm" class="sel">
                                    <option>월</option>
                                    <option value="01">1</option>
                                    <option value="02">2</option>
                                    <option value="03">3</option>
                                    <option value="04">4</option>
                                    <option value="05">5</option>
                                    <option value="06">6</option>
                                    <option value="07">7</option>
                                    <option value="08">8</option>
                                    <option value="09">9</option>
                                    <option value="10">10</option>
                                    <option value="11">11</option>
                                    <option value="12">12</option>
                                </select>
                            </span>
                        </div>

                        <!-- BIRTH_DD -->
                        <div id="bir_dd">
                            <span class="box">
                                <input type="text" id="dd" class="int" maxlength="2" placeholder="일">
                            </span>
                        </div>
                    </div>
                </div>

                <!-- GENDER -->
                <div>
                    <h3 class="join_title"><label for="gender">성별</label></h3>
                    <span class="box gender_code">
                        <select id="UserGender" class="sel">
                            <option>성별</option>
                            <option value="M">남자</option>
                            <option value="F">여자</option>
                        </select>
                    </span>
                </div>


                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="UserPhone" class="int" maxlength="16" placeholder="전화번호 입력">
                    </span>
                </div>


                <!-- EMAIL -->
                <div>
                    <h3 class="join_title"><label for="email">이메일 주소</label></h3>
                    <span class="box int_email">
                        <input type="email" id="UserEmail" class="int" maxlength="100" placeholder="이메일 주소 입력">
                    </span>
                </div>

                  <!-- ADDRESS -->
                <div>
                    <h3 class="join_title"><label for="address">주소</label></h3>
                </div>

                <input type="text" id="sample6_postcode" class="d_form std" placeholder="우편번호">
                <input type="button" onclick="sample6_execDaumPostcode()" class="btn_zip" value="우편번호 찾기"><br>
                <input type="text" id="sample6_address" class="d_form large" placeholder="주소"><br>
                <input type="text" id="sample6_detailAddress" class="d_form mini" placeholder="상세주소">
                <input type="text" id="sample6_extraAddress" class="d_form mini" placeholder="참고항목">
                <br>

                <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <script>
                    function sample6_execDaumPostcode() {
                        new daum.Postcode({
                            oncomplete: function(data) {
                                var addr = '';
                                var extraAddr = '';

                                if (data.userSelectedType ==='R') {
                                    addr = data.jibunAddress;
                                }
                                else {
                                    addr = data.jibunAddress;
                                }
                                if (data.userSelectedType === "R") {
                                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                                        extraAddr += data.bname;
                                    }
                                    if (data.buildingName !== '' && data.apartment === 'Y') {
                                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                                    }
                                    if (extraAddr !== '') {
                                        extraAddr = ' (' + extraAddr + ')';
                                    }
                                    document.getElementById("sample6_extraAddress").value = extraAddr;
                                }
                                else {
                                    document.getElementById("sample6_extraAddress").value = '';
                                }
                                document.getElementById('sample6_postcode').value = data.zonecode;
                                document.getElementById("sample6_address").value = addr;
                                document.getElementById("sample6_detailAddress").focus();
                            }
                        }).open();
                  }
                </script>

                <!-- JOIN BTN-->
                <div class="btn_area">
                    <button type="button" id="btnJoin" onClick="register();">
                        <!-- <input type="submit" name="" value="">  나중에 사용-->
                        <span>가입하기</span>
                    </button>
                </div>



            </div>
            <!-- content-->

        </div>
          <!-- wrapper -->
    <script src="main.js"></script>
    </body>
</html>