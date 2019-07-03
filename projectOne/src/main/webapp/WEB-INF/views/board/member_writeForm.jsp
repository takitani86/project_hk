<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script type="text/javascript" src="http://code.jquery.com/jquery-latest.js"></script>
<title>고객센터 게시판</title>
</head>
<body>
<form action="member_writeBoard.do" method="post" enctype="multipart/form-data">
  <table border="1">
    <tr>
      <th>아이디</th>
      <td colspan="2"><input type="text" name="id" readonly>${login_Session.mem_id}</td>
    </tr>
    <tr>
      <th>제목</th>
      <td colspan="2"><input type="text" name="title"></td>
    </tr>
    <tr>
      <th>내용</th>
      <td colspan="2"><textarea name="content" cols="60" rows="10"></textarea></td>
    </tr>
    <tr>
      <th>이미지파일 첨부:</th>
      <td><input type="file" name="imageFileName" onchange="readURL(this);"></td>
      <td><img id="preview" src="#" width=200 height=200/></td>
    </tr>
    <tr>
      <td colspan="3">
        <input type="submit" value="등록">
        <input type="button" value="목록" onclick="location.href='member_board.do'">
      </td>
    </tr>
  </table>  
</form>
<script>
  function readURL(input) {
    if (input.files && input.files[0]) {
      var reader = new Filereader();
      reader.onload = function (e) {
        $('#preview').attr('src', e.target.result);
      }
      reader.readAsDataURL(input.files[0]);
    }
  }
</script>
</body>
</html>