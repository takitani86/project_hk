<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- HEAD(link파일들 모음) -->
<%-- include 경로를 불러온 jsp 페이지의 상대경로에 따라 
../를 추가해주어야 한다(절대경로로 할 방법이 없음) --%>
<%@ include file="../include/head.jsp"%>

<body class="layout-boxed skin-blue sidebar-mini">
	<div class="wrapper">
		<!-- Main Header(네비게이션 바) -->
		<%@ include file="../include/main_header.jsp"%>
		<!-- Left Column(사이드바) -->
		<%@ include file="../include/left_column.jsp"%>
		<!-- Content Wrapper. Contains page content -->
		<div class="content-wrapper">
			<!-- Content Header (Page header) -->
			<div class="container fluid" style="padding:10px 10px 0px 10px;">
				<section class="content-header">
					<h1>
						<strong>고객상담</strong> <small>대화창</small>
					</h1>
				</section>
			</div>
			<section class="content container-fluid">
				<div class="box box-primary direct-chat direct-chat-primary" style="width:300px;">
					<div class="box-header with-border" style="padding:10px 30px 10px 30px;">
						<h3 style="margin:10px 0px 10px 0px;"><strong>1:1 상담</strong> <small>관리자용</small></h3>						
						<div class="box-tools pull-right">
							<button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                			</button>
						</div>
					</div>
					<div class="box-body">
						<div id="chatContainer" class="direct-chat-messages" style="height:300px;">
							<div id="chatArea" class="direct-chat-msg right" style="height:270px; overflow-y:scroll;">
							</div>
						</div>
					</div>
					<div class="box-footer">
		                <div class="input-group">
		                  <input id="message" type="text" name="message" placeholder="내용을 입력하세요" class="form-control">
		                      <span id="sendBtn" class="input-group-btn">
		                        <button type="submit" class="btn btn-primary btn-flat" style="cursor: pointer;">Send</button>
		                      </span>
		                </div>
		            </div>
					<div class="container fluid">
						Signed In as : <span id="">${sessionScope.userid}</span>
					</div>
					<div class="container fluid" style="margin:0px -670px 5px 0px; padding:0px 15px 5px;">
						Send To : <span id="sendTo">merchant</span>
					</div>							
				</div>
			</section>
		</div>
		<%@ include file="../include/main_footer.jsp"%>
	</div>
	<!-- JS 스크립트모음 -->
	<%@ include file="../include/plugin_js.jsp"%>
	<script>
	/*
	$.ajax({
		url : '/sessList.do',
		success : function(data) {
			$.each(data, function(index, value) {
				$("#chatContainer").append(
						"<div style='width:100px;border:1px solid black;' onclick='sendToCng(\""
								+ value + "\");'>" + value + "</div>")
			});
		}
	});
	 */
	$(document).ready(function() {
		$("#sendBtn").click(function() {
			sendMessage();
			$('#message').val('');
		});

		$("#message").keydown(function(key) {
			if (key.keyCode == 13) {// 엔터
				sendMessage();
				$('#message').val('');
			}
		});
	});

	//Init WebSocket.
	var webSocket = new WebSocket("ws://192.168.5.124:8888/projectOne/broadsocket");

	var messageTextArea = document.getElementById("chatArea");


	webSocket.onmessage = function processMessge(message) {
		//Json parse
		var jsonData = JSON.parse(message.data);
		if (jsonData.message != null) {
			$("#chatArea")
					.append(
							"<div class='direct-chat-info clearfix' style='margin:4px 0px 2px 0px;'>" + 
							"<span class='direct-chat-name pull-left'>고객</span><span id='time-result' class='direct-chat-timestamp pull-right'></span>" + "</div>" +
							"<div class='direct-chat-text' style='width:200px; margin:5px 25px 0px 0px; float:left;'>"
									+ jsonData.message
									+ "</div><div style='clear:both;'></div>");

			if ($("#newmsg").length < 1) {
				$("body")
						.append(
								"<div id='newmsg' style='position:absolute;bottom:0;right:0;'>New Message!</div>");
			}
			setTimeout(function() {

				$("#newmsg").css("opacity", 0);

			}, 3000);
			setTimeout(function() {

				$("#newmsg").remove();

			}, 4000);
		}
		;
	}

	//Send Message.
	function sendMessage() {
		var messageText = document.getElementById("message");

		messageText.value = messageText.value.replace('"', '&#34;');

		webSocket.send('{ \"sendTo\" : \"' + $("#sendTo").text() + '\", \"message\" : \"' + messageText.value + '\"}');

		$("#chatArea").append(
							"<div class='direct-chat-info clearfix' style='margin:4px 4px 2px 0px;'>" + 
							"<span class='direct-chat-name pull-right'>ADMIN</span><span id='time-result' class='direct-chat-timestamp pull-left'></span>" + "</div>" +
							"<div class='direct-chat-text' style='width:200px; margin:5px 25px 0px 0px; float:right;'>"
							   + messageText.value
							   + "</div><div style='clear:both;'></div>");
		
		messageText.value = "";
	}


</script>
<script type="text/javascript">
	var d = new Date();
	var currentDate = ( d.getMonth() + 1 ) + "월 " + d.getDate() + "일";
    var currentTime = d.getHours() + "시 " + d.getMinutes() + "분 ";
    var result = document.getElementById("time-result");
    result.innerHTML = currentDate + " " + currentTime; 
</script>

	<!-- Optionally, you can add Slimscroll and FastClick plugins.
     Both of these plugins are recommended to enhance the
     user experience. -->
</body>
<style>
#newmsg {
	transition: opacity 1s;
}
</style>
</html>