<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
html, body { margin:0; padding:0; height:100%; }
#wrap {
    height:100%;
}
#header {
    position:relative;
    width:100%;
    height:45px;
    background-color:#eaeaea;
}
#body {
    margin:-45px 0 -50px;
    width:100%;
    min-height:100%;
}
#body #container {
    padding:45px 0 50px;
}
  
#footer {
    width:100%;
    height:50px;
    background-color:#eaeaea;
}
</style>
</head>
<body>
	<table id="wrapper" style="width:100%">
		<tr id="body">
			<td style="width:10%;"><tiles:insertAttribute name="leftSide"/></td>
			<td><tiles:insertAttribute name="content"/></td>
		</tr>
	</table>
</body>
</html>