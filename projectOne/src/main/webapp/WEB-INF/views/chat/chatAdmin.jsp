<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>Home</title>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script type="text/javascript"
	src="//cdnjs.cloudflare.com/ajax/libs/sockjs-client/0.3.4/sockjs.min.js"></script>
<meta charset="UTF-8" />
</head>
<body>
	<h1>1:1 상담(관리자)</h1>


	<br />
	<div id="chatContainer"></div>

	<div id="chatArea"
		style="width: 500px; height: 500px; overflow-y: scroll; margin-top: 30px;"></div>

	<br />

	<input id="message">
	<span id="sendBtn"
		style="border: 1px solid red; padding: 5px; width: 30px; background-color: red; color: white; cursor: pointer;">
		Send</span>


	<div>
		Signed In as : <span id="">${sessionScope.userid }</span>
	</div>
	<div>
		Send To : <span id="sendTo">merchant</span>
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