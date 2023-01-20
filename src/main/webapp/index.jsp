<%@page import="java.util.Locale"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.smhrd.model.BoardDAO1"%>
<%@page import="com.smhrd.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>MONDA MAIN</title>
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
<!-- login css 연결 -->
<link rel="stylesheet" href="./assets/css/login.css">


<script src="https://kit.fontawesome.com/481f0bd49e.js"
	crossorigin="anonymous"></script>

<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">
	<%
	MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
	List<BoardVO> file_list = new BoardDAO1().showBoard();				   // T_file selectAll

	Date nowDate = new Date();											   // 오늘날짜 시간 불러옴
	SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyMMdd");	   // 날짜 230117 형식 format
	String codedate = simpleDateFormat.format(nowDate);					   // 오늘날짜 데이터 230117 형식으로 format해서 String codedate 에 담아줌
	SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");			   // 날짜 2023-01-17 형식 format	
	Date date = new Date();												   // 오늘날짜 시간 불러옴
	try {
		date = sdf.parse(codedate);										   
		
	} catch (ParseException e) {
	}
	Calendar cal = Calendar.getInstance(Locale.KOREA);

	cal.add(Calendar.DATE, 2 - cal.get(Calendar.DAY_OF_WEEK));
	String monday = sdf.format(cal.getTime());
	cal.add(Calendar.DATE, 3 - cal.get(Calendar.DAY_OF_WEEK));
	String tuesday = sdf.format(cal.getTime());
	cal.add(Calendar.DATE, 4 - cal.get(Calendar.DAY_OF_WEEK));
	String wednesday = sdf.format(cal.getTime());
	cal.add(Calendar.DATE, 5 - cal.get(Calendar.DAY_OF_WEEK));
	String thursday = sdf.format(cal.getTime());
	cal.add(Calendar.DATE, 6 - cal.get(Calendar.DAY_OF_WEEK));
	String friday = sdf.format(cal.getTime());
	cal.add(Calendar.DATE, 7 - cal.get(Calendar.DAY_OF_WEEK));
	String saturday = sdf.format(cal.getTime());
	cal.add(Calendar.DATE, 8 - cal.get(Calendar.DAY_OF_WEEK));
	String sunday = sdf.format(cal.getTime());

	ArrayList<String> mon = new ArrayList<>();
	ArrayList<String> tues = new ArrayList<>();
	ArrayList<String> wed = new ArrayList<>();
	ArrayList<String> thu = new ArrayList<>();
	ArrayList<String> fri = new ArrayList<>();
	ArrayList<String> sat = new ArrayList<>();
	ArrayList<String> sun = new ArrayList<>();
	for (int i = 0; i < file_list.size(); i++) {
		String date1 = String.valueOf(file_list.get(i).getT_UPLOADDAY()).substring(0, 10);

		if (date1.equals(sunday)) {
			sun.add(file_list.get(i).getREAL_FILE_NAME());

		} else if (date1.equals(monday)) {
			mon.add(file_list.get(i).getREAL_FILE_NAME());
		} else if (date1.equals(tuesday)) {
			tues.add(file_list.get(i).getREAL_FILE_NAME());
		} else if (date1.equals(wednesday)) {
			wed.add(file_list.get(i).getREAL_FILE_NAME());
		} else if (date1.equals(thursday)) {
			thu.add(file_list.get(i).getREAL_FILE_NAME());
		} else if (date1.equals(friday)) {
			fri.add(file_list.get(i).getREAL_FILE_NAME());
		} else if (date1.equals(saturday)) {
			sat.add(file_list.get(i).getREAL_FILE_NAME());

		}
	}
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
				<div class="profile">
					<a href=""><img
						src="./images/<%if (loginMember == null) {%>profile_img.png<%} else {%><%=loginMember.getM_profile_img()%><%}%>" /></a>
					<div class="profile_txt f_right">
						<p>
							<%
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
					<li class="search"><input type="text" /></li>
					<li><a href=""><img src="./images/chat_icon01.png" /></a></li>
				</ul>
			</div>
			<nav>
				<ul>
					<li><a href="index.jsp" class="border_b active">Main</a></li>
					<li><a href="#one" class="border_b">My Space</a>
						<ul class="work_list">
							<li><a href="workspace.jsp" class="list_menu">My Workspace</a></li>
							<li><a href="calendar.jsp" class="list_menu">나의 캘린더</a></li>
							<li><a href="codeCon" class="list_menu">나의 코드블럭</a></li>
						</ul>
					</li>
					<li>
						<a href="" class="border_b">Project Name</a>
						<ul class="work_list">
							<li><a href="Team_workspace.jsp" class="list_menu">Team Workspace</a></li>
							<li><a href="Team_calendar.jsp" class="list_menu">프로젝트1 캘린더</a></li>
						</ul>
					</li>
				</ul>
			</nav>
		</div>
		<!--우측 고정된 영역-->
		<div id="fixed_area">
		    <input type="checkbox" id="fixed_btn"/>
		    <label for="fixed_btn" class="btn"><i></i><i></i><i></i></label>
		    <div class="area">
		        <!-- 채팅기능추가 -->
				<div class="chattingWrap">
					<ul>
						<li><p>현재 접속한 채팅 : </p><input id="nowsession" value="" readonly></li>
						<li>
							<form>
								<input id="roomID" type="text" value="roomName" placeholder="채팅번호를 입력해주세요">
								<input onclick="sendRoomID()" value="Send" type="button">
							</form>
						</li>
						<li>
							<!-- 콘솔 메시지의 역할을 하는 로그 텍스트 에리어.(수신 메시지도 표시한다.) -->
							<textarea id="messageTextArea" rows="8" cols="50" readonly></textarea>
						</li>
						<li>
							<form>
								<!-- 유저 명을 입력하는 텍스트 박스 -->
								<input id="user" type="text" value="<%if (loginMember != null) {%><%=loginMember.getM_name()%><% }%>">
								<!-- 송신 메시지를 작성하는 텍스트 박스 -->
								<input id="textMessage" type="text">
								<!-- 메세지를 송신하는 버튼 -->
								<input onclick="sendMessage()" value="Send" type="button">
								<!-- WebSocket 접속 종료하는 버튼 -->
								<!-- <input onclick="disconnect()" value="Disconnect" type="button"> -->
							</form>
						</li>
						
					</ul>
				</div>
				<!-- //채팅기능 끝 -->
		    </div><!--//area-->
		</div><!--//fixed_area-->
		
	</section>
	<!-- //sidebar -->
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- login 시작 -->
		<div class="dialongWrap" style="display: none;" id="noneDiv">
			<div class="dialog">
				<span class="dialog__close" onclick="offDisplay()">&#x2715;</span>
				<form action="joincon">
					<div class="dialog__signup">
						<h2 class="dialog__title" id="signup">
							<span>or</span>Sign up
						</h2>
						<div class="dialog__holder">
							<input name="id" type="text" class="input" placeholder="Id" />
							<input name="pw" type="password" class="input" placeholder="Password" />
							<input name="name" type="text" class="input" placeholder="이름" />
							<input name="nick" type="text" class="input" placeholder="닉네임" />
							<input name="email" type="text" class="input" placeholder="Email" />
						</div>
						<button class="submit-btn">Sign up</button>
					</div>
				</form>
				<form action="logincon">
					<div class="dialog__login slide-up">
						<div class="center">
							<h2 class="dialog__title" id="login">
								<span>or</span>Login
							</h2>
							<div class="dialog__holder">
								<input name="id" type="text" class="input" placeholder="Id" />
								<input name="pw" type="password" class="input" placeholder="Password" />
							</div>
							<button class="submit-btn">Login</button>
						</div>
					</div>
				</form>
			</div>
		</div>
		<!-- 로그인 끝 -->
		<!-- Intro -->
		<div class="mainWrap">
			<section class="wrapper bg_white fullscreen fade-up">
				<div class="main_contents mb30">
					<div class="main_space mb00">
						<!-- 워크스페이스 시작 -->
						<div class="main_workspace">
							<table class="wks_table">
								<colgroup>
									<col width="14.2%" />
									<col width="14.2%" />
									<col width="14.2%" />
									<col width="14.2%" />
								</colgroup>
								<thead>
									<tr>
										<th scope="col">
											<div class="work_title">
												<svg viewBox="0 0 16 16" class="typesIcon"
													style="width: 16px; height: 16px; display: block; fill: rgba(55, 53, 47, 0.45); flex-shrink: 0; backface-visibility: hidden;">
															<path
														d="M0.637695 13.1914C1.0957 13.1914 1.32812 13 1.47852 12.5215L2.24414 10.3887H6.14746L6.90625 12.5215C7.05664 13 7.2959 13.1914 7.74707 13.1914C8.22559 13.1914 8.5332 12.9043 8.5332 12.4531C8.5332 12.2891 8.50586 12.1523 8.44434 11.9678L5.41602 3.79199C5.2041 3.21777 4.82129 2.9375 4.19922 2.9375C3.60449 2.9375 3.21484 3.21777 3.0166 3.78516L-0.0322266 12.002C-0.09375 12.1797 -0.121094 12.3232 -0.121094 12.4668C-0.121094 12.918 0.166016 13.1914 0.637695 13.1914ZM2.63379 9.12402L4.17871 4.68066H4.21973L5.76465 9.12402H2.63379ZM12.2793 13.2324C13.3115 13.2324 14.2891 12.6787 14.7129 11.8037H14.7402V12.5762C14.7471 12.9863 15.0273 13.2393 15.4238 13.2393C15.834 13.2393 16.1143 12.9795 16.1143 12.5215V8.00977C16.1143 6.49902 14.9658 5.52148 13.1543 5.52148C11.7666 5.52148 10.6592 6.08887 10.2695 6.99121C10.1943 7.15527 10.1533 7.3125 10.1533 7.46289C10.1533 7.81152 10.4062 8.04395 10.7686 8.04395C11.0215 8.04395 11.2129 7.94824 11.3496 7.73633C11.7529 6.99121 12.2861 6.65625 13.1064 6.65625C14.0977 6.65625 14.6992 7.20996 14.6992 8.1123V8.67285L12.5664 8.7959C10.7686 8.8916 9.77734 9.69824 9.77734 11.0107C9.77734 12.3369 10.8096 13.2324 12.2793 13.2324ZM12.6621 12.1387C11.8008 12.1387 11.2129 11.667 11.2129 10.9561C11.2129 10.2725 11.7598 9.82129 12.7578 9.75977L14.6992 9.62988V10.3203C14.6992 11.3457 13.7969 12.1387 12.6621 12.1387Z"></path>
														</svg>
												<p class="typesTitle">작업 이름</p>
											</div>
										</th>
										<th scope="col">
											<div class="work_title">
												<svg viewBox="0 0 16 16" class="typesIcon"
													style="width: 16px; height: 16px; display: block; fill: rgba(55, 53, 47, 0.45); flex-shrink: 0; backface-visibility: hidden;">
															<path
														d="M8.75488 1.02344C8.75488 0.613281 8.41309 0.264648 8.00293 0.264648C7.59277 0.264648 7.25098 0.613281 7.25098 1.02344V3.11523C7.25098 3.51855 7.59277 3.86719 8.00293 3.86719C8.41309 3.86719 8.75488 3.51855 8.75488 3.11523V1.02344ZM3.91504 5.0293C4.20215 5.31641 4.69434 5.32324 4.97461 5.03613C5.26855 4.74902 5.26855 4.25684 4.98145 3.96973L3.53906 2.52051C3.25195 2.2334 2.7666 2.21973 2.47949 2.50684C2.19238 2.79395 2.18555 3.28613 2.47266 3.57324L3.91504 5.0293ZM10.9629 4.01758C10.6826 4.30469 10.6826 4.79688 10.9697 5.08398C11.2568 5.37109 11.749 5.36426 12.0361 5.07715L13.4854 3.62793C13.7725 3.34082 13.7725 2.84863 13.4785 2.55469C13.1982 2.27441 12.7061 2.27441 12.4189 2.56152L10.9629 4.01758ZM15.0234 8.78906C15.4336 8.78906 15.7822 8.44727 15.7822 8.03711C15.7822 7.62695 15.4336 7.28516 15.0234 7.28516H12.9385C12.5283 7.28516 12.1797 7.62695 12.1797 8.03711C12.1797 8.44727 12.5283 8.78906 12.9385 8.78906H15.0234ZM0.975586 7.28516C0.56543 7.28516 0.223633 7.62695 0.223633 8.03711C0.223633 8.44727 0.56543 8.78906 0.975586 8.78906H3.07422C3.48438 8.78906 3.83301 8.44727 3.83301 8.03711C3.83301 7.62695 3.48438 7.28516 3.07422 7.28516H0.975586ZM12.0361 10.9902C11.749 10.71 11.2568 10.71 10.9629 10.9971C10.6826 11.2842 10.6826 11.7764 10.9697 12.0635L12.4258 13.5127C12.7129 13.7998 13.2051 13.793 13.4922 13.5059C13.7793 13.2256 13.7725 12.7266 13.4854 12.4395L12.0361 10.9902ZM2.52051 12.4395C2.22656 12.7266 2.22656 13.2188 2.50684 13.5059C2.79395 13.793 3.28613 13.7998 3.57324 13.5127L5.02246 12.0703C5.31641 11.7832 5.31641 11.291 5.03613 11.0039C4.74902 10.7168 4.25684 10.71 3.96973 10.9971L2.52051 12.4395ZM8.75488 12.9658C8.75488 12.5557 8.41309 12.207 8.00293 12.207C7.59277 12.207 7.25098 12.5557 7.25098 12.9658V15.0576C7.25098 15.4609 7.59277 15.8096 8.00293 15.8096C8.41309 15.8096 8.75488 15.4609 8.75488 15.0576V12.9658Z"></path>
														</svg>
												<p class="typesTitle">Status</p>
											</div>
										</th>
										<th scope="col">
											<div class="work_title">
												<svg viewBox="0 0 16 16" class="typesIcon"
													style="width: 16px; height: 16px; display: block; fill: rgba(55, 53, 47, 0.45); flex-shrink: 0; backface-visibility: hidden;">
															<path
														d="M10.9536 7.90088C12.217 7.90088 13.2559 6.79468 13.2559 5.38525C13.2559 4.01514 12.2114 2.92017 10.9536 2.92017C9.70142 2.92017 8.65137 4.02637 8.65698 5.39087C8.6626 6.79468 9.69019 7.90088 10.9536 7.90088ZM4.4231 8.03003C5.52368 8.03003 6.42212 7.05859 6.42212 5.83447C6.42212 4.63843 5.51245 3.68945 4.4231 3.68945C3.33374 3.68945 2.41846 4.64966 2.41846 5.84009C2.42407 7.05859 3.32251 8.03003 4.4231 8.03003ZM1.37964 13.168H5.49561C4.87231 12.292 5.43384 10.6074 6.78711 9.51807C6.18628 9.14746 5.37769 8.87231 4.4231 8.87231C1.95239 8.87231 0.262207 10.6917 0.262207 12.1628C0.262207 12.7974 0.548584 13.168 1.37964 13.168ZM7.50024 13.168H14.407C15.4009 13.168 15.7322 12.8423 15.7322 12.2864C15.7322 10.8489 13.8679 8.88354 10.9536 8.88354C8.04492 8.88354 6.17505 10.8489 6.17505 12.2864C6.17505 12.8423 6.50635 13.168 7.50024 13.168Z"></path>
														</svg>
												<p>담당자</p>
											</div>
										</th>
										<th scope="col">
											<div class="work_title">
												<svg viewBox="0 0 16 16" class="typesIcon"
													style="width: 16px; height: 16px; display: block; fill: rgba(55, 53, 47, 0.45); flex-shrink: 0; backface-visibility: hidden;">
															<path
														d="M3.29688 14.4561H12.7031C14.1797 14.4561 14.9453 13.6904 14.9453 12.2344V3.91504C14.9453 2.45215 14.1797 1.69336 12.7031 1.69336H3.29688C1.82031 1.69336 1.05469 2.45215 1.05469 3.91504V12.2344C1.05469 13.6973 1.82031 14.4561 3.29688 14.4561ZM3.27637 13.1162C2.70898 13.1162 2.39453 12.8154 2.39453 12.2207V5.9043C2.39453 5.30273 2.70898 5.00879 3.27637 5.00879H12.71C13.2842 5.00879 13.6055 5.30273 13.6055 5.9043V12.2207C13.6055 12.8154 13.2842 13.1162 12.71 13.1162H3.27637ZM6.68066 7.38086H7.08398C7.33008 7.38086 7.41211 7.30566 7.41211 7.05957V6.66309C7.41211 6.41699 7.33008 6.3418 7.08398 6.3418H6.68066C6.44141 6.3418 6.35938 6.41699 6.35938 6.66309V7.05957C6.35938 7.30566 6.44141 7.38086 6.68066 7.38086ZM8.92285 7.38086H9.31934C9.56543 7.38086 9.64746 7.30566 9.64746 7.05957V6.66309C9.64746 6.41699 9.56543 6.3418 9.31934 6.3418H8.92285C8.67676 6.3418 8.59473 6.41699 8.59473 6.66309V7.05957C8.59473 7.30566 8.67676 7.38086 8.92285 7.38086ZM11.1582 7.38086H11.5547C11.8008 7.38086 11.8828 7.30566 11.8828 7.05957V6.66309C11.8828 6.41699 11.8008 6.3418 11.5547 6.3418H11.1582C10.9121 6.3418 10.8301 6.41699 10.8301 6.66309V7.05957C10.8301 7.30566 10.9121 7.38086 11.1582 7.38086ZM4.44531 9.58203H4.84863C5.09473 9.58203 5.17676 9.50684 5.17676 9.26074V8.86426C5.17676 8.61816 5.09473 8.54297 4.84863 8.54297H4.44531C4.20605 8.54297 4.12402 8.61816 4.12402 8.86426V9.26074C4.12402 9.50684 4.20605 9.58203 4.44531 9.58203ZM6.68066 9.58203H7.08398C7.33008 9.58203 7.41211 9.50684 7.41211 9.26074V8.86426C7.41211 8.61816 7.33008 8.54297 7.08398 8.54297H6.68066C6.44141 8.54297 6.35938 8.61816 6.35938 8.86426V9.26074C6.35938 9.50684 6.44141 9.58203 6.68066 9.58203ZM8.92285 9.58203H9.31934C9.56543 9.58203 9.64746 9.50684 9.64746 9.26074V8.86426C9.64746 8.61816 9.56543 8.54297 9.31934 8.54297H8.92285C8.67676 8.54297 8.59473 8.61816 8.59473 8.86426V9.26074C8.59473 9.50684 8.67676 9.58203 8.92285 9.58203ZM11.1582 9.58203H11.5547C11.8008 9.58203 11.8828 9.50684 11.8828 9.26074V8.86426C11.8828 8.61816 11.8008 8.54297 11.5547 8.54297H11.1582C10.9121 8.54297 10.8301 8.61816 10.8301 8.86426V9.26074C10.8301 9.50684 10.9121 9.58203 11.1582 9.58203ZM4.44531 11.7832H4.84863C5.09473 11.7832 5.17676 11.708 5.17676 11.4619V11.0654C5.17676 10.8193 5.09473 10.7441 4.84863 10.7441H4.44531C4.20605 10.7441 4.12402 10.8193 4.12402 11.0654V11.4619C4.12402 11.708 4.20605 11.7832 4.44531 11.7832ZM6.68066 11.7832H7.08398C7.33008 11.7832 7.41211 11.708 7.41211 11.4619V11.0654C7.41211 10.8193 7.33008 10.7441 7.08398 10.7441H6.68066C6.44141 10.7441 6.35938 10.8193 6.35938 11.0654V11.4619C6.35938 11.708 6.44141 11.7832 6.68066 11.7832ZM8.92285 11.7832H9.31934C9.56543 11.7832 9.64746 11.708 9.64746 11.4619V11.0654C9.64746 10.8193 9.56543 10.7441 9.31934 10.7441H8.92285C8.67676 10.7441 8.59473 10.8193 8.59473 11.0654V11.4619C8.59473 11.708 8.67676 11.7832 8.92285 11.7832Z"></path>
														</svg>
												<p>마감일</p>
											</div>
										</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td></td>
										<td style="height: 40px"><select class="work_status">
												<option>작업시작전</option>
												<option>작업중</option>
												<option>완료</option>
										</select></td>
										<td></td>
										<td class="bd_right"></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td class="bd_right"></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td class="bd_right"></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td class="bd_right"></td>
									</tr>
									<tr>
										<td></td>
										<td></td>
										<td></td>
										<td class="bd_right"></td>
									</tr>
								</tbody>
							</table>
						</div>
						<!-- 워크스페이스 끝 -->
						<!-- 채팅 목록 시작 -->
						<div class="chat_list">
							<ul>
								<li>
									<dl>
										<dt class="bm_left">
											<img src="./images/profile_img_small.png">
										</dt>
										<dd class="bm_right name">
											<div class="memeber_info">
												<span class="name">장두식</span> <span class="time">두식씨
													힘내세요~</span>
											</div>
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt class="bm_left">
											<img src="./images/profile_img_small.png">
										</dt>
										<dd class="bm_right name">
											<div class="memeber_info">
												<span class="name">장예슬</span> <span class="time">서연씨
													어쩌고 저쩌고 언제까지 해주세요~!</span>
											</div>
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt class="bm_left">
											<img src="./images/profile_img_small.png">
										</dt>
										<dd class="bm_right name">
											<div class="memeber_info">
												<span class="name">윤효창</span> <span class="time">MONDA.jpg</span>
											</div>
										</dd>
									</dl>
								</li>
								<li>
									<dl>
										<dt class="bm_left">
											<img src="./images/profile_img_small.png">
										</dt>
										<dd class="bm_right name">
											<div class="memeber_info">
												<span class="name">김시우</span> <span class="time">코드블럭
													화이팅~!</span>
											</div>
										</dd>
									</dl>
								</li>
							</ul>
						</div>
						<!-- 채팅 목록 끝 -->
					</div>
				</div>
				<!-- 주간캘린더 시작 -->
				<div class="main_contents mb30">
					<div class="calendar">
						<table class="bbs_table">
							<colgroup>
								<col width="14.2%" />
								<col width="14.2%" />
								<col width="14.2%" />
								<col width="14.2%" />
								<col width="14.2%" />
								<col width="14.2%" />
								<col width="14.2%" />
							</colgroup>
							<thead>
								<tr class="schedule_lst">
									<th scope="col"><span class="sunday">SUN</span></th>
									<th scope="col">MON</th>
									<th scope="col">TUE</th>
									<th scope="col">WED</th>
									<th scope="col">THU</th>
									<th scope="col">FRI</th>
									<th scope="col"><span class="saturday">SAT</span></th>
								</tr>
							</thead>
							<tbody>
								<tr>
									<td>
										<div
											class="DeprecatedCalendarWeek DeprecatedProjectCalendarWeek-calendarWeek">
											<div
												class="DeprecatedCalendarDay DeprecatedCalendarDay--compact DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
												<div class="DeprecatedCalendarDay-dayHeader m00">
													<span class="DeprecatedCalendarDay-date">8</span> <span
														class="DeprecatedCalendarDay-headerLabel"></span>
												</div>
												<div class="DeprecatedCalendarDay-actions">
													<div class="DeprecatedCalendarDay-actions--left"></div>
													<div class="DeprecatedCalendarDay-actions--right"></div>
												</div>
											</div>
									</td>
									<td>
										<div
											class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
											<div class="DeprecatedCalendarDay-dayHeader m00">
												<span class="DeprecatedCalendarDay-date">9</span> <span
													class="DeprecatedCalendarDay-headerLabel"></span>
											</div>
											<div class="DeprecatedCalendarDay-tasks">
												<div>
													<div class="ContextMenuTarget-contextMenuEventListener">
														<!-- calc 수정 -->
														<div
															class="DeprecatedCalendarTaskRow DeprecatedCalendarTaskRow--colorAqua DeprecatedDropTargetCalendarTaskRow DeprecatedDraggableDropTargetCalendarTaskRow DeprecatedCalendarWeek-multiDayCalendarTaskRow"
															draggable="true"
															style="margin-left: -225px; width: calc(100% + 610px);">
															<div
																class="TaskCell TaskCell--hoverable TaskCell--showCompletionCheckbox TaskCell--colorAqua TaskCell--isCalendar DeprecatedCalendarTaskRow-taskCell">
																<div class="TaskCell-content">
																	<div
																		class="TaskRowCompletionStatus-checkbox--enabled TaskRowCompletionStatus-checkbox TaskRowCompletionStatus TaskCell-completionStatus"
																		role="checkbox" tabindex="0" aria-checked="false"
																		aria-disabled="false" aria-label="완료됨">
																		<svg
																			class="CompoundIcon--small CompoundIcon TaskCompletionCompoundIcon TaskCompletionStatusIndicator--incomplete TaskCompletionStatusIndicator TaskRowCompletionStatus-taskCompletionIcon--incomplete TaskRowCompletionStatus-taskCompletionIcon--incomplete--colorAqua TaskRowCompletionStatus-taskCompletionIcon"
																			viewBox="0 0 32 32" aria-hidden="true"
																			focusable="false">
																					<path
																				d="M31,16c0,8.3-6.7,15-15,15S1,24.3,1,16S7.7,1,16,1S31,7.7,31,16z"
																				class="CompoundIcon-outer"></path>
																					<path
																				d="M13.4,22.1c-0.3,0-0.5-0.1-0.7-0.3l-3.9-3.9c-0.4-0.4-0.4-1,0-1.4s1-0.4,1.4,0l3.1,3.1l8.1-8.1c0.4-0.4,1-0.4,1.4,0   s0.4,1,0,1.4l-8.9,8.9C13.9,22,13.7,22.1,13.4,22.1z"
																				class="CompoundIcon-inner"></path>
																				</svg>
																	</div>
																	<div class="TaskCell-assigneeContainer">
																		<span class="TaskCell-printableAssigneeName">장서연</span>
																		<div
																			class="DomainUserAvatar DomainUserAvatar--isDisabled TaskCell-avatar">
																			<div aria-hidden="true"
																				class="DomainUserAvatar-avatar Avatar AvatarPhoto AvatarPhoto--default AvatarPhoto--small AvatarPhoto--color7">장서</div>
																		</div>
																	</div>
																	<div class="TaskCell-nameAndSubtasksContainer">
																		<div
																			class="TaskCell-nameContainer TaskCell-nameContainer--showTwoLines">
																			<div class="TaskCell-name">코드블럭 기능 구현</div>
																		</div>
																	</div>
																	<div class="TaskCell-colorChipContainer">
																		<div
																			class="TaskCellColorChip TaskCellColorChip--colorBlueGreen"></div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div>
													<div class="ContextMenuTarget-contextMenuEventListener">
														<div
															class="DeprecatedCalendarTaskRow DeprecatedCalendarTaskRow--colorYellowOrange DeprecatedDropTargetCalendarTaskRow DeprecatedDraggableDropTargetCalendarTaskRow DeprecatedCalendarWeek-multiDayCalendarTaskRow"
															draggable="true"
															style="margin-left: -225px; width: calc(200% + 810px);">
															<div
																class="TaskCell TaskCell--hoverable TaskCell--showCompletionCheckbox TaskCell--colorYellowOrange TaskCell--isCalendar DeprecatedCalendarTaskRow-taskCell">
																<div class="TaskCell-content">
																	<div
																		class="TaskRowCompletionStatus-checkbox--enabled TaskRowCompletionStatus-checkbox TaskRowCompletionStatus TaskCell-completionStatus"
																		role="checkbox" tabindex="0" aria-checked="false"
																		aria-disabled="false" aria-label="완료됨">
																		<svg
																			class="CompoundIcon--small CompoundIcon TaskCompletionCompoundIcon TaskCompletionStatusIndicator--incomplete TaskCompletionStatusIndicator TaskRowCompletionStatus-taskCompletionIcon--incomplete TaskRowCompletionStatus-taskCompletionIcon--incomplete--colorYellowOrange TaskRowCompletionStatus-taskCompletionIcon"
																			viewBox="0 0 32 32" aria-hidden="true"
																			focusable="false">
																					<path
																				d="M31,16c0,8.3-6.7,15-15,15S1,24.3,1,16S7.7,1,16,1S31,7.7,31,16z"
																				class="CompoundIcon-outer"></path>
																			<path
																				d="M13.4,22.1c-0.3,0-0.5-0.1-0.7-0.3l-3.9-3.9c-0.4-0.4-0.4-1,0-1.4s1-0.4,1.4,0l3.1,3.1l8.1-8.1c0.4-0.4,1-0.4,1.4,0   s0.4,1,0,1.4l-8.9,8.9C13.9,22,13.7,22.1,13.4,22.1z"
																				class="CompoundIcon-inner"></path>
																				</svg>
																	</div>
																	<div class="TaskCell-assigneeContainer">
																		<span class="TaskCell-printableAssigneeName">장서연</span>
																		<div
																			class="DomainUserAvatar DomainUserAvatar--isDisabled TaskCell-avatar">
																			<div aria-hidden="true"
																				class="DomainUserAvatar-avatar Avatar AvatarPhoto AvatarPhoto--default AvatarPhoto--small AvatarPhoto--color7">장서</div>
																		</div>
																	</div>
																	<div class="TaskCell-nameAndSubtasksContainer">
																		<div
																			class="TaskCell-nameContainer TaskCell-nameContainer--showTwoLines">
																			<div class="TaskCell-name">워크스페이스 기능 구현</div>
																		</div>
																	</div>
																	<div class="TaskCell-colorChipContainer">
																		<div
																			class="TaskCellColorChip TaskCellColorChip--colorAqua"></div>
																		<div
																			class="TaskCellColorChip TaskCellColorChip--colorYellow"></div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div>
													<div class="ContextMenuTarget-contextMenuEventListener">
														<!-- 여기 style:calc 수정하기 -->
														<div
															class="DeprecatedCalendarTaskRow DeprecatedCalendarTaskRow--colorPurple DeprecatedDropTargetCalendarTaskRow DeprecatedDraggableDropTargetCalendarTaskRow DeprecatedCalendarWeek-multiDayCalendarTaskRow"
															draggable="true" style="width: calc(300% + 780px);">
															<div
																class="TaskCell TaskCell--hoverable TaskCell--showCompletionCheckbox TaskCell--colorPurple TaskCell--isCalendar DeprecatedCalendarTaskRow-taskCell">
																<div class="TaskCell-content">
																	<div
																		class="TaskRowCompletionStatus-checkbox--enabled TaskRowCompletionStatus-checkbox TaskRowCompletionStatus TaskCell-completionStatus"
																		role="checkbox" tabindex="0" aria-checked="false"
																		aria-disabled="false" aria-label="완료됨">
																		<svg
																			class="CompoundIcon--small CompoundIcon TaskCompletionCompoundIcon TaskCompletionStatusIndicator--incomplete TaskCompletionStatusIndicator TaskRowCompletionStatus-taskCompletionIcon--incomplete TaskRowCompletionStatus-taskCompletionIcon--incomplete--colorPurple TaskRowCompletionStatus-taskCompletionIcon"
																			viewBox="0 0 32 32" aria-hidden="true"
																			focusable="false">
																					<path
																				d="M31,16c0,8.3-6.7,15-15,15S1,24.3,1,16S7.7,1,16,1S31,7.7,31,16z"
																				class="CompoundIcon-outer"></path>
																					<path
																				d="M13.4,22.1c-0.3,0-0.5-0.1-0.7-0.3l-3.9-3.9c-0.4-0.4-0.4-1,0-1.4s1-0.4,1.4,0l3.1,3.1l8.1-8.1c0.4-0.4,1-0.4,1.4,0   s0.4,1,0,1.4l-8.9,8.9C13.9,22,13.7,22.1,13.4,22.1z"
																				class="CompoundIcon-inner"></path>
																				</svg>
																	</div>
																	<div class="TaskCell-nameAndSubtasksContainer">
																		<div
																			class="TaskCell-nameContainer TaskCell-nameContainer--showTwoLines">
																			<div class="TaskCell-name">풀캘린더 구현</div>
																		</div>
																	</div>
																	<div class="TaskCell-colorChipContainer">
																		<div
																			class="TaskCellColorChip TaskCellColorChip--colorAqua"></div>
																		<div
																			class="TaskCellColorChip TaskCellColorChip--colorRed"></div>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
											</div>
											<div class="DeprecatedCalendarDay-actions">
												<div class="DeprecatedCalendarDay-actions--left"></div>
												<div class="DeprecatedCalendarDay-actions--right"></div>
											</div>
										</div>
									</td>
									<td>
										<div
											class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
											<div class="DeprecatedCalendarDay-dayHeader m00">
												<span class="DeprecatedCalendarDay-date">10</span> <span
													class="DeprecatedCalendarDay-headerLabel"></span>
											</div>
											<div class="DeprecatedCalendarDay-tasks">
												<div class="DeprecatedCalendarWeek-taskPlaceholder"></div>
												<div class="DeprecatedCalendarWeek-taskPlaceholder"></div>
												<div class="DeprecatedCalendarWeek-taskPlaceholder"></div>
											</div>
											<div class="DeprecatedCalendarDay-actions">
												<div class="DeprecatedCalendarDay-actions--left"></div>
												<div class="DeprecatedCalendarDay-actions--right"></div>
											</div>
										</div>
									</td>
									<td>
										<div
											class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
											<div class="DeprecatedCalendarDay-dayHeader m00">
												<span class="DeprecatedCalendarDay-date">11</span> <span
													class="DeprecatedCalendarDay-headerLabel"></span>
											</div>
											<div class="DeprecatedCalendarDay-tasks">
												<div class="DeprecatedCalendarWeek-taskPlaceholder"></div>
												<div class="DeprecatedCalendarWeek-taskPlaceholder"></div>
												<div class="DeprecatedCalendarWeek-taskPlaceholder"></div>
											</div>
											<div class="DeprecatedCalendarDay-actions">
												<div class="DeprecatedCalendarDay-actions--left"></div>
												<div class="DeprecatedCalendarDay-actions--right"></div>
											</div>
										</div>
									</td>
									<td>
										<div
											class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
											<div class="DeprecatedCalendarDay-dayHeader m00">
												<span class="DeprecatedCalendarDay-date">12</span> <span
													class="DeprecatedCalendarDay-headerLabel"></span>
											</div>
											<div class="DeprecatedCalendarDay-tasks"></div>
											<div class="DeprecatedCalendarDay-actions">
												<div class="DeprecatedCalendarDay-actions--left"></div>
												<div class="DeprecatedCalendarDay-actions--right"></div>
											</div>
										</div>
									</td>
									<td>
										<div
											class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
											<div class="DeprecatedCalendarDay-dayHeader m00">
												<span class="DeprecatedCalendarDay-date">13</span> <span
													class="DeprecatedCalendarDay-headerLabel"></span>
											</div>
											<div class="DeprecatedCalendarDay-tasks"></div>
											<div class="DeprecatedCalendarDay-actions">
												<div class="DeprecatedCalendarDay-actions--left"></div>
												<div class="DeprecatedCalendarDay-actions--right"></div>
											</div>
										</div>
									</td>
									<td>
										<div
											class="DeprecatedCalendarDay DeprecatedCalendarDay--compact DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
											<div class="DeprecatedCalendarDay-dayHeader m00">
												<span class="DeprecatedCalendarDay-date">14</span> <span
													class="DeprecatedCalendarDay-headerLabel"></span>
											</div>
											<div class="DeprecatedCalendarDay-actions">
												<div class="DeprecatedCalendarDay-actions--left"></div>
												<div class="DeprecatedCalendarDay-actions--right"></div>
											</div>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
				</div>
				<!-- 주간캘린더 끝 -->
				<!-- 메인 코드차트 시작 -->
				<div class="main_contents mb20">
					<div class="main_space mb00">
						<div class="main_chart">
							<table>
								<colgroup>
									<col width="14.2%" />
									<col width="14.2%" />
									<col width="14.2%" />
									<col width="14.2%" />
									<col width="14.2%" />
									<col width="14.2%" />
									<col width="14.2%" />
								</colgroup>
								<tr>
									<th>MON</th>
									<th>TUES</th>
									<th>WED</th>
									<th>THU</th>
									<th>FRI</th>
									<th>SAT</th>
									<th>SUN</th>
								</tr>
	<%for (int i = 0; i < 4; i++) {%>
	<tr>
		<td><%if (mon.size() >= i + 1) {%><span class="purple"></span><%=mon.get(i)%><%}%></td>
		
		<td><%if (tues.size() >= i + 1) {%><span class="pink"></span><%=tues.get(i)%><%}%></td>
		
		<td><%if (wed.size() >= i + 1) {%><span class="orange"></span><%=wed.get(i)%><%}%></td>
		
		<td><%if (thu.size() >= i + 1) {%><span class="light_orange"></span><%=thu.get(i)%><%}%></td>
		
		<td><%if (fri.size() >= i + 1) {%><span class="light_green"></span><%=fri.get(i)%><%}%></td>
		
		<td><%if (sat.size() >= i + 1) {%><span class="green"></span><%=sat.get(i)%><%}%></td>
		
		<td><%if (sun.size() >= i + 1) {%><span class="blue"></span><%=sun.get(i)%><%}%></td>
	</tr>
	<% }%>
							</table>
						</div>
						<div class="workspace file_upload">
							<p>Drop your file(s) here</p>
						</div>
					</div>
				</div>
				<!-- //메인코드차트 끝 -->
			</section>
		</div>

		<!-- One -->
		<section id="workspace" class="wrapper style2 spotlights">
			<div id="wrapper">
				<div class="fixed inset-x-0 top-0 z-9999">
					<div class="bg-brand-500" style="width: 0%; height: 0"></div>
				</div>
				<!--$-->
				<div class="flex flex-col min-h-screen">

					<!-- 헤더 -->
					<main class="mx-auto w-full grow flex flex-col max-w-screen">
						<div class="flex grow flex-col">
							<div class="relative grow">
								<div class="absolute inset-0 overflow-auto bg-gray-50">
									<!-- 워크스페이스 상단 -->
									<div class="work_header">
										<div class="work_headerWrap">
											<ul>
												<li class="active"><a href="">메세지목록</a></li>
												<li class=""><a href="">메세지보드</a></li>
											</ul>
										</div>
									</div>
									<!-- 워크스페이스 상단 끝 -->
									<div class="workspace_contents">
										<di class="flex gap-8" data-rfd-droppable-id="root"
											data-rfd-context-id=":rs:">

										<section class="w25">
											<div class="flex items-center gap-2">
												<div class="font-medium">요청</div>
												<span class="self-end text-sm text-gray-400"> <!-- 요청 num 들어가는 곳 -->
												</span>
											</div>
											<div data-rfd-droppable-id="group-unspecified"
												data-rfd-droppable-context-id=":rs:"
												class="mt-2 flex flex-col gap-2">
												<div
													class="both-center h-85px w-full flex select-none border-2 rounded border-dashed text-sm text-gray-300">
													도착한 요청이 없습니다</div>
											</div>
											<div></div>
										</section>

										<section class="w25" data-rfd-draggable-context-id=":rs:"
											data-rfd-draggable-id="RGlyZWN0TWVzc2FnZVJvb21Hcm91cDpjbGJ1Zzh2b3IwMGR5Y3QwMWNpZXNmczNv">
											<div class="flex items-center gap-2">
												<div class="font-medium" tabindex="0" role="button"
													aria-describedby="rfd-hidden-text-:rs:-hidden-text-:rt:"
													data-rfd-drag-handle-draggable-id="RGlyZWN0TWVzc2FnZVJvb21Hcm91cDpjbGJ1Zzh2b3IwMGR5Y3QwMWNpZXNmczNv"
													data-rfd-drag-handle-context-id=":rs:" draggable="false">
													<div>계획 중</div>
												</div>
												<span class="self-end text-sm text-gray-400">(0)</span>
												<div class="grow"></div>
												<div class="relative" data-headlessui-state="">
													<button
														class="flex h-6 w-6 items-center justify-center rounded transition"
														id="headlessui-menu-button-:r11:" type="button"
														aria-haspopup="menu" aria-expanded="false"
														data-headlessui-state="">
														<i class="fa-solid fa-circle-plus plus_bg"></i>
													</button>
												</div>
											</div>
											<div class="mt-2 flex flex-col gap-2"
												data-rfd-droppable-id="RGlyZWN0TWVzc2FnZVJvb21Hcm91cDpjbGJ1Zzh2b3IwMGR5Y3QwMWNpZXNmczNv"
												data-rfd-droppable-context-id=":rs:">
												<div
													class="both-center h-85px w-full flex border-2 rounded border-dashed text-sm text-gray-300">
													메시지를 끌어다 놓아보세요!</div>
												<div></div>
											</div>
										</section>

										<section class="w25" data-rfd-draggable-context-id=":rs:"
											data-rfd-draggable-id="RGlyZWN0TWVzc2FnZVJvb21Hcm91cDpjbGJ1Zzh2b3IwMGR5Y3QwMWNpZXNmczNv">
											<div class="flex items-center gap-2">
												<div class="font-medium" tabindex="0" role="button"
													aria-describedby="rfd-hidden-text-:rs:-hidden-text-:rt:"
													data-rfd-drag-handle-draggable-id="RGlyZWN0TWVzc2FnZVJvb21Hcm91cDpjbGJ1Zzh2b3IwMGR5Y3QwMWNpZXNmczNv"
													data-rfd-drag-handle-context-id=":rs:" draggable="false">
													<div>진행 중</div>
												</div>
												<span class="self-end text-sm text-gray-400">(0)</span>
												<div class="grow"></div>
												<div class="relative" data-headlessui-state="">
													<button
														class="flex h-6 w-6 items-center justify-center rounded transition"
														id="headlessui-menu-button-:r11:" type="button"
														aria-haspopup="menu" aria-expanded="false"
														data-headlessui-state="">
														<i class="fa-solid fa-circle-plus"></i>
													</button>
												</div>
											</div>
											<div class="mt-2 flex flex-col gap-2"
												data-rfd-droppable-id="RGlyZWN0TWVzc2FnZVJvb21Hcm91cDpjbGJ1Zzh2b3IwMGR5Y3QwMWNpZXNmczNv"
												data-rfd-droppable-context-id=":rs:">
												<div
													class="both-center h-85px w-full flex border-2 rounded border-dashed text-sm text-gray-300">
													메시지를 끌어다 놓아보세요!</div>
												<div></div>
											</div>
										</section>

										<section class="w25" data-rfd-draggable-context-id=":rs:"
											data-rfd-draggable-id="RGlyZWN0TWVzc2FnZVJvb21Hcm91cDpjbGJ1Zzh2b3IwMGR5Y3QwMWNpZXNmczNv">
											<div class="flex items-center gap-2">
												<div class="font-medium" tabindex="0" role="button"
													aria-describedby="rfd-hidden-text-:rs:-hidden-text-:rt:"
													data-rfd-drag-handle-draggable-id="RGlyZWN0TWVzc2FnZVJvb21Hcm91cDpjbGJ1Zzh2b3IwMGR5Y3QwMWNpZXNmczNv"
													data-rfd-drag-handle-context-id=":rs:" draggable="false">
													<div>완료</div>
												</div>
												<span class="self-end text-sm text-gray-400">(0)</span>
												<div class="grow"></div>
												<div class="relative" data-headlessui-state=""></div>
											</div>
											<div class="mt-2 flex flex-col gap-2"
												data-rfd-droppable-id="RGlyZWN0TWVzc2FnZVJvb21Hcm91cDpjbGJ1Zzh2b3IwMGR5Y3QwMWNpZXNmczNv"
												data-rfd-droppable-context-id=":rs:">
												<div
													class="both-center h-85px w-full flex border-2 rounded border-dashed text-sm text-gray-300">
													메시지를 끌어다 놓아보세요!</div>
												<div></div>
											</div>
										</section>
									</div>
								</div>
							</div>
						</div>
				</div>
				</main>
			</div>
		</section>
		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.scrollex.min.js"></script>
		<script src="assets/js/jquery.scrolly.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>

		<!-- login 스크립트 -->
		<script src="http://code.jquery.com/jquery-latest.js"></script>
		<script>
			function onDisplay(){
				$('#noneDiv').show();
			}
			function offDisplay(){
				$('#noneDiv').hide();
			}
		
			function dialog() {

			var dialogBox = $('.dialog'),
				dialogTrigger = $('.dialog__trigger'),
				dialogSignup = $('.dialog__signup'),
				dialogLogin = $('.dialog__login'),
				dialogClose = $('.dialog__close');

			// Open the dialog
			dialogTrigger.on('click', function(e) {
				dialogBox.toggleClass('dialog--active');
				e.stopPropagation()
			});


			// Close the dialog - click close button
			dialogClose.on('click', function() {
				dialogBox.removeClass('dialog--active');
			});

			// Close the dialog - press escape key // key#27
			$(document).keyup(function(e) {
				if (e.keyCode === 27) {
				dialogBox.removeClass('dialog--active');
				}
			});

			// Close dialog - click outside
			$(document).on("click", function(e) {
				if ($(e.target).is(dialogBox) === false &&
				$(e.target).is(dialogTitle) === false &&
				$(e.target).is(dialogSignup) === false &&
				$(e.target).is(dialogLogin) === false) {
				dialogBox.removeClass("dialog--active");
				}
			});

			};

			// Run function when the document has loaded
			$(function() {
			dialog();
			});
		</script>
		<script>
			console.clear();

		const loginBtn = document.getElementById('login');
		const signupBtn = document.getElementById('signup');

		loginBtn.addEventListener('click', (e) => {
		let parent = e.target.parentNode.parentNode;
		Array.from(e.target.parentNode.parentNode.classList).find((element) => {
			if(element !== "slide-up") {
			parent.classList.add('slide-up')
			}else{
			signupBtn.parentNode.classList.add('slide-up')
			parent.classList.remove('slide-up')
			}
		});
		});

		signupBtn.addEventListener('click', (e) => {
		let parent = e.target.parentNode;
		Array.from(e.target.parentNode.classList).find((element) => {
			if(element !== "slide-up") {
			parent.classList.add('slide-up')
			}else{
			loginBtn.parentNode.parentNode.classList.add('slide-up')
			parent.classList.remove('slide-up')
			}
		});
		});
		</script>
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