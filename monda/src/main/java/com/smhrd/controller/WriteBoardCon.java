package com.smhrd.controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.BoardDAO1;
import com.smhrd.model.BoardVO;

public class WriteBoardCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		//post방식 인코딩
		request.setCharacterEncoding("UTF-8");
		
		
		
		// MultipartRequest에서 필요한 매개변수 설정
		// 1. 모든 요청의 정보가 담겨있는 request객체
		// 2. 업로드 된 파일(이미지)을 저장할 경로
	    String path = request.getServletContext().getRealPath("./file");
	    //System.out.println(path);
	    
		// 3. 파일의 max size
	    int maxSize = 1024*1024*1024;
	    
		// 4. 인코딩 방식
	    String encoding = "UTF-8";
	    
		// 5. 중복제거 -> 파일명 뒤에 숫자 붙여주는 객체
        DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		// 파일 업로드 -> MultipartRequest -> cos.jar
		MultipartRequest multi = new MultipartRequest(request,path,maxSize,encoding,rename);
		System.out.println("multi"+multi);
		
        // DB에 저장하기 위해서 게시글 정보 가져오기
		String FILE_NAME = multi.getParameter("FILE_NAME");
		String REAL_FILE_NAME ;
		String EXT = multi.getParameter("EXT");
		BigDecimal FILE_SIZE = new BigDecimal(multi.getParameter("FILE_SIZE"));
		String FILE_MEMO = multi.getParameter("FILE_MEMO");
		
		System.out.println("FILE_NAME"+FILE_NAME);
		
		//String FILE_SIZE = multi.getParameter("FILE_SIZE");
		
		
		if(multi.getOriginalFileName("REAL_FILE_NAME") == null){ REAL_FILE_NAME = "파일전송실패"; }else {
		REAL_FILE_NAME = URLEncoder.encode( multi.getOriginalFileName("REAL_FILE_NAME"),"UTF-8"); }
		// 한글이름은 인코딩해야 나중에 이미지 확인 가능!!
	    // URLEncoder.encode(인코딩할 값, 인코딩 방식)
	    // Integer.parseInt(형변환할 값)

	    
	    //System.out.println("FILE_SEQ :" + FILE_SEQ);
	   // System.out.println("Test : "+WORK_SEQ);
	    //System.out.println("Test : "+ REAL_FILE_NAME);
	    //vo로 묶기
		BoardVO vo = new BoardVO(FILE_NAME,REAL_FILE_NAME,EXT,FILE_SIZE,FILE_MEMO);
	   // BoardVO vo = new BoardVO(FILE_NAME,REAL_FILE_NAME);
	    
	    int cnt = new BoardDAO1().upload(vo);
	    
	    if(cnt>0) {
	    	System.out.println("업로드 성공");
	    }else {
	    	System.out.println("업로드 실패");
	    }
	    
	    response.sendRedirect("boardMain.jsp");
	}
}
