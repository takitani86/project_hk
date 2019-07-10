<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터 게시판</title>
</head>
<body>
<table border="1">
  <col width="50px">
  <col width="50px">
  <col width="50px">
  <col width="300px">
  <col width="100px">
  <col width="50px">
	<tr>
    <th><input type="checkbox" name="allCheck" onclick="allSel(this.checked);"></th>
    <th>번호</th>
    <th>작성자</th>
    <th>제목</th>
    <th>작성일</th>
    <th>조회수</th>
  </tr>
  <c:choose>
    <c:when test="${empty searchArticles}">
      <tr>
        <td colspan="5">----검색 결과가 없습니다.----</td>
      </tr>
    </c:when>
  <c:otherwise>
  <c:forEach var="board" items="${searchArticles}">
    <tr>
      <td><input type="checkbox" name="chk" value="${board.qna_seq}"></td>
      <td>${board.qna_seq}</td>
      <td>${board.mem_id}</td>
      <td align='left'>
        <span style="padding-left:30px;"></span>
      <c:choose>
        <c:when test='${board.level > 1}'>
          <c:forEach begin="1" end="${board.level}" step="1">
            <span style="padding-left:20px;"></span>
          </c:forEach>
          <span style="font-size:12px;">[답변]</span><a href="admin_boarddetail.do?seq=${board.qna_seq}">${board.qna_title}</a>
        </c:when>
        <c:otherwise>
          <a href="admin_boarddetail.do?seq=${board.qna_seq}">${board.qna_title}</a>
        </c:otherwise>
      </c:choose>
      </td>
      <td><fmt:formatDate value="${board.qna_regDate}"/></td>
      <td>${board.qna_readCount}</td>
    </tr>
  </c:forEach>
  </c:otherwise>
  </c:choose>
</table>
<div>
${searchCount}개의 게시물이 있습니다.
  <div>
    <form action="searchBoard.do" method="POST" name="searchForm">
    <select name="searchType" size="1" class="select">
      <option value="all" <c:out value="${search.searchType == 'all'?'selected':''}"/>>전체</option>
      <option value="qna_title" <c:out value="${search.searchType == 'qna_title'?'selected':''}"/>>제목</option>
      <option value="qna_content" <c:out value="${search.searchType == 'qna_content'?'selected':''}"/>>내용</option>
      <option value="mem_id" <c:out value="${search.searchType == 'mem_id'?'selected':''}"/>>아이디</option>
    </select>
    <input name="keyword" value="${search.keyword}">
    <input type="submit" value="조회">
    </form>
  </div>
</div>
<div>
<c:if test="${searchCount != null}">
  <c:choose>
    <c:when test="${searchCount > 100}">
      <c:forEach var="page" begin="1" end="10" step="1">
        <c:if test="${section > 1 && page == 1}">
          <a href="admin_board.do?section=${section-1}&curPage=${(section-1)*10}">&nbsp;[이전]</a>
        </c:if>
        <a href="admin_board.do?section=${section}&curPage=${page}">${(section-1)*10+page}</a>
        <c:if test="${page == 10}">
          <a href="admin_board.do?section=${section+1}&curPage=1">&nbsp;[다음]</a>
        </c:if>
      </c:forEach>
    </c:when>
    <c:when test="${searchCount == 100}">
      <c:forEach var="page" begin="1" end="10" step="1">
        <a href="#">${page}</a>
      </c:forEach>
    </c:when>

    <c:when test="${searchCount < 100}">
      <c:forEach var="page" begin="1" end="${searchCount/10+1}" step="1">
        <c:choose>
          <c:when test="${page==curPage}">
            <a href="admin_board.do?section=${section}&curPage=${page}">${page}</a>
          </c:when>
          <c:otherwise>
            <a href="admin_board.do?section=${section}&curPage=${page}">${page}</a>
          </c:otherwise>
        </c:choose>
      </c:forEach>
    </c:when>
  </c:choose>
</c:if>
</div>
  <a href="admin_writeForm.do">글쓰기</a>
  <a href="../home.do">메인화면</a>
<!--   <a href="dummy.do">게시글 100개 추가</a> -->
<script>
  // 전체선택
  function allSel(chk) {
    var chks = document.getElementsByName("chk");
    for (var i = 0; i < chks.length; i++) {
      chks[i].checked = chk;
    }
  }
</script>
</body>
</html>