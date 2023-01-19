<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>

<head>
<title>MONDA|WORKSPACE</title>
<meta charset="utf-8" />

<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />

<link rel="stylesheet" href="assets/css/main.css" />
<link rel="stylesheet" href="assets/css/sub.css" />
<link rel="stylesheet"
	href="assets/css/_default.page.client.936d3e7c.css" />
<!-- calendar css 연결 -->
<!-- <link rel="stylesheet" href="./assets/css/root.css"> -->
<!-- login css 연결 -->
<link rel="stylesheet" href="./assets/css/login.css">

<!-- jQuery 설치 -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"
	integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ=="
	crossorigin="anonymous" referrerpolicy="no-referrer">
	
</script>

<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css"
	integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w=="
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<!-- 워크스페이스 textarea 자동높이조절 -->
<script>
	console.log("함수 적용 확인");
	function resize(obj) {
		obj.style.height = "1px";
		obj.style.height = (12 + obj.scrollHeight) + "px";
	}
</script>

<noscript>
	<link rel="stylesheet" href="assets/css/noscript.css" />
</noscript>


<!-- 워크스페이스 CSS -->
<style>
/* 각 영역이 850px이 넘어가면 스크롤이 뜨게 설정 */
.scroll_box {
	min-height: 850px;
	max-height: 850px;
	overflow-y: auto;
	/* height: expression(this.scrollHeight > 99 ? "100px" : "auto"); */
}

/* 해당 요소 드래그 가능함 */
/* 드래그 할 때 커서 모영 바꾸기 */
/* .draggable {
			cursor: pointer;
		} */

/* 드래그할 때 오퍼러티 보여주기 */
.draggable.dragging {
	opacity: 0.5;
}

/* 정렬용 */
/* 기준이 되는 테이블 */
.guideline {
	z-index: 0;
	position: absolute;
}

/* 워크스페이스 */
.draggable {
	z-index: 999;
	position: relative;
}

.myPlan {
	position: relative;
}

/* 워크스페이스를 끌어다 놓아보세여 */
.p-relative {
	position: relative;
}

/* textarea영역(이었던 것) */
.print_textarea {
	background-color: white;
	height: auto;
	padding: 10px;
	min-height: 100px
}
</style>

