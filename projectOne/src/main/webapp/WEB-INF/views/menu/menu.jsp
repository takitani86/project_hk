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
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>메뉴판</title>
</head>
<body>
<div>
  <table border="1">
    <tr>
      <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addCategory">
        카테고리 추가
      </button>
      <button type="button" class="btn btn-secondary" onclick="consumer();">
        손님용 메뉴판
      </button>
      <c:if test="${not empty category}">
        <c:forEach var="cate" items="${category}">
          <td id="${cate.cat_seq}" onclick="menuList(${cate.cat_seq});">${cate.cat_name}</a></td>
        </c:forEach>
        <script>
          $(document).ready(function(){
            var seq = $('td:first').attr("id");
            menuList(seq);
          })
        </script>
      </c:if>
    </tr>
  </table>
</div>
<div>
  <table class="menuList">
  </table>
</div>
<%@ include file="menulist.jsp" %>

<!-- 카테고리 추가 MODAL -->
<div class="modal fade" id="addCategory" tabindex="-1" role="dialog" aria-labelledby="addCategoryLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="addCategoryLabel">카테고리 추가</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <input type="text" class="form-control" id="add">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
          <button type="button" class="btn btn-primary" onclick="addCategory();">추가</button>
        </div>
      </div>
    </div>
  </div>

<script>
  function addCategory() {
    location.href="addCategory.do?add=" + $('#add').val();
  }
</script>
</body>
</html>