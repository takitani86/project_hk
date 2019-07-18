<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<script
  src="https://code.jquery.com/jquery-3.4.1.min.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<%@ include file="../include/head.jsp" %>
<body class="hold-transition skin-blue">
<%@ include file="../include/main_header.jsp" %>
<%@ include file="../include/left_column.jsp" %>
	<div class="wrapper">
		<div class="ground1" style="display: inline-block; width: 150px; top:0px;"> <!-- 사진 등록 위로 올리기 -->
			<img src="${member.mem_image}" class="img-circle"
				alt="User Image" style="width: 80px; height: 80px"> <br />
			<button type="button" onclick="#" class="btn btn-block btn-default">사진 등록</button>
		</div>
		<div class="ground2" style="display: inline-block">
			<div class="box" style="width:500px;">
				<div class="box-header">
					<h3 class="box-title">기본 정보</h3>
				</div>
				<div class="box-body no-padding">
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
							<th>비밀번호</th>
							<td><input type="password" value="${member.mem_pw}" readonly></td>
						</tr>
						<tr>
							<th>승인 상태</th>
							<td>${member.mem_isApprove}</td>
						</tr>
						<tr>
							<th>탈퇴 여부</th>
							<td>${member.mem_isDel}</td>
						</tr>
						<tr>
							<th>가입일</th>
							<td>${member.mem_regDate}</td>
						</tr>
					</table>
				</div>
				<br>
				<div class="box-header">
					<h3 class="box-title">매장 정보</h3>
				</div>
				<div class="box-body no-padding">
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
					<table class="table">
						<tr>
							<td>
								<button type="submit" class="btn btn-block btn-default"
									onclick="location.href='member_infoForm.do?mem_id=${member.mem_id}'">회원 정보 수정</button>
							</td>
							<td>
								<button type="submit" class="btn btn-block btn-default"
									onclick="location.href='memberList.do'">회원 목록</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
<%@ include file="../include/main_footer.jsp" %>
<%@ include file="../include/plugin_js.jsp" %>
</body>
</html>