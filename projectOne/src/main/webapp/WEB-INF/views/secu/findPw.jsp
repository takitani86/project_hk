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
<title>비밀번호 찾기</title>
<script type="text/javascript">
	function search(){
		if((sendPw.mem_id.value != null)&&(sendPw.mem_name.value != null)&&(sendPw.mem_email.value != null)) {
			sendPw.submit();
		} else if(sendPw.mem_id.value == null) {
			alert("아이디를 입력하세요.");
		} else if(sendPw.mem_name.value == null) {
			alert("이름을 입력하세요.");
		} else if(sendPw.mem_email.value == null) {
			alert("이메일 주소를 입력하세요.");
		}
	}
	function login() {
		window.open("login.do", "_self", "");
	}
</script>
</head>
<body>
	<h1>비밀번호 재발급</h1>
	<h5>아래 항목을 정확히 입력하시면 이메일을 통해 비밀번호 재발급이 가능합니다.</h5>
	<hr width="500px" align="left" noshade>
	<form action="sendPw.do" name="sendPw" method="post">
		<div id="findPwForm">
			<label for="mem_id" class="id_label">아이디</label>
				<input type="text" id="mem_id" name="mem_id" placeholder="아이디 입력" /> <br />
			<label for="mem_name" class="name_label">이름</label>
				<input type="text" id="mem_name" name="mem_name" placeholder="이름 입력" /> <br />
			<label for="mem_email" class="email_label">E-Mail</label>
				<input type="email" id="mem_email" name="mem_email" placeholder="이메일 주소 입력" /> <br />
		</div>
		<hr width="500px" align="left" noshade>
        <div>
           * 소셜 계정으로 가입하신 회원은 소셜 계정으로 바로 로그인하실 수 있습니다.
        </div>
		<input type="button" value="비밀번호 찾기" onclick="search()" />
	</form>
	<div>
		<a href="javascript:loginpage()">로그인 페이지로 돌아가기</a>
	</div>
</body>
</html>