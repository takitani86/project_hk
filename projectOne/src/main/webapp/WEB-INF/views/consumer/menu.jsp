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
          ${user.username} 영업장의 메뉴입니다.
        </h1>
      </section>

      <!-- Main content -->
      <section class="content">
        <div class="row">
          <div class="col-sm-10">
            <div class="box">
              <div class="box-body">
                <table class="table table-bordered">
                  <tr>
                    <c:if test="${not empty category}">
                      <c:forEach var="cate" items="${category}">
                        <td id="${cate.cat_seq}" onclick="menuList('${cate.cat_seq}');">${cate.cat_name}</a>
                          &nbsp;&nbsp;&nbsp;<a href="delCate(${cate.cat_seq})" class="glyphicon glyphicon-minus"></a>
                        </td>
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
                <table class="menuList">
                </table>
              </div>
            </div>
            <div class="box">
              <div class="box-header">
                <h6>장바구니</h6>
              </div>
              <box id="selectOrder" class="box-body">
                <p>주문수량 :</p>
                <p>
                  합계:<span id="sum"></span>
                </p>
                <p>
                </p>
                <sec:authorize access="isAuthenticated()">
                  <button onclick="payment('${user.username}');">결제</button>
                </sec:authorize>
              </box>
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
  <script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script>
    function addCategory() {
      location.href = "addCategory.do?add=" + $('#add').val();
    }

    function consumer() {
      location.href = "consumer.do";
    }

    function delCate(seq) {
      location.href = "delCategory.do?seq=" + seq;
    }
    var productList;
    var pro_seq;

    function menuList(seq) {
      $.ajax({
        url: 'menuList.do?seq=' + seq,
        type: 'get',
        dataType: 'JSON',
        async: false,
        success: function (data) {
          productList = data;
          var a = '';
          let count = 0;
          a += '<tr>';
          $.each(data, function (key, value) {
            a += '<td><p><img src="' + value.pro_image +
              '" width="150" height="200" onclick="selectOrder(' + key + ',' + value.pro_seq +
              ')"></p><p>' + value.pro_name + '</p><p>' + value.pro_price + '</td>';
            count++;
            if (count == 4) {
              a += '</tr><tr>';
              count = 0;
            }
            pro_seq = value.pro_seq;
          });
          $('#menuList').html(a);
        }
      });
    }
    var price = 0;
    var arrayBox = new Array();

    function selectOrder(k, pro_seq) {
      //var object =JSON(productList);
      price += productList[k]["pro_price"];
      arrayBox.push(pro_seq);
      $("#selectOrder").append("<div class ='pay' value=" + pro_seq + ">" + productList[k]["pro_name"] + "</div>");

      $("#sum").html(price);


      //$("#selectOrder").append(JSON.stringify(productList);
      // $('#selectOrder').append(productList["pro_name"]);
      //$('#selectOrder').html(object);

    }

    var IMP = window.IMP;
    IMP.init('imp55450318');

    function payment(userid) {
      IMP.request_pay({
        pg: 'kakao',
        pay_method: 'card',
        merchant_uid: 'merchant_' + new Date().getTime(),
        name: '주문명:결제테스트',
        amount: $("#sum").text(),
        buyer_email: 'aetheru@gmail.com',
        buyer_name: '이상희',
        buyer_tel: '010-6665-4963',
        buyer_addr: '서울특별시 영등포구 양평로',
        buyer_postcode: '123-456'
      }, function (rsp) {
        if (rsp.success) {
          var msg = '결제가 완료되었습니다.';
          var suc = 0;
          check(userid);

          msg += '고유ID : ' + rsp.imp_uid;
          msg += '상점 거래ID : ' + rsp.merchant_uid;
          msg += '결제 금액 : ' + rsp.paid_amount;
          msg += '카드 승인번호 : ' + rsp.apply_num;

        } else {
          var msg = '결제에 실패하였습니다.';
          msg += '에러내용 : ' + rsp.error_msg;
        }

        alert(msg);
      });
    }
    var i;

    function check(userid) {
      var suc = 0;
      for (i = 0; i < arrayBox.length; i++) {
        ordList(userid, arrayBox[i]);
      }
      $("#selectOrder").html("<div></div>");
      $("#sum").html(suc);
      arrayBox.splice(0);
    }

    function ordList(userid, seqs) {
      $.ajax({
        url: "../ordList.do",
        type: 'GET',
        data: "seqs=" + seqs + "&user=" + userid,
        success: function (data) {},
        error: function (jqXHR, textStatus, errorThrown) {
          alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
        }
      });
    }
  </script>
</body>

</html>