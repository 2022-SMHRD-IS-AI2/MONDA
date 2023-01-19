<%@page import="org.apache.ibatis.reflection.SystemMetaObject"%>
<%@page import="java.math.BigDecimal"%>
<%@page import="java.nio.file.Files"%>
<%@page import="java.nio.file.Paths"%>
<%@page import="java.nio.file.Path"%>
<%@page import="com.smhrd.model.BoardDAO1"%>
<%@page import="com.smhrd.model.BoardVO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Forty by HTML5 UP</title>
<meta charset="utf-8" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
<link rel="stylesheet" href="assetsBoard/css/main.css" />
<link rel="stylesheet" href="assetsBoard/css/board.css" />
<!--[if lte IE 9]><link rel="stylesheet" href="assets/css/ie9.css" /><![endif]-->
<!--[if lte IE 8]><link rel="stylesheet" href="assets/css/ie8.css" /><![endif]-->

</head>
<body>
	<!-- Q17. 게시글 목록 조회 기능 
                 : web_board 테이블에 있는 모든 게시글 출력
                 : select * from web_board-->

	<%
	List<BoardVO> vo = new BoardDAO1().showBoard();
	%>

	<!-- Q18. 게시글 목록 세부페이지 기능(제목을 클릭하면 세부페이지 BoardDetail.jsp로 이동)-->
	<div id="board">
		<table id="list">
			<tr>
				<td>순차</td>
				<td>다운로드</td>
				<td>파일명</td>
				<td>실재파일명</td>
				<td>파일크기</td>
				<td>확장자</td>
				<td>파일메모</td>
				<td>업로드</td>
			</tr>

			<%
			for (int i = 0; i < vo.size(); i++) {
			%>
			<tr>
				<td><%=i + 1%></td>
				<!-- i는 변수이기 때문에 표현식을 사용한다 ! -->
				<td><a href="./file/<%=vo.get(i).getREAL_FILE_NAME()%>"
					
					download>다운로드</a></td>
					<!--효창 - download 기능구현 실패 -->
				<%
				String size = vo.get(i).getREAL_FILE_NAME();
				String ext = vo.get(i).getREAL_FILE_NAME();
								
				// String size1 = size.toEngineeringString();
				//효창 - 시간 관계상 파일 사이즈는 불러 와지는데 저장을 못하고 캘린더로 넘어감
				Path path = Paths.get(
						//효창 - 경로 지정할때 \ 하나면 주석때문에 인식 못함/ 이것도 어느로직에서는 안먹혔음 \\가장 무난함
						//효창 - 파일 업로드 할때 깃을 PULL , PUSY할때 경로로 지정한 폴더가 없어서 새로 만들어야됨
						"C:\\Users\\smhrd\\Desktop\\webStudy\\.metadata\\.plugins\\org.eclipse.wst.server.core\\tmp3\\wtpwebapps\\monda_1\\file\\"+ size);
				System.out.print(path);
				long path2 = Files.size(path);
				%>
				<%=path2%>

				<td><%=vo.get(i).getFILE_NAME()%></td>
				<td><%=vo.get(i).getREAL_FILE_NAME()%></td>
				<td><%=path2%>kb</td>
				<!--효창- 확장자는 이름에  substring(ext.length()-3 썼음 마찬가지로 저장 로직 시간문제로 구현 실패 -->
				<td><%=ext.substring(ext.length()-3, ext.length())%></td>
				<td><%=vo.get(i).getFILE_MEMO()%></td>
				<td><%=vo.get(i).getT_UPLOADDAY()%></td>
			</tr>
			<%
			}
			%>
		</table>

		<a href="Main.jsp"><button id="writer">홈으로가기</button></a> <a
			href="boardWrite.jsp"><button id="writer">작성하러가기</button></a>
	</div>


	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.scrolly.min.js"></script>
	<script src="assets/js/jquery.scrollex.min.js"></script>
	<script src="assets/js/skel.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>
</body>
</html>