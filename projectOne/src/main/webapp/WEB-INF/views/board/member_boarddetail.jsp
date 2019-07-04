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
<table border="1">
  <tr>
    <th>번호</th>
    <td>${boarddetail.qna_seq}</td>
  </tr>
  <tr>
    <th>아이디</th>
    <td>${boarddetail.mem_id}</td>
  </tr>
  <tr>
    <th>제목</th>
    <td>${boarddetail.qna_title}</td>
  </tr>
  <tr>
    <th>내용</th>
    <td><textarea cols="60" rows="10">${boarddetail.qna_content}</textarea></td>
  </tr>
  <tr>
    <th>첨부이미지 미리보기</th>
    <td>
      <img src="${pageContext.request.contextPath}/image/${boarddetail.qna_fileName}" width=200 height=200/>
    </td>
  </tr>
  <tr>
    <td colspan="2">
      <button type="button" onclick="updateForm('${boarddetail.qna_seq}')">수정</button>
      <button type="button" onclick="delBoard('${boarddetail.qna_seq}')">삭제</button>
      <input type="button" value="목록" onclick="location.href='member_board.do'">
    </td>
  </tr>
</table>
<script>
  // 수정폼으로 이동
  function updateForm(seq) {
    location.href="member_updateForm.do?seq=" + seq;
  }
  // 삭제하기
  function delBoard(seq) {
    location.href="member_del.do?seq=" + seq;
  }
</script>
</body>
</html>