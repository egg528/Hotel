<%@ page language="java" pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="ko">
    <head>
        <meta charset="UTF-8">
        <link rel="stylesheet" href="/resources/css/style_admin.css" type="text/css">
        <script type="text/javascript" src="/resources/js/jquery-1.11.3.min.js"></script>
        <style>
            .banner_main{
                background-image: url(/resources/image/outdoor.jpg);
                background-size: 1920px 850px;
                margin-top: auto;
                min-width: 700px;
                height: 770px;
                padding: 8px;
            }

        </style>
        <title>Admin Page</title>
        
         <script type="text/javascript">
        	var sessionLevel = '${member.userLevel}';
	
			if(sessionLevel == null || sessionLevel == 'null' || sessionLevel=="" || sessionLevel == "1"|| sessionLevel == "3"){
				alert("관리자 권한이 없습니다.");
				location.href="/main";
			}
		</script>

    </head>
    <body>
        <%@include file = "/WEB-INF/views/admin/admin_header.jsp" %>
        <div class=banner_main></div>
        <div class=contents>
            <p> 안녕하세요. 그룹 루시드는 직원 여러분의 편의와 복지를 위해 힘쓰겠습니다.</p>
            <p> 오늘도 최고의 품격과 신뢰를 바탕으로 고객에게 최고의 서비스를 제공합시다.</p>
            <b><p> 식사시간 : AM 11:30 ~ PM 1:30</p>
            <p> 영업시간 : AM 10:00 ~ PM 9:00</p></b>
			</div>
        <%@include file = "/WEB-INF/views/admin/admin_final.jsp" %>
    </body>
</html>