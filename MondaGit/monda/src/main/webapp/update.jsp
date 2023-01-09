<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.smhrd.model.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
	 SimpleDateFormat sDate = new SimpleDateFormat("yyyy/MM/dd");
	%>
	<!-- Wrapper -->
	<div id="wrapper">
		<!-- Menu -->
		<nav>
		<ul>
			<li><h5>회원정보수정</h5></li>
			<form action="updatecon" method="post" enctype="multipart/form-data">>
				<li>접속한 ID : <%=loginMember.getM_id() %></li>
				<li><input name="pw" type="password" placeholder="PW를 입력하세요"
					style="width: 500px; margin: 0 auto;"></li>
				<li><input name="name" type="text"
					value="<%=loginMember.getM_name() %>" placeholder="이름을 입력하세요"
					style="width: 500px; margin: 0 auto;"></li>
				<li><input name="nick" type="text"
					value="<%=loginMember.getM_name() %>" placeholder="NickName을 입력하세요"
					style="width: 500px; margin: 0 auto;"></li>
				<li><input name="email" type="text"
					value="<%=loginMember.getM_email() %>" placeholder="Email을 입력하세요"
					style="width: 500px; margin: 0 auto;"></li>
				<li><input name="filename" type="file"
					value="<%=loginMember.getM_profile() %>" 
						style="float: left ;">프로필 사진</li><br>
				<li><span>회원가입일자 : <%=loginMember.getM_joindate() %></span></li>
				<li>일반<input type ="radio" name="type" value="M">
					관리자<input type ="radio" name="type" value="A"></li>
				<li><input type="submit" value="JoinUs" class="button fit"
					style="width: 500px; margin: 0 auto;"></li>
			</form>
		</ul>
		</nav>
	</div>
</body>
</html>