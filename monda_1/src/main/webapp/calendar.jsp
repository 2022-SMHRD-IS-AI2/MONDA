<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
						<p><%
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
							<li><a href="calendar.jsp" class="list_menu active">나의
									캘린더</a></li>
							<li><a href="#three" class="list_menu">나의 메모</a></li>
							<li><a href="codechart.jsp" class="list_menu">나의 코드블럭</a></li>
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
		<!-- 캘린더시작 -->
		<section id="calendar" class="wrapper style2 spotlights">
			<div class="ProjectPage">
				<div class="ProjectPage-projectInfoBanner"></div>
				<div class="ProjectPage-calendar">
					<div
						class="PageToolbarStructure PageToolbarStructure--medium DeprecatedCalendarPageToolbar">
						<div class="PageToolbarStructure-leftChildren">
							<h5
								class="DeprecatedCalendarPageToolbar-title Typography Typography--colorDefault Typography--h5 Typography--fontWeightMedium">2023년&nbsp;1월</h5>
							<div id="lui_178"
								class="ThemeableIconButtonPresentation--isEnabled ThemeableIconButtonPresentation ThemeableIconButtonPresentation--medium SubtleIconButton--standardTheme SubtleIconButton DeprecatedCalendarPageToolbar-monthPicker SubtleIconButton--standardTheme SubtleIconButton DeprecatedCalendarPageToolbar-monthPicker"
								role="button" tabindex="0" aria-label="월 선택"
								aria-expanded="false">
								<svg class="Icon DownIcon" viewBox="0 0 32 32"
									aria-hidden="true" focusable="false">
											<path
										d="M16,22.5c-0.3,0-0.7-0.1-0.9-0.3l-11-9c-0.6-0.5-0.7-1.5-0.2-2.1s1.5-0.7,2.1-0.2l10,8.2l10-8.2c0.6-0.5,1.6-0.4,2.1,0.2c0.5,0.6,0.4,1.6-0.2,2.1l-11,9C16.7,22.4,16.3,22.5,16,22.5z"></path>
										</svg>
							</div>
						</div>
						<div class="PageToolbarStructure-rightChildren">
							<div
								class="ThemeableRectangularButtonPresentation--isEnabled ThemeableRectangularButtonPresentation ThemeableRectangularButtonPresentation--medium SubtleButton--standardTheme SubtleButton DeprecatedCalendarPageToolbar-todayButton SubtleButton--standardTheme SubtleButton DeprecatedCalendarPageToolbar-todayButton"
								role="button" tabindex="0">오늘</div>
							<div id="lui_181"
								class="ThemeableRectangularButtonPresentation--isEnabled ThemeableRectangularButtonPresentation ThemeableRectangularButtonPresentation--medium SubtleButton--standardTheme SubtleButton ViewSettingsMenuColorDropdown DeprecatedProjectCalendar-toolbarColorButton ViewSettingsMenuColorDropdown-button SubtleButton--standardTheme SubtleButton ViewSettingsMenuColorDropdown DeprecatedProjectCalendar-toolbarColorButton ViewSettingsMenuColorDropdown-button"
								role="button" tabindex="0" aria-expanded="false">
								<svg
									class="MiniIcon ThemeableRectangularButtonPresentation-leftIcon PaintbrushMiniIcon"
									viewBox="0 0 24 24" aria-hidden="true" focusable="false">
											<path
										d="M21,0H3C2.4,0,2,0.4,2,1v10c0,1.7,1.3,3,3,3h3v6c0,2.2,1.8,4,4,4c2.2,0,4-1.8,4-4v-6h3c1.7,0,3-1.3,3-3V1  C22,0.4,21.6,0,21,0z M4,2h2v2c0,0.6,0.4,1,1,1s1-0.4,1-1V2h2v2c0,0.6,0.4,1,1,1s1-0.4,1-1V2h2v2c0,0.6,0.4,1,1,1s1-0.4,1-1V2h4v4.9  H4V2z M20,11c0,0.6-0.4,1-1,1h-4c-0.6,0-1,0.4-1,1v7c0,1.1-0.9,2-2,2c-1.1,0-2-0.9-2-2v-7c0-0.6-0.4-1-1-1H5c-0.6,0-1-0.4-1-1V8.9  h16V11z"></path>
										</svg>
								<span
									class="ViewSettingsMenuColorDropdown-buttonLabel Typography Typography--overflowTruncate Typography--s">색상:
									기본 색상</span>
							</div>
							<div
								class="ThemeableRectangularButtonPresentation--isEnabled ThemeableRectangularButtonPresentation ThemeableRectangularButtonPresentation--medium SubtleButton--standardTheme SubtleButton DeprecatedCalendarPageToolbar-weekendButton SubtleButton--standardTheme SubtleButton DeprecatedCalendarPageToolbar-weekendButton"
								role="button" tabindex="0">주말: 사용 안 함</div>
							<div id="lui_184"
								class="ThemeableRectangularButtonPresentation--isEnabled ThemeableRectangularButtonPresentation--withNoLabel ThemeableRectangularButtonPresentation ThemeableRectangularButtonPresentation--medium SubtleButton--standardTheme SubtleButton MoreMenu ProjectPageToolbarMoreMenu SubtleButton--standardTheme SubtleButton MoreMenu ProjectPageToolbarMoreMenu"
								role="button" tabindex="0" aria-label="기타 작업"
								aria-expanded="false">
								<svg
									class="Icon ThemeableRectangularButtonPresentation-leftIcon MoreIcon"
									viewBox="0 0 32 32" aria-hidden="true" focusable="false">
											<path
										d="M16,13c1.7,0,3,1.3,3,3s-1.3,3-3,3s-3-1.3-3-3S14.3,13,16,13z M3,13c1.7,0,3,1.3,3,3s-1.3,3-3,3s-3-1.3-3-3S1.3,13,3,13z M29,13c1.7,0,3,1.3,3,3s-1.3,3-3,3s-3-1.3-3-3S27.3,13,29,13z"></path>
										</svg>
							</div>
						</div>
					</div>
					<div id="DeprecatedCalendarBody" class="DeprecatedCalendarBody">
						<div class="DeprecatedCalendarBody-dayOfWeekLabels">
							<div class="DeprecatedCalendarBody-columnLabel">일</div>
							<div class="DeprecatedCalendarBody-columnLabel">월</div>
							<div class="DeprecatedCalendarBody-columnLabel">화</div>
							<div class="DeprecatedCalendarBody-columnLabel">수</div>
							<div class="DeprecatedCalendarBody-columnLabel">목</div>
							<div class="DeprecatedCalendarBody-columnLabel">금</div>
							<div class="DeprecatedCalendarBody-columnLabel">토</div>
						</div>
						<div
							class="Scrollable--withCompositingLayer Scrollable Scrollable--vertical DeprecatedCalendarBody-dates"
							tabindex="-1">
							<div
								class="DeprecatedCalendarWeek DeprecatedProjectCalendarWeek-calendarWeek">
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--compact DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">1월 1</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--firstOfMonth DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">2일</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">3</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">4</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--today DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">5</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks">
										<div>
											<div class="ContextMenuTarget-contextMenuEventListener">
												<div
													class="DeprecatedCalendarTaskRow DeprecatedCalendarTaskRow--colorAqua DeprecatedDropTargetCalendarTaskRow DeprecatedDraggableDropTargetCalendarTaskRow DeprecatedCalendarWeek-multiDayCalendarTaskRow"
													draggable="true" style="width: calc(200% + 230px);">
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
															<div
																class="TaskCell-nameAndSubtasksContainer cal_red borderL">
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
									</div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right">
											<div
												class="ThemeableRectangularButtonPresentation--isEnabled ThemeableRectangularButtonPresentation ThemeableRectangularButtonPresentation--medium SubtleButton--standardTheme SubtleButton DeprecatedCalendarDay-addTaskButton SubtleButton--standardTheme SubtleButton DeprecatedCalendarDay-addTaskButton"
												role="button" tabindex="0">
												<svg
													class="MiniIcon ThemeableRectangularButtonPresentation-leftIcon DeprecatedCalendarDay-addTaskButton--plusIcon PlusMiniIcon"
													viewBox="0 0 24 24" aria-hidden="true" focusable="false">
													<path
														d="M10,10V4c0-1.1,0.9-2,2-2s2,0.9,2,2v6h6c1.1,0,2,0.9,2,2s-0.9,2-2,2h-6v6c0,1.1-0.9,2-2,2s-2-0.9-2-2v-6H4c-1.1,0-2-0.9-2-2s0.9-2,2-2H10z"></path>
												</svg>
												작업 추가
											</div>
										</div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">6</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks">
										<div class="DeprecatedCalendarWeek-taskPlaceholder"></div>
										<div>
											<div class="ContextMenuTarget-contextMenuEventListener">
												<div
													class="DeprecatedCalendarTaskRow DeprecatedCalendarTaskRow--colorYellowOrange DeprecatedDropTargetCalendarTaskRow DeprecatedDraggableDropTargetCalendarTaskRow DeprecatedCalendarWeek-multiDayCalendarTaskRow"
													draggable="true" style="width: calc(100% + 220px);">
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
									</div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--compact DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">7</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
							</div>
							<div
								class="DeprecatedCalendarWeek DeprecatedProjectCalendarWeek-calendarWeek">
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--compact DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">8</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">9</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks">
										<div>
											<div class="ContextMenuTarget-contextMenuEventListener">
												<div
													class="DeprecatedCalendarTaskRow DeprecatedCalendarTaskRow--colorAqua DeprecatedDropTargetCalendarTaskRow DeprecatedDraggableDropTargetCalendarTaskRow DeprecatedCalendarWeek-multiDayCalendarTaskRow"
													draggable="true"
													style="margin-left: -225px; width: calc(100% + 225px);">
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
													style="margin-left: -225px; width: calc(200% + 225px);">
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
												<div
													class="DeprecatedCalendarTaskRow DeprecatedCalendarTaskRow--colorPurple DeprecatedDropTargetCalendarTaskRow DeprecatedDraggableDropTargetCalendarTaskRow DeprecatedCalendarWeek-multiDayCalendarTaskRow"
													draggable="true" style="width: calc(300% + 245px);">
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
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
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
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
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
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">12</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">13</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--compact DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">14</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
							</div>
							<div
								class="DeprecatedCalendarWeek DeprecatedProjectCalendarWeek-calendarWeek">
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--compact DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">15</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">16</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">17</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">18</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">19</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">20</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--compact DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">21</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
							</div>
							<div
								class="DeprecatedCalendarWeek DeprecatedProjectCalendarWeek-calendarWeek">
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--compact DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">22</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">23</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">24</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">25</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">26</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">27</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--compact DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">28</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
							</div>
							<div
								class="DeprecatedCalendarWeek DeprecatedProjectCalendarWeek-calendarWeek">
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--compact DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">29</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">30</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">31</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">2월 1일</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">2</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">3</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-tasks"></div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
								<div
									class="DeprecatedCalendarDay DeprecatedCalendarDay--compact DeprecatedCalendarDay--canClickCanvasToAddTask DeprecatedProjectCalendarDay">
									<div class="DeprecatedCalendarDay-dayHeader">
										<span class="DeprecatedCalendarDay-date">4</span> <span
											class="DeprecatedCalendarDay-headerLabel"></span>
									</div>
									<div class="DeprecatedCalendarDay-actions">
										<div class="DeprecatedCalendarDay-actions--left"></div>
										<div class="DeprecatedCalendarDay-actions--right"></div>
									</div>
								</div>
		</section>
		<!-- 캘린더 끝 -->
</body>
</html>