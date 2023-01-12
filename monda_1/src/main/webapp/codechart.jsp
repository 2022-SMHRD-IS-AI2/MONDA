<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>MONDA-캘린더</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/sub.css" />
<link rel="stylesheet"
	href="assets/css/_default.page.client.936d3e7c.css" />
<link rel="stylesheet" href="assets/css/Textarea.1ddb1922.css " />
<!-- calendar css 연결 -->
<link rel="stylesheet" href="./assets/css/root.css">


<script src="https://kit.fontawesome.com/481f0bd49e.js"
	crossorigin="anonymous"></script>

<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">
	<%
	MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
	%>
	<!-- Sidebar -->
	<section id="sidebar">
		<div class="Logo">
			<a href="" class="Logo_atag"><h1>
					<img src="./images/Logo_white_s.png" />
				</h1></a>
		</div>
		<div class="inner">
			<div class="profileWrap">
				<div class="profile f_left">
					<a href=""><img
						src="./file/<%if (loginMember == null) {%>profile_img.png<%} else {%><%=loginMember.getM_profile_img()%><%}%>" /></a>
					<div class="profile_txt f_right">
						<p>
							<%
							if (loginMember == null) {
							%><span id="lojo" onclick="onDisplay()">로그인/회원가입</span>

							<%
							} else {
							%><%=loginMember.getM_name()%><br> <a href="logoutCon">로그아웃</a><br>
							<span><a href="update.jsp">회원정보수정</a></span>
							<%
							}
							%>
						</p>
					</div>
				</div>
			</div>
			<nav>
				<ul>
					<li><a href="index.jsp" class="border_b">Main</a></li>
					<li><a href="#one" class="border_b">My Space</a>
						<ul class="work_list">
							<li><a href="workspace.jsp" class="list_menu">My
									Workspace</a></li>
							<li><a href="calendar.jsp" class="list_menu">나의 캘린더</a></li>
							<li><a href="#three" class="list_menu">나의 메모</a></li>
							<li><a href="codechart.jsp" class="list_menu active">나의
									코드블럭</a></li>
						</ul></li>
					<li><a href="" class="border_b">Project Name</a>
						<ul class="work_list">
							<li><a href="" class="list_menu">My Workspace</a></li>
							<li><a href="" class="list_menu">프로젝트1 캘린더</a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</section>

	<!-- Wrapper -->
	<div id="wrapper">
		<div class="mainWrap">
			<img src="./images/chart.png" class="exex">
		</div>
	</div>
</body>
</html>
</html>