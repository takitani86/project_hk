<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%request.setCharacterEncoding("utf-8");
response.setContentType("text/html; charset=utf-8");
%>
<!DOCTYPE html >
<html>
<head>
<script type="text/javascript">
var ws = new WebSocket("ws://localhost:8080/replyEcho?bno=1234")

ws.onopen=function(){
	console.log('info: connection opened.');
	setTimeout( function(){	connect();},1000);
}

ws.onmessage=function(event){
	console.log(event.data+'\n');
};

ws.onclose=function (event) {console.log('info: connection closed.');};
ws.onerror=function (event) {console.log('info: connection closed.');};

$('#btnSend').on('click',function(evt){
	evt.preventDefault();
	if(socket.readyState !==1) return;
		let msg=$('input#msg').val();
		ws.send(msg);
});


</script>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>세부사항</title>
</head>
<body>
<p><input type="button" name="btnSend" />버튼</p>
</body>
</html>