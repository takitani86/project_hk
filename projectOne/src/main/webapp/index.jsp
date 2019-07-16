<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ page session="false" %>

<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	통합 주문관리서비스 기능구현중
</h1>


<p><a href="<c:url value='productList.do?countProductPage=1&sort=1'/>">상품리스트</a></p>
<p><a href="<c:url value='member/memberList.do'/>">회원목록</a>
<p><a href="<c:url value='member/board/member_board.do'/>">점주 게시판</a>
<p><a href="<c:url value='admin/board/admin_board.do'/>">관리자 게시판</a>
<p><a href="<c:url value='member/payment.do'/>">결제테스트</a>
<p><a href="<c:url value='member/menu.do'/>">메뉴판</a>
<sec:authorize access="isAnonymous()">
    <h5><a href='<c:url value="/secu/loginPage.do"/>'>LOGIN</a> 로그인 해주세요.</h5>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
<sec:authentication var="user" property="principal"/>
<h3>${user.username}</h3>님, 반갑습니다.
암호 : ${user.password} <br>
활성화 여부: ${user.enabled}<br>
이메일: ${user.secu_email}<br>
	<form action="<c:url value='/logout.do'/>" method="POST">
		<button type="submit">LOGOUT</button>
	</form>
</sec:authorize>
</body>
</html>
