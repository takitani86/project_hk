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
          <!-- left column -->
          <div class="col-xs-10">
            <!-- general form elements -->
            <div class="box box-primary">
              <div class="box-header with-border">
                <h3 class="box-title">글쓰기</h3>
              </div>
              <!-- /.box-header -->
              <!-- form start -->
              <form role="form" action="member_writeBoard.do" method="post" enctype="multipart/form-data">
                <div class="box-body">
                  <div class="form-group">
                    <label for="id">아이디</label>
                    <input type="text" name="mem_id" class="form-control col-xs-4" id="id" value="${user.username}" placeholder="${user.username}"
                      readonly>
                  </div>
                  <div class="form-group">
                    <label for="title">제목</label>
                    <input type="text" name="qna_title" class="form-control" id="title" placeholder="제목">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputFile">파일 첨부</label>
                    <input type="file" name="uploadFile" onchange="readURL(this);" id="exampleInputFile">
                    <img src="#" id="preview" width=250 height=400 alt="preview">
                    <p class="help-block">미리보기가 표시됩니다.</p>
                  </div>
                  <div class="form-group">
                    <label for="content">내용</label>
                    <textarea name="qna_content" class="form-control" rows="8" id="content"
                      placeholder="내용을 입력하세요." style="resize:none;"></textarea>
                  </div>
                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                  <button type="submit" class="btn btn-primary">등록</button>
                </div>
              </form>
            </div>
            <!-- /.box -->
      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->

    <!-- Main Footer -->
    <%@ include file="../include/main_footer.jsp"%>

  </div>
  <!-- ./wrapper -->

  <!-- REQUIRED JS SCRIPTS -->

  <!-- JS 스크립트모음 -->
  <%@ include file="../include/plugin_js.jsp"%>

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