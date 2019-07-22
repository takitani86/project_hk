<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HEAD(link파일들 모음) -->
<%-- include 경로를 불러온 jsp 페이지의 상대경로에 따라 
../를 추가해주어야 한다(절대경로로 할 방법이 없음) --%>
<%@ include file="../include/head.jsp"%>
<style>
  html,
  body {
    height: 100%;
  }

  body {
    display: table;
    margin: 0 auto;
  }

  .container {
    height: 100%;
    display: table-cell;
    vertical-align: middle;
  }

  .main {
    height: 150px;
    width: 150px;
  }
</style>

<body class="hold-transition">
  <div class="content container-fluid">
      <div class="box box-default">
        <h3 class="box-title">
          <i class="fa fa-tag"></i> 점포를 선택해주세요.
        </h3>
      </div>
      <div class="box-body">
        <div class="row">
            <c:forEach var="member" items="${member}">
              <div class="col-sm-4 col-md-2">
                <div class="main text-center" onclick="selectMerchant('${member.mem_id}');">
                  <img src="<c:url value='/resources/img/profile/default.jpg'/>" alt="image" height="100px" width="100px">
                  <h4>${member.mem_id}</h4>
                </div>
              </div>
            </c:forEach>
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