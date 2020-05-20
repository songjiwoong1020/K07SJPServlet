<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>chatting03.jsp</title>
	
</head>
	
<body>
	<input type="text" id="chat_id"	value="${param.chat_id }"	 
		style="border:1px dotted red; width:200px;" />
	<fieldset style="width:350px; text-align:center;">
		<legend>채팅창</legend>	
		<!-- 대화입력창 -->	
		<input type="text" id="inputMessage" style="width:300px; margin-bottom:5px;"/>
		<br />
		<input type="button" onclick="sendMessage();" value="보내기"/>
		<input type="button" onclick="disconnect();" value="채팅종료"/>	
		<br />
		<!-- 대화출력창 -->
		<textarea id="messageWindow" style="width:300px; height:400px; margin-top:10px;" readonly></textarea>
	</fieldset>

	
	<script>
	var messageWindow = document.getElementById("messageWindow");
	var inputMessage = document.getElementById('inputMessage');
	var chat_id = document.getElementById('chat_id').value;
	
	var webSocket = new WebSocket("ws://localhost:8282/K07JSPServlet/ChatServer02");
	
	webSocket.onopen = function(event){
		wsOpen(event);
	};
	
	webSocket.onclose = function(event){
		wsClose(event);
	};
	
	webSocket.onerror = function(event){
		wsError(event);
	};
	/*메세지 입력시 세번째 실행 아마 이벤트?라서 실행되는듯 잘모름*/
	webSocket.onmessage = function(event){
		wsMessage(event);
	};
	
	function wsOpen(event){
		messageWindow.value += "연결성공\n";
	}
	function wsClose(event){
		messageWindow.value += "연결끊기성공\n";
	}
	function wsError(event){
		alert(event.data);
	}
	function wsMessage(event){
		var message = event.data.split("|");
		var sender = message[0];
		var content = message[1];
		
		if(content == ""){
		} else {
			//보낸 메세지에
			if(content.match("/")){
				// 슬러쉬(/)가 포함되어있다면 명령어로 인식...
				if(content.match(("/" + chat_id))){
					// 귓속말 명령어를 한글로 대체 한 후..
					var temp = content.replace(("/" + chat_id), "[귓속말]:");
					// 귓속말을 받을 클라이언트에게만 내용을 출력한다.
					messageWindow.value += sender + "" + temp + "\n";
				}
			} else {
				// 슬러쉬가 없다면 일반적인 메세지
				messageWindow.value += sender + ":" + content + "\n";
			}
			
		}
		
	}
	
	/*메세지 입력시 첫번째 실행*/
	function sendMessage(){
		messageWindow.value += "나(me):" + inputMessage.value + "\n";
		webSocket.send(chat_id + '|' + inputMessage.value);//여기서 서버로 보냄
		inputMessage.value = "";
		
	}
	
	</script>
</body>
</html>