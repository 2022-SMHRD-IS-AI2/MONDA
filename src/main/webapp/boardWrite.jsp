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
         <!-- Q16. 게시글 작성 기능(작성된 게시글은 DB에 저장) - 파일업로드 cos.jar 사용 -->
         <div id = "board">
            <form action ="WriteBoardCon" method ="post"  enctype="multipart/form-data">
            <table id="list">
               <tr>
                  <td>파일명</td>
                  <td><input  type="text" name ="FILE_NAME"> </td>
               </tr> 
               <tr>
                  <td>실재파일명</td>
                  <td><input  type="file" name ="REAL_FILE_NAME" style="float: right;"> </td>
               </tr>
               <tr>
                  <td>파일메모</td>
                  <td><input  type="text" name ="FILE_MEMO"> </td>
               </tr> 
               <tr>
                  <td colspan="2">
                     <input type="reset" value="초기화">
                     <input type="submit" value="작성하기">
                  </td>
               </tr>
            </table>
            </form>
         </div>
         <!-- Scripts -->
         <script src="assets/js/jquery.min.js"></script>
         <script src="assets/js/jquery.scrolly.min.js"></script>
         <script src="assets/js/jquery.scrollex.min.js"></script>
         <script src="assets/js/skel.min.js"></script>
         <script src="assets/js/util.js"></script>
         <script src="assets/js/main.js"></script>
</body>
<!-- 효창 후기 - 1.드래그 드랍기능부분가 파일 업로드 기능을 따로 나눠서 구현하다가 파일 업로드가 두개가 만들어져서 내꺼는 불필요 해짐 구현기능 겹치는 부분 좀더 파악 필요
			   2. 파일업로드만 생각말고 삭제,다운,수정을 뒤늦게 생각함 그 기능 필요한 파생기능을 생각 할 필요가 있음
			   3. 마감 기한 정해지다 보닌 나중에는 출시는 해야해서 야매로 구동하는 가감함이 필요함 또는 프로젝트 기능구현기간을 나눠야함
			   4. 나중에 복습 또는 팀원에게설명을 위해 주석을 미리미리 달아야함(잘한점 ,안됨점, 기능 등) 

-->
</html>
