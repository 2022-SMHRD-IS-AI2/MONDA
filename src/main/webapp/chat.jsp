<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Chat</title>
</head>
<body>
<%MemberVO loginMember = (MemberVO) session.getAttribute("loginMember"); %>
	현재세션 :
	<input id="nowsession" value="" readonly>

	<form>
		세션변경 : <input id="roomID" type="text" value="roomName"> <input
			onclick="sendRoomID()" value="Send" type="button">
	</form>



	<form>
		<!-- 유저 명을 입력하는 텍스트 박스 -->
		<input id="user" type="text" value=<%=loginMember.getM_name() %>>
		<!-- 송신 메시지를 작성하는 텍스트 박스 -->
		<input id="textMessage" type="text">
		<!-- 메세지를 송신하는 버튼 -->
		<input onclick="sendMessage()" value="Send" type="button">
		<!-- WebSocket 접속 종료하는 버튼 -->
		<input onclick="disconnect()" value="Disconnect" type="button">
	</form>
	<br />
	<!-- 콘솔 메시지의 역할을 하는 로그 텍스트 에리어.(수신 메시지도 표시한다.) -->
	<textarea id="messageTextArea" rows="10" cols="50" readonly></textarea>
	<script type="text/javascript">
		// 콘솔 텍스트 에리어 오브젝트
		var messageTextArea = document.getElementById("messageTextArea");
		// 웹 소켓 접속 함수, url 뒤의 파라미터는 callback 함수를 받는다.
		function connectWebSocket(url, message, open, close, error) {
			// WebSocket 오브젝트 생성 (자동으로 접속 시작한다. - onopen 함수 호출)
			let webSocket = new WebSocket(url);
			// 함수 체크하는 함수
			function call(cb, msg) {
				// cb가 함수 타입인지 확인
				if (cb !== undefined && typeof cb === "function") {
					// 함수 호출
					cb.call(null, msg);
				}
			}
			// WebSocket 서버와 접속이 되면 호출되는 함수
			webSocket.onopen = function() {
				// callback 호출
				call(open);
			};
			// WebSocket 서버와 접속이 끊기면 호출되는 함수
			webSocket.onclose = function() {
				// callback 호출
				call(close);
			};
			// WebSocket 서버와 통신 중에 에러가 발생하면 요청되는 함수
			webSocket.onerror = function() {
				// callback 호출
				call(error);
			};
			// WebSocket 서버로 부터 메시지가 오면 호출되는 함수
			webSocket.onmessage = function(msg) {
				// callback 호출
				call(message, msg);

			};
			// 웹 소켓 리턴
			return webSocket;
		}
		// 연결 발생 때 사용할 callback 함수
		var open = function() {
			// 콘솔 텍스트에 메시지를 출력한다
			messageTextArea.value += "서버연결\n";
		}
		// 종료 발생 때 사용할 callback 함수
		var close = function() {
			// 콘솔 텍스트에 메시지를 출력한다
			messageTextArea.value += "서버종료\n";
			// 재 접속을 시도한다.
			setTimeout(function() {
				// 재접속
				webSocket = connectWebSocket(
						"ws://localhost:8082/monda/broadsocket", message,
						open, close, error);
			});
		}
		// 에러 발생 때 사용할 callback 함수
		var error = function() {
			messageTextArea.value += "에러\n";
		}
		// 메세지를 받을 때 사용할 callback 함수
		var message = function(msg) {
			
			var today = new Date();   

			var hours = today.getHours(); // 시
			var minutes = today.getMinutes();  // 분
			
			// 코드개판났으니 송신받은 메세지 인덱싱하기
			var text = msg.data;
			var startIndexRoom = text.indexOf("<<") + 2;
			var endIndexRoom = text.indexOf(">>");
			var roomFix = text.substring(startIndexRoom, endIndexRoom);

			var startIndexName = text.indexOf("{{") + 2;
			var endIndexName = text.indexOf("}}");
			var nameFix = text.substring(startIndexName, endIndexName);

			var startIndexMsg = text.indexOf("[[") + 2;
			var endIndexMsg = text.indexOf("]]");
			var msgFix = text.substring(startIndexMsg, endIndexMsg);

			TestRoom = sessionStorage.getItem("roomID");
			// 현재 세션roomID랑 송신받은 세션roomID같으면 기록
			if (TestRoom == roomFix) {
				messageTextArea.value += "(" + hours +":"+ minutes + ") " + "[" + roomFix + "] " + nameFix
						+ " 님의 메세지 : " + msgFix + "\n";
			}

		};
		// 웹 소켓 생성
		var webSocket = connectWebSocket(
				"ws://localhost:8082/monda/broadsocket", message, open,
				close, error);

		function sendRoomID() {
			var TestRoom = document.getElementById("roomID").value;
			//세선설정
			sessionStorage.setItem("roomID", TestRoom);

			var sessionBox = document.getElementById("nowsession");
			sessionBox.value = TestRoom;

			//메시지박스 전송
			messageTextArea.value += TestRoom + " 이름의 방으로 입장\n";
		}

		// Send 버튼을 누르면 호출되는 함수  
		function sendMessage() {
			// roomID 세션값 받아오기
			TestRoom = sessionStorage.getItem("roomID");

			// 유저명 텍스트 박스 오브젝트를 취득  
			var user = document.getElementById("user");
			// 송신 메시지를 작성하는 텍스트 박스 오브젝트를 취득  
			var message = document.getElementById("textMessage");
			// 콘솔 텍스트에 메시지를 출력한다.  
			messageTextArea.value += user.value + "(me) => " + message.value
					+ "\n";
			// WebSocket 서버에 메시지를 전송(형식 「{{유저명}}메시지」)  
			webSocket.send("<<" + TestRoom + ">>" + "{{" + user.value + "}}"
					+ "[[" + message.value + "]]");
			// 송신 메시지를 작성한 텍스트 박스를 초기화한다.  
			message.value = "";
		}
		// Disconnect 버튼을 누르면 호출되는 함수  
		function disconnect() {
			// WebSocket 접속 해제  
			webSocket.close();
		}
	</script>
</body>
</html>