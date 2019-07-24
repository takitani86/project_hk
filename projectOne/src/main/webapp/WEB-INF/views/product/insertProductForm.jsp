<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HEAD(link파일들 모음) -->
<%-- include 경로를 불러온 jsp 페이지의 상대경로에 따라 
../를 추가해주어야 한다(절대경로로 할 방법이 없음) --%>
<%@ include file="../include/head.jsp"%>
<%  String pageNum=(String)session.getAttribute("countProductPageSession"); %>

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
          상품 추가 <small></small>
        </h1>
      </section>

      <!-- Main content -->
      <section class="content container-fluid">
        <div class="row">
          <!-- left column -->
          <div class="col-xs-10">
            <!-- general form elements -->
            <div class="box box-primary">
              <!-- form start -->
              <form role="form" action="insertReceiveProduct.do" method="post" enctype="multipart/form-data">
                <div class="box-body">
                  <div class="form-group">
                    <label for="id">상품명</label>
                    <input type="text" name="pro_name" class="form-control col-xs-4" id="id">
                  </div>
                  <div class="form-group">
                    <label for="price">가격</label>
                    <input type="text" name="pro_price" class="form-control" id="price">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputFile">상품이미지</label>
                    <input type="file" name="uploadFile" onchange="readURL(this);" id="exampleInputFile">
                    <img src="#" id="preview" width=250 height=400 alt="preview">
                  </div>
                  <div class="form-group">
                    <label for="content">카테고리 선택</label>
                    <select class="form-control" name="cat_seq">
                      <c:forEach var="cate" items="${category}">
                        <option value="${cate.cat_seq}">${cate.cat_name}</option>
                      </c:forEach>
                    </select>
                  </div>
                  <div class="form-group">
                    <label for="desc">상품 상세설명</label>
                    <textarea name="pro_desc" class="form-control" rows="8" id="desc"
                    style="resize:none;"></textarea>
                  </div>
                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                  <button type="submit" class="btn btn-primary">등록</button>
                  <button type="button" class="btn btn-default"
                    onclick="location.href='productList.do?countProductPage=<%=pageNum%>&sort=${sort}'">돌아가기</button>
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