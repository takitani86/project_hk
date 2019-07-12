<%@ page import="com.hk.one.dto.MemberDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기 결과</title>
</head>
<body>
	<h3>비밀번호 찾기 결과</h3>
	<c:choose>
		<c:when test="${msg eq 0}">
			<meta http-equiv='Refresh' content='5; url=../home.do'>
			사용자 계정에 입력된 이메일 주소로 비밀번호 변경 폼이 전송되었습니다.
			메일을 확인 바랍니다. 감사합니다.
			(5초 후 메인 페이지로 자동 이동합니다.)
			<a href="../home.do">메인 페이지로 돌아가기</a>
		</c:when>
		<c:when test="${msg eq 1}">
			<meta http-equiv='Refresh' content='5; url=to_find_PwForm.do'>
			<div>
			사용자 계정에 입력된 정보와 입력해주신 정보가 맞지 않습니다.
			확인하시고 다시 입력해 주세요. 감사합니다.
			(5초 후 비밀번호 찾기 페이지로 자동 이동합니다.)
			<a href="to_find_PwForm.do">비밀번호 찾기 페이지로 돌아가기</a>
			</div>
		</c:when>
	</c:choose>
</body>
</html>