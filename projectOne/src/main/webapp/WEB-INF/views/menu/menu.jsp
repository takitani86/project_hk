<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>메뉴판</title>
</head>
<body>
<div>
  <table border="1">
    <tr>
      <c:if test="${not empty category}">
        <c:forEach var="cate" items="${category}">
          <td onclick="menuList(${cate.cat_seq});">${cate.cat_name}</a></td>
        </c:forEach>
      </c:if>
    </tr>
  </table>
</div>
<div>
  <table class="menuList">
  </table>
</div>
<%@ include file="menulist.jsp" %>
</body>
</html>