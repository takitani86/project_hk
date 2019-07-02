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
	<tr>
    <th>번호</th>
    <th>작성자</th>
    <th>제목</th>
    <th>작성일</th>
    <th>조회수</th>
  </tr>
  <c:choose>
    <c:when test="${empty list}">
      <tr>
        <td colspan="5">----작성된 글이 없습니다.----</td>
      </tr>
    </c:when>
  <c:otherwise>
  <c:forEach var="list" items="${list}">
    <tr>
      <td>${list.qna_seq}</td>
      <td>${list.mem_id}</td>
      <td>${list.qna_title}</td>
      <td>${list.qna_regDate}</td>
      <td>${list.qna_readCount}</td>
    </tr>
  </c:forEach>
  </c:otherwise>
  </c:choose>
</table>
  <a href="qna_write.do">글쓰기</a>
</body>
</html>