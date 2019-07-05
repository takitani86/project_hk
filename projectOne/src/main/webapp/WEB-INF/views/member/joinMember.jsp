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
<script src="https://code.jquery.com/jquery-latest.js"></script>
<title>회원 가입 페이지</title>
<script>
$(function(){
	$(".checkIdMember").click(function(){
		var query = $("#mem_id").val();
		$.ajax({
			url: "checkIdMember.do",
			type: "post",
			data: {"mem_id": query},
			success: function(data) {
				if(data == 1) {
					$(".resultId .msg").text("사용할 수 없는 ID입니다.");
					$(".resultId .msg").attr("style", "color:#f00");
				} else {
					$(".resultId .msg").text("사용할 수 있는 ID입니다.");
					$(".resultId .msg").attr("style", "color:#00f");
				}
			},
			error: function() {
				alert("에러 발생");
			}
		});
	});	
})
$(function(){
	$()
})
</script>
</head>
<body>
	<h1>회원 가입</h1>
		<form action="joinMember.do" method="post">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" id="mem_id" name="mem_id" placeholder="아이디 입력"></td>
					<td><button type="button" class="checkIdMember">아이디 확인</button></td>
					<td><p class="resultId"><span class="msg">아이디를 확인해 주십시오.</span></p></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="mem_pw" placeholder="비밀번호 입력"></td>
				</tr>
				<tr>
					<th></th>
					<td>(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10~16자)</td>
				</tr>
				<tr>
					<th></th>
					<td><input type="password" name="mem_pw2" placeholder="비밀번호 확인"></td>
				</tr>
				<tr>
					<th>E-Mail</th>
					<td><input type="email" name="mem_email" placeholder="이메일 주소 입력"></td>
					<td><input type="button" value="이메일 인증" onclick="#"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="text" name="mem_email2" placeholder="인증 번호 입력 입력"></td>
					<td>인증 완료</td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="mem_name" placeholder="사용자 이름 입력"></td>
				</tr>
			</table>
			<br />
			<table border="1">
				<tr>
					<th>매장 주소</th>
					<td><input type="text" name="mem_address" placeholder="우편 번호를 입력"></td>
					<td><input type="button" value="우편 번호" onclick="#"></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="text" name="mem_address2" placeholder="상세 주소 입력"></td>
				</tr>
				<tr>
					<th>전화 번호</th>
					<td><input type="text" name="mem_phone" placeholder="전화 번호 입력"></td>
				</tr>
				<tr>
					<th>상호명</th>
					<td><input type="text" name="mem_b_name" placeholder="상호명 입력"></td>
				</tr>
				<tr>
					<th>업태</th>
					<td><select name="mem_b_status" size='1' class='select'>
						<option value=''>선택하세요</option>
						<option value="1">카페</option>
						<option value="2">중국집</option>
						<option value="3">야식</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="회원 가입"></td>
					<td><input type="reset" value="취소"></td>
				</tr>
			</table>
		</form>
</body>
</html>