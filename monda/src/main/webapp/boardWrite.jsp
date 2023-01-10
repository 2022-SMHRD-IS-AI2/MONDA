<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
      <title>Forty by HTML5 UP</title>
      <meta charset="utf-8" />
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <!--[if lte IE 8]><script src="assets/js/ie/html5shiv.js"></script><![endif]-->
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
                  <td>확장자</td>
                  <td><input  type="text" name ="EXT"> </td>
               </tr> 
               <tr>
                  <td>파일크기</td>
                  <td><input  type="text" name ="FILE_SIZE"> </td>
               </tr> 
               <tr>
                  <td>파일메모</td>
                  <td><input  type="text" name ="FILE_MEMO"> </td>
               </tr> 
              <!--  <tr>
                  <td colspan="2">내용</td>
               </tr> -->
            <!--    <tr>
                  <td colspan="2">
                     
                     <textarea name ="content" rows="10" style="resize: none;"></textarea>         
                  </td>
               </tr> -->
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
         <!--[if lte IE 8]><script src="assets/js/ie/respond.min.js"></script><![endif]-->
         <script src="assets/js/main.js"></script>
</body>
</html>