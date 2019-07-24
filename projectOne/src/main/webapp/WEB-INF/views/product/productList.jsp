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
          상품리스트 <small>상세보기</small>
        </h1>
      </section>

      <!-- Main content -->
      <section class="content container-fluid">

        <div class="row">
          <div class="col-xs-10">
            <div class="box">
              <!-- /.box-header -->
              <div class="box-body table-responsive no-padding">
                <table class="table table-hover">
                  <tr>
                    <th width="10%" onclick="sortNo(4)">카테고리
                    <th onclick="sortNo(2)">상품명</th>
                    <th onclick="sortNo(3)">가격</th>
                    <th width="40%">설명</th>
                    <th onclick="sortNo(0)">수정일</th>
                  </tr>
                  <c:choose>
                    <c:when test="${empty list}">
                      <tr>
                        <td>----등록된 상품이 없습니다----</td>
                      </tr>
                    </c:when>
                    <c:otherwise>
                      <c:forEach items="${list}" var="dto">
                        <tr>
                          <td>${dto.cat_seq}</td>
                          <td>${dto.pro_name}</td>
                          <td>${dto.pro_price}</td>
                          <td>${dto.pro_desc}</td>
                          <td><fmt:formatDate value="${dto.pro_regdate}" pattern="yyyy-MM-dd"/></td>
                        </tr>
                      </c:forEach>
                    </c:otherwise>
                  </c:choose>
                </table>
              </div>
              <div style="text-align: center;">
                <ul class="pagination">
                  <c:forEach begin="1" end="${getPcount}" step="1" var="i">
                    <li><a href="productList.do?countProductPage=${i}&sort=${sort}"
                        style="text-decoration: none;">${i}</a></li>
                  </c:forEach>
                </ul>
              </div>
              <!-- /.box-body -->
            </div>
            <div>
              <input class="btn btn-success btn-flat" type="button" value="상품추가"
                onclick="location.href='insertProductForm.do'" />
            </div>
            <!-- /.box -->
          </div>
        </div>
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
 
  function sortNo(num){
  	var nums=num;
	  var page =<%=(String)session.getAttribute("countProductPageSession")%>;
	  location.href="productList.do?countProductPage="+page+"&sort="+nums;
  }

  </script>
</body>

</html>