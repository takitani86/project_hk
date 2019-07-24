<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<body class="skin-blue">
	<!-- Main Header -->
	<header class="main-header">

		<!-- Logo -->
		<a href="<c:url value='/home.do' />" class="logo">
			<!-- mini logo for sidebar mini 50x50 pixels -->
			<span class="logo-mini"><b>O</b>NE</span> <!-- logo for regular state and mobile devices -->
			<span class="logo-lg">PROJECT<b>ONE</b></span>
		</a>

		<!-- Header Navbar -->
		<nav class="navbar navbar-static-top" role="navigation">
			<!-- Sidebar toggle button-->
			<a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button"> <span class="sr-only">Toggle
					navigation</span>
			</a>
			<!-- Navbar Right Menu -->
			<div class="navbar-custom-menu">
				<ul class="nav navbar-nav">

					<!-- Notifications Menu -->
					<sec:authorize access="hasRole('ROLE_ADMIN')">
						<li class="dropdown notifications-menu">
							<!-- Menu toggle button --> <a href="#" class="dropdown-toggle" data-toggle="dropdown"> <i
									class="fa fa-bell-o"></i> <span id="alert1" class="label label-warning"></span>
							</a>
							<ul class="dropdown-menu">
								<li>
									<!-- Inner Menu: contains the notifications -->
									<ul class="menu">
										<li>
											<!-- start notification --> <a id="alert3" href="<c:url value='/admin/memberList.do'/>"><i class="fa fa-users text-aqua"></i>
											</a>
										</li>
										<!-- end notification -->
									</ul>
								</li>
							</ul>
						</li>
					</sec:authorize>
				</ul>
			</div>
		</nav>
	</header>
	<script>
		$(function() {
			$.ajax({
				url: '/projectOne/pushalert.do',
				type: 'get',
				success: function (count) {
					if (count != 0) {
					$("#alert1").html(count);
					$("#alert3").append(count + "명의 점주가 승인 대기중입니다.");
					}
				}
			});
		});
</script>
</body>

</html>