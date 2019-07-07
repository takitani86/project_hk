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
  <col width="300px">
  <col width="100px">
  <col width="50px">
	<tr>
    <th>번호</th>
    <th>작성자</th>
    <th>제목</th>
    <th>작성일</th>
    <th>조회수</th>
  </tr>
  <c:choose>
    <c:when test="${empty board}">
      <tr>
        <td colspan="5">----작성된 글이 없습니다.----</td>
      </tr>
    </c:when>
  <c:otherwise>
  <c:forEach var="board" items="${board}">
    <tr>
      <td>${board.qna_seq}</td>
      <td>${board.mem_id}</td>
      <td align='left'>
        <span style="padding-left:30px;"></span>
      <c:choose>
        <c:when test='${board.level > 1}'>
          <c:forEach begin="1" end="${board.level}" step="1">
            <span style="padding-left:20px;"></span>
          </c:forEach>
          <span style="font-size:12px;">[답변]</span><a href="member_boarddetail.do?seq=${board.qna_seq}">${board.qna_title}</a>
        </c:when>
        <c:otherwise>
          <a href="member_boarddetail.do?seq=${board.qna_seq}">${board.qna_title}</a>
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
<c:if test="${totalArticles != null}">
  <c:choose>
    <c:when test="${totalArticles > 100}">
      <c:forEach var="page" begin="1" end="10" step="1">
        <c:if test="${section > 1 && page == 1}">
          <a href="member_board.do?section=${section-1}&curPage=${(section-1)*10+1}">&nbsp;[이전]</a>
        </c:if>
        <a href="member_board.do?section=${section}&curPage=${page}">${(section-1)*10+page}</a>
        <c:if test="${page == 10}">
          <a href="member_board.do?section=${section+1}&curPage=${section*10+1}">&nbsp;[다음]</a>
        </c:if>
      </c:forEach>
    </c:when>
    <c:when test="${totalArticles == 100}">
      <c:forEach var="page" begin="1" end="10" step="1">
        <a href="#">${page}</a>
      </c:forEach>
    </c:when>

    <c:when test="${totalArticles < 100}">
      <c:forEach var="page" begin="1" end="${totalArticles/10+1}" step="1">
        <c:choose>
          <c:when test="${page==curPage}">
            <a href="member_board.do?section=${section}&curPage=${page}">${page}</a>
          </c:when>
          <c:otherwise>
            <a href="member_board.do?section=${section}&curPage=${page}">${page}</a>
          </c:otherwise>
        </c:choose>
      </c:forEach>
    </c:when>
  </c:choose>
</c:if>
</div>
  <a href="member_writeForm.do">글쓰기</a>
  <a href="../home.do">메인화면</a>
  <a href="dummy.do">게시글 100개 추가</a>
</body>
</html>

<!-- <div>
    <c:if test="${pagination.curRange ne 1}">
      <a href="#" onclick="fn_paging(1)">[처음]</a>
    </c:if>
    <c:if test="${pagination.curPage ne 1}">
      <a href="#" onclick="fn_paging('${pagination.prevPage}')">[이전]</a>
    </c:if>
    <c:forEach var="pageNum" begin="${pagination.startPage}" end="${pagination.endPage}">
      <c:choose>
        <c:when test="${pageNum eq pagination.curPage}">
          <span style="font-weight: bold;"><a href="#" onclick="fn_paging('${pageNum}')">${pageNum}</a></span>
        </c:when>
        <c:otherwise>
          <a href="#" onclick="fn_paging('${pageNum}')">${pageNum}</a>
        </c:otherwise>
      </c:choose>
    </c:forEach>
    <c:if test="${pagination.curPage ne pagination.pageCnt && pagination.pageCnt > 0}">
      <a href="#" onclick="fn_paging('${pagination.nextPage}')">[다음]</a>
    </c:if>
    <c:if test="${pagination.curRange ne pagination.rangeCnt && pagination.rangeCnt > 0}">
      <a href="#" onclick="fn_paging('${pagination.pageCnt}')">[끝]</a>
    </c:if>
    </div>
    <div>
      총 게시글 수 : ${pagination.listCnt} / 총 페이지 수 : ${pagination.pageCnt} / 현재 페이지 : ${pagination.curPage} / 현재 블럭 : ${pagination.curRange} / 총 블럭 수 : ${pagination.rangeCnt}
    </div>
      <a href="member_writeForm.do">글쓰기</a>
      <a href="../home.do">메인화면</a>
      <a href="dummy.do">게시글 100개 추가</a>
    
      <script>
        function fn_paging(pageNum) {
          location.href="member_board.do?curPage=" + pageNum;
        }
      </script> -->