<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<script src="https://code.jquery.com/jquery-latest.js"></script>
<title>회원 가입 페이지</title>
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
</script>
<script>
$(function(){
	$(".checkIdMember").click(function(){
		var query = $("#mem_id").val();
		$.ajax({
			url: "checkIdMember.do",
			type: "post",
			data: {"mem_id": query},
			success: function(data) {
				if(data == 1) {
					$(".resultId .msg").text("사용할 수 없는 ID입니다.");
					$(".resultId .msg").attr("style", "color:#f00");
				} else {
					$(".resultId .msg").text("사용할 수 있는 ID입니다.");
					$(".resultId .msg").attr("style", "color:#00f");
				}
			},
			error: function() {
				alert("에러 발생");
			}
		});
	});	
})
$(function(){
	$()
})
$(function(){
	$(".emailRegist").click(function() {
		var mem_email = document.getElementById("mem_email").value;
		
		if(mem_email == "") {
			alert("이메일을 입력해 주세요.");
			return false;		
		}
		
		function sendEmail(mem_email) {
			var registNum = $("#registNum").val();
			$.ajax({
				url: "emailRegist.do",
				type: "POST",
				data: {"registNum": registNum},
				success: function() {
					alert("이메일을 전송하였습니다. 확인해 주세요.");
					//registNum을 담고 registNum 함수로 넘기기
				}
			});
		}
	)};
})			
$(function registNum(){ //registNum 함수
	$.ajax({ //rst값과 registNum을 가져와서 활용해야 한다
		url: "",
		type: "POST",
		data: $("rst"), 
		success: function(rst) {
			if((rst == 0) && (registNum.equal(RegistN))) {					
				$(".resultEmail .rst").text("인증완료");
				$(".resultEmail .rst").attr("style", "color:#00f");
			} else if (rst ==1) {
				$(".resultEmail .rst").text("이메일을 다시 확인해 주세요..");
				$(".resultEmail .rst").attr("style", "color:#f00");
			} else if (!registNum.equal(RegistN)) {
				$(".resultEmail .rst").text("인증번호가 맞지 않습니다.");
				$(".resultEmail .rst").attr("style", "color:#f00");
			}
		},
		error: function() {
			alert("에러 발생");
		}
	});
})
</script>
</head>
<body>
	<h1>회원 가입</h1>
		<form action="joinMember.do" name="form" id="form" method="post">
			<table border="1">
				<tr>
					<th>아이디</th>
					<td><input type="text" id="mem_id" name="mem_id" placeholder="아이디 입력"></td>
					<td><button type="button" class="checkIdMember">아이디 확인</button></td>
					<td><p class="resultId"><span class="msg">아이디를 확인해 주십시오.</span></p></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" name="mem_pw" placeholder="비밀번호 입력"></td>
				</tr>
				<tr>
					<th></th>
					<td>(영문 대소문자/숫자/특수문자 중 2가지 이상 조합, 10~16자)</td>
				</tr>
				<tr>
					<th></th>
					<td><input type="password" name="mem_pw2" placeholder="비밀번호 확인"></td>
				</tr>
				<tr>
					<th>E-Mail</th>
					<td><input type="email" name="mem_email" placeholder="이메일 주소 입력"></td>
					<td><button type="button" class="emailRegist">이메일 인증</button></td>
				</tr>
				<tr>
					<th></th>
					<td><input type="text" name="registNum" placeholder="인증 번호 입력 입력"></td>
					<td><p class="resultEmail"><span class="rst"></span></p></td>
				</tr>
				<tr>
					<th>이름</th>
					<td><input type="text" name="mem_name" placeholder="사용자 이름 입력"></td>
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
							<input type="text" id="sample4_roadAddress" name="roadAddress" placeholder="도로명주소">
							<span id="guide" style="color:#999;display:none"></span>
							<input type="text" id="sample4_detailAddress" name="detailAddress" placeholder="상세주소">
							<input type="text" id="sample4_extraAddress" placeholder="참고항목">
							<input type="hidden" name="mem_address" id="mem_address" value="">
						</td>
					</tr>				
				</tbody>
				<tr>
					<th>전화 번호</th>
					<td><input type="text" name="mem_phone" placeholder="전화 번호 입력"></td>
				</tr>
				<tr>
					<th>상호명</th>
					<td><input type="text" name="mem_b_name" placeholder="상호명 입력"></td>
				</tr>
				<tr>
					<th>업태</th>
					<td><select name="mem_b_status" size='1' class='select'>
						<option value=''>선택하세요</option>
						<option value="1">카페</option>
						<option value="2">중국집</option>
						<option value="3">야식</option>
						</select>
					</td>
				</tr>
				<tr>
					<td><input type="submit" value="회원 가입"></td>
					<td><input type="reset" value="취소"></td>
				</tr>
			</table>
		</form>
</body>
</html>