<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../include/head.jsp" %>

<body class="hold-transition login-page">
  <div class="login-box">
    <div class="login-logo">
      <a href="<c:url value='/home.do'/>"><b>Project</b>ONE</a>
    </div>
    <!-- /.login-logo -->
    <div class="login-box-body">
      <p class="login-box-msg">환영합니다</p>

      <form action="<c:url value='/user/login'/>" method="post">
        <div class="form-group has-feedback">
          <input type="text" name="loginId" class="form-control" placeholder="ID">
          <span class="glyphicon glyphicon-user form-control-feedback"></span>
        </div>
        <div class="form-group has-feedback">
          <input type="password" name="loginPwd" class="form-control" placeholder="Password">
          <span class="glyphicon glyphicon-lock form-control-feedback"></span>
        </div>
        <div class="container fluid">
        	<c:if test="${not empty SPRING_SECURITY_LAST_EXCEPTION}">
    			<font color="red">
        			<p>로그인에 실패하였습니다.</p>
        			<c:remove var="SPRING_SECURITY_LAST_EXCEPTION" scope="session"/>
    			</font>
			</c:if>
        </div>        
        <div class="row">
          <div class="col-xs-8">
          </div>
          <!-- /.col -->
          <div class="col-xs-4">
            <button type="submit" id="checkLoginResult" class="btn btn-primary btn-block btn-flat">로그인</button>
          </div>
          <!-- /.col -->
        </div>
      </form>

      <div class="social-auth-links text-center">
        <p>- OR -</p>
        <a id="kakao-login-btn"></a> <a href="http://developers.kakao.com/logout"></a>
      </div>
      <!-- /.social-auth-links -->

      <a href="<c:url value='/secu/to_find_PwForm.do'/>">비밀번호 찾기</a><br>
      <a href="<c:url value='/secu/joinMemberForm.do'/>">회원가입</a><br>
      <a href="<c:url value='/member/consumer/select.do'/>">고객용 메뉴</a><br>

    </div>
    <!-- /.login-box-body -->
  </div>
  <!-- /.login-box -->
  <%@ include file="../include/plugin_js.jsp" %>
  <script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
  <!-- iCheck -->
  <script src="<c:url value='/resources/plugins/iCheck/icheck.min.js'/>"></script>
  <script>
    $(function () {
      $('input').iCheck({
        checkboxClass: 'icheckbox_square-blue',
        radioClass: 'iradio_square-blue',
        increaseArea: '20%' /* optional */
      });
    });
    //<![CDATA[
    // 사용할 앱의 JavaScript 키를 설정해 주세요.
    Kakao.init('a995d32c456d751360248fd1314e6cc5');
    // 카카오 로그인 버튼을 생성합니다.
    Kakao.Auth.createLoginButton({
      container: '#kakao-login-btn',
      success: function (authObj) {

        // 로그인 성공 시, API를 호출합니다.
        Kakao.API.request({
          url: '/v1/user/me',
          success: function (res) {
            console.log("아이디:"+res["properties"]);
            //여기서 정보 요청해서 다 받아온 뒤에 디비에서 아이디 검색 -> 있으면 로그인완료+메인화면 이동 / 없으면 정보 받아서 회원가입폼으로 이동 ㅜㅜ

            var userToken = res.access_token;
            var userId = res.id; //유저의 카톡 고유 id
            var userEmail = res.kaccount_email; //유저의 이메일
            var userNickName = res.properties.nickname; //유저의 별명

            console.log(userToken);
            console.log(userId);
            console.log(userEmail);
            console.log(userNickName);
            console.log(Object.keys(res.properties));
				if (userEmail == undefined) {
					location.href = "kakaoLogin.do?mem_id=" + userId + "&mem_name=" + userNickName;					
				} else {
					location.href = "kakaoLogin.do?mem_id=" + userId + "&mem_email=" + userEmail + "&mem_name=" + userNickName;		
				}
          },
          fail: function (error) {
            alert(JSON.stringify(error));
          }
        });
      },
      fail: function (err) {
        alert(JSON.stringify(err));
      }
    });
    //]]>
  </script>
</body>

</html>