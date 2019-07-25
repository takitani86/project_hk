<%@ page import="com.hk.one.dto.MemberDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<html>
<%@ include file="../include/head.jsp"%>
<body>
	<div class="wrapper" >
		<div class="content-wrapper" style="width:900px;">
			<section class="content-header">
				<h1><strong>비밀번호 찾기 결과</strong></h1>
			</section>
			<section class="content container-fluid">
				<c:choose>
					<c:when test="${msg eq 0}">
						<meta http-equiv='Refresh' content='5; url=loginPage.do'>
						<div class="container-fluid">
						<h3>사용자 계정에 입력된 이메일 주소로 비밀번호가 전송되었습니다.</h3>
						<h5>메일을 확인 바랍니다. 감사합니다. </h5>
						<small>
						(5초 후 로그인 페이지로 자동 이동합니다.) <br />
						<a href="loginPage.do">로그인 페이지로 돌아가기</a>						
						</small>
						</div>
					</c:when>
					<c:when test="${msg eq 1}">
						<meta http-equiv='Refresh' content='5; url=to_find_PwForm.do'>
						<div class="container-fluid">
						<h3>사용자 계정에 입력된 정보와 입력해주신 정보가 맞지 않습니다.</h3>
						<h5>확인하시고 다시 입력해 주세요. 감사합니다. </h5>
						<small>
						(5초 후 비밀번호 찾기 페이지로 자동 이동합니다.) <br />
						<a href="to_find_PwForm.do">비밀번호 찾기 페이지로 돌아가기</a>
						</small>
						</div>
					</c:when>
				</c:choose>
			</section>
		</div>
	</div>
</body>
</html>