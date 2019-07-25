<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ page session="false"%>

<html>
<link rel="stylesheet" href="../../bower_components/morris.js/morris.css">
<style>
	.floatingPosition {
		position: relative;
		clear: both;
		margin-left: 5px;
		/* top: 45px;
		left: 1025px; */
	}

	.rolling_panel {
		position: relative;
		width: 750px;
		height: 300px;
		margin: 0;
		padding: 0;
		overflow: hidden;
		float: left;
	}

	.rolling_panel ul {
		float: right;
		position: absolute;
		margin: 5px;
		padding: 0;
		list-style: none;
	}

	.rolling_panel ul li {
		float: left;
		padding: 5px;
		width: 750px;
		height: 300px;
	}
</style>
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
			
				<!-- 슬라이드 배너 -->
				<!-- <a href="javascript:void(0)" id="prev">이전</a>
				 <a href="javascript:void(0)" id="next">다음</a> -->
				 <div class="rolling_panel">
					 <ul>
						<li><img src="<c:url value='/resources/img/banner1.png'/>"></li>
						<li><img src="<c:url value='/resources/img/banner2.png'/>"></li>
						<li><img src="<c:url value='/resources/img/banner3.png'/>"></li>
					</ul>
						<a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
		                  <span class="fa fa-angle-left"></span>
		                </a>
		                <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
		                  <span class="fa fa-angle-right"></span>
		                </a>
				</div>

				<!-- to do list -->
				<div class="box box-primary" style="width:230px; height:289px; float:right; margin-top: 10px; margin-left:10px;">
           	 		<div class="box-header">
              			<i class="ion ion-clipboard"></i>
              			<h3 class="box-title">To Do List</h3>
			            <div class="box-tools pull-right">
	              		</div>
            		</div>
            		<!-- /.box-header -->
		            <div class="box-body">
		              <!-- See dist/js/pages/dashboard.js to activate the todoList plugin -->
		              <ul class="todo-list">
		                <li>
		                  <!-- drag handle -->
		                  <span class="handle">
	                        <i class="fa fa-ellipsis-v"></i>
	                        <i class="fa fa-ellipsis-v"></i>
	                      </span>
		                  <!-- checkbox -->
		                  <input type="checkbox" value="">
		                  <!-- todo text -->
		                  <span class="text" style="margin:0px; padding:0px;">얼음 보충하기</span>
		                  <!-- Emphasis label -->
		                  <small class="label label-danger" style="float:right; margin:0px; padding:3px;"><i class="fa fa-clock-o"></i> 6 hours</small>
		                  <!-- General tools such as edit or delete-->
		                  <div class="tools">
		                    <i class="fa fa-edit"></i>
		                    <i class="fa fa-trash-o"></i>
		                  </div>
		                </li>
		                <li>
		                      <span class="handle">
		                        <i class="fa fa-ellipsis-v"></i>
		                        <i class="fa fa-ellipsis-v"></i>
		                      </span>
		                  <input type="checkbox" value="">
		                  <span class="text" style="margin:0px; padding:0px;">컵홀더 주문</span>
		                  <small class="label label-danger" style="float:right; margin:0px; padding:3px;"><i class="fa fa-clock-o"></i> 6 hours</small>
		                  <div class="tools">
		                    <i class="fa fa-edit"></i>
		                    <i class="fa fa-trash-o"></i>
		                  </div>
		                </li>
		                <li>
		                      <span class="handle">
		                        <i class="fa fa-ellipsis-v"></i>
		                        <i class="fa fa-ellipsis-v"></i>
		                      </span>
		                  <input type="checkbox" value="">
		                  <span class="text" style="margin:0px; padding:0px;">원두 로스팅</span>
		                  <small class="label label-info" style="float:right; margin:0px; padding:3px;"><i class="fa fa-clock-o"></i> 1 day</small>
		                  <div class="tools">
		                    <i class="fa fa-edit"></i>
		                    <i class="fa fa-trash-o"></i>
		                  </div>
		                </li>
		                <li>
		                      <span class="handle">
		                        <i class="fa fa-ellipsis-v"></i>
		                        <i class="fa fa-ellipsis-v"></i>
		                      </span>
		                  <input type="checkbox" value="">
		                  <span class="text" style="margin:0px; padding:0px;">화분 물주기</span>
		                  <small class="label label-info" style="float:right; margin:0px; padding:3px;"><i class="fa fa-clock-o"></i> 2 days</small>
		                  <div class="tools">
		                    <i class="fa fa-edit"></i>
		                    <i class="fa fa-trash-o"></i>
		                  </div>
		                </li>
		              </ul>
		            </div>
		            <!-- /.box-body -->
		            <div class="box-footer clearfix no-border">
		              <button type="button" class="btn btn-default pull-right"><i class="fa fa-plus"></i> 할 일 추가</button>
		            </div>
	          </div>
			</section>
			<section class="container-fluid">
			<br />

				<div class="row">
					<div class="col-sx-10">
						<div class="floatingPosition">
							<%@ include file="include/floating.jsp"%>
						</div>
					</div>
				</div>
				
			 <div class="nav-tabs-custom">
	            <!-- Tabs within a box -->
	            <ul class="nav nav-tabs pull-right">
	              <li class="active"><a href="#revenue-chart" data-toggle="tab">Area</a></li>
	              <li><a href="#sales-chart" data-toggle="tab">Donut</a></li>
	              <li class="pull-left header"><i class="fa fa-inbox"></i> Sales</li>
	            </ul>
	            <div class="tab-content no-padding">
	            <div class="box-body chart-responsive">
	              <div class="chart" id="revenue-chart" style="height: 300px;"></div>
    	        </div>
	              <div class="chart tab-pane active" id="revenue-chart" style="position: relative; height: 300px;"></div>
	              <div class="chart tab-pane" id="sales-chart" style="position: relative; height: 300px;"></div>
	            </div>
	          </div>

			</section>
		</div>

		<!-- Main Footer -->
		<%@ include file="include/main_footer.jsp"%>

	</div>
	<!-- /wrapper -->

	<!-- JS 스크립트모음 -->
	<%@ include file="include/plugin_js.jsp"%>

	<script type="text/javascript">
		$(document).ready(function () {

			var $panel = $(".rolling_panel").find("ul");

			var itemWidth = $panel.children().outerWidth(); // 아이템 가로 길이
			var itemLength = $panel.children().length; // 아이템 수

			console.log("아이템 윋ㄷ드" + itemWidth);
			console.log("아이템 랭쓰" + itemLength);
			// Auto 롤링 아이디
			var rollingId;

			auto();

			// 배너 마우스 오버 이벤트
			$panel.mouseover(function () {
				clearInterval(rollingId);
			});

			// 배너 마우스 아웃 이벤트
			$panel.mouseout(function () {
				auto();
			});

			// 이전 이벤트
			$("#prev").on("click", prev);

			$("#prev").mouseover(function (e) {
				clearInterval(rollingId);
			});

			$("#prev").mouseout(auto);

			// 다음 이벤트
			$("#next").on("click", next);

			$("#next").mouseover(function (e) {
				clearInterval(rollingId);
			});

			$("#next").mouseout(auto);

			function auto() {

				// 2초마다 start 호출
				rollingId = setInterval(function () {
					start();
				}, 6000);
			}

			function start() {
				$panel.css("width", itemWidth * itemLength);
				$panel.animate({
					"left": -itemWidth + "px"
				}, function () {

					// 첫번째 아이템을 마지막에 추가하기
					$(this).append("<li>" + $(this).find("li:first").html() + "</li>");

					// 첫번째 아이템을 삭제하기
					$(this).find("li:first").remove();

					// 좌측 패널 수치 초기화
					$(this).css("left", 0);
				});
			}

			// 이전 이벤트 실행
			function prev(e) {
				$panel.css("left", -itemWidth);
				$panel.prepend("<li>" + $panel.find("li:last").html() + "</li>");
				$panel.animate({
					"left": "0px"
				}, function () {
					$(this).find("li:last").remove();
				});
			}

			// 다음 이벤트 실행
			function next(e) {
				$panel.animate({
					"left": -itemWidth + "px"
				}, function () {
					$(this).append("<li>" + $(this).find("li:first").html() + "</li>");
					$(this).find("li:first").remove();
					$(this).css("left", 0);
				});
			}
		});
	</script>
</body>

</html>