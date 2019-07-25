<%@ page import="com.hk.one.dto.MemberDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
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
		window.open("loginPage.do", "_self", "");
	}
</script>
<%@ include file="../include/head.jsp"%>
<body>
	<div class="wrapper" >
		<div class="content-wrapper" style="width:900px;">
			<section class="content-header">
				<h1><strong>비밀번호 재발급</strong></h1>
				<h5>아래 항목을 정확히 입력하시면 이메일을 통해 비밀번호 재발급이 가능합니다.</h5>
			</section>
			<section class="content container-fluid">
				<div class="form-group">
					<form action="sendPw.do" role="form" name="sendPw" method="post">
						<div id="findPwForm">
							<label for="mem_id" class="id_label">아이디</label>
								<input type="text" id="mem_id" name="mem_id" class="form-control" placeholder="아이디 입력" /> <br />
							<label for="mem_name" class="name_label">이름</label>
								<input type="text" id="mem_name" name="mem_name" class="form-control" placeholder="이름 입력" /> <br />
							<label for="mem_email" class="email_label">E-Mail</label>
								<input type="email" id="mem_email" name="mem_email" class="form-control" placeholder="이메일 주소 입력" /> <br />
						</div>
				        <div>
				        	<p class="help-block">* 소셜 계정으로 가입하신 회원은 소셜 계정으로 바로 로그인하실 수 있습니다.</p>
							<button type="submit" class="btn btn-primary" onclick="search()">비밀번호 찾기</button>
				        </div>
					</form>
					<div>
						<a href="javascript:login()">로그인 페이지로 돌아가기</a>
					</div>
				</div>			
			</section>
		</div>
	</div>
</body>
</html>