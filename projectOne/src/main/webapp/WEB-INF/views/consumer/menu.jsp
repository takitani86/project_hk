<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<%
	response.setContentType("text/html; charset=UTF-8");
%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@ taglib prefix="sec"
	uri="http://www.springframework.org/security/tags"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="false"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script type="text/javascript"
	src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<title>메뉴판</title>
</head>
<body>

	<div>
		<table border="1">
			<tr>
				<c:if test="${not empty category}">
					<c:forEach var="cate" items="${category}">
						<td onclick="menuList(${cate.cat_seq});">${cate.cat_name}</td>
					</c:forEach>
					<script>
              $(document).ready(function(){
                var seq = $('td:first').attr("id");
                menuList(seq);
              })
          </script>
				</c:if>
			</tr>
		</table>
	</div>
	<div>
		<table id="menuList" class="text-center">
		</table>
	</div>
	<hr>
	<div id="selectOrder">
		<p>주문수량 :</p>
	</div>
	<script>

var productList;
var pro_seq;

function menuList(seq) {
  $.ajax({
    url : 'menuList.do?seq=' + seq,
    type : 'get',
    dataType : 'JSON',
    async:false,
    success : function(data) {
      productList = data;
      var a = '';
      let count = 0; 
      a += '<tr>';
      $.each(data, function(key, value){
          a += '<td><p><img src="' + value.pro_image +
           '" width="150" height="200" onclick="selectOrder('+key+',' + value.pro_seq +
           ')"></p><p>' + value.pro_name + '</p><p>' + value.pro_price + '</td>';
           count++;
           if (count == 4) {
             a += '</tr><tr>';
             count = 0;
           }
           pro_seq=value.pro_seq;
      });
      $('#menuList').html(a);
    }
  });
}
var price=0;
var arrayBox = new Array();
function selectOrder(k,pro_seq) {
  //var object =JSON(productList);
  price+= productList[k]["pro_price"];
  arrayBox.push(pro_seq); 
  $("#selectOrder").append("<div class ='pay' value="+pro_seq+">"+productList[k]["pro_name"] +"</div>");
  
  $("#sum").html(price);
  
  
  //$("#selectOrder").append(JSON.stringify(productList);
 // $('#selectOrder').append(productList["pro_name"]);
  //$('#selectOrder').html(object);
  
}


</script>
	<p>
		합계:<span id="sum"></span>
	</p>
	<p>
		<button onclick="payment('${user.username}');">결제</button>
	</p>
	<sec:authorize access="isAuthenticated()">
		<sec:authentication var="user" property="principal" />
		<input type='button' id="btn1" onclick="check('${user.username}');"
			value="${user.username}" />
	</sec:authorize>
	<script>
var IMP = window.IMP;
IMP.init('imp55450318');

function payment(userid) {
  IMP.request_pay({
    pg : 'kakao',
    pay_method : 'card',
    merchant_uid : 'merchant_' + new Date().getTime(),
    name : '주문명:결제테스트',
    amount : $("#sum").text(),
    buyer_email : 'aetheru@gmail.com',
    buyer_name : '이상희',
    buyer_tel : '010-6665-4963',
    buyer_addr : '서울특별시 영등포구 양평로',
    buyer_postcode : '123-456'
  }, function(rsp) {
    if ( rsp.success ) {
        var msg = '결제가 완료되었습니다.';
        var suc=0;
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
var suc=0;
for(i=0;i<arrayBox.length;i++){
	ordList(userid,arrayBox[i]);
}
$("#selectOrder").html("<div></div>");
$("#sum").html(suc);
arrayBox.splice(0);
} 

function ordList(userid,seqs) {
	 $.ajax({
	        url:"../ordList.do",
	        type:'GET',
	        data:"seqs="+seqs+"&user="+userid,
	        success:function(data){
	            alert("완료!");
	        },
	        error:function(jqXHR, textStatus, errorThrown){
	            alert("에러 발생~~ \n" + textStatus + " : " + errorThrown);
	        }
	    });
	}
	
</script>
</body>
</html>