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
      <div class="container-fluid">
	      <section class="content-header" style="margin:0px 0px 0px 2px;">
	        <h1>
	          <strong>메뉴판 관리</strong> <small>점주용</small>
	        </h1>
	      </section>
      </div>

      <!-- Main content -->
      <section class="content">
        <div class="row">
          <div class="col-sm-10">
            <div class="box">
              <div class="box-header with-border">
                <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#addCategory">
                  카테고리 추가
                </button>
                <button type="button" class="btn btn-secondary" onclick="consumer();">
                  손님용 메뉴판
                </button>
              </div>
              <div class="box-body">
		      	<table class="table table-bordered" style="width:400px;">
                  <tr>
                    <c:if test="${not empty category}">
                      <c:forEach var="cate" items="${category}">
                        <td id="${cate.cat_seq}" onclick="menuList('${cate.cat_seq}');">${cate.cat_name}
                        &nbsp;&nbsp;&nbsp;<a href="delCategory.do?seq=${cate.cat_seq}" class="glyphicon glyphicon-minus"></a></td>
                      </c:forEach>
                      <script>
                        $(document).ready(function () {
                          var seq = $('td:first').attr("id");
                          menuList(seq);
                        })
                      </script>
                    </c:if>
                  </tr>
                </table>
              </div>
            </div>
            <div class="box">
              <div class="box-body">
              	<div class="container fluid" style="margin:10px 0px 10px 0px; padding:10px 10px 10px 10px;">
	                <table class="menuList">
	                <%@ include file="menulist.jsp" %>
	                </table>
              	</div>
              </div>
            </div>
          </div>
        </div>

      </section>
      <!-- /.content -->
    </div>
    <!-- /.content-wrapper -->
    
    <!-- 카테고리 추가 MODAL -->
    <div class="modal fade" id="addCategory" tabindex="-1" role="dialog" aria-labelledby="addCategoryLabel"
      aria-hidden="true">
      <div class="modal-dialog modal-sm" role="document">
        <div class="modal-content">
          <div class="modal-header">
            <h5 class="modal-title" id="addCategoryLabel">카테고리 추가</h5>
            <button type="button" class="close" data-dismiss="modal" aria-label="Close">
              <span aria-hidden="true">&times;</span>
            </button>
          </div>
          <div class="modal-body">
            <input type="text" class="form-control" id="add">
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-primary" onclick="addCategory();">추가</button>
          </div>
        </div>
      </div>
    </div>
    
    <!-- Main Footer -->
    <%@ include file="../include/main_footer.jsp"%>

  </div>
  <!-- ./wrapper -->

  <!-- REQUIRED JS SCRIPTS -->

  <!-- JS 스크립트모음 -->
  <%@ include file="../include/plugin_js.jsp"%>

  <script>
    function addCategory() {
      location.href = "addCategory.do?add=" + $('#add').val();
    }

    function consumer() {
      location.href = "consumer.do";
    }
  </script>
</body>

</html>