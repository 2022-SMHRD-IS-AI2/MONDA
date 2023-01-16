<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 20230111 link태그 추가 -->
<link rel="stylesheet" href="assets/css/update.css" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/root.css" />
<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/sub.css" />
<link rel="stylesheet"
	href="assets/css/_default.page.client.936d3e7c.css" />
<link rel="stylesheet" href="assets/css/Textarea.1ddb1922.css " />
<!-- 20230111 link태그 추가 끝 -->

<!-- update.js 추가 -->
<script type="text/javascript" defer src="./assets/js/update.js"></script>


</head>
<body>
	<%
		MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
	 	
	%>
    
    <!-- Sidebar -->
        <section id="sidebar">
            <div class="Logo">
                <a href="" class="Logo_atag"><h1><img src="./images/Logo_white_s.png"/></h1></a>
            </div>
            <div class="inner">
                <div class="profileWrap">
                    <div class="profile f_left">
                        <a href=""><img
						src="./images/<%if (loginMember == null) {%>profile_img.png<%} else {%><%=loginMember.getM_profile_img()%><%}%>" /></a>
                        <div class="profile_txt f_right">
                            <p><%
							if (loginMember == null) {
							%><span onclick="onDisplay()" style="cursor: pointer">로그인/회원가입</span>

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
                
                <div id="intro" class="main_header">
                    <ul>
                        <li class="search"><input type="text"/></li>
                        <li><a href=""><img src="./images/chat_icon01.png"/></a></li>
                    </ul>
                </div>
                <nav>
				<ul>
					<li><a href="index.jsp" class="border_b">Main</a></li>
					<li><a href="#one" class="border_b">My Space</a>
						<ul class="work_list">
							<li><a href="#workspace.jsp" class="list_menu">My Workspace</a></li>
							<li><a href="calendar.jsp" class="list_menu">나의 캘린더</a></li>
							<li><a href="codeCon" class="list_menu">나의 코드블럭</a></li>
						</ul>
					</li>
					<li><a href="#two" class="border_b">Project Name 01</a>
						<ul class="work_list">
							<li><a href="" class="list_menu">Team Workspace</a></li>
							<li><a href="" class="list_menu">프로젝트1 캘린더</a></li>
						</ul>
					</li>
				</ul>
			</nav>
            </div>
        </section>
    <!-- //sidebar -->
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Menu -->
		<nav class="update_nav">
			<ul>
				<li><h5>회원정보수정</h5></li>
				<form action="updatecon" method="post" enctype="multipart/form-data">
					<li>접속한 ID : <%=loginMember.getM_id() %></li>
					<li><input class="update_input" name="pw" type="password" placeholder="PW를 입력하세요"
						style="width: 500px; margin: 0 auto;"></li>
					<li><input class="update_input" name="name" type="text"
						value="<%=loginMember.getM_name() %>" placeholder="이름을 입력하세요"
						style="width: 500px; margin: 0 auto;"></li>
					<li><input class="update_input" name="nick" type="text"
						value="<%=loginMember.getM_name() %>"
						placeholder="NickName을 입력하세요"
						style="width: 500px; margin: 0 auto;"></li>
					<li><input class="update_input" name="email" type="text"
						value="<%=loginMember.getM_email() %>" placeholder="Email을 입력하세요"
						style="width: 500px; margin: 0 auto;"></li>
					<li>
                        <div class="filebox"> 
                            <label for="file">업로드</label> 
                            <input type="file" id="file" name="filename"> 
                            <input class="upload-name" value="<%=loginMember.getM_profile_img() %>" placeholder="파일을 선택해주세요">
                        </div>
                    </li>
					<li><span>회원가입일자 : <%=loginMember.getM_joindate() %></span></li>
					<li>
                        <label class="join_label">
                            <input type="radio" name="type" value="M" checked>
                            <span>일반</span>
                        </label>
                        <label>
                            <input type="radio" name="type" value="A">
                            <span>관리자</span>
                        </label>
                    </li>
					<li><input class="join_btn" type="submit" value="JoinUs" class="button fit"
						style="width: 500px; margin: 0 auto;"></li>
				</form>
			</ul>
		</nav>
	</div>
</body>
</html>