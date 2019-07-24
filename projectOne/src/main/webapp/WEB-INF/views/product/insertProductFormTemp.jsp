<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품추가하기</title>.
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<%  String pageNum=(String)session.getAttribute("countProductPageSession"); %>
</head>
<body>
<h1>상품추가하기</h1>
<form action="insertReceiveProduct.do" method="post" enctype="multipart/form-data">
	<table border="1">
		<tr>
			<th>상품이름</th>
			<td><input type="text" name="pro_name" required="required"/></td>
		</tr>
		<tr>
			<th>상품이미지</th>
			 <td><input type="file" name="uploadFile" onchange="readURL(this);"></td>
     		 <td><img id="preview" src="#" width=200 height=200/></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="text" name="pro_price" required="required"/></td>
		</tr>
		<tr>
			<th>상품설명</th>
			<td><textarea rows="10" cols="60" name="pro_desc" required="required"></textarea></td>
		</tr>
		<tr>
			<th>카테고리선택</th>
			<td><input type="text" name="cat_seq" required="required"/></td>
		</tr>
		<tr>
			<th>메인여부</th>
			<td><input type="text" name="pro_option" required="required"/></td>
		</tr>
		<tr>
			<th>메뉴판선택</th>
			<td><input type="text" name="pro_menu" required="required"/></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="상품등록" />
				<input type="button" value="목록" onclick="location.href='productList.do?countProductPage=<%=pageNum%>&sort=${sort}'"/>
			</td>
		</tr>
	</table>
</form>
<script type="text/javascript">
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new FileReader();
      reader.onload = function (e) {
        $('#preview').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  };
</script>
</body>
</html>