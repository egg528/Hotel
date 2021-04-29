<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
	</script>
	  <style>
		  .j{
		    font-size: 10px;
		  }
	  </style>
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
        <h1>Lucid Reward</h1>
        <p> ${member.userName}님의 Lucid Reward 등급은 ${member.userGrade} 입니다.</p>
        <table class="table" style="text-align: center">
            <thead>
            <tr class="h">
                <td class="name">등급명</td>
                <td class="d">New</td>
                <td class="d">Silver</td>
                <td class="d">Gold</td>
                <td class="d">Platinum</td>
                <td class="d">Diamond</td>
                <td class="d">Vip</td>
                <td class="d">Vvip</td>
            </tr>
            </thead>
            <tbody>
            <tr class="r">
              <td>조건</td>
              <td class="j">무료가입<br> 즉시</td>
              <td class="j">마일리지<br> 1p <br>이상</td>
              <td class="j">마일리지<br> 10,000p <br>이상</td>
              <td class="j">마일리지<br> 30,000p <br>이상</td>
              <td class="j">마일리지<br> 60,000p <br>이상</td>
              <td class="j">마일리지<br> 100,000p <br>이상</td>
              <td class="j">마일리지<br> 150,000p <br>이상</td>
            </tr>
            <tr class="r">
                <td>Wi-Fi</td>
                <td>○</td>
                <td>○</td>
                <td>○</td>
                <td>○</td>
                <td>○</td>
                <td>○</td>
                <td>○</td>
            </tr>
            <tr class="r">
                <td>웰컴 드링크</td>
                <td>-</td>
                <td>○</td>
                <td>○</td>
                <td>○</td>
                <td>○</td>
                <td>○</td>
                <td>○</td>
            </tr>
            <tr class="r">
                <td>체크아웃 연장 시간</td>
                <td>-</td>
                <td>-</td>
                <td>○</td>
                <td>○</td>
                <td>○</td>
                <td>○</td>
                <td>○</td>
            </tr>
            <tr class="r">
                <td>얼리 체크인</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>○</td>
                <td>○</td>
                <td>○</td>
                <td>○</td>
            </tr>
            <tr class="r">
                <td>객실 업그레이드</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>○</td>
                <td>○</td>
            </tr>
            </tbody>
        </table>
    </div>
    <%@include file = "/WEB-INF/views/layout/final.jsp" %>
</div>

</body>
</html>