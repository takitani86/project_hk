<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>

<html>
<head>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="<c:url value='/resources/AdminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css'/>">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="<c:url value='/resources/AdminLTE/bower_components/font-awesome/css/font-awesome.min.css'/>">
<!-- Ionicons -->
<link rel="stylesheet"
	href="<c:url value='/resources/AdminLTE/bower_components/Ionicons/css/ionicons.min.css'/>">
<!-- Theme style -->
<link rel="stylesheet"
	href="<c:url value='/resources/AdminLTE/dist/css/AdminLTE.min.css'/>">
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
<link rel="stylesheet"
	href="<c:url value='/resources/AdminLTE/dist/css/skins/skin-blue.min.css'/>">
<!-- jQuery 3 -->
<script
	src="<c:url value='/resources/AdminLTE/bower_components/jquery/dist/jquery.min.js'/>"></script>
<!-- Bootstrap 3.3.7 -->
<script
	src="<c:url value='/resources/AdminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js'/>"></script>
<!-- AdminLTE App -->
<script
	src="<c:url value='/resources/AdminLTE/dist/js/adminlte.min.js'/>"></script>
<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<title>Home</title>
</head>
<body class="hold-transition skin-blue sidebar-mini">
	<h1>통합 주문관리서비스 기능구현중</h1>
	<p>
		<a href="<c:url value='productList.do?countProductPage=1'/>">상품리스트</a>
	</p>
	<p>
		<a href="<c:url value='member/memberList.do'/>">회원목록</a>
	</p>
	<p>
		<a href="<c:url value='member/board/member_board.do'/>">점주 게시판</a>
	</p>
	<p>
		<a href="<c:url value='admin/board/admin_board.do'/>">관리자 게시판</a>
	</p>
	<p>
		<a href="<c:url value='member/payment.do'/>">결제테스트</a>
	</p>
	<p>
		<a href="<c:url value='chatAdmin.do'/>">관리자채팅</a>
	</p>
	<p>
		<a href="<c:url value='chat.do'/>">채팅</a>
	</p>
	<p>
		<a href="<c:url value='member/menu.do'/>">메뉴판</a>
	</p>
	<sec:authorize access="isAnonymous()">
		<h5>
			<a href='<c:url value="/secu/loginPage.do"/>'>LOGIN</a> 로그인 해주세요.
		</h5>
	</sec:authorize>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication var="user" property="principal" />
		<h3>${user.username}님,반갑습니다.</h3>
암호 : ${user.password} <br>
활성화 여부: ${user.enabled}<br>
이메일: ${user.secu_email}<br>
		<form action="<c:url value='/logout.do'/>" method="POST">
			<button type="submit">LOGOUT</button>
		</form>
	</sec:authorize>
</body>
</html>