</head>
<body class="is-preload">

	<%
	MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
	%>

	<!-- Sidebar -->
	<section id="sidebar">
		<div class="Logo">
			<a href="" class="Logo_atag">
				<h1>
					<img src="./images/Logo_white_s.png" />
				</h1>
			</a>
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
					<li><a href="index.jsp" class="border_b">Main</a></li>
					<li><a href="#one" class="border_b">My Space</a>
						<ul class="work_list">
							<li><a href="workspace.jsp" class="list_menu active">My
									Workspace</a></li>
							<li><a href="calendar.jsp" class="list_menu">나의 캘린더</a></li>
							<li><a href="codeCon" class="list_menu">나의 코드블럭</a></li>
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
	<!-- Wrapper -->
	<div id="wrapper">
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
									<div class="mx-auto p00 pt20">
										<di class="flex gap-8">

										<section class="w25">
											<div class="flex items-center gap-2">
												<div class="font-medium">요청</div>
												<span class="self-end text-sm text-gray-400"> <!-- 요청 num 들어가는 곳 -->
												</span>
											</div>

											<dic class="scroll_box">
											<div class="mt-2 flex flex-col gap-2">

												<div
													class="both-center h-85px w-full flex select-none border-2 rounded border-dashed text-sm text-gray-300">
													도착한 요청이 없습니다
												</div>

											</div>
											</dic>
										</section>

										<!-- 계획 중 -->
										
										<section class="w25">
											<div class="flex items-center gap-2">
												<div class="font-medium" tabindex="0" role="button"
													draggable="false">
													<div>계획 중</div>
												</div>
												<span class="self-end text-sm text-gray-400">(0)</span>
												<div class="grow"></div>
												<div class="relative" data-headlessui-state="">
													<button onclick=<% if(loginMember!=null){%>
													"planDIV()"<%}else if(loginMember==null){%>
													"noplanDIV()"<%}%>
														class="flex h-6 w-6 items-center justify-center rounded transition"
														id="headlessui-menu-button-:r11:" type="button"
														aria-haspopup="menu" aria-expanded="false"
														data-headlessui-state="">
														<i class="fa-solid fa-circle-plus"></i>
													</button>
												</div>
											</div>

											<div class="scroll_box container" id="planSpace">

												<!-- 여기 안에서 변화함 -->
												<div class="mt-2 flex flex-col gap-2 noplan p-relative">
													<div
														class="both-center h-85px w-full flex border-2 rounded border-dashed text-sm text-gray-300 guideline">
														워크스페이스를 끌어다 놓아보세요!
													</div>
													<div></div>
												</div>
										</section>

										<!-- 진행 중 -->
										<section class="w25">
											<div class="flex items-center gap-2">
												<div class="font-medium" tabindex="0" role="button"
													draggable="false">
													<div>진행 중</div>
												</div>
												<span class="self-end text-sm text-gray-400">(0)</span>
												<div class="grow"></div>
												<div class="relative" data-headlessui-state="">
													<button onclick=<% if(loginMember!=null){%>
													"processSpace()"<%}else if(loginMember==null){%>
													"noplanDIV()"<%}%>
														class="flex h-6 w-6 items-center justify-center rounded transition"
														id="headlessui-menu-button-:r11:" type="button"
														aria-haspopup="menu" aria-expanded="false"
														data-headlessui-state="">
														<i class="fa-solid fa-circle-plus"></i>
													</button>
												</div>
											</div>

											<div class="scroll_box container" id="processSpace">

												<div class="mt-2 flex flex-col gap-2 p-relative">
													<div
														class="both-center h-85px w-full flex border-2 rounded border-dashed text-sm text-gray-300 guideline">
														워크스페이스를 끌어다 놓아보세요!</div>
													<div></div>
												</div>
										</section>

										<!-- 완료 -->
										<section class="w25">
											<div class="flex items-center gap-2">
												<div class="font-medium" tabindex="0" role="button"
													draggable="false">
													<div>완료</div>
												</div>
												<span class="self-end text-sm text-gray-400">(0)</span>
												<div class="grow"></div>
												<div class="relative" data-headlessui-state=""></div>
											</div>

											<div class="scroll_box container" id="endSpace">

												<div class="flex flex-col gap-2 p-relative">
													<div
														class="both-center h-85px w-full flex border-2 rounded border-dashed text-sm text-gray-300 guideline">
														워크스페이스를 끌어다 놓아보세요!</div>
													<div></div>
												</div>

												<!-- 테스트용
															(제출용) -->
												<!-- (DB에 저장된 거 보여주는 용) -->
												<div class="mt-2 draggable mb-8" draggable="true">
													<div
														class="h-auto p-4 border rounded-md bg-gray-100 grow text-sm font-medium border-brand-300">
														<div class="text-xs text-gray-400 f_right f_icon">
															<i onclick="w_modify()">M</i> <i onclick="w_delete()">X</i>
														</div>
														<p class="self-start text-xs text-gray-400">프로젝트 이름1</p>
														<hr>
														<p class="p-1">워크스페이스 이름</p>
														<div style="text-align: center">
															<span class="self-start text-xs text-gray-400">yyyy-mm-dd</span>
															➔ <span class="self-start text-xs text-gray-400">yyyy-mm-dd</span>
														</div>
														<div class="text-right">
															<a class="self-start text-xs text-gray-400 "
																href="http://test.com">요청자</a>
														</div>
														<div></div>
														<p class="print_textarea">테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트
														</p>
													</div>
												</div>

												<div class="mt-2 draggable mb-8" draggable="true">
													<div
														class="h-auto p-4 border rounded-md bg-gray-100 grow text-sm font-medium border-brand-300">
														<div class="text-xs text-gray-400 f_right f_icon">
															<i onclick="w_modify()">M</i> <i onclick="w_delete()">X</i>
														</div>
														<p class="self-start text-xs text-gray-400">프로젝트 이름1</p>
														<hr>
														<p class="p-1">워크스페이스 이름</p>
														<div style="text-align: center">
															<span class="self-start text-xs text-gray-400">yyyy-mm-dd</span>
															➔ <span class="self-start text-xs text-gray-400">yyyy-mm-dd</span>
														</div>
														<div class="text-right">
															<a class="self-start text-xs text-gray-400 "
																href="http://test.com">요청자</a>
														</div>
														<div></div>
														<p class="print_textarea">테스트테스트테스트테스트테스트테스트테스트테스트테스트테스트
														</p>
													</div>
												</div>
										</section>
									</div>
								</div>
							</div>
						</div>
					</main>
				</div>
			</div>
		</section>
	</div>

	<!-- 드래그 앤 드롭 기능 JS -->
	<script src="./assets/js/workspace.js"></script>

	<!-- 워크스페이스 추가하는 기능 -->
	<script src="./assets/js/plusWorkSpace.js"></script>

	<!-- 워크스페이스 수정 / 삭제 -->
	<script>
		function w_modify() {
			window.alert([ "수정" ])
		}
		function w_delete() {
			window.alert([ "삭제" ])
		}
	</script>
</body>

</html>