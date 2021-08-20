<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8">
	<!-- <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"> -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<meta name="description" content="">
	<meta name="author" content="">

	<title>YedamERP</title>

	<!-- Bootstrap Core CSS -->
	<link href="${pageContext.request.contextPath}/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	<!-- MetisMenu CSS -->
	<link href="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
	<!-- Custom CSS -->
	<link href="${pageContext.request.contextPath}/resources/dist/css/sb-admin-2.css" rel="stylesheet">
	<!-- Morris Charts CSS -->
	<link href="${pageContext.request.contextPath}/resources/vendor/morrisjs/morris.css" rel="stylesheet">
	<!-- Custom Fonts -->
	<link href="${pageContext.request.contextPath}/resources/vendor/font-awesome/css/font-awesome.min.css"
		rel="stylesheet" type="text/css">
	<!--  Jquery UI CSS -->
	<link href="${pageContext.request.contextPath}/resources/jquery/jquery-ui.min.css" rel="stylesheet">
	<!-- jQuery -->
	<script src='https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.9.0/moment.min.js'></script>
	<script src="${pageContext.request.contextPath}/resources/vendor/jquery/jquery.min.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="${pageContext.request.contextPath}/resources/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

	<!-- Chat -->
	<link href="${pageContext.request.contextPath}/resources/chat/chat.css" rel="stylesheet">

	<!-- <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
 -->
	<style>
		.page-header {
			padding: 8px 0px 8px 0px;
			border-bottom: 1px solid #eee;
		}

		.erp-page-header {
			padding: 7px 12px 12px 5px;
			background-color: #FAEBD7;
		}
	</style>

	<script>
		var title_nav = ""
	</script>
	<script>
		function logoutcheck() {
			location.href = 'logout';
		}
	</script>
</head>

<body>
	<div id="wrapper">
		<!-- Navigation -->
		<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span
						class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<c:if
					test="${not empty sessionScope.viewCustomer.customerCode && sessionScope.viewCustomer.customerCode == '1111'}">
					<h3>${sessionScope.viewCustomer.customerName}님환영합니다.</h3>
					<input class="btn btn-primary" type="button" name="logout" value="로그아웃" onclick="logoutcheck()" />
				</c:if>
				<!-- jstl 코어 태그 -->
				<c:choose>
					<c:when
						test="${not empty sessionScope.viewCustomer.customerCode && sessionScope.viewCustomer.customerCode=='admin12345'}">
						<a class="navbar-brand" href="./">YedamERP</a>
					</c:when>
					<c:when
						test="${not empty sessionScope.viewCustomer.customerCode && sessionScope.viewCustomer.customerCode!='admin12345'}">
						<a class="navbar-brand" href="#">YedamERP</a>
					</c:when>

				</c:choose>

			</div>
		</nav>
	</div>
	<div id="wrapper">
		<!-- Navigation -->

		<tiles:insertAttribute name="menu" />
		<div id="page-wrapper">
			<tiles:insertAttribute name="header" />
			<tiles:insertAttribute name="content" />

			<!-- Metis Menu Plugin JavaScript -->
			<script src="${pageContext.request.contextPath}/resources/vendor/metisMenu/metisMenu.min.js"></script>
			<!-- Custom Theme JavaScript -->
			<script src="${pageContext.request.contextPath}/resources/dist/js/sb-admin-2.js"></script>
		</div>

		<!-- chat -->

		<div id="chat">
			Live Q&A
			<div id="chatlogin">
				상호명<input type="text" id="nickname" onkeydown="enterlogin()" size="18"> <input type="button" value="입장"
					onclick="login()">
			</div>
			<div id="chat-area">
				<textarea id="messageWindow" rows="20" cols="33" readonly="readonly"></textarea>
				<br /> <input id="inputMessage" type="text" onkeydown="enterkey()" size="13" /> <input type="button"
					value="보내기" onclick="send()" />
				<input type="button" value="나가기" onclick="logout()" />
			</div>


		</div>
	</div>

	<script type="text/javascript">
		var textarea = document.getElementById("messageWindow");
		var webSocket
		var inputMessage = document.getElementById('inputMessage');
		var clientID

		//채팅방 로그인
		function login() {

			document.getElementById("chatlogin").style.display = "none";
			document.getElementById("chat-area").style.display = "block";
			clientID = document.getElementById("nickname").value;
			webSocket = new WebSocket(
				'ws://180.71.250.243/erp/websocket/broadcast.do');

			webSocket.onerror = function (event) {
				onError(event)
			};
			webSocket.onopen = function (event) {
				onOpen(event)
			};
			webSocket.onmessage = function (event) {
				onMessage(event)
			};

			function onMessage(event) {
				textarea.value += event.data + "\n";
			}

			function onOpen(event) {
				textarea.value += "연결 성공\n";
			}

			function onError(event) {
				console.log(event);
				alert(event.data);
			}
		}

		function send() {
			// 서버로 전송할 데이터를 담을 msg 객체 생성.
			var msg = {
				cmd: "message",
				msg: document.getElementById("inputMessage").value,
				id: clientID
			};
			// Send the msg object as a JSON-formatted string.
			webSocket.send(JSON.stringify(msg));
			// Blank the text input element, ready to receive the next line of text from the user.
			document.getElementById("inputMessage").value = "";
		}

		function enterkey() {
			if (window.event.keyCode == 13) {
				if (document.getElementById("inputMessage").value != "")
					send();
			}
		}

		function enterlogin() {
			if (window.event.keyCode == 13) {
				if (document.getElementById("nickname").value != "")
					login();
			}
		}

		function logout() {
			document.getElementById("chat-area").style.display = "none";
			document.getElementById("chatlogin").style.display = "block";
		};
		/*  $( function() {
		    $( "#chat" ).draggable({handle: ''});
		  });	
		 */
	</script>

</body>

</html>