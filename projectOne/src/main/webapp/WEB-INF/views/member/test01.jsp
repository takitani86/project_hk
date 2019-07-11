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
		if((sendPw.mem_id.value != null)&&(sendPw.mem_email.value != null)) {
			sendPw.submit();
		} else if(sendPw.mem_id.value == null) {
			alert("아이디를 입력하세요.");
		} else if(sendPw.mem_email.value == null) {
			alert("이메일 주소를 입력하세요.");
		}
	}
	function showMsg(m) {
		if(m == 0) {
			window.open("sendPw.do", "_self", "");	
		} else if(m == 1) {
			alert("입력하신 정보가 등록하신 정보와 다릅니다. 확인하시고 다시 입력해 주세요.");
		}
	}
	function login() {
		window.open("login.do", "_self", "");
	}
</script>
</head>
<body onload="showMsg(${msg})">
	<form action="sendPw.do" name="sendPw" method="post">
		<input type="text" id="mem_id" name="mem_id" placeholder="아이디 입력" /> <br />
		<input type="email" name="mem_email" placeholder="이메일 주소 입력" /> <br />
		<input type="button" value="비밀번호 찾기" onclick="search()" />
	</form>
	<div>
		<a href="javascript:login()">로그인 페이지로 돌아가기</a>
	</div>
</body>
</html>