<%@ page import="com.hk.one.dto.MemberDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원 목록 페이지</title>
<meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">

<script type="text/javascript">
	var mem_id = "mem_id";
	function goDetail(mem_id) {
 		location.href = 'memberDetail.do?mem_id=' + mem_id; 
	}
</script>
<style type="text/css">
	#tableSelect > tbody {
		cursor: pointer;
	}
	#tableSelect > tbody:hover {
		background-color: gray;
	}
</style>
</head>
<body class="skin-blue-light">
	<div class="wrapper">
		<section class="content-header">
			<form name="searchForm" method="post" action="./searchMember.do">
				<div class="form-group" style='display:inline; width:100px; float:left; margin-right:10px;'>
					<select name="searchOption" size='1' class='form-control'>
						<option value='all' <c:out value="${map.searchOption == 'all'?'selected':''}"/>>전체</option>
						<option value='mem_name' <c:out value="${map.searchOption == 'mem_name'?'selected':''}"/>>회원 이름</option>
						<option value="mem_id" <c:out value="${map.searchOption == 'mem_id'?'selected':''}"/>>회원ID</option>
						<option value="mem_b_name" <c:out value="${map.searchOption == 'mem_b_name'?'selected':''}"/>>상호명</option>
						<option value="mem_seq" <c:out value="${map.searchOption == 'mem_seq'?'selected':''}"/>>회원 번호</option>	
					</select>
				</div>
				<div class="input-group input-group-sm" style="width: 200px; float:left;">
					<input type="text" name="keyword" class="form-control" value="${map.keyword}">
					<span class="input-group-btn">
						<button type="submit" class="btn btn-info btn-flat">조회</button>
					</span>
				</div>
			</form>
		</section>
	</div>	
	<div class="content-wrapper">
		<div class="row">
			<div class="col-xs-12">
				<section class="content-subject">
					<h3 class="box-title">회원 목록</h3>
				</section>
				<table border="1" id="tableSelect" class="table table-bordered table-hover">
					<col width="50px"><col width="80px"><col width="150px"><col width="150px"><col width="150px"><col width="80px"><col width="80px">
					<tr>
						<th>회원번호</th><th>이미지</th><th>회원ID</th><th>회원 이름</th><th>상호명</th><th>승인</th><th>상태</th>
					</tr>
					<c:choose>
						<c:when test="${empty list}">
							<tr><td colspan="10">-----가입된 회원이 없습니다.-----</tr>
						</c:when>
						<c:otherwise>
							<c:forEach items="${list}" var="member">
								<tbody onclick="goDetail('${member.mem_id}')">
								<tr>
									<td>${member.mem_seq}</td>
									<td>${member.mem_image}</td>
									<td>${member.mem_id}</td>
									<td>${member.mem_name}</td>
									<td>${member.mem_b_name}</td>
									<td>
										<c:set var="isApprove" value="${member.mem_isApprove}" />
										<c:choose>
											<c:when test="${isApprove == 1}">
											승인
											</c:when>
											<c:otherwise>
											미승인
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<c:set var="isDel" value="${member.mem_isDel}" />
										<c:choose>
											<c:when test="${isDel == 1}">
											탈퇴
											</c:when>
											<c:otherwise>
											가입
											</c:otherwise>
										</c:choose>
									</td>
								</tr>
								</tbody>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				<div class="box-footer">
					<div class="box-tools">
						<ul class="pagination pagination-sm no-margin pull-right">
							<li><a href="#">&laquo;</a></li>
							<li><a href="#">1</a></li>
							<li><a href="#">2</a></li>
							<li><a href="#">3</a></li>
							<li><a href="#">&raquo;</a></li>
						</ul>
					</div>
					<button type="submit" onclick="location.href='joinMemberForm.do'" class="btn btn-block btn-default">회원 추가</button>
					<button onclick="location.href='home.do'" class="btn btn-block btn-default">홈으로</button>
					<button onclick="location.href='<c:url value="to_find_PwForm.do"/>'" class="btn btn-block btn-default">비밀번호 찾기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>