<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HEAD(link파일들 모음) -->
<%-- include 경로를 불러온 jsp 페이지의 상대경로에 따라 
../를 추가해주어야 한다(절대경로로 할 방법이 없음) --%>
<%@ include file="../include/head.jsp"%>

<body class="hold-transition">
  <div class="content container-fluid row">
    <div class="container-fluid row">
      <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12" style="float: none; margin: 0 auto;">
        <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
        <div class="col-lg-8 col-md-8 col-sm-8 col-xs-8">
          <div class="box box-default">
            <h3 class="box-title">
              <i class="fa fa-tag"></i> 점포를 선택해주세요.
            </h3>
          </div>
          <c:forEach var="member" items="${member}">
              <div class="text-center" onclick="selectMerchant('${member.mem_id}');">
                <img src="<c:url value='/resources/img${member.mem_image}'/>" alt="image" height="100px" width="100px">
                <h4>${member.mem_id}</h4>
              </div>
          </c:forEach>
          <div class="col-lg-2 col-md-2 col-sm-2 col-xs-2"></div>
        </div>
      </div>
    </div>
  </div>
  <!-- /.content -->

  <!-- REQUIRED JS SCRIPTS -->

  <!-- JS 스크립트모음 -->
  <%@ include file="../include/plugin_js.jsp"%>

  <script>
    function selectMerchant(id) {
      location.href = "menu.do?mem_id=" + id;
    }
  </script>
</body>

</html>