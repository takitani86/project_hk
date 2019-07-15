<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>

// 카테고리 선택후 상품리스트 출력
function menuList(seq) {
  $.ajax({
    url : 'menuList.do?seq=' + seq,
    type : 'get',
    success : function(data) {
      var a = '';
      let count = 0; 
      a += '<tr>';
      $.each(data, function(key, value){
          a += '<td><p><img src="' + value.pro_image +
           '" width="150" height="200" onclick="productUpdate(' + value.pro_seq +
           ')"></p><p>' + value.pro_name + '</p></td>';
           count++;
           if (count == 3) {
             a += '</tr><tr>';
             count = 0;
           }
      });
      $('.menuList').html(a);
    }
  });
}

function productUpdate(seq) {
  
}
</script>