<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="../resources/AdminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
<link rel="stylesheet"
	href="../resources/AdminLTE/bower_components/font-awesome/css/font-awesome.min.css">
<link rel="stylesheet"
	href="../resources/AdminLTE/bower_components/Ionicons/css/ionicons.min.css">
<link rel="stylesheet"
	href="../resources/AdminLTE/bower_components/datatables.net-bs/css/dataTables.bootstrap.min.css">
<link rel="stylesheet"
	href="../resources/AdminLTE/dist/css/AdminLTE.min.css">
<link rel="stylesheet"
	href="../resources/AdminLTE/dist/css/skins/_all-skins.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<link
	href="https://fonts.googleapis.com/css?family=Nanum+Gothic:400,700,800&display=swap&subset=korean"
	rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>제목</title>
<style>
#header {
	width: 100%;
	height: 50px;
	text-align: center;
	background-color: #3C8DBC;
}

#left {
	float: left;
	width: 15%;
	background-color: #222222;
}

#main {
	float: left;
	width: 85%;
	background-color: #ecf0f5;
}

#footer {
	width: 100%;
	height: 50px;
	text-align: center;
	background-color: white;
	clear: both;
}

#main {
	min-height: 600px;
}
</style>
</head>
<body>
	<div style="width: 100%; height: 100%;">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="left">
			<tiles:insertAttribute name="left" />
		</div>
		<div id="main">
			<tiles:insertAttribute name="body" />
		</div>
		<div id="footer">
			<tiles:insertAttribute name="footer" />
		</div>
	</div>

	<script type="text/javascript">
		$(function() {

		});
	</script>
</body>
</html>