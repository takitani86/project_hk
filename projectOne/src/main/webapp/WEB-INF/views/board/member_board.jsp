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
  <a href="member_writeForm.do">글쓰기</a>
  <a href="../home.do">메인화면</a>
</body>
</html>