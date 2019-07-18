<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>

<html>
<!-- HEAD(link파일들 모음) -->
<%@ include file="../include/head.jsp"%>

<body class="hold-transition skin-blue sidebar-mini">

	<div class="wrapper">
		<!-- Main Header(네비게이션 바) -->
		<%@ include file="../include/main_header.jsp"%>

		<!-- Left Column(사이드바) -->
		<%@ include file="../include/left_column.jsp"%>
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<section class="content-header">
				<h1>
					고객센터 게시판 <small>관리자용</small>
					<hr>
				</h1>
			</section>
			<section class="content container-fluid">
				<table class="table table-striped table-bordered table-hover">
					<thead>
						<tr>
							<th width="2%"><input type="checkbox" name="allCheck" onclick="allSel(this.checked);"></th>
							<th width="5%">번호</th>
							<th width="4%">작성자</th>
							<th width="50%">제목</th>
							<th width="5%">작성일</th>
							<th width="4%">조회수</th>
						</tr>
					</thead>
					<c:choose>
						<c:when test="${empty board}">
							<tr>
								<td colspan="5">----작성된 글이 없습니다.----</td>
							</tr>
						</c:when>
						<c:otherwise>
							<c:forEach var="board" items="${board}">
								<tr>
									<td><input type="checkbox" name="chk" value="${board.qna_seq}"></td>
									<td>${board.qna_seq}</td>
									<td>${board.mem_id}</td>
									<td align='left'>
										<c:choose>
											<c:when test='${board.level > 1}'>
												<c:forEach begin="1" end="${board.level}" step="1">
													<span style="padding-left: 20px;"></span>
												</c:forEach>
												<span style="font-size: 12px;">[답변]</span>
												<a href="admin_boarddetail.do?seq=${board.qna_seq}">${board.qna_title}</a>
											</c:when>
											<c:otherwise>
												<a href="admin_boarddetail.do?seq=${board.qna_seq}">${board.qna_title}</a>
											</c:otherwise>
										</c:choose>
									</td>
									<td>
										<fmt:formatDate value="${board.qna_regDate}" />
									</td>
									<td>${board.qna_readCount}</td>
								</tr>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</table>
				<div class="form-group">
					<form class="form-inline" action="searchBoard.do" method="POST" name="searchForm">
						<div class="form-group">
							<select class="form-control" name="searchType" size="1" class="select">
								<option value="all" <c:out value="${search.searchType == 'all'?'selected':''}" />>전체</option>
								<option value="qna_title" <c:out value="${search.searchType == 'qna_title'?'selected':''}" />>제목
								</option>
								<option value="qna_content" <c:out value="${search.searchType == 'qna_content'?'selected':''}" />>내용
								</option>
								<option value="mem_id" <c:out value="${search.searchType == 'mem_id'?'selected':''}" />>아이디</option>
							</select>
						</div>
						<div class="form-group">
							<input class="form-control" name="keyword" value="${search.keyword}">
						</div>
						<div class="form-group">
							<button class="btn-default" type="submit">
								<i class="glyphicon glyphicon-search"></i>
							</button>
						</div>
					</form>
					<div>
						<ul class="pagination">
							<c:if test="${totalArticles != null}">
								<c:choose>
									<c:when test="${totalArticles > 100}">
										<c:forEach var="page" begin="1" end="10" step="1">
											<c:if test="${section > 1 && page == 1}">
												<a href="admin_board.do?section=${section-1}&curPage=${(section-1)*10}">&nbsp;[이전]</a>
											</c:if>
											<li><a href="admin_board.do?section=${section}&curPage=${page}">${(section-1)*10+page}</a></li>
											<c:if test="${page == 10}">
												<a href="admin_board.do?section=${section+1}&curPage=1">&nbsp;[다음]</a>
											</c:if>
										</c:forEach>
									</c:when>
									<c:when test="${totalArticles == 100}">
										<c:forEach var="page" begin="1" end="10" step="1">
											<li><a href="#">${page}</a></li>
										</c:forEach>
									</c:when>
									<c:when test="${totalArticles < 100}">
										<c:forEach var="page" begin="1" end="${totalArticles/10+1}" step="1">
											<c:choose>
												<c:when test="${page==curPage}">
													<li><a href="admin_board.do?section=${section}&curPage=${page}">${page}</a></li>
												</c:when>
												<c:otherwise>
													<li><a href="admin_board.do?section=${section}&curPage=${page}">${page}</a></li>
												</c:otherwise>
											</c:choose>
										</c:forEach>
									</c:when>
								</c:choose>
							</c:if>
						</ul>
					</div>
					<input type="button" class="btn-default" onclick="location.href='admin_writeForm.do'" value="글쓰기">
			</section>
		</div>
	<!-- Main Footer -->
	<%@ include file="../include/main_footer.jsp"%>

	</div>
	<!-- /wrapper -->

	<script>
		// 전체선택
		function allSel(chk) {
			var chks = document.getElementsByName("chk");
			for (var i = 0; i < chks.length; i++) {
				chks[i].checked = chk;
			}
		}
	</script>
	<%@ include file="../include/plugin_js.jsp"%>
</body>

</html>