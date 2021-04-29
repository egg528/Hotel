<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lnag="ko">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
        <title>SIGN UP</title>
        <style>
          body {
              background-color: #fbfcf5;
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
	function idcheck() {
		var UserId = $('#UserId').val();
		var data = {"UserId" : UserId};
		$.ajax({
			type : "POST",
			url : "/memeber/idcheck.do",
			data : data,
			datatype : 'json',
			success : function(data) {
				var result = data["resultMsg"];
				if(result == "success"){
					alert("사용 가능한 아이디입니다.");
				}else if(result == "fail"){
					alert("이미 사용중인 아이디입니다.");
					$('#UserId').focus();
				}
			}
		})
	}
    
	function register() {
		var UserId = $('#UserId').val();
		var UserPassword = $('#UserPassword').val();
		var UserName = $('#UserName').val();
		var UserBirth = $('#UserBirth').val();
		var UserPhone = $('#UserPhone').val();
		var UserPostCode = $('#UserPostCode').val();
		var UserAddress = $('#UserAddress').val();
		var UserDetailAddress = $('#UserDetailAddress').val();
		var UserExtraAddress = $('#UserExtraAddress').val();
		var passwordCheck = $('#passwordCheck').val();
		var UserGender = $('#UserGender').val();
		var UserEmail = $('#UserEmail').val();

		var data = {"UserId" : UserId, 
				"UserPassword" : UserPassword,
				"UserName" : UserName,
				"UserBirth" : UserBirth,
				"UserPhone" : UserPhone,
				"UserEmail" : UserEmail,
				"UserPostCode" : UserPostCode,
				"UserAddress" : UserAddress,
				"UserDetailAddress" : UserDetailAddress,
				"UserExtraAddress" : UserExtraAddress,
				"UserLevel" : "1",
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
		} else if (UserEmail == "") {
			alert("이메일을 입력해주세요.");
			$('#UserEmail').focus();
			return false;
		} else if (UserBirth == "") {
			alert("생년월일을 입력해주세요.");
			$('#UserBirth').focus();
			return false; 
		} else if (UserPhone == "") {
			alert("핸드폰 번호를 입력해주세요.");
			$('#UserPhone').focus();
			return false;
		} else if(UserGender == "") {
			alert("성별을 입력해주세요.");
			$('#UserGender').focus();
			return false;
		} else if (UserPostCode == "") {
			alert("주소를 입력해주세요.");
			return false;
		}

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
					alert("아이디 중복을 확인하세요.");
					$('#UserId').focus();
				}
			}
		})
	}
		
	</script>
	  
	</head>


    <body>
        <!-- header -->
        <%@include file = "/WEB-INF/views/layout/header.jsp" %>

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
                        <input type="button" id="id" onclick="idcheck()" class="btn_idcheck" value="중복 확인">
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
                    <div id="bir_yy">
                    <span class="box int_birth">
                        <input type="text" id="UserBirth" class="int" maxlength="6" placeholder="주민등록번호 앞의 6자리">
                	</span>
                	</div>
                </div>

                <!-- GENDER -->
                <div>
                    <h3 class="join_title"><label for="gender">성별</label></h3>
                    <span class="box gender_code">
                        <select id="UserGender" class="sel">
                            <option value="">성별</option>
                            <option value="M">남자</option>
                            <option value="F">여자</option>
                        </select>
                    </span>
                </div>


                <!-- MOBILE -->
                <div>
                    <h3 class="join_title"><label for="phoneNo">휴대전화</label></h3>
                    <span class="box int_mobile">
                        <input type="tel" id="UserPhone" class="int" maxlength="11" placeholder="전화번호 '-'구분없이 입력">
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

                <input type="text" id="UserPostCode" class="d_form std" placeholder="우편번호">
                <input type="button" onclick="execDaumPostcode()" class="btn_zip" value="우편번호 찾기"><br>
                <input type="text" id="UserAddress" class="d_form large" placeholder="주소"><br>
                <input type="text" id="UserDetailAddress" class="d_form mini" placeholder="상세주소">
                <input type="text" id="UserExtraAddress" class="d_form mini" placeholder="참고항목">
                <br>

                <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
                <script>
                    function execDaumPostcode() {
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
                                    document.getElementById("UserExtraAddress").value = extraAddr;
                                }
                                else {
                                    document.getElementById("UserExtraAddress").value = '';
                                }
                                document.getElementById("UserPostCode").value = data.zonecode;
                                document.getElementById("UserAddress").value = addr;
                                document.getElementById("UserDetailAddress").focus();
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