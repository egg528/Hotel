<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
.content{
		font-size: 15px;
		padding: 10px;
		list-style: none;
	}
	#first{
		list-style: none;
		padding: 0px;
	}
	.content li::before {
		content: "\2022";
		color: black;
		font-weight: bold;
		display: inline-block; 
		width: 1em;
		margin-left: -1em;
	} 
	
	
	.menu{
		font-size: 20px;
	}
</style>
<script type="text/javascript">
	$(document).ready(function(){
		$('.menu').click(function () {	
			$(this).parent().children('ul.content').toggle(200);
		});
		$(function(){ //페이지 보였을 때, 하위메뉴들 없이 큰 메뉴만 보이게 하기... (이거 없으면 다 펼쳐져있음)
			$('.menu').parent().children('ul.content').toggle(200);
		}); 
	});
</script>
</head>
<body>
<table id="sideMenu" style=width:100%; border="1">
	<!-- <tr>
		<td>OOO님 로그아웃</td>
	</tr> -->
	<tr>
		<td><h4><a href="/adminMain" >HOME</a></h4></td>
	</tr>
<!-- 	<tr>
		<td class="menu"><b>상품관리</b>
	</tr>
	<tr>
		<td class="menu"><b>회원관리</b>
	</tr>
	<tr>
		<td>
			<table class="content" style="padding-left: 20px;">
				<tr>
					<td>전체누적
				</tr>
				<tr>
					<td>신규신청
				</tr>
				<tr>
					<td>대기중
				</tr>
				<tr>
					<td>정상이용중
				</tr>
				<tr>
					<td>보류
				</tr>
				<tr>
					<td>사용중지
				</tr>
				<tr>
					<td>일시정지
				</tr>
				<tr>
					<td>미납중지
				</tr>
			</table>
	</tr>
	<tr>
		<td class="menu"><b>관리자설정</b>
	</tr> -->
	
	
<tr>
		<td>
			<ul style="padding: 0px;">
				<li id="first"><label class="menu"><b><a href="/productManagedList" >상품관리</a></b></label>
					<!-- <ul class="content">
						<li>내용1</li>
							<li>내용2</li>
								<li><label class="menu">작은메뉴1</label>
									<ul class="content">
										<li>내용3</li>
										<li>내용4</li>
										<li><label class="menu">작은메뉴2</label>
									<ul class="content">
										<li>내용5</li>
										<li>내용6</li>
									</ul>
								</li>
							</ul>
						</li>
					</ul> -->
				</li>
					
				<li id="first"><label class="menu"><b>회원관리</b></label>
					<ul class="content">
						<li>전체누적</li>
						<li>신규신청</li>
						<li>대기중</li>
						<li>정상이용중</li>
						<li>보류</li>
						<li>사용중지</li>
						<li>일시정지</li>
						<li>미납중지</li>
					</ul>
				</li>
				
				<li id="first"><label class="menu"><b><a href="/adminMemberList" >관리자설정</a></b></label>
				</li>
			</ul>
		</td>
	</tr>
</table>

</body>
</html>