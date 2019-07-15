<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%request.setCharacterEncoding("UTF-8");%>
<%response.setContentType("text/html; charset=UTF-8");%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- Latest compiled and minified CSS -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<!-- Popper JS -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<!-- Latest compiled JavaScript -->
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>
<title>로그인</title>
</head>
<body>
<div class="jumbotron">
    <h1>로그인</h1>
</div>
      <br><br>
      <div class="container text-center">
          <h1>Security Prj</h1><br>
      </div>
      <div class="container col-md-4">
	      <form class="px-4 py-3" action="<c:url value='/user/login'/>" method="post">
	          <div class="form-group">
	              <label for="exampleDropdownFormEmail1">ID</label>
	              <input type="text" class="form-control" name="loginId" placeholder="example">
	          </div>
	          <div class="form-group">
	              <label for="exampleDropdownFormPassword1">Password</label>
	              <input type="password" class="form-control" name="loginPwd" placeholder="Password">
	          </div>
	          <div class="form-check">
	              <label class="form-check-label">
	              <input type="checkbox" class="form-check-input">
	              Remember me
	              </label>
	          </div>
	          <button type="submit" class="btn btn-primary">Sign in</button>
	      </form>
	      <div class="social-login">
	      		<a id="kakao-login-btn"></a>
	      		<a href="http://developers.kakao.com/logout"></a>
<script type='text/javascript'>
      //<![CDATA[
        // 사용할 앱의 JavaScript 키를 설정해 주세요.
        Kakao.init('a995d32c456d751360248fd1314e6cc5');
        // 카카오 로그인 버튼을 생성합니다.
        Kakao.Auth.createLoginButton({
          container: '#kakao-login-btn',
          success: function(authObj) {
            alert(JSON.stringify(authObj));
            
            // 로그인 성공 시, API를 호출합니다.
            Kakao.API.request({
            	url: '/v1/user/me',
            	success: function(res) {
            		console.log(res);
            		//여기서 정보 요청해서 다 받아온 뒤에 디비에서 아이디 검색 -> 있으면 로그인완료+메인화면 이동 / 없으면 정보 받아서 회원가입폼으로 이동 ㅜㅜ
            		
            		
            		var userId = res.id; //유저의 카톡 고유 id
            		var userEmail = res.kaccount_email; //유저의 이메일
            		var userNickName = res.properties.nickname; //유저의 별명
            		
            		console.log(userId);
            		console.log(userEmail);
            		console.log(userNickName);
            		
            		location.href = "register.do"
            	},
            	fail: function(error) {
            		alert(JSON.stringify(error));
            	}
            });
          },
          fail: function(err) {
             alert(JSON.stringify(err));
          }
        });
      //]]>
</script>
	      </div>
	      <div class="dropdown-divider"></div>
	      <a class="dropdown-item" href="<c:url value='/secu/joinMemberForm.do'/>">ProjectOne 회원가입 하기</a>
	      <a class="dropdown-item" href="<c:url value='/secu/joinKakaoMember.do'/>">카카오 계정으로 회원가입 하기</a>
	      <a class="dropdown-item" href="<c:url value='/secu/to_find_PwForm.do'/>">비밀번호 찾기</a>
	  </div>
</body>
</html>