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
<title>로그인</title>
</head>
<body>
<div class="jumbotron">
    <h1>로그인</h1>
</div>
<c:url var="loginProcessingUrl" value='/user/login' />
<form action="${loginProcessingUrl}" method="post">
    <div class="form-group form-group-lg">
        <div class="form-group">
            <label>사용자명</label>
            <input type="text" name="mem_email" class="form-control" placeholder="이메일">
        </div>
        <div class="form-group">
            <label>비밀번호</label>
            <input type="password" name="mem_pw" class="form-control" placeholder="비밀번호">
        </div>
        <div class="form-group">
            <input type="hidden" name="${ _csrf.parameterName }" value="${ _csrf.token }" >
        </div>
        <div class="form-action">
        	<sec:csrfInput/>
            <input type="submit" class="btn btn-primary btn-lg" value="로그인">
        </div>
    </div>
</form>
</body>
</html>