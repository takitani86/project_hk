<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
  var qna_seq = '${boarddetail.qna_seq}'; // 게시글 번호
  $('[name=commentInsertBtn]').click(function () { // 댓글 등록 버튼 클릭시
    var insertData = $('[name=commentInsertForm]').serialize(); // commentInsertForm의 내용을 가져옴
    commentInsert(insertData); // Insert 함수 호출(아래)
  })

  // 댓글 목록
  function commentList() {
    $.ajax({
      url: 'comment/list.do?seq=' + qna_seq,
      type: 'get',
      success: function (data) {
        var a = '';
        $.each(data, function (key, value) {
          var user = '${user.username}';
          var writeuser = value.mem_id;
          a += '<div class="commentInfo' + value.com_seq + '">' + ' 작성자 : ' +
            value.mem_id;
          if (value.com_isDel == 1) {
            a += '<div class="commentContent' + value.com_seq + '"> <p> -- 삭제된 댓글입니다. -- <p>';
          } else {
            if (user == writeuser) {
              a += '<button type="button" class="btn btn-flat btn-sm pull-right" onclick="commentUpdate(' +
                value.com_seq + ',\'' + value.com_content + '\');"> 수정 </button>';
              a +=
                '<button type="button" class="btn btn-danger btn-flat btn-sm pull-right" onclick="commentDelete(' +
                value.com_seq + ');"> 삭제 </button>';
            }
            a += '</div><div class="commentContent' + value.com_seq + '"> <p>' + value.com_content + '<p>';
          }
        });
        $("#commentList").html(a);
      }
    });
  }

  // 댓글 등록
  function commentInsert(insertData) {
    $.ajax({
      url: 'comment/insert.do',
      type: 'post',
      data: insertData,
      success: function (data) {
        if (data == 1) {
          commentList(); // 댓글 작성 후 댓글목록 reload
          $('[name=com_content]').val('');
        }
      }
    });
  }

  // 댓글 수정 - 댓글 내용 출력을 input폼으로 변경
  function commentUpdate(com_seq, com_content) {
    var a = '';

    a += '<div class="input-group">';
    a += '<input type="text" name="com_content_' + com_seq + '" value="' + com_content + '"/>';
    a += '<span><button type="button" class="btn btn-flat btn-sm" onclick="commentUpdateProc(' + com_seq +
      ');">수정</button></span>';
    a += '</div>';

    $('.commentContent' + com_seq).html(a);
  }

  // 댓글 수정
  function commentUpdateProc(com_seq) {
    var updateContent = $('[name=com_content_' + com_seq + ']').val();

    $.ajax({
      url: 'comment/update.do',
      type: 'post',
      data: {
        'com_content': updateContent,
        'com_seq': com_seq
      },
      success: function (data) {
        if (data == 1) commentList(qna_seq); // 댓글 수정후 목록 출력
      }
    });
  }

  // 댓글 삭제
  function commentDelete(com_seq) {
    $.ajax({
      url: 'comment/delete.do?seq=' + com_seq,
      type: 'post',
      success: function (data) {
        if (data == 1) commentList(qna_seq); // 댓글 삭제후 목록 출력
      }
    });
  }

  $(document).ready(function () {
    commentList(); // 페이지 로딩시 목록 출력
  });
</script>