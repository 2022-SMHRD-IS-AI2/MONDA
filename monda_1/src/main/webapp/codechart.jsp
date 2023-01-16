<%@page import="com.smhrd.model.DAO"%>
<%@page import="com.smhrd.model.VO"%>
<%@page import="java.util.List"%>
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
<link rel="stylesheet" href="assets/css/codechartstyle.css">
<link rel="stylesheet" href="assets/css/codechartsvg.css">
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
	List<VO> list = new DAO().selectList();
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
						src="./images/<%if (loginMember == null) {%>profile_img.png<%} else {%><%=loginMember.getM_profile_img()%><%}%>" /></a>
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
							<li><a href="codeCon" class="list_menu active">나의
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
	            <div class="bag fixed">
            <h1>캘린더!!!</h1>
            <div class="calendar">
<div class="position-relative">

<div class="border py-2 graph-before-activity-overview">
<div class="js-calendar-graph mx-md-2 mx-3 d-flex flex-column flex-items-end flex-xl-items-center overflow-hidden pt-1 is-graph-loading graph-canvas ContributionCalendar height-full text-center" data-graph-url="/users/your-username/contributions" data-url="/your-username" data-from="2022-01-02 00:00:00 UTC" data-to="2023-01-06 23:59:59 UTC" data-org="">
<svg width="850" height="135" class="js-calendar-graph-svg">
    <g transform="translate(15, 20)" data-hydro-click="{&quot;event_type&quot;:&quot;user_profile.click&quot;,&quot;payload&quot;:{&quot;profile_user_id&quot;:120652126,&quot;target&quot;:&quot;CONTRIBUTION_CALENDAR_SQUARE&quot;,&quot;user_id&quot;:120652126,&quot;originating_url&quot;:&quot;https://github.com/users/ksw110/contributions?from=2023-01-01&amp;to=2023-01-11&quot;}}" data-hydro-click-hmac="9f26ce9d821b8a259a3c19f14771c746d1e894ec2c23b827a47d237dfb96c1e3">
	<%
	
	int t = 0;
	int x = 16;
	int y = 0;
	int ax = 270;
	int kk = 0;
	
	for(int i = 0; i < 52 ; i++){
		 
		 %>
        <g transform="translate(<%=t %>, 0)" >
            <% for(int k =0 ; k < 7 ; k++) {%>
            <rect width="11" height="11" x="<%=x %>" y="<%=y %>"  class="ContributionCalendar-day" data-date="2023-01-01" data-level="<%if(list.get(kk).getCount()>4){%>4<%}else{%><%=list.get(kk).getCount()%><%} %>" rx="2" ry="2"></rect><text class="arrow_box" x="<%=ax %>" y="115"><%=list.get(kk).getCount()%> contributions <%=list.get(kk).getCodedate().substring(0,10)%> </text>
            <%y += 15; kk+=1;} %>
            
        </g><%t +=16; x -=1; ax -=16; y=0;} %>
        
        <text x="16" y="-8" class="ContributionCalendar-label">Jan</text>
        <text x="91" y="-8" class="ContributionCalendar-label">Feb</text>
        <text x="151" y="-8" class="ContributionCalendar-label">Mar</text>
        <text x="211" y="-8" class="ContributionCalendar-label">Apr</text>
        <text x="286" y="-8" class="ContributionCalendar-label">May</text>
        <text x="346" y="-8" class="ContributionCalendar-label">Jun</text>
        <text x="406" y="-8" class="ContributionCalendar-label">Jul</text>
        <text x="481" y="-8" class="ContributionCalendar-label">Aug</text>
        <text x="541" y="-8" class="ContributionCalendar-label">Sep</text>
        <text x="601" y="-8" class="ContributionCalendar-label">Oct</text>
        <text x="676" y="-8" class="ContributionCalendar-label">Nov</text>
        <text x="736" y="-8" class="ContributionCalendar-label">Dec</text>

      <text text-anchor="start" class="ContributionCalendar-label" dx="-15" dy="8" style="display: ;">Sun</text>
      <text text-anchor="start" class="ContributionCalendar-label" dx="-15" dy="25">Mon</text>
      <text text-anchor="start" class="ContributionCalendar-label" dx="-15" dy="32" style="display: none;">Tue</text>
      <text text-anchor="start" class="ContributionCalendar-label" dx="-15" dy="56">Wed</text>
      <text text-anchor="start" class="ContributionCalendar-label" dx="-15" dy="57" style="display: none;">Thu</text>
      <text text-anchor="start" class="ContributionCalendar-label" dx="-15" dy="85">Fri</text>
      <text text-anchor="start" class="ContributionCalendar-label" dx="-15" dy="81" style="display: none;">Sat</text>
</g>  </svg>
<div class="width-full f6 px-0 px-md-5 py-1">
<div class="float-left">

</div>
<div class="float-right color-fg-muted" aria-hidden="true">
Less
<svg width="10" height="10" class="d-inline-block">
<rect width="10" height="10" class="ContributionCalendar-day" data-level="0" rx="2" ry="2"></rect>
</svg>
<svg width="10" height="10" class="d-inline-block">
<rect width="10" height="10" class="ContributionCalendar-day" data-level="1" rx="2" ry="2"></rect>
</svg>
<svg width="10" height="10" class="d-inline-block">
<rect width="10" height="10" class="ContributionCalendar-day" data-level="2" rx="2" ry="2"></rect>
</svg>
<svg width="10" height="10" class="d-inline-block">
<rect width="10" height="10" class="ContributionCalendar-day" data-level="3" rx="2" ry="2"></rect>
</svg>
<svg width="10" height="10" class="d-inline-block">
<rect width="10" height="10" class="ContributionCalendar-day" data-level="4" rx="2" ry="2"></rect>
</svg>
More
</div>
</div>
</div>
</div>
</div>
<div class="contrib-column contrib-column-first table-column"><span class="text-muted">Contributions in the last year</span>
                               <span class="contrib-number">0 total</span>
                               <span class="text-muted">Jan 7, 2022 – Jan 6, 2023</span></div><div class="contrib-column table-column"><span class="text-muted">Longest streak</span>
                               <span class="contrib-number">0 days</span>
                               <span class="text-muted">Rock - Hard Place</span></div><div class="contrib-column table-column"><span class="text-muted">Current streak</span>
                               <span class="contrib-number">0 days</span>
                               <span class="text-muted">Rock - Hard Place</span></div></div></div>
</body>
</html>
</html>