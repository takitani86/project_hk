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
<style>
<<<<<<< HEAD
.static{
position:relative;
=======
.floatingPosition{
position:absolute;
top:45px;
left:1025px;
>>>>>>> branch 'master' of https://github.com/takitani86/project_hk.git
}
<<<<<<< HEAD

.floatingPosition{
position:relative;
top:-750px;
left:900px;
}

.content-wrapper{
width:1500;
height:700;
}


=======
.rolling_panel { position: relative; width: 750px; height: 300px; margin: 0; padding: 0; overflow: hidden; }
.rolling_panel ul { float:right; position: absolute; margin:5px; padding:0; list-style: none; }
.rolling_panel ul li { float:left; padding:5px; width:750px; height:300px; }
>>>>>>> branch 'master' of https://github.com/takitani86/project_hk.git
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
			
			<!-- 슬라이드 배너 -->
			<!-- <a href="javascript:void(0)" id="prev">이전</a>
       		<a href="javascript:void(0)" id="next">다음</a> -->
        	<div class="rolling_panel">
	            <ul>
	                <li><img src="resources/img/banner1.png"></li>
	                <li><img src="resources/img/banner2.png"></li>
	                <li><img src="resources/img/banner3.png"></li>
	            </ul>
        	</div>		
					
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
							<div class="static">
							<h3>${user.username}님,반갑습니다.</h3>
							<p>암호 : ${user.password}</p>
							<p>활성화 여부: ${user.enabled}</p>
							<p>권한 여부: ${user.auth}</p>
							<p>이메일: ${user.secu_email}
							</p>
							<form action="<c:url value='/logout.do'/>" method="POST">
								<button type="submit">LOGOUT</button>
							</form>
							</div>
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
	<div class="floatingPosition">
	<%@ include file="include/floating.jsp"%>
	</div>
	
<script type="text/javascript">
$(document).ready(function() {
	 
    var $panel = $(".rolling_panel").find("ul");

    var itemWidth = $panel.children().outerWidth(); // 아이템 가로 길이
    var itemLength = $panel.children().length;      // 아이템 수

    console.log("아이템 윋ㄷ드" + itemWidth);
    console.log("아이템 랭쓰" + itemLength);
    // Auto 롤링 아이디
    var rollingId;

    auto();

    // 배너 마우스 오버 이벤트
    $panel.mouseover(function() {
        clearInterval(rollingId);
    });

    // 배너 마우스 아웃 이벤트
    $panel.mouseout(function() {
        auto();
    });

    // 이전 이벤트
    $("#prev").on("click", prev);

    $("#prev").mouseover(function(e) {
        clearInterval(rollingId);
    });

    $("#prev").mouseout(auto);

    // 다음 이벤트
    $("#next").on("click", next);

    $("#next").mouseover(function(e) {
        clearInterval(rollingId);
    });

    $("#next").mouseout(auto);

    function auto() {

        // 2초마다 start 호출
        rollingId = setInterval(function() {
            start();
        }, 6000);
    }

    function start() {
        $panel.css("width", itemWidth * itemLength);
        $panel.animate({"left": - itemWidth + "px"}, function() {

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
        $panel.css("left", - itemWidth);
        $panel.prepend("<li>" + $panel.find("li:last").html() + "</li>");
        $panel.animate({"left": "0px"}, function() {
            $(this).find("li:last").remove();
        });
    }

    // 다음 이벤트 실행
    function next(e) {
        $panel.animate({"left": - itemWidth + "px"}, function() {
            $(this).append("<li>" + $(this).find("li:first").html() + "</li>");
            $(this).find("li:first").remove();
            $(this).css("left", 0);
        });
    }
});
</script>
</body>
</html>
