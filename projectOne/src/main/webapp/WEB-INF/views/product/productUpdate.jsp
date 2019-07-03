<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상품수정하기</title>
</head>
<body>
<h1>상품수정하기</h1>
<form action="updateReceiveProduct.do" method="post">
	<table border="1">
		<tr>
			<th>상품번호</th>
			<td><input type="text" name="pro_seq" value="${dto.pro_seq}"></td>
		</tr>
		<tr>
			<th>상품이름</th>
			<td><input type="text" name="pro_name" value="${dto.pro_name}"></td>
		</tr>
		<tr>
			<th>상품이미지</th>
			<td><input type="text" name="pro_image" value="${dto.pro_image}"></td>
		</tr>
		<tr>
			<th>가격</th>
			<td><input type="text" name="pro_price" value="${dto.pro_price}"></td>
		</tr>
		<tr>
			<th>상품설명</th>
			<td><textarea rows="10" cols="60" name="pro_desc"> ${dto.pro_desc}</textarea></td>
		</tr>
		<tr>
			<th>카테고리선택</th>
			<td><input type="text" name="cat_seq" value="${dto.cat_seq}"></td>
		</tr>
		<tr>
			<th>메인여부</th>
			<td><input type="text" name="pro_option" value="${dto.pro_option}"></td>
		</tr>
		<tr>
			<th>메뉴판선택</th>
			<td><input type="text" name="pro_menu" value="${dto.pro_menu}"></td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="상품수정" />
				<input type="button" value="목록" onclick="location.href='productList.do'"/>
			</td>
		</tr>
	</table>
</form>
</body>
</html>