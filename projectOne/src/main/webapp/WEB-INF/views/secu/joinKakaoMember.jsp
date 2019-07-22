<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<%@ include file="../include/head.jsp" %>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                //document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }
    function oneAddress() {
    	if(document.getElementById("sample4_roadAddress").value && document.getElementById("sample4_detailAddress").value) {
    		document.getElementById("mem_address").value = parseInt(document.getElementById("sample4_roadAddress").value);
    	}
    }
</script>
<body class="layout-boxed skin-blue sidebar-mini">
<div class="wrapper">
<%@ include file="../include/main_header.jsp" %>
<%@ include file="../include/left_column.jsp" %>
	<div class="content-wrapper">
	<section class="content-header">
	<h1>카카오 회원</h1><small>추가 정보 입력</small>
	</section>
		<form action="joinMember.do" name="form" id="form" method="post">
			<input type="hidden" id="mem_id" name="mem_id" value="${map.mem_id}" placeholder="아이디 입력">
			<input type="hidden" name="mem_pw" value="kakao0000" />
			<table border="1">
				<tr>
					<th>이름</th>
					<td><input type="text" name="mem_name" value="${map.mem_name}" readonly></td>
				</tr>
				<tr>
					<th>E-Mail</th>
					<c:set var="mem_email" value="${map.mem_email}" />
					<c:choose>
						<c:when test="${mem_email != null}">
							<td><input type="email" name="mem_email" value="${map.mem_email}" readonly></td>
						</c:when>
						<c:when test="${mem_email == null}">
							<td><input type="email" name="mem_email" placeholder="이메일 주소 입력"></td>
						</c:when>
					</c:choose>
				</tr>
			</table>
			<br />
			<table border="1">
				<colgroup>
				<col style="width:20%"><col>
				</colgroup>
				<tbody>
					<tr>
						<th>매장 주소</th>
						<td>
							<input type="text" id="sample4_postcode" placeholder="우편번호">
							<input type="button" id="addressBtn" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
							<input type="text" id="sample4_roadAddress" name="roadAddress" placeholder="도로명주소" onkeyup="oneAddress()">
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="sample4_detailAddress" name="detailAddress" placeholder="상세주소" onkeyup="oneAddress()">
							<input type="text" id="sample4_extraAddress" placeholder="참고항목">
							<input type="hidden" name="mem_address" id="mem_address" value="">
						</td>
					</tr>				
				</tbody>
				<tr>
					<th>전화 번호</th>
					<td><input type="text" name="mem_phone" placeholder="000-0000-0000"></td>
				</tr>
				<tr>
					<th>상호명</th>
					<td><input type="text" name="mem_b_name" placeholder="상호명 입력"></td>
				</tr>
				<tr>
					<th>업태</th>
					<td><select name="mem_b_status" size='1' class='select'>
						<option value=''>선택하세요</option>
						<option value="1">한식</option>
						<option value="2">분식</option>
						<option value="3">일식</option>
						<option value="4">중식</option>
						<option value="5">양식</option>
						<option value="6">야식</option>
						<option value="7">주점</option>
						<option value="8">카페/디저트</option>
						<option value="9">패스트푸드</option>
						<option value="10">치킨/피자</option>
						<option value="11">기타</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="회원 가입"></td>
					<td><input type="reset" value="취소"></td>
				</tr>
			</table>
		</form>
	</div>
	</div>
</body>
</html>