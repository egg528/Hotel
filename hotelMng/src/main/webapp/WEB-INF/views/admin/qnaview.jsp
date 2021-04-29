<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
	<head>
	        <style>
	            * {font-family: 'Noto Sans KR', sans-serif;}
	        </style>
	        <meta charset="UTF-8">
	        <title>QnA View</title>
	        <link rel="stylesheet" href="/resources/css/style_admin.css" type="text/css">
	    </head>
		<body>
		    <%@include file = "/WEB-INF/views/admin/admin_header.jsp" %>
		    <div class=contain>

		        <div class=contents>
		            <br>
		            <h2>문의사항 상세 보기</h2>
			            <table class="table">
							<tr>
								<th>작성자</th>
								<td><a href="/admin/memberDetail.do?userId=${dto.QNAWRITER}">${dto.QNAWRITER}</td>
							</tr>
							<tr>
								<th>작성일자</th>
								<td>${dto.QNAREGISTERDATE}</td>
							</tr>
							<tr>
								<th>제목</th>
								<td>${dto.QNAWRITER}</td>
							</tr>
							<%-- <tr>
								<th>분류</th>
								<td>${dto.QNACODE}</td>
							</tr> --%>
							<tr>
								<th>내용</th>
								<td>${dto.QNACONTENT}</td>
							</tr>
						</table>

		            <div>
		                <input type="hidden" name = "QNACODE" value="${dto.QNACODE}">
		                    <button type ="button" class="submit-btn" id = "btnDelete" onclick="location.href='/admin/delete.do?QNACODE=${dto.QNACODE}'">삭제</button>
		                    <button type ="button" class="submit-btn" id ="btnList" onclick="location.href='/admin/qnaList'">목록</button>
		            </div>

		        </div>
		    </div>
		    </body>
</html>