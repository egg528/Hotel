<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <style>
      body {
        margin: 0;
        background-color: #fbfcf5;
        font-family: 나눔고딕;
      }
    </style>
  
  <meta charset="utf-8">
  <link rel="stylesheet" href="/resources/css/style.css" type="text/css">
  <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
  <link href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" rel="stylesheet">
  
  <title>SIGN IN</title>
  
  
  <script type="text/javascript">
  
  function goRegist() {
	  document.location.href = '/memeber/regist.do';
  }
  
  function login() {
	  var id = $('#UserId').val();
	  var password = $('#UserPassword').val();
	  var data = {"UserId" : id, "UserPassword" : password};
	  if(id=="") {
		  alert("아이디를 입력해주세요.");
		  return false;
	  }else if (password=="") {
	      alert("비밀번호를 입력해주세요.");
	      $('#UserPassword').focus();
	      return false;
	  }

	  $.ajax({
			type : "POST",
			url : "/memeber/loginAction.do",
			data : data,
			datatype : 'json',
			success : function(data) {
				var id = $('#UserId').val();
				var result = data["resultMsg"];
				if(result == "Success"){
					alert(id + "님, 안녕하세요!")
					location.href="/main";
				}else if(result == "Manager"){
					location.href="/admin";		
				}else if(result == "IDfail"){
					alert("아이디가 존재하지 않습니다.");
				}else if(result == "Passwordfail"){
					alert("비밀번호가 일치하지 않습니다.");
				}else{
					location.href="/"+result;
				}
			}
	
	  })
  }
  </script>
  
  
  
</head>

<body>
  <%@include file = "/WEB-INF/views/layout/header.jsp" %>

  <div class="login-form">
    <form id="target" action="/memeber/join">
      <input type="text" name="UserId" id="UserId" class="text-field" placeholder="ID"><br>
      <input type="password" name="UserPassword" id="UserPassword" class="text-field" placeholder="Password"><br>
     </form>
      <input type="submit" value="SIGN IN" class="submit-btn" onClick="login();">
      <input type="submit" value="SIGN UP" class="submit-btn" onClick="goRegist();">
  </div>
</body>
</html>
