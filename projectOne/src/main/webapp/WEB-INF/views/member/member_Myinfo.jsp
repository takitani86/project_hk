<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>

<body class="layout-boxed skin-blue sidebar-mini">
	<div class="wrapper">
	<%@ include file="../include/main_header.jsp" %>
	<%@ include file="../include/left_column.jsp" %>
	<div class="content-wrapper">
		<form action='member_Myinfo.do' method='post' enctype="multipart/form-data">
			<div class="container-fluid" style=":after; overflow:auto;">
				<section class="content-header" style="margin-top:10px; display:block;">
					<h1><strong>회원 정보</strong>
						<small>정보를 수정하시려면 '변경' 버튼을 눌러 주세요.</small></h1>
				</section>
				<section class="content-header">
					<div class="container-fluid" style="text-align:center; padding-top:20px; display:inline-block;">
						<img src="<c:url value="/resources/img${member.mem_image}"/>" class="img-circle"
							id="preview" alt="User Image" style="width:150px; height:150px;">
						<input type="file" id="uploadFile" name="uploadFile" onchange="readURL(this);" style="display:none;">						
						<button type="button" id="btn_upload" class="btn btn-block btn-default" style="width:150px;">사진 변경</button>
					</div>
				</section>
				<br />
				<div class="content-body" >
					<section class="content-header" >
						<h4><strong>기본 정보</strong></h4>
					</section>
					<section class="content container-fluid">
						<div class="container-fluid">
							<table class="table">
								<col width="20%"><col width="60%"><col width="20%">
								<tr>
									<th>아이디</th>
									<td><input type="text" name="mem_id" value='${member.mem_id}' style="width:80%;" readonly></td><td>&nbsp;</td>
								</tr>
								<tr>
									<th>E-Mail</th>
									<td><input type="text" name="mem_email" value='${member.mem_email}' style="width:80%;" readonly></td><td>&nbsp;</td>
								</tr>
								<tr>
									<th>이름</th>
									<td><input type="text" name="mem_name" value='${member.mem_name}' style="width:80%;" readonly></td>
									<td><button type="button" id="turnBtn" onclick="turnAttr(this);" class="btn btn-block btn-info btn-xs" style="width:50px;">변경</button></td>
								</tr>
								<tr>
									<th>비밀번호</th>
									<td><input type="text" name="mem_pw" value='${member.mem_pw}' style="width:80%;" readonly></td>
									<td><button type="button" id="turnBtn" onclick="turnAttr(this);" class="btn btn-block btn-info btn-xs" style="width:50px;">변경</button></td>
								</tr>
							</table>
						</div>
					</section>
					<section class="content-header">
						<h4><strong>매장 정보</strong></h4>
					</section>
					<section class="content container-fluid">
						<div class="container-fluid">						
							<table class="table">
								<col width="20%"><col width="60%"><col width="20%">
								<tr>
									<th>매장 주소</th>
									<td><input type="text" name="mem_address" value='${member.mem_address}' style="width:80%;" readonly></td>
									<td><button type="button" id="turnBtn" onclick="turnAttr(this);" class="btn btn-block btn-info btn-xs" style="width:50px;">변경</button></td>
								</tr>
								<tr>
									<th>전화 번호</th>
									<td><input type="text" name="mem_phone" value='${member.mem_phone}' style="width:80%;" readonly></td>
									<td><button type="button" id="turnBtn" onclick="turnAttr(this);" class="btn btn-block btn-info btn-xs" style="width:50px;">변경</button></td>
								</tr>
								<tr>
									<th>상호명</th>
									<td><input type="text" name="mem_b_name" value='${member.mem_b_name}' style="width:80%;" readonly></td>
									<td><button type="button" id="turnBtn" onclick="turnAttr(this);" class="btn btn-block btn-info btn-xs" style="width:50px;">변경</button></td>
								</tr>
								<tr>
									<th>업태</th>
									<td><c:set var="b_status" value="${member.mem_b_status}" />
										<select name="mem_b_status" size='1' class='select' style="width:80%;">
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
						</div>
					</section>
					<section class="content container-fluid">
						<table class="table">
							<col width="20%"><col width="60%"><col width="20%">
							<tr>
								<th>탈퇴 신청</th>
								<td><button type="button" onclick="location.href='deleteMember.do?mem_id=${member.mem_id}'" class="btn btn-block btn-danger" style="width:30%; float:left;">탈퇴</button></td>
							</tr>
							<tr>
								<th>회원 정보 변경</th>
								<td><button type="submit" class="btn btn-block btn-primary" style="width:90%; float:left;">변경 완료</button></td>
								<td><button type="reset" class="btn btn-block btn-warning" style="width:90%; float:left;">변경 취소</button></td>
							</tr>
						</table>
					</section>
				</div>				
			</div>
		</form>
	</div>
<%@ include file="../include/main_footer.jsp" %>
	</div>
<script type="text/javascript">
	function turnAttr(a) {
		$(a).parent().prev().children().removeAttr("readonly");
		console.log("실행 되는중")
	}
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#preview').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
    console.log("이미지 밸류: " + mem_image);
  };
</script>
<script type="text/javascript">
$(function (){
	$('#btn_upload').click(function (e) {
		e.preventDefault();
		$('#uploadFile').click();
	});

});
</script>
<%@ include file="../include/plugin_js.jsp" %>
</body>
</html>