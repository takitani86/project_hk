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
function selectOrder(k,pro_seq) {
  //var object =JSON(productList);
  price+= productList[k]["pro_price"];
  $("#selectOrder").append("<div>"+ pro_seq +":"+productList[k]["pro_name"] +"</div>");
  $("#sum").append(price);
  
  
  //$("#selectOrder").append(JSON.stringify(productList);
 // $('#selectOrder').append(productList["pro_name"]);
  //$('#selectOrder').html(object);
  
}


</script>
<p>합계:<span id="sum"></span></p>
</body>
</html>