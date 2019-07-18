<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta
	content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no"
	name="viewport">
<link rel="stylesheet"
	href="/projectOne/resources/AdminLTE/bower_components/bootstrap/dist/css/bootstrap.min.css">
<!-- Font Awesome -->
<link rel="stylesheet"
	href="/projectOne/resources/AdminLTE/bower_components/font-awesome/css/font-awesome.min.css">
<!-- Ionicons -->
<link rel="stylesheet"
	href="/projectOne/resources/AdminLTE/bower_components/Ionicons/css/ionicons.min.css">
<!-- Theme style -->
<link rel="stylesheet"
	href="/projectOne/resources/AdminLTE/dist/css/AdminLTE.min.css">
<!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
<link rel="stylesheet"
	href="/projectOne/resources/AdminLTE/dist/css/skins/skin-blue.min.css">
<!-- jQuery 3 -->
<script
	src="/projectOne/resources/AdminLTE/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script
	src="/projectOne/resources/AdminLTE/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script
	src="/projectOne/resources/AdminLTE/dist/js/adminlte.min.js"></script>

<!-- Google Font -->
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic">
<title>Home</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/sockjs-client/0.3.4/sockjs.min.js"></script>
<meta charset="UTF-8" />
</head>
<body class="hold-transition skin-blue-light">
	<section class="content-header">
		<h1>1:1 상담(고객)</h1>
	</section>

	<br />
	<div id="chatContainer"></div>
	<div class="box box-danger direct-chat direct-chat-danger">
		<div class="box-header with-border">
			<h3 class="box-title">1:1상담</h3>
			<div class="box-tools pull-right">
				<button class="btn btn-box-tool" data-widget="collapse">
					<i class="fa fa-minus"></i>
				</button>
				<button class="btn btn-box-tool" data-widget="remove">
					<i class="fa fa-times"></i>
				</button>
			</div>
		</div>
	</div>

	<div class="box-body">
		<div id="chatArea" class="direct-chat-meassage">
			<div class="direct-chat-msg">
				<div class="direct-chat-info clearfix">
					<span class="direct-chat-name pull-left">${sessionScope.userid}</span>
					<span class="direct-chat-timestamp pull-right">23 Jan 2:00pm</span>
				</div>
				<img class="direct-chat-img" src="../dist/img/user1-128x128.jpg"
					alt="message user image">
				<div class="direct-chat-text">Is this template really for
					free? That's unbelievable!</div>
			</div>
		</div>

		<br />

		<div class="box-footer">
			<div class="input group">
				<input type="text" id="message" placeholder="메시지를 입력하세요." class="form-control">
				<span id="sendBtn" class="input-group-btn">
					<button type="button" class="btn btn-danger btn-flat">Send</button>
				</span>
			</div>
		</div>
	</div>
	<div>
		Signed In as : <span id=""> ${sessionScope.userid } </span>
	</div>
	<div>
		Send To : <span id="sendTo">ADMIN</span>
	</div>
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
							"<div style='float:left;border:1px solid red;background-color:red;border-radius:6px;margin-bottom:10px;'>"
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

		$("#chatArea").append("<div style='float:right;border:1px solid cornflowerblue;background-color:cornflowerblue;border-radius:6px;margin-bottom:10px;'>" + 
							   messageText.value + 
							   "</div><div style='clear:both;'></div>");
		
		messageText.value = "";
	}


</script>
</body>
<style>
#newmsg {
	transition: opacity 1s;
}
</style>
</html>