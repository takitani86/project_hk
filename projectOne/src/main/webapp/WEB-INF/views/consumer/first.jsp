<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HEAD(link파일들 모음) -->
<%-- include 경로를 불러온 jsp 페이지의 상대경로에 따라 
../를 추가해주어야 한다(절대경로로 할 방법이 없음) --%>
<%@ include file="../include/head.jsp"%>
<style>
  .card {
    box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2);
    width: 200px;
    height: 300px;
    margin: auto;
    text-align: center;
    display: inline-block;
  }
</style>

<body class="hold-transition">
  <div class="content container-fluid">
    <div class="row">
      <div class="col-md-8">
        <div class="box box-default">
          <div class="box-header with-border">
            <h3 class="box-title">
              <i class="fa fa-tag"></i> 점포를 선택해주세요.
            </h3>
          </div>
          <div class="box-body" >
            <c:forEach var="member" items="${member}">
              <div class=" card" onclick="selectMerchant('${member.mem_id}');">
                <img src="<c:url value='/resources/img${member.mem_image}'/>" alt="매장이미지"
                  style="width:100%; height: 70%">
                <h3>${member.mem_b_name}</h3>
                <p>${member.mem_id}</p>
                <p>${member.mem_address}</p>
              </div>
            </c:forEach>
          </div>
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