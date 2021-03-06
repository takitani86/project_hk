<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<!-- Left side column. contains the logo and sidebar -->
<aside class="main-sidebar">

	<!-- sidebar: style can be found in sidebar.less -->
	<section class="sidebar">
		<!-- Sidebar user panel (optional) -->
		<!-- 비로그인 상태 -->
		<sec:authorize access="isAnonymous()">
			<div class="user-panel">
				<div class="pull-left image">
					<img src="<c:url value="/resources/dist/img/question-mark.png"/>" width="160px" height="160px"
						class="img-circle" alt="User Image">
				</div>
				<div class="pull-left info">
					<p>
						<a href="<c:url value='/secu/loginPage.do'/>">로그인해주세요.</a>
					</p>
				</div>
			</div>
		</sec:authorize>
		<!-- Sidebar user panel (optional) -->
		<!-- 로그인 상태 -->
		<c:choose>
			<c:when test="${not empty kakao}">
				<div class="user-panel">
					<div class="pull-left image">
						<img src="<c:url value="/resources/dist/img/avatar5.png"/>" class="img-circle" alt="User Image">
					</div>
					<div class="pull-left info">
						<p>${kakao.secu_id}</p>
						<!-- Status -->
						<a href="<c:url value='/member/memberMyDetail.do'/>"><i class="fa fa-circle text-success"></i>${kakao.auth
							== "ROLE_ADMIN" ? "관리자":"점주"}</a>
					</div>
				</div>
			</c:when>
			<c:otherwise>
				<sec:authorize access="isAuthenticated()">
					<sec:authentication var="user" property="principal" />
					<div class="user-panel">
						<div class="pull-left image">
							<img src="<c:url value='/resources/img${user.secu_image}'/>" class="img-circle" alt="User Image">
						</div>
						<div class="pull-left info">
							<p>${user.username}</p>
							<!-- Status -->
							<a href="<c:url value='/member/memberMyDetail.do'/>"><i class="fa fa-circle text-success"></i>${user.auth
								== "ROLE_ADMIN" ? "관리자":"점주"}</a>
						</div>
					</div>
					<br>
				</sec:authorize>
			</c:otherwise>
		</c:choose>

		<!-- Sidebar Menu -->
		<!-- 관리자 메뉴 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<ul class="sidebar-menu" data-widget="tree">
				<li class="header">관리자 메뉴</li>
				<!-- Optionally, you can add icons to the links -->
				<li>
					<a href="<c:url value='/admin/board/admin_board.do'/>">
						<i class="fa fa-file-text-o"></i>
						<span>고객센터</span></a>
				</li>
				<li>
					<a href="<c:url value='/admin/memberList.do'/>">
						<i class="fa fa-list-alt"></i>
						<span>가입점주 목록</span></a>
				</li>
				<li>
					<a name="logout" href="<c:url value='/logout.do'/>" onclick="logout();">
						<i class="fa  fa-user"></i>
						<span>로그아웃</span></a>
					<script>
						function logout() {
							document.logout.action = "<c:url value='/logout.do'/>";
							document.logout.method = "post";
							document.logout.submit;
						}
					</script>
				</li>
			</ul>
		</sec:authorize>

		<sec:authorize access="hasRole('ROLE_MEMBER')">
			<ul class="sidebar-menu" data-widget="tree">
				<li class="header">점주 메뉴</li>
				<!-- Optionally, you can add icons to the links -->
				<li>
					<a href="<c:url value='/productList.do?countProductPage=1&sort=1'/>">
						<i class="fa fa-book"></i>
						<span>상품관리</span></a>
				</li>
				<li>
					<a href="<c:url value='/member/menu.do'/>">
						<i class="fa fa-calendar"></i>
						<span>메뉴판 관리</span></a>
				</li>
				<li>
					<a href="<c:url value='/orderlist.do'/>">
						<i class="fa fa-flask"></i>
						<span>주문관리</span></a>
				</li>
				<li>
						<a href="<c:url value='/member/board/member_board.do'/>">
							<i class="fa fa-file-text-o"></i>
							<span>고객센터</span></a>
					</li>
				<li>
					<a href="<c:url value='/member/memberMyDetail.do'/>">
						<i class="fa fa-smile-o"></i>
						<span>내 정보 보기</span></a>
				</li>
				<li>
					<a name="logout" href="<c:url value='/logout.do'/>" onclick="logout();">
						<i class="fa  fa-user"></i>
						<span>로그아웃</span></a>
					<script>
						function logout() {
							document.logout.action = "<c:url value='/logout.do'/>";
							document.logout.method = "post";
							document.logout.submit;
						}
					</script>
				</li>
			</ul>
		</sec:authorize>
		<!-- /.sidebar-menu -->
	</section>
	<!-- /.sidebar -->
</aside>