<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>

<body class="hold-transition skin-blue">
	<%@ include file="../include/main_header.jsp" %>
	<%@ include file="../include/left_column.jsp" %>
	<div class="wrapper">
	<form action='member_info.do' method='post'>
	<div class="box" style="width: 500px;">
	<section class="content-header">
		<h1>회원 정보
			<small>정보를 수정하시려면 '변경' 버튼을 눌러 주세요.</small></h1>
	</section>
		<div class="content">
			<img src="${member.mem_image}" class="img-circle"
				alt="User Image" style="width: 80px; height: 80px"> <br />
			<input type="text" name="mem_image" value='${member.mem_image}'>
			<button type="button" onclick="#" class="btn btn-block btn-default" style="width:100px;">사진 등록</button>
		</div>
		<br>
			<div class="content-body">
					<div class="box-header">
						<h3 class="box-title">기본 정보</h3>
					</div>
					<div class="box-body no-padding">
						<table class="table">
							<col width="80px">
							<col width="150px">
							<tr>
								<th>아이디</th>
								<td><input type="text" name="mem_id" value='${member.mem_id}' readonly></td><td>&nbsp;</td>
							</tr>
							<tr>
								<th>E-Mail</th>
								<td><input type="text" name="mem_email" value='${member.mem_email}' readonly></td><td>&nbsp;</td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="mem_name" value='${member.mem_name}' readonly></td>
								<td><button type="button" id="turnBtn" onclick="turnAttr(this);" class="btn btn-block btn-info btn-xs" style="width:50px;">변경</button></td>
							</tr>
							<tr>
								<th>비밀번호</th>
								<td><input type="text" name="mem_pw" value='${member.mem_pw}' readonly></td>
								<td><button type="button" id="turnBtn" onclick="turnAttr(this);" class="btn btn-block btn-info btn-xs" style="width:50px;">변경</button></td>
							</tr>
						</table>
					</div>
					<div class="box-header">
						<h3 class="box-title">매장 정보</h3>
					</div>
					<table class="table">
						<col width="80px">
						<col width="150px">
						<tr>
							<th>매장 주소</th>
							<td><input type="text" name="mem_address" value='${member.mem_address}' readonly></td>
							<td><button type="button" id="turnBtn" onclick="turnAttr(this);" class="btn btn-block btn-info btn-xs" style="width:50px;">변경</button></td>
						</tr>
						<tr>
							<th>전화 번호</th>
							<td><input type="text" name="mem_phone" value='${member.mem_phone}' readonly></td>
							<td><button type="button" id="turnBtn" onclick="turnAttr(this);" class="btn btn-block btn-info btn-xs" style="width:50px;">변경</button></td>
						</tr>
						<tr>
							<th>상호명</th>
							<td><input type="text" name="mem_b_name" value='${member.mem_b_name}' readonly></td>
							<td><button type="button" id="turnBtn" onclick="turnAttr(this);" class="btn btn-block btn-info btn-xs" style="width:50px;">변경</button></td>
						</tr>
						<tr>
							<th>업태</th>
							<td><c:set var="b_status" value="${member.mem_b_status}" />
								<select name="mem_b_status" size='1' class='select'>
								<option value=''>선택하세요</option>
								<option value="1" ${b_status == 1?"selected":""} >한식</option>
								<option value="2" ${b_status == 2?"selected":""}>분식</option>
								<option value="3" ${b_status == 3?"selected":""}>일식</option>
								<option value="4" ${b_status == 4?"selected":""}>중식</option>
								<option value="5" ${b_status == 5?"selected":""}>양식</option>
								<option value="6"${b_status == 6?"selected":""}>야식</option>
								<option value="7"${b_status == 7?"selected":""}>주점</option>
								<option value="8"${b_status == 8?"selected":""}>카페/디저트</option>
								<option value="9"${b_status == 9?"selected":""}>패스트푸드</option>
								<option value="10"${b_status == 10?"selected":""}>치킨/피자</option>
								<option value="11"${b_status == 11?"selected":""}>기타</option>
								</select></td>
						</tr>
					</table>
					<br />
					<table class="table">
						<col width="80px">
						<col width="150px">
						<tr>
							<th>탈퇴 신청</th>
							<td><button type="button" onclick="location.href='deleteMember.do?mem_id=${member.mem_id}'" class="btn btn-block btn-danger" style="width:30%; float:left;">탈퇴</button></td>
						</tr>
					</table>
					<br />
					<table class="table">
						<tr>
							<th>회원 정보 변경</th>
							<td><button type="submit" class="btn btn-block btn-primary" style="width:90%; float:left;">변경 완료</button></td>
							<td><button type="reset" class="btn btn-block btn-warning" style="width:90%; float:left;">변경 취소</button></td>
						</tr>
<!-- 						<tr>
							<th>멤버 목록</th>
							<td><input type="button" value="멤버 목록으로 가기"
								onclick="location.href='memberList.do'"></td>
						</tr> -->
					</table>
				</div>
			</div>
		</form>
	</div>
<%@ include file="../include/main_footer.jsp" %>
<%@ include file="../include/plugin_js.jsp" %>
<script type="text/javascript">
	function turnAttr(a) {
	$(a).parent().prev().children().removeAttr("readonly");
	console.log("실행 되는중")
	}
</script>
</body>
</html>