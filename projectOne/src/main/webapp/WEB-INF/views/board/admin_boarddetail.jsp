<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<!-- HEAD(link파일들 모음) -->
<%-- include 경로를 불러온 jsp 페이지의 상대경로에 따라 
../를 추가해주어야 한다(절대경로로 할 방법이 없음) --%>
<%@ include file="../include/head.jsp"%>
<style>
  #replyForm {
    display: none;
  }
</style>

<body class="layout-boxed skin-blue sidebar-mini">
  <div class="wrapper">
    <!-- Main Header(네비게이션 바) -->
    <%@ include file="../include/main_header.jsp"%>

    <!-- Left Column(사이드바) -->
    <%@ include file="../include/left_column.jsp"%>

    <!-- Content Wrapper. Contains page content -->
    <div class="content-wrapper">
      <!-- Content Header (Page header) -->
      <section class="content-header">
        <h1>
          고객센터 게시판 <small>관리자용</small>
          <hr>
        </h1>
      </section>

      <!-- Main content -->
      <section class="content container-fluid">
        <div class="row">
          <div class="col-xs-10">
            <div class="box box-primary">
              <!-- form start -->
              <div class="box-body">
                <div class="form-group">
                  <label for="id">아이디</label>
                  <input type="text" name="mem_id" class="form-control col-xs-3" id="id"
                    placeholder="${boarddetail.mem_id}" readonly>
                </div>
                <div class="form-group">
                  <label for="title">제목</label>
                  <input type="text" name="qna_title" class="form-control" id="title" value="${boarddetail.qna_title}"
                    readonly>
                </div>
                <div class="form-group">
                  <label for="exampleInputFile">첨부된 파일</label>
                 
                  <p class="help-block">이미지일 경우 미리보기가 표시됩니다.</p>
                </div>
                <div class="form-group">
                  <label for="content">내용</label>
                  <textarea name="qna_content" class="form-control" rows="8" id="content" disabled
                    style="resize:none;">${boarddetail.qna_content}</textarea>
                </div>
              </div>
              <!-- /.box-body -->

              <div class="box-footer btn-group">
                <c:if test="${user.username == boarddetail.mem_id}">
                  <button class="btn btn-default" type="button"
                    onclick="updateForm('${boarddetail.qna_seq}')">수정</button>
                    <button class="btn btn-danger" type="button" data-toggle="modal" data-target="#delBoard">삭제</button>
                </c:if>
                <c:if test="${user.username != boarddetail.mem_id}">
                  <button class="btn btn-default" type="button" onclick="replyForm()">답글달기</button>
                </c:if>
              </div>
            </div>
            <!-- /.box -->
            <!-- 답글폼 -->
            <div class="box box-primary" id="replyForm">
              <div class="box-body">
                <div class="form-group">
                  <h1>답글</h1>
                  <form action="admin_replyBoard.do" method="post" enctype="multipart/form-data">
                    <input type="hidden" name="seq" value="${boarddetail.qna_seq}">
                    <table class="table table-bordered table-hover">
                      <tr>
                        <th width="10%">아이디</th>
                        <td colspan="2"><input class="form-control" type="text" name="mem_id" value="ADMIN" readonly>
                        </td>
                      </tr>
                      <tr>
                        <th>제목</th>
                        <td colspan="2"><input class="form-control type=" text" name="qna_title"></td>
                      </tr>
                      <tr>
                        <th><input type="file" name="uploadFile" onchange="readURL(this);"></th>
                        <td><img id="preview" src="<c:url value='/resources/dist/img/default-50x50.gif'/>" width=200
                            height=200 /></td>
                      </tr>
                      <tr>
                        <th>내용</th>
                        <td colspan="2"><textarea name="qna_content" class="form-control rounded-0" rows="5"></textarea>
                        </td>
                      </tr>
                      <tr>
                        <td colspan="3">
                          <input class="btn btn-default" type="submit" value="등록">
                          <input class="btn btn-default" type="button" value="목록" onclick="history.back()">
                        </td>
                      </tr>
                    </table>
                  </form>
                </div>
              </div>
            </div>
            <!-- 댓글목록 -->
            <div class="box">
              <div class="box-body" id="commentList">

              </div>
              <!-- 댓글  -->
              <label for="content">댓글</label>
              <form name="commentInsertForm">
                <div class="input-group">
                  <input type="hidden" name="qna_seq" value="${boarddetail.qna_seq}">
                  <input type="text" class="form-control" id="content" name="com_content" placeholder="내용을 입력하세요.">
                  <span class="input-group-btn">
                    <button class="btn btn-default" type="button" name="commentInsertBtn">등록</button>
                  </span>
                </div>
              </form>
            </div>
          </div>
          <%@ include file="comment.jsp" %>
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <%@ include file="../include/main_footer.jsp"%>

  </div>
  <!-- ./wrapper -->
  <!-- 삭제창 Modal -->
  <div id="delBoard" class="modal" role="dialog">
    <div class="modal-dialog modal-sm">

      <!-- Modal content-->
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal">&times;</button>
          <h4 class="modal-title">삭제 확인</h4>
        </div>
        <div class="modal-body">
          <p>정말 삭제하시겠습니까?</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-danger" onclick="delBoard('${boarddetail.qna_seq}');">예</button>
          <button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
        </div>
      </div>

    </div>
  </div>
  <!-- REQUIRED JS SCRIPTS -->

  <!-- JS 스크립트모음 -->
  <%@ include file="../include/plugin_js.jsp"%>

  <!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
  <script>
    // 이미지 미리보기
    function readURL(input) {
      if (input.files && input.files[0]) {
        var reader = new FileReader();
        reader.onload = function (e) {
          $('#preview').attr('src', e.target.result);
        }
        reader.readAsDataURL(input.files[0]);
      }
    };
    // 답글작성폼으로 이동
    function replyForm() {
      $('#replyForm').toggle();
    }

    // 수정폼으로 이동
    function updateForm(seq) {
      location.href = "admin_updateForm.do?seq=" + seq;
    }
    // 삭제하기
    function delBoard(seq) {
      location.href = "admin_del.do?seq=" + seq;
    }
  </script>
</body>

</html>