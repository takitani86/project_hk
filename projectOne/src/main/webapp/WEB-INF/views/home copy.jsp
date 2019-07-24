<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HEAD(link파일들 모음) -->
<%@ include file="include/head.jsp"%>

<body class="skin-blue sidebar-mini layout-boxed">

	<div class="wrapper">
		<!-- Main Header(네비게이션 바) -->
		<%@ include file="include/main_header.jsp"%>

		<!-- Left Column(사이드바) -->
		<%@ include file="include/left_column.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					통합 주문관리서비스 <small>2019.07.18</small>
				</h1>
			</section>
			<section class="content container-fluid">
				<p>
					<a href="<c:url value='productList.do?countProductPage=1&sort=1'/>">상품리스트</a>
				</p>
				<p>
					<a href="<c:url value='admin/memberList.do'/>">회원목록</a>
				</p>
				<p>
					<a href="<c:url value='member/board/member_board.do'/>">점주 게시판</a>
				</p>
				<p>
					<a href="<c:url value='admin/board/admin_board.do'/>">관리자 게시판</a>
				</p>
				<p>
					<a href="<c:url value='member/payment.do'/>">결제테스트</a>
				</p>
				<p>
					<a href="<c:url value='chatAdmin.do'/>">관리자채팅</a>
				</p>
				<p>
					<a href="<c:url value='chat.do'/>">채팅</a>
				</p>
				<p>
					<a href="<c:url value='member/menu.do'/>">메뉴판</a>
				</p>
				<sec:authorize access="isAnonymous()">
					<h5>
						<a href='<c:url value="/secu/loginPage.do"/>'>LOGIN</a> 로그인 해주세요.
					</h5>
				</sec:authorize>
				<c:choose>
					<c:when test="${not empty kakao}">
						<h3>${kakao.secu_id}님,반갑습니다.</h3>
						<p>암호 : ${kakao.password}</p>
						<p>활성화 여부: ${kakao.enabled}</p>
						<p>권한 여부: ${kakao.auth}</p>
						<p>이메일: ${kakao.secu_email}
						</p>
						<form action="<c:url value='/logout.do'/>" method="POST">
							<button type="submit">LOGOUT</button>
						</form>
					</c:when>
					<c:otherwise>
						<sec:authorize access="isAuthenticated()">
							<sec:authentication var="user" property="principal" />
							<h3>${user.username}님,반갑습니다.</h3>
							<p>암호 : ${user.password}</p>
							<p>활성화 여부: ${user.enabled}</p>
							<p>권한 여부: ${user.auth}</p>
							<p>이메일: ${user.secu_email}
							</p>
							<form action="<c:url value='/logout.do'/>" method="POST">
								<button type="submit">LOGOUT</button>
							</form>
						</sec:authorize>
					</c:otherwise>
				</c:choose>
			</section>
		</div>

		<!-- Main Footer -->
		<%@ include file="include/main_footer.jsp"%>

	</div>
	<!-- /wrapper -->

	<!-- JS 스크립트모음 -->
	<%@ include file="include/plugin_js.jsp"%>
</body>

</html>