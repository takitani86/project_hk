<%@ page import="com.hk.one.dto.MemberDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비번찾기 테스트</title>
<script type="text/javascript">
	function search(){
		if(())
	}
</script>
</head>
<body>
	<form action="find_Pw.do" name="findPw" method="post">
		<input type="text" id="mem_id" name="mem_id" placeholder="아이디 입력" /> <br />
		<input type="email" name="mem_email" placeholder="이메일 주소 입력" /> <br />
		<input type="button" value="비밀번호 찾기" onclick="search()" />
	</form>
</body>
</html>