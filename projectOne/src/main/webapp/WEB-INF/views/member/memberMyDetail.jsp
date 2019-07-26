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
	<div class="content-wrapper" style="overflow:auto;"> <!-- float 사용시 부모태그에 overflow 선언해줘야함 -->
		<div class="ground1" style="width:20%; float:left; text-align:center; padding-top:30px;">
			<img src="<c:url value="/resources/img${member.mem_image}"/>" class="img-circle"
				alt="User Image" style="width: 100px; height: 100px; display:inline-block;">
			<!-- <button type="button" onclick="#" class="btn btn-block btn-default" style="width:150px; display:inline-block; margin-top:10px;">사진 변경</button> -->
		</div>
		<div class="ground2" style="width:80%; float:right;">
			<section class="content-header">
				<h3><strong>기본 정보</strong></h3>
			</section>
			<section class="content container-fluid">
				<table class="table">
					<col width="80px">
					<col width="150px">
					<tr>
						<th>회원번호</th>
						<td>${member.mem_seq}</td>
					</tr>
					<tr>
						<th>아이디</th>
						<td>${member.mem_id}</td>
					</tr>
					<tr>
						<th>E-Mail</th>
						<td>${member.mem_email}</td>
					</tr>
					<tr>
						<th>이름</th>
						<td>${member.mem_name}</td>
					</tr>
					<tr>
						<th>가입일</th>
						<td>${member.mem_regDate}</td>
					</tr>
				</table>
			</section>
			<section class=" content-header">
				<h3><strong>매장 정보</strong></h3>
			</section>
			<section class="content container-fluid">
				<table class="table">
					<col width="80px">
					<col width="150px">
					<tr>
						<th>매장 주소</th>
						<td>${member.mem_address}</td>
					</tr>
					<tr>
						<th>전화 번호</th>
						<td>${member.mem_phone}</td>
					</tr>
					<tr>
						<th>상호명</th>
						<td>${member.mem_b_name}</td>
					</tr>
					<tr>
						<th>업태</th>
						<td><c:set var="b_status" value="${member.mem_b_status}" />
						<c:choose>
							<c:when test="${b_status == 1}">한식</c:when>
							<c:when test="${b_status == 2}">분식</c:when>
							<c:when test="${b_status == 3}">일식</c:when>
							<c:when test="${b_status == 4}">중식</c:when>
							<c:when test="${b_status == 5}">양식</c:when>
							<c:when test="${b_status == 6}">야식</c:when>
							<c:when test="${b_status == 7}">주점</c:when>
							<c:when test="${b_status == 8}">카페/디저트</c:when>
							<c:when test="${b_status == 9}">패스트푸드</c:when>
							<c:when test="${b_status == 10}">치킨/피자</c:when>
							<c:otherwise>기타</c:otherwise>							
						</c:choose></td>
					</tr>
				</table>
			</section>
			<section class="content container-fluid">			
				<div class="container-fluid">
					<ul class="no-margin pull-right">
						<li style="display:inline-block"><button type="submit" class="btn btn-block btn-default"
						onclick="location.href='member_MyinfoForm.do?mem_id=${member.mem_id}'">회원 정보 수정</button></li>
					</ul>
				</div>
			</section>
		</div>
	</div>
<%@ include file="../include/main_footer.jsp" %>
	</div>
<%@ include file="../include/plugin_js.jsp" %>
</body>
</html>