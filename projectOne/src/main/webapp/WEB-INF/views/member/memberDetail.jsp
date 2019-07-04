<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 상세정보 게시판</title>
</head>
<body>
	<table border="1">
		<tr>
			<td>${member.mem_image}</td>
		</tr>
	</table>
	<br>
	<h1>기본 정보</h1>
	<table border="1">
		<col width="80px"><col width="150px">
		<tr>
		<th>회원번호</th><td>${member.mem_seq}</td>
		</tr>
		<tr>
		<th>아이디</th><td>${member.mem_id}</td>
		</tr>
		<tr>
		<th>E-Mail</th><td>${member.mem_email}</td>
		</tr>
		<tr>
		<th>이름</th><td>${member.mem_name}</td>
		</tr>
		<tr>
		<th>비밀번호</th><td><input type="password" value="${member.mem_pw}" readonly></td>
		</tr>
		<tr>
		<th>승인 상태</th><td>${member.mem_isApprove}</td>
		</tr>
		<tr>
		<th>탈퇴 여부</th><td>${member.mem_isDel}</td>
		</tr>
		<tr>
		<th>가입일</th><td>${member.mem_regDate}</td>
		</tr>
	</table>
	<br>
	<h1>매장 정보</h1>
	<table border="1">
	<col width="80px"><col width="150px">
		<tr>
		<th>매장 주소</th><td>${member.mem_address}</td>
		</tr>
		<tr>
		<th>전화 번호</th><td>${member.mem_phone}</td>
		</tr>
		<tr>
		<th>상호명</th><td>${member.mem_b_name}</td>
		</tr>
		<tr>
		<th>업태</th><td>${member.mem_b_status}</td>
		</tr>
	</table>
	<table border="1">
		<tr>
			<td>
				<input type="button" value="회원 정보 수정" onclick="location.href='member_infoForm.do?mem_id=${member.mem_id}'" />
			</td>
			<td>
				<input type="button" value="회원 목록" onclick="location.href='memberList.do'" />
			</td>
		</tr>
	</table>
</body>
</html>