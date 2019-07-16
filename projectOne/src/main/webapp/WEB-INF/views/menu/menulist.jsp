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
           '" width="150" height="200" data-toggle="modal" data-target="#productUpdate" onclick="productUpdate(' + value.pro_seq +
           ')"></p><p>' + value.pro_name + '</p><p>' + value.pro_price + '</td>';
           count++;
           if (count == 4) {
             a += '</tr><tr>';
             count = 0;
           }
      });
      $('.menuList').html(a);
    }
  });
}

function productUpdate(seq) {
  $.ajax({
    url : 'menuProductUpdate.do?seq=' + seq,
    type : 'get',
    success : function(data) {
      $('#productUpdate').modal('show');
      $('input[name="pro_seq"]').val(data.pro_seq);
      $('input[name="pro_name"]').val(data.pro_name);
      $('input[name="pro_price"]').val(data.pro_price);
      $('input[name="pro_desc"]').val(data.pro_desc);
      $('input[name="pro_option"]').val(data.pro_option);
    }
  })
}

function delProduct() {
  location.href="delProduct.do?seq=" + $('input[name="pro_seq"]').val();
}
</script>

<!-- 상품수정 MODAL -->
<div class="modal fade" id="productUpdate" tabindex="-1" role="dialog" aria-labelledby="productUpdateLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="productUpdateLabel">상품 수정</h5>
          <button type="button" class="close" data-dismiss="modal" aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
        </div>
        <div class="modal-body">
          <form action="productUpdateSubmit.do" method="post">
            <input type="hidden" name="pro_seq">
            <label for="pro_name">상품명</label>
            <input type="text" class="form-control" name="pro_name"><br>
            <label for="pro_price">가격</label>
            <input type="text" class="form-control" name="pro_price"><br>
            <label for="pro_desc">상품설명</label>
            <input type="text" class="form-control" name="pro_desc"><br>
            <label for="pro_option">상품 옵션</label>
            <input type="text" class="form-control" name="pro_option"><br>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기</button>
            <button type="button" class="btn btn-danger" onclick="delProduct();">삭제</button>
            <input type="submit" class="btn btn-primary" value="수정">
          </form>
        </div>
      </div>
    </div>
  </div>