<%@page import="java.util.Locale"%>
<%@page import="java.util.Calendar"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="com.smhrd.model.BoardDAO1"%>
<%@page import="com.smhrd.model.BoardVO"%>
<%@page import="com.smhrd.model.DAO"%>
<%@page import="com.smhrd.model.VO"%>
<%@page import="java.util.List"%>
<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Hyperspace by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
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

<!-- 코드차트 css 추가 -->
<link rel="stylesheet" href="assets/css/codechartstyle.css">
<link rel="stylesheet" href="assets/css/codechartsvg.css">


<script src="https://kit.fontawesome.com/481f0bd49e.js"
	crossorigin="anonymous"></script>

<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>
</head>
<body class="is-preload">
	<%
	MemberVO loginMember = (MemberVO) session.getAttribute("loginMember"); // 로그인시 왼쪽 보여지기위해 로그인 user 정보 가져옴
	List<VO> list = new DAO().selectList();								   // T_code selectAll
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
							%><span id="lojo" onclick="onDisplay()">로그인/회원가입</span>

							<%
							} else {
							%><%=loginMember.getM_name()%><br> <a
								href="logoutCon">로그아웃</a><br> <span><a
								href="update.jsp">회원정보수정</a></span>
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
					<li><a href="index.jsp" class="border_b">Main</a></li>
					<li><a href="#one" class="border_b">My Space</a>
						<ul class="work_list">
							<li><a href="workspace.jsp" class="list_menu">My
									Workspace</a></li>
							<li><a href="calendar.jsp" class="list_menu">나의 캘린더</a></li>
							<li><a href="codeCon" class="list_menu active">나의 코드블럭</a></li>
						</ul></li>
					<li><a href="" class="border_b">Project Name</a>
						<ul class="work_list">
							<li><a href="Team_workspace.jsp" class="list_menu">Team
									Workspace</a></li>
							<li><a href="Team_calendar.jsp" class="list_menu">프로젝트1
									캘린더</a></li>
						</ul></li>
				</ul>
			</nav>
		</div>
	</section>

	<!-- Wrapper -->
	<div id="wrapper">
		<div class="mainWrap">
			<!-- 폴더리스트 시작 -->
			<div class="code_folder">
				<ul>
					<li>
						<div class="folder01">
							<div class="folderCon">
								<svg aria-hidden="true" height="16" viewBox="0 0 16 16"
									version="1.1" width="16" data-view-component="true"
									class="octicon">
											<path fill-rule="evenodd"
										d="M2 2.5A2.5 2.5 0 014.5 0h8.75a.75.75 0 01.75.75v12.5a.75.75 0 01-.75.75h-2.5a.75.75 0 110-1.5h1.75v-2h-8a1 1 0 00-.714 1.7.75.75 0 01-1.072 1.05A2.495 2.495 0 012 11.5v-9zm10.5-1V9h-8c-.356 0-.694.074-1 .208V2.5a1 1 0 011-1h8zM5 12.25v3.25a.25.25 0 00.4.2l1.45-1.087a.25.25 0 01.3 0L8.6 15.7a.25.25 0 00.4-.2v-3.25a.25.25 0 00-.25-.25h-3.5a.25.25 0 00-.25.25z"></path>
										</svg>
								<a href="">2023-01-13</a>
							</div>
							<div class="code_on">
								<p>on</p>
							</div>
						</div>
					</li>
					<li>
						<div class="folder01">
							<div class="folderCon">
								<svg aria-hidden="true" height="16" viewBox="0 0 16 16"
									version="1.1" width="16" data-view-component="true"
									class="octicon">
											<path fill-rule="evenodd"
										d="M2 2.5A2.5 2.5 0 014.5 0h8.75a.75.75 0 01.75.75v12.5a.75.75 0 01-.75.75h-2.5a.75.75 0 110-1.5h1.75v-2h-8a1 1 0 00-.714 1.7.75.75 0 01-1.072 1.05A2.495 2.495 0 012 11.5v-9zm10.5-1V9h-8c-.356 0-.694.074-1 .208V2.5a1 1 0 011-1h8zM5 12.25v3.25a.25.25 0 00.4.2l1.45-1.087a.25.25 0 01.3 0L8.6 15.7a.25.25 0 00.4-.2v-3.25a.25.25 0 00-.25-.25h-3.5a.25.25 0 00-.25.25z"></path>
										</svg>
								<a href="">2023-01-14</a>
							</div>
							<div class="code_on">
								<p>on</p>
							</div>
						</div>
					</li>
					<li>
						<div class="folder01">
							<div class="folderCon">
								<svg aria-hidden="true" height="16" viewBox="0 0 16 16"
									version="1.1" width="16" data-view-component="true"
									class="octicon">
											<path fill-rule="evenodd"
										d="M2 2.5A2.5 2.5 0 014.5 0h8.75a.75.75 0 01.75.75v12.5a.75.75 0 01-.75.75h-2.5a.75.75 0 110-1.5h1.75v-2h-8a1 1 0 00-.714 1.7.75.75 0 01-1.072 1.05A2.495 2.495 0 012 11.5v-9zm10.5-1V9h-8c-.356 0-.694.074-1 .208V2.5a1 1 0 011-1h8zM5 12.25v3.25a.25.25 0 00.4.2l1.45-1.087a.25.25 0 01.3 0L8.6 15.7a.25.25 0 00.4-.2v-3.25a.25.25 0 00-.25-.25h-3.5a.25.25 0 00-.25.25z"></path>
										</svg>
								<a href="">2023-01-15</a>
							</div>
							<div class="code_on">
								<p>on</p>
							</div>
						</div>
					</li>
					<li>
						<div class="folder01">
							<div class="folderCon">
								<svg aria-hidden="true" height="16" viewBox="0 0 16 16"
									version="1.1" width="16" data-view-component="true"
									class="octicon">
											<path fill-rule="evenodd"
										d="M2 2.5A2.5 2.5 0 014.5 0h8.75a.75.75 0 01.75.75v12.5a.75.75 0 01-.75.75h-2.5a.75.75 0 110-1.5h1.75v-2h-8a1 1 0 00-.714 1.7.75.75 0 01-1.072 1.05A2.495 2.495 0 012 11.5v-9zm10.5-1V9h-8c-.356 0-.694.074-1 .208V2.5a1 1 0 011-1h8zM5 12.25v3.25a.25.25 0 00.4.2l1.45-1.087a.25.25 0 01.3 0L8.6 15.7a.25.25 0 00.4-.2v-3.25a.25.25 0 00-.25-.25h-3.5a.25.25 0 00-.25.25z"></path>
										</svg>
								<a href="">2023-01-16</a>
							</div>
							<div class="code_on">
								<p>on</p>
							</div>
						</div>
					</li>
				</ul>
				<ul class="pt10">
					<li>
						<div class="folder01">
							<div class="folderCon">
								<svg aria-hidden="true" height="16" viewBox="0 0 16 16"
									version="1.1" width="16" data-view-component="true"
									class="octicon">
											<path fill-rule="evenodd"
										d="M2 2.5A2.5 2.5 0 014.5 0h8.75a.75.75 0 01.75.75v12.5a.75.75 0 01-.75.75h-2.5a.75.75 0 110-1.5h1.75v-2h-8a1 1 0 00-.714 1.7.75.75 0 01-1.072 1.05A2.495 2.495 0 012 11.5v-9zm10.5-1V9h-8c-.356 0-.694.074-1 .208V2.5a1 1 0 011-1h8zM5 12.25v3.25a.25.25 0 00.4.2l1.45-1.087a.25.25 0 01.3 0L8.6 15.7a.25.25 0 00.4-.2v-3.25a.25.25 0 00-.25-.25h-3.5a.25.25 0 00-.25.25z"></path>
										</svg>
								<a href="">2023-01-17</a>
							</div>
							<div class="code_on">
								<p>on</p>
							</div>
						</div>
					</li>
					<li>
						<div class="folder01">
							<div class="folderCon">
								<svg aria-hidden="true" height="16" viewBox="0 0 16 16"
									version="1.1" width="16" data-view-component="true"
									class="octicon">
											<path fill-rule="evenodd"
										d="M2 2.5A2.5 2.5 0 014.5 0h8.75a.75.75 0 01.75.75v12.5a.75.75 0 01-.75.75h-2.5a.75.75 0 110-1.5h1.75v-2h-8a1 1 0 00-.714 1.7.75.75 0 01-1.072 1.05A2.495 2.495 0 012 11.5v-9zm10.5-1V9h-8c-.356 0-.694.074-1 .208V2.5a1 1 0 011-1h8zM5 12.25v3.25a.25.25 0 00.4.2l1.45-1.087a.25.25 0 01.3 0L8.6 15.7a.25.25 0 00.4-.2v-3.25a.25.25 0 00-.25-.25h-3.5a.25.25 0 00-.25.25z"></path>
										</svg>
								<a href="">2023-01-18</a>
							</div>
							<div class="">
								<p>on</p>
							</div>
						</div>
					</li>
					<li>
						<div class="folder01">
							<div class="folderCon">
								<svg aria-hidden="true" height="16" viewBox="0 0 16 16"
									version="1.1" width="16" data-view-component="true"
									class="octicon">
											<path fill-rule="evenodd"
										d="M2 2.5A2.5 2.5 0 014.5 0h8.75a.75.75 0 01.75.75v12.5a.75.75 0 01-.75.75h-2.5a.75.75 0 110-1.5h1.75v-2h-8a1 1 0 00-.714 1.7.75.75 0 01-1.072 1.05A2.495 2.495 0 012 11.5v-9zm10.5-1V9h-8c-.356 0-.694.074-1 .208V2.5a1 1 0 011-1h8zM5 12.25v3.25a.25.25 0 00.4.2l1.45-1.087a.25.25 0 01.3 0L8.6 15.7a.25.25 0 00.4-.2v-3.25a.25.25 0 00-.25-.25h-3.5a.25.25 0 00-.25.25z"></path>
										</svg>
								<a href="">2023-01-19</a>
							</div>
							<div class="">
								<p>on</p>
							</div>
						</div>
					</li>
					<li>
						<div class="folder01">
							<div class="folderCon">
								<svg aria-hidden="true" height="16" viewBox="0 0 16 16"
									version="1.1" width="16" data-view-component="true"
									class="octicon">
											<path fill-rule="evenodd"
										d="M2 2.5A2.5 2.5 0 014.5 0h8.75a.75.75 0 01.75.75v12.5a.75.75 0 01-.75.75h-2.5a.75.75 0 110-1.5h1.75v-2h-8a1 1 0 00-.714 1.7.75.75 0 01-1.072 1.05A2.495 2.495 0 012 11.5v-9zm10.5-1V9h-8c-.356 0-.694.074-1 .208V2.5a1 1 0 011-1h8zM5 12.25v3.25a.25.25 0 00.4.2l1.45-1.087a.25.25 0 01.3 0L8.6 15.7a.25.25 0 00.4-.2v-3.25a.25.25 0 00-.25-.25h-3.5a.25.25 0 00-.25.25z"></path>
										</svg>
								<a href="">2023-01-20</a>
							</div>
							<div class="">
								<p>on</p>
							</div>
						</div>
					</li>
				</ul>
				<ul class="pt10">
					<li>
						<div class="folder01">
							<div class="folderCon">
								<svg aria-hidden="true" height="16" viewBox="0 0 16 16"
									version="1.1" width="16" data-view-component="true"
									class="octicon">
											<path fill-rule="evenodd"
										d="M2 2.5A2.5 2.5 0 014.5 0h8.75a.75.75 0 01.75.75v12.5a.75.75 0 01-.75.75h-2.5a.75.75 0 110-1.5h1.75v-2h-8a1 1 0 00-.714 1.7.75.75 0 01-1.072 1.05A2.495 2.495 0 012 11.5v-9zm10.5-1V9h-8c-.356 0-.694.074-1 .208V2.5a1 1 0 011-1h8zM5 12.25v3.25a.25.25 0 00.4.2l1.45-1.087a.25.25 0 01.3 0L8.6 15.7a.25.25 0 00.4-.2v-3.25a.25.25 0 00-.25-.25h-3.5a.25.25 0 00-.25.25z"></path>
										</svg>
								<a href="">2023-01-21</a>
							</div>
							<div class="">
								<p>on</p>
							</div>
						</div>
					</li>
					<li>
						<div class="folder01">
							<div class="folderCon">
								<svg aria-hidden="true" height="16" viewBox="0 0 16 16"
									version="1.1" width="16" data-view-component="true"
									class="octicon">
											<path fill-rule="evenodd"
										d="M2 2.5A2.5 2.5 0 014.5 0h8.75a.75.75 0 01.75.75v12.5a.75.75 0 01-.75.75h-2.5a.75.75 0 110-1.5h1.75v-2h-8a1 1 0 00-.714 1.7.75.75 0 01-1.072 1.05A2.495 2.495 0 012 11.5v-9zm10.5-1V9h-8c-.356 0-.694.074-1 .208V2.5a1 1 0 011-1h8zM5 12.25v3.25a.25.25 0 00.4.2l1.45-1.087a.25.25 0 01.3 0L8.6 15.7a.25.25 0 00.4-.2v-3.25a.25.25 0 00-.25-.25h-3.5a.25.25 0 00-.25.25z"></path>
										</svg>
								<a href="">2023-01-22</a>
							</div>
							<div class="">
								<p>on</p>
							</div>
						</div>
					</li>
					<li>
						<div class="folder01">
							<div class="folderCon">
								<svg aria-hidden="true" height="16" viewBox="0 0 16 16"
									version="1.1" width="16" data-view-component="true"
									class="octicon">
											<path fill-rule="evenodd"
										d="M2 2.5A2.5 2.5 0 014.5 0h8.75a.75.75 0 01.75.75v12.5a.75.75 0 01-.75.75h-2.5a.75.75 0 110-1.5h1.75v-2h-8a1 1 0 00-.714 1.7.75.75 0 01-1.072 1.05A2.495 2.495 0 012 11.5v-9zm10.5-1V9h-8c-.356 0-.694.074-1 .208V2.5a1 1 0 011-1h8zM5 12.25v3.25a.25.25 0 00.4.2l1.45-1.087a.25.25 0 01.3 0L8.6 15.7a.25.25 0 00.4-.2v-3.25a.25.25 0 00-.25-.25h-3.5a.25.25 0 00-.25.25z"></path>
										</svg>
								<a href="">2023-01-23</a>
							</div>
							<div class="">
								<p>on</p>
							</div>
						</div>
					</li>
					<li>
						<div class="folder01">
							<div class="folderCon">
								<svg aria-hidden="true" height="16" viewBox="0 0 16 16"
									version="1.1" width="16" data-view-component="true"
									class="octicon">
											<path fill-rule="evenodd"
										d="M2 2.5A2.5 2.5 0 014.5 0h8.75a.75.75 0 01.75.75v12.5a.75.75 0 01-.75.75h-2.5a.75.75 0 110-1.5h1.75v-2h-8a1 1 0 00-.714 1.7.75.75 0 01-1.072 1.05A2.495 2.495 0 012 11.5v-9zm10.5-1V9h-8c-.356 0-.694.074-1 .208V2.5a1 1 0 011-1h8zM5 12.25v3.25a.25.25 0 00.4.2l1.45-1.087a.25.25 0 01.3 0L8.6 15.7a.25.25 0 00.4-.2v-3.25a.25.25 0 00-.25-.25h-3.5a.25.25 0 00-.25.25z"></path>
										</svg>
								<a href="">2023-01-24</a>
							</div>
							<div class="">
								<p>on</p>
							</div>
						</div>
					</li>
				</ul>
			</div>
			<!-- //폴더리스트 끝 -->
			<!-- 코드차트 캘린더 시작 -->
			<div class="calendar">
				<div class="position-relative">
					<div class="border graph-before-activity-overview pd115">
						<div
							class="js-calendar-graph mx-md-2 mx-3 d-flex flex-column flex-items-end flex-xl-items-center overflow-hidden pt-1 is-graph-loading graph-canvas ContributionCalendar height-full text-center"
							data-graph-url="/users/your-username/contributions"
							data-url="/your-username" data-from="2022-01-02 00:00:00 UTC"
							data-to="2023-01-06 23:59:59 UTC" data-org="">
							<svg class="js-calendar-graph-svg w100 height200">
										<g transform="translate(15, 20)"
									data-hydro-click="{&quot;event_type&quot;:&quot;user_profile.click&quot;,&quot;payload&quot;:{&quot;profile_user_id&quot;:120652126,&quot;target&quot;:&quot;CONTRIBUTION_CALENDAR_SQUARE&quot;,&quot;user_id&quot;:120652126,&quot;originating_url&quot;:&quot;https://github.com/users/ksw110/contributions?from=2023-01-01&amp;to=2023-01-11&quot;}}"
									data-hydro-click-hmac="9f26ce9d821b8a259a3c19f14771c746d1e894ec2c23b827a47d237dfb96c1e3">
											<%
											int t = 0;
											int x = 30;
											int y = 0;
											int ax = 650;
											int kk = 0;
											int sum = 0;
											for (int i = 0; i < 48; i++) {
											%>
												<g transform="translate(<%=t%>, 0)">
													<%
													for (int k = 0; k < 7; k++) {
														if (list.get(kk).getCount() > 0) {
															sum += 1;
														}
													%>
													<rect width="25" height="25" x="<%=x%>" y="<%=y%>"
									class="ContributionCalendar-day" data-date="2023-01-01"
									data-level="<%if (list.get(kk).getCount() > 4) {%>4<%} else {%><%=list.get(kk).getCount()%><%}%>"
									rx="2" ry="2"></rect>
																	<text class="arrow_box" x="<%=ax%>" y="230"><%=list.get(kk).getCount()%> contributions <%=list.get(kk).getCodedate().substring(0, 10)%> </text>
													<%
													y += 30;
													kk += 1;
													}
													%>
													
											</g>
											<%
											t += 30;
											x -= 1;
											ax -= 30;
											y = 0;
											}
											%>
						
											<text x="30" y="-8" class="ContributionCalendar-label">Jan</text>
											<text x="147" y="-8" class="ContributionCalendar-label">Feb</text>
											<text x="265" y="-8" class="ContributionCalendar-label">Mar</text>
											<text x="380" y="-8" class="ContributionCalendar-label">Apr</text>
											<text x="500" y="-8" class="ContributionCalendar-label">May</text>
											<text x="610" y="-8" class="ContributionCalendar-label">Jun</text>
											<text x="728" y="-8" class="ContributionCalendar-label">Jul</text>
											<text x="845" y="-8" class="ContributionCalendar-label">Aug</text>
											<text x="960" y="-8" class="ContributionCalendar-label">Sep</text>
											<text x="1076" y="-8" class="ContributionCalendar-label">Oct</text>
											<text x="1190" y="-8" class="ContributionCalendar-label">Nov</text>
											<text x="1305" y="-8" class="ContributionCalendar-label">Dec</text>
									
											<text text-anchor="start" class="ContributionCalendar-label"
									dx="-15" dy="15" style="padding-right: 10px;">Sun</text>
											<text text-anchor="start" class="ContributionCalendar-label"
									dx="-15" dy="47">Mon</text>
											<text text-anchor="start" class="ContributionCalendar-label"
									dx="-15" dy="78">Tue</text>
											<text text-anchor="start" class="ContributionCalendar-label"
									dx="-15" dy="107">Wed</text>
											<text text-anchor="start" class="ContributionCalendar-label"
									dx="-15" dy="137">Thu</text>
											<text text-anchor="start" class="ContributionCalendar-label"
									dx="-15" dy="167">Fri</text>
											<text text-anchor="start" class="ContributionCalendar-label"
									dx="-15" dy="197">Sat</text>
										</g> 
									</svg>
							<div class="width-full f6 px-0 px-md-5 py-1">
								<div class="float-left"></div>
								<div class="float-right color-fg-muted fontColor">
									Less
									<svg width="15" height="15" class="d-inline-block">
												<rect width="15" height="15"
											class="ContributionCalendar-day" data-level="0" rx="2" ry="2"></rect>
											</svg>
									<svg width="15" height="15" class="d-inline-block">
												<rect width="15" height="15"
											class="ContributionCalendar-day" data-level="1" rx="2" ry="2"></rect>
											</svg>
									<svg width="15" height="15" class="d-inline-block">
												<rect width="15" height="15"
											class="ContributionCalendar-day" data-level="2" rx="2" ry="2"></rect>
											</svg>
									<svg width="15" height="15" class="d-inline-block">
												<rect width="15" height="15"
											class="ContributionCalendar-day" data-level="3" rx="2" ry="2"></rect>
											</svg>
									<svg width="15" height="15" class="d-inline-block">
												<rect width="15" height="15"
											class="ContributionCalendar-day" data-level="4" rx="2" ry="2"></rect>
											</svg>
									More
								</div>
							</div>
						</div>
					</div>
				</div>
				<div class="contrib-column contrib-column-first table-column">
					<span class="text-muted txt_color">Contributions in the this
						year</span> <span class="contrib-number txt_color"><%=sum%> total</span>
					<span class="text-muted txt_color">Jan 1, 2022 – Dec 31,
						2023</span>
				</div>

			</div>
			<!-- //코드차트 캘린더 끝 -->
			<!-- 메인 코드차트 시작 -->
			<div class="chart_contents">
				<div class="code_chart_filename">
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

						<%
						for (int i = 0; i < 4; i++) {
						%>
						<tr>

							<%
							if (mon.size() >= i + 1) {
							%><td><span class="purple"></span><%=mon.get(i)%></td>
							<%
							}if (tues.size() >= i + 1) {
								%><td><span class="pink"></span><%=tues.get(i)%></td>
							<%
							}if (wed.size() >= i + 1) {
								%><td><span class="orange"></span><%=wed.get(i)%></td>
							<%
							}if (thu.size() >= i + 1) {
								%><td><span class="light_orange"></span><%=thu.get(i)%></td>
							<%
							}if (fri.size() >= i + 1) {
								%><td><span class="light_green"></span><%=fri.get(i)%></td>
							<%
							}if (sat.size() >= i + 1) {
								%><td><span class="green"></span><%=sat.get(i)%></td>
							<%
							}if (sun.size() >= i + 1) {
								%><td><span class="blue"></span><%=sun.get(i)%></td>
							<%
							}
							%>
						</tr>
						<% }%>
						
						

					</table>
				</div>
			</div>
			<!-- //메인코드차트 끝 -->
		</div>
	</div>
</body>
</html>