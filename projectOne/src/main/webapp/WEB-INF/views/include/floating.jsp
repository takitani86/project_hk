<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<script src="//code.jquery.com/jquery-3.2.1.min.js"></script>
<style>
	.floatMenu {
		position: absolute;
		width: 100px;
		height: 100px;
		left: 50px;
		top: 450px;
		background-color: #606060;
		color: #fff;
	}
</style>
<c:choose>
	<c:when test="${not empty kakao}">
		<c:choose>
			<c:when test="${kakao.secu_id eq 'ADMIN'}">

				<%@ include file="/WEB-INF/views/chat/chatAdmin.jsp"%>


			</c:when>
			<c:otherwise>
				<%@ include file="/WEB-INF/views/chat/chat.jsp"%>
			</c:otherwise>

		</c:choose>
	</c:when>
	<c:otherwise>
		<sec:authorize access="isAuthenticated()">
			<sec:authentication var="user" property="principal" />
			<c:choose>
				<c:when test="${user.username eq 'ADMIN'}">

					<%@ include file="/WEB-INF/views/chat/chatAdmin.jsp"%>


				</c:when>
				<c:otherwise>
					<%@ include file="/WEB-INF/views/chat/chat.jsp"%>
				</c:otherwise>

			</c:choose>

		</sec:authorize>
	</c:otherwise>
</c:choose>






<script>
	$(document).ready(function () {

		// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
		var floatPosition = parseInt($(".floatMenu").css('top'));
		// 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

		$(window).scroll(function () {
			// 현재 스크롤 위치를 가져온다.
			var scrollTop = $(window).scrollTop();
			var newPosition = scrollTop + floatPosition + "px";

			/* 애니메이션 없이 바로 따라감
			 $(".floatMenu").css('top', newPosition);
			 */

			$(".floatMenu").stop().animate({
				"top": newPosition
			}, 500);

		}).scroll();

	});
</script>