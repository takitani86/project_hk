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
<title>회원 정보 / 수정</title>
</head>
<body>
	<h1>회원 정보</h1>
	<form action='member_info.do' method='post'>
		<table border="1">
			<tr>
				<td><input type="text" name="mem_image" value='${member.mem_image}'></td>
			</tr>
			<tr>
				<td><input type="button" value="사진 등록" onclick="location.href='#'"></td>
			</tr>
		</table>
		<br>
		<h3>기본 정보</h3>
		<table border="1">
			<col width="80px"><col width="150px">
			<tr>
				<th>아이디</th>
				<td><input type="text" name="mem_id" value='${member.mem_id}' readonly></td>
			</tr>
			<tr>
				<th>E-Mail</th>
				<td><input type="text" name="mem_email" value='${member.mem_email}' readonly></td>
			</tr>
			<tr>
				<th>이름</th>
				<td><input type="text" name="mem_name" value='${member.mem_name}'></td>
				<td><input type="button" value="변경" onclick="location.href='#'"></td>
			</tr>
			<tr>
				<th>비밀번호</th>
				<td><input type="text" name="mem_pw" value='${member.mem_pw}'></td>
				<td><input type="button" value="변경" onclick="location.href='#'"></td>
			</tr>
		</table>
		<h3>매장 정보</h3>
		<table border="1">
		<col width="80px"><col width="150px">
			<tr>
				<th>매장 주소</th>
				<td><input type="text" name="mem_address" value='${member.mem_address}'></td>
				<td><input type="button" value="변경" onclick="location.href='#'"></td>
			</tr>
			<tr>
				<th>전화 번호</th>
				<td><input type="text" name="mem_phone" value='${member.mem_phone}'></td>
				<td><input type="button" value="변경" onclick="location.href='#'"></td>
			</tr>
			<tr>
				<th>상호명</th>
				<td><input type="text" name="mem_b_name" value='${member.mem_b_name}'></td>
				<td><input type="button" value="변경" onclick="location.href='#'"></td>
			</tr>
			<tr>
				<th>업태</th>
				<td><input type="text" name="mem_b_status" value='${member.mem_b_status}'></td>
				<td><input type="button" value="변경" onclick="location.href='#'"></td>
			</tr>
		</table>
		<table border="1">
		<col width="80px"><col width="150px">
			<tr>
				<th>탈퇴 신청</th>
				<td><input type="button" value="탈퇴" onclick="location.href='deleteMember.do?mem_id=${member.mem_id}'"></td>
			</tr>
			<tr>
				<th>회원 정보 변경</th>
				<td><input type="submit" value="변경 완료" ></td>
				<td><input type="reset" value="변경 취소" ></td>
			</tr>			
			<tr>
				<th>멤버 목록</th>
				<td><input type="button" value="멤버 목록으로 가기" onclick="location.href='memberList.do'"></td>
			</tr>
		</table>
	</form>
</body>
</html>