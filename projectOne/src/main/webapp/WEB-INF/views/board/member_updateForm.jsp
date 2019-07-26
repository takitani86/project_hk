<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HEAD(link파일들 모음) -->
<%-- include 경로를 불러온 jsp 페이지의 상대경로에 따라 
../를 추가해주어야 한다(절대경로로 할 방법이 없음) --%>
<%@ include file="../include/head.jsp"%>

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
          고객센터 게시판 <small>점주용</small>
        </h1>
      </section>

      <!-- Main content -->
      <section class="content container-fluid">
        <div class="row">
          <div class="col-xs-10">
            <div class="box box-primary">
              <!-- form start -->
              <form role="form" action="member_updateBoard.do" method="post" enctype="multipart/form-data">
                <input type="hidden" name="qna_seq" value="${boarddetail.qna_seq}">
                <div class="box-body">
                  <div class="form-group">
                    <label for="id">아이디</label>
                    <input type="text" name="mem_id" class="form-control col-xs-3" id="id"
                      placeholder="${boarddetail.mem_id}" readonly>
                  </div>
                  <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" name="qna_title" class="form-control" id="title"
                      value="${boarddetail.qna_title}">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputFile">파일 첨부</label>
                    <input type="file" name="uploadFile" onchange="readURL(this);" id="exampleInputFile">
                    <c:if test="${boarddetail.qna_fileName != null}">
                      <img onerror="this.style.display='none'" src="#" id="preview" width=250 height=400 alt="preview">
                      <p class="help-block">미리보기가 표시됩니다.</p>
                    </c:if>
                  </div>
                  <div class="form-group">
                    <label for="content">내용</label>
                    <textarea name="qna_content" class="form-control" rows="8" id="content"
                      style="resize:none;">${boarddetail.qna_content}</textarea>
                  </div>
                </div>
                <!-- /.box-body -->

                <div class="box-footer btn-group">
                  <button class="btn btn-default" type="submit">수정</button>
                  <button class="btn btn-danger" type="button" data-toggle="modal" data-target="#delBoard">삭제</button>
                  <input class="btn btn-default" type="button" value="돌아가기"
                    onclick="location.href='member_boarddetail.do?seq=${boarddetail.qna_seq}'">
                </div>
              </form>
            </div>
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

  <script>
    // 수정폼으로 이동
    function updateForm(seq) {
      location.href = "member_updateForm.do?seq=" + seq;
    }
    // 삭제하기
    function delBoard(seq) {
      location.href = "member_del.do?seq=" + seq;
    }
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
  </script>
</body>

</html>