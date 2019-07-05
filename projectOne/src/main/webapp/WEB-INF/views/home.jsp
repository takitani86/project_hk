<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world! 
	Hi world!
	pzl
</h1>

<P>  The time on the server is ${serverTime}. </P>
<p><a href="productList.do?countProductPage=1">상품리스트</a></p>
<p><a href="memberList.do">회원목록</a>
<p><a href="board/member_board.do">점주 게시판</a>
<p><a href="board/admin_board.do">관리자 게시판</a>
</body>
</html>
