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
					<img src="<c:url value="/resources/dist/img/question-mark.png"/>"> width="160px"
						height="160px" class="img-circle" alt="User Image">
				</div>
				<div class="pull-left info">
					<p>
						<a href="<c:url value='/secu/loginPage.do'/>">로그인 해주세요.
					</p>
				</div>
			</div>
		</sec:authorize>
		<!-- Sidebar user panel (optional) -->
		<!-- 로그인 상태 -->
		<sec:authorize access="isAuthenticated()">
			<sec:authentication var="user" property="principal" />
			<div class="user-panel">
				<div class="pull-left image">
					<img src="<c:url value="/resources/dist/img/user1-128x128.jpg"/>"> class="img-circle"
						alt="User Image">
				</div>
				<div class="pull-left info">
					<p>${user.username}</p>
					<!-- Status -->
					<a href="#"><i class="fa fa-circle text-success"></i>${user.auth == "ROLE_ADMIN" ? "관리자":"점주"}</a>
				</div>
			</div>
		</sec:authorize>

		<!-- Sidebar Menu -->
		<!-- 관리자 메뉴 -->
		<sec:authorize access="hasRole('ROLE_ADMIN')">
			<ul class="sidebar-menu" data-widget="tree">
				<li class="header">관리자 메뉴</li>
				<!-- Optionally, you can add icons to the links -->
				<li class="active"><a href="<c:url value='/admin/board/admin_board.do'/>"><i class="fa fa-link"></i> <span>고객센터 게시판</span></a></li>
				<li><a href="#"><i class="fa fa-link"></i> <span>Another
							Link</span></a></li>
				<li class="treeview"><a href="#"><i class="fa fa-link"></i>
						<span>Multilevel</span> <span class="pull-right-container">
							<i class="fa fa-angle-left pull-right"></i>
					</span> </a>
					<ul class="treeview-menu">
						<li><a href="#">Link in level 2</a></li>
						<li><a href="#">Link in level 2</a></li>
					</ul></li>
			</ul>
		</sec:authorize>
		<!-- /.sidebar-menu -->
	</section>
	<!-- /.sidebar -->
</aside>
