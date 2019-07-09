<%@ page import="com.hk.one.dto.MemberDto" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<script
  src="https://code.jquery.com/jquery-latest.js"
  integrity="sha256-CSXorXvZcTkaix6Yvo6HppcZGetbYMGWSFlBw8HfCJo="
  crossorigin="anonymous"></script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>비밀번호 찾기</title>
</head>
<body>
   <h1>비밀번호 재발급</h1>
   <h5>아래 항목을 정확히 입력하시면 이메일을 통해 비밀번호 재발급이 가능합니다.</h5>
   <hr width="500px" align="left" noshade>
   <form:form id="find_PwForm" class="form-horizontal" role="form" commandName = "MemberDto" action="find_PW" method="post">
       <div class="findPwForm">
          <label for="mem_id" class="id_label">아이디</label>
             <input type="text" class="id_form" name="mem_id" value="${MemberDto.mem_id}" placeholder="아이디 입력">
          <label for="mem_name" class="name_label">이름</label>
             <input type="text" class="name_form" name="mem_name" value="${MemberDto.mem_name}" placeholder="이름 입력">
           <label for="mem_email" class="email_label">E-Mail</label>
            <div class="email_div">
               <input type="text" class="email_form" name="mem_email" value="${MemberDto.mem_email}" placeholder="이메일 주소 입력">
            </div>
            <div class="email_valid">
            <div style="color:red; margin-top:2px" >
               <form:errors path="mem_email"/>
               <form:errors/>
            </div>
         </div>
      </div>
   <hr width="500px" align="left" noshade>
      <div class="find_PwForm">
         <div class="inform_pw">
            <div style="border-top: 1px solid#888; padding-top:15px; font-size:85%" >
               * 소셜 계정으로 인증하신 회원은 소셜 계정으로 바로 로그인하실 수 있습니다.
            </div>
         </div>
      </div>                  
      <div class="find_PwForm" style="margin-left:82%">
         <div class="find_PwButton">
            <button id="btn_find" type="submit" class="btn btn-info">확인</button>
         </div>
      </div>
   </form:form>
</body>
</html>