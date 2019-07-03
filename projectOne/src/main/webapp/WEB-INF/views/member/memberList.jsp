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
<title>회원 목록 페이지</title>
</head>
<body>
<h1>회원 목록</h1>
<table border="1">
	<col width="50px"><col width="80px"><col width="150px"><col width="150px"><col width="150px">
	<tr>
		<th>회원번호</th><th>회원ID</th><th>이미지</th><th>회원 이름</th><th>상호명</th>
	</tr>
	<c:choose>
		<c:when test="${empty list}">
			<tr><td colspan="10">-----가입된 회원이 없습니다.-----</tr>
		</c:when>
		<c:otherwise>
			<c:forEach items="${list}" var="member">
				<tr>
					<td>${member.mem_seq}</td>
					<td><a href="memberDetail.do?mem_id=${member.mem_id}">${member.mem_id}</a></td>
					<td>${member.mem_image}</td>
					<td>${member.mem_name}</td>
					<td>${member.mem_b_name}</td>
				</tr>
			</c:forEach>
		</c:otherwise>
	</c:choose>
	<tr><td>
	<input type="button" value="회원 추가" onclick="location.href='joinMemberForm.do'" />
	<button onclick="location.href='home.do'">홈으로</button>
	</td></tr>
</table>
</body>
</html>