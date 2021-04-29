<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"  %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html lang="ko">
  <head>
    <meta charset="utf-8">
    <link rel="stylesheet" href="/resources/css/style_mypage.css" type="text/css">
    <title>My Information</title>


    <script type="text/javascript">
    var sessionUserId = '${member.userId}';
    if(sessionUserId == null || sessionUserId == 'null' || sessionUserId=="" || sessionUserId == "1"){
      alert("로그인 후 이용해주세요.");
      location.href="/login.do";
    }
    
	function memberdelete() {
		var confirm_test = confirm("회원 탈퇴하시겠습니까?");
		if(confirm_test == true) {
			location.href="/mypage/memberDelete";
			alert("탈퇴되었습니다.");
		}
		location.href="/main";
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
        <h1>개인 정보</h1>
        <table class="table">
            <tr>
                <th class="pd">이름</th>
                <td>${member.userName}</td>
            </tr>
            <tr>
                <th>아이디</th>
                <td>${member.userId}</td>
            </tr>
            <tr>
                <th>등급</th>
                <td>${member.userGrade}</td>
            </tr>
            <tr>
                <th>전화번호</th>
                <td>${fn:substring(member.userPhone,0,3)} - ${fn:substring(member.userPhone,3, 7)} - ${fn:substring(member.userPhone,7,11)}</td>
            </tr>
            <tr>
                <th>이메일</th>
                <td>${member.userEmail}</td>
            </tr>
            <tr>
                <th>마일리지</th>
                <td>${member.userMile}</td>
            </tr>
            <tr>
                <th>생년월일</th>
                <td>${member.userBirth}</td>
            </tr>
            <tr>
                <th>주소</th>
                <td>${member.userPostCode} ${member.userAddress} ${member.userDetailAddress} ${member.userExtraAddress}</td>
            </tr>
        </table>

        <br>
        <div class="btn_area">
                    <button type="button" class="submit-btn" id="res_btn" onClick="memberdelete();">
                    <span>회원 탈퇴하기</span>
                  </button>
                  </div>
        </div>
    <%@include file = "/WEB-INF/views/layout/final.jsp" %>
  </div>

</body>
</html>