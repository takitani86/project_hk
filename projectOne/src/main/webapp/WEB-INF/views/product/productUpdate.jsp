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
          상품 상세보기 & 수정 <small></small>
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
              <form role="form" action="updateReceiveProduct.do" method="post" enctype="multipart/form-data">
                <div class="box-body">
                <input type="hidden" value="${dto.pro_seq}" name="pro_seq">
                  <div class="form-group">
                    <label for="id">상품명</label>
                    <input type="text" name="pro_name" class="form-control col-xs-4" value="${dto.pro_name}" id="id">
                  </div>
                  <div class="form-group">
                    <label for="price">가격</label>
                    <input type="text" name="pro_price" class="form-control" value="${dto.pro_price}" id="price">
                  </div>
                  <div class="form-group">
                    <label for="exampleInputFile">상품이미지</label>
                    <input type="file" name="uploadFile" onchange="readURL(this);" id="exampleInputFile">
                    <img src="resources/img/product/default_product.png" id="preview" width=250 height=400
                      alt="preview">
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
                    <textarea name="pro_desc" class="form-control" rows="8" id="desc" style="resize:none;">${dto.pro_desc}</textarea>
                  </div>
                </div>
                <!-- /.box-body -->

                <div class="box-footer">
                  <button type="submit" class="btn btn-primary">수정</button>
                  <button type="button" class="btn btn-danger" data-toggle="modal" data-target="#delProduct">삭제</button>
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
  <!-- 삭제창 Modal -->
  <div id="delProduct" class="modal" role="dialog">
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
            <button type="button" class="btn btn-danger" onclick="delProduct('${dto.pro_seq}');">예</button>
            <button type="button" class="btn btn-default" data-dismiss="modal">아니오</button>
          </div>
        </div>
  
      </div>
    </div>
  <!-- REQUIRED JS SCRIPTS -->

  <!-- JS 스크립트모음 -->
  <%@ include file="../include/plugin_js.jsp"%>

  <script>
    function delProduct(seq) {
      location.href="delProduct.do?seq=" + seq;
    }
  </script>
</body>

</html>