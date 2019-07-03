<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>고객센터 게시판</title>
</head>
<body>
<form action="member_write.do" method="post">
  <table border="1">
    <tr>
      <th>아이디</th>
      <td><input type="text" name="id" readonly>${list.mem_id}</td>
    </tr>
    <tr>
      <th>제목</th>
      <td><input type="text" name="title"></td>
    </tr>
    <tr>
      <th>내용</th>
      <td><textarea name="content" cols="60" rows="10"></textarea></td>
    </tr>
    <tr>
      <td colspan="2">
        <input type="submit" value="등록">
        <input type="button" value="목록" onclick="member_board.do">
      </td>
    </tr>
  </table>  
</form>
</body>
</html>