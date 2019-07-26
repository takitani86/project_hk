<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HEAD(link파일들 모음) -->
<%-- include 경로를 불러온 jsp 페이지의 상대경로에 따라 
../를 추가해주어야 한다(절대경로로 할 방법이 없음) --%>
<%@ include file="../include/head.jsp"%>

<body class="hold-transition">
  <!-- Content Wrapper. Contains page content -->
  <div class="content container">
    <!-- Content Header (Page header) -->

    <!-- Main content -->
    <div class="row">
      <div class="col-lg-8">
        <section class="content-header text-center">
        	<!-- <div class="box box-solid"> -->
        		<div class="container fluid">
	            <!-- <blockquote class="pull-left"> -->
	            <h1>
	              <p style="font-stretch:condensed; font-weight:bolder; font-size:larger">
	              <i class="fa fa-coffee"></i>&nbsp;&nbsp; ${mem_b_name}</p>
	            </h1>
	            <br /><br />
	            <!-- </blockquote> -->
        		</div>
          <!-- 	</div> -->
        
          <%-- <div class="alert alert-info alert-dismissable">
            <h1>
              ${mem_b_name}
            </h1>
          </div> --%>
        </section>
        <div class="box">
          <div class="box-body">
            <table class="table table-bordered text-center">
              <tr>
                <c:if test="${not empty category}">
                  <c:forEach var="cate" items="${category}">
                    <td id="${cate.cat_seq}" onclick="menuList('${cate.cat_seq}');">${cate.cat_name}</a>
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
            <table class="menuList text-center">
            </table>
          </div>
        </div>
        <div class="box">
        	<div class="container fluid"><br></div>
        	<div class="container fluid">
            <h4><i class="icon fa fa-check"></i>
              <strong>내 주문</strong></h4>
            - 선택한 상품이 아래에 표시됩니다.
          </div>
          <div id="selectOrder" class="box-body">
            <div class="row">
              <div class="col-md-8">
                <table class="orderList text-center">
                  <tr></tr>
                </table>
              </div>
              <div class="col-md-2">
                <h4>합계</h4>
                <h3 id="sum"></h3>
                <input type="hidden" id="sum1">
              </div>
              <div class="col-md-2">
                <button class="btn btn-block btn-default btn-sm" onclick="delOrder();">장바구니 비우기</button>
                <button class="btn btn-block btn-primary btn-lg" onclick="payment('${mem_id}');">결제</button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </div>


  <!-- REQUIRED JS SCRIPTS -->

  <!-- JS 스크립트모음 -->
  <%@ include file="../include/plugin_js.jsp"%>
  <script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
  <script>
    function consumer() {
      location.href = "consumer.do";
    }

    function numberWithCommas(x) {
      return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
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
          a += '<ul style="overflow: hidden; list-style:none; margin:0px; padding:0px; width:800px;">';
          $.each(data, function (key, value) {
        	  a += '<li style="float:left; margin:0px 3px;"><div class="box box-solid hvr-grow-shadow" id="proBox" style="padding:5px 10px 10px;">' +
            	'<div class="box-header with-border"><p><img src="${pageContext.request.contextPath}/resources/img/product/' + value.pro_image +
             '" width="150" height="200" data-toggle="modal" data-target="#productUpdate" onclick="selectOrder(' + key + ',' + value.pro_seq +
             ')"></p></div><div class="box-body"><p><strong>' + value.pro_name + '</strong></p><p>' + value.pro_price + '원</div></div></li>';
             count++;
            if (count == 4) {
				a += '</ul><ul style="overflow:hidden; list-style:none; margin:0px; padding:0px; width:800px;">';
				count = 0;
              
/*               a += '<tr>';
              $.each(data, function (key, value) {
                a += '<td><p><img src="${pageContext.request.contextPath}/resources/img/product/' + value
                  .pro_image +
                  '" width="150" height="200" onclick="selectOrder(' + key + ',' + value.pro_seq +
                  ')"></p><p>' + value.pro_name + '</p><p>' + value.pro_price + '</td>';
                count++;
                if (count == 5) {
                  a += '</tr><tr>';
                  count = 0; */
            }
            pro_seq = value.pro_seq;
          });
          $('.menuList').html(a);
        }
      });
    }
    var price = 0;
    var arrayBox = new Array();

    function selectOrder(k, pro_seq) {
      //var object =JSON(productList);
      price += productList[k]["pro_price"];
      arrayBox.push(pro_seq);
      var a = '';
      $(".orderList").children().append("<td><img src='${pageContext.request.contextPath}/resources/img/product/" +
        productList[k]["pro_image"] + "' width='100px' height='120px'><p>" + productList[k]["pro_name"] + '</p></td>');
      // $("#selectOrder").append("<div class ='pay' value=" + pro_seq + ">" + productList[k]["pro_name"] + "</>");
      $("#sum1").val(price);
      $("#sum").html("&#8361; " + numberWithCommas(price));


      //$("#selectOrder").append(JSON.stringify(productList);
      // $('#selectOrder').append(productList["pro_name"]);
      //$('#selectOrder').html(object);

    }

    function delOrder() {
      $(".orderList").html('<tr></tr>');
      $("#sum1").val('');
      $("#sum").html('');
      price = 0;
      arrayBox = [];
    }
    var IMP = window.IMP;
    IMP.init('imp55450318');
    var uid = new Date().getTime();
    function payment(userid) {
      IMP.request_pay({
        pg: 'kakao',
        pay_method: 'card',
        merchant_uid: uid,
        name: '주문명:결제테스트',
        amount: $("#sum1").val(),
        buyer_email: 'aetheru@gmail.com',
        buyer_name: '이상희',
        buyer_tel: '010-6665-4963',
        buyer_addr: '서울특별시 영등포구 양평로',
        buyer_postcode: '123-456'
      }, function (rsp) {
        if (rsp.success) {
          var msg = '결제가 완료되었습니다.';
          var suc = 0;
          check(userid, uid);
          msg += 'merchant_uid: ' + uid;
          msg += '고유ID : ' + rsp.imp_uid;
          msg += '상점 거래ID : ' + rsp.merchant_uid;
          msg += '결제 금액 : ' + rsp.paid_amount;
          msg += '카드 승인번호 : ' + rsp.apply_num;
          $('#successOrder').modal('show');
          $('input[name="id"]').val(rsp.imp_uid);
          $('input[name="id2"]').val(rsp.merchant_uid);
          $('input[name="id3"]').val(rsp.paid_amount);
          $('input[name="id4"]').val(rsp.aplly_num);

        } else {
          var msg = '결제에 실패하였습니다.';
          msg += '에러내용 : ' + rsp.error_msg;
        }

        console.log(msg);
      });
    }


    function check(userid, uid) {
      var suc = 0;
      for (i = 0; i < arrayBox.length; i++) {
        ordList(userid, uid, arrayBox[i]);
      }
      $("#selectOrder").html("<tr></tr>");
      $("#sum").html(suc);
      arrayBox.splice(0);
    }

    function ordList(userid, uid, seqs) {
      $.ajax({
        url: "ordList.do",
        type: 'GET',
        data: {seqs : seqs, user : userid, uid : uid},
        // data: "seqs=" + seqs + "&user=" + userid + "&uid=" + uid,
        success: function (data) {
        },
        error: function (jqXHR, textStatus, errorThrown) {
          alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
        }
      });
    }
  </script>

  <!-- 결제완료 MODAL -->
  <div class="modal" id="successOrder" tabindex="-1" role="dialog" aria-labelledby="successOrder"
    aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="sucessOrder">결제정보</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
            <label for="id">고유ID</label>
            <input type="text" class="form-control" name="id" readonly>
            <label for="id2">상점 거래ID</label>
            <input type="text" class="form-control" name="id2" readonly>
            <label for="id3">결제금액</label>
            <input type="text" class="form-control" name="id3" readonly>
            <label for="id4">카드 승인번호</label>
            <input type="text" class="form-control" name="id4" readonly>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">확인</button>
          </div>
        </div>
      </div>
    </div>
</body>

</html>