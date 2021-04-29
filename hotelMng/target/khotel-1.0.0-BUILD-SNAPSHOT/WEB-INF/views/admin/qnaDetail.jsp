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
		            <h2>게시물 보기</h2>
					<table class="table">
						<tr>
							<th>작성자</th>
							<td>${dto.QNAWRITER}</td>
						</tr>
						<tr>
							<th>작성일자</th>
							<td>${dto.QNAREGISTERDATE}</td>
						</tr>
						<tr>
							<th>제목</th>
							<td>${dto.QNAWRITER}</td>
						</tr>
						<tr>
							<th>분류</th>
							<td>${dto.QNACODE}</td>
						</tr>
						<tr>
							<th>내용</th>
							<td>${dto.QNACONTENT}</td>
						</tr>
					</table>

<%--		            <form id="form1" name = "form1" method="post">--%>

<%--		                <h3 class="tit_">● 작성자 정보</h3>--%>
<%--		                <div class="col_one_third">--%>
<%--		                    <h3 class="join_title">작성자</h3>--%>
<%--		                    <div class="view_d_form large">${dto.QNAWRITER}</div>--%>
<%--		                </div>--%>

<%--		                <div class="col_one_third">--%>
<%--		                    <h3 class="join_title">작성일자</h3>--%>
<%--		                    <div class="view_d_form large">${dto.QNAREGISTERDATE}</div>--%>
<%--		                </div>--%>

<%--		                <div class="clear"></div>--%>

<%--		                <h3 class="tit_">● 문의사항</h3>--%>

<%--		                <div class="col_two_third">--%>
<%--		                    <h3 class="join_title">제목</h3>--%>
<%--		                    <div class="view_d_form large">${dto.QNATITLE}</div>--%>
<%--		                </div>--%>

<%--		                <div class="clear"></div>--%>

<%--		                <div class="col_full">--%>
<%--		                    <h3 class="join_title_write">내용</h3>--%>
<%--		                    <div class="view_d_form large_write">${dto.QNACONTENT}</div>--%>
<%--		                </div>--%>

<%--		            </form>--%>

		            <div>
		                <input type="hidden" name = "QNACODE" value="${dto.QNACODE}">
		                    <button type ="button"  id ="btnUpdate" onclick="location.href='/qna/rewrite.do?QNACODE=${dto.QNACODE}'">수정</button> //삭제로 바꿔주세요
		                    <button type ="button"  id ="btnList" onclick="location.href='/qna/list.do'">목록</button>
		            </div>

		        </div>
		    </div>
		    </body>
</html>