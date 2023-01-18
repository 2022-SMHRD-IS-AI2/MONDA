package com.smhrd.controller;

import java.io.IOException;
import java.net.URLEncoder;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;
import com.smhrd.model.MemberDAO_1;
import com.smhrd.model.MemberVO;

public class updatecon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO)session.getAttribute("loginMember");
		// MultipartRequest에서 필요한 매개변수 설정
		// 1. 모둔 요청의 정보가 담겨있는 request 객체
		// 2. 업로드 된 파일(이미지)을 저장할 경로
		String path = request.getServletContext().getRealPath("./images");
		System.out.println(path);
		
		// 3. 파일의 max size
		int maxSize = 10*1024*1024;
		
		// 4. 인코딩 방식
		String encoding = "UTF-8";
		
		// 5. 중복제거 -> 파일명 뒤에 숫자 붙여주는 객체 중복되면 자동으로 1 or 2 ... 붙여줌
		DefaultFileRenamePolicy rename = new DefaultFileRenamePolicy();
		
		// 파일 업로드 -> MultipartRequest -> cos.jar
		MultipartRequest multi = new MultipartRequest(request, path, maxSize, encoding, rename);
		
		String id = loginMember.getM_id();
		String pw = multi.getParameter("pw");
		String name = multi.getParameter("name");
		String email = multi.getParameter("email");
		String nick = multi.getParameter("nick");
		String filename = URLEncoder.encode(multi.getFilesystemName("filename"), "UTF-8");
		String date = loginMember.getM_joindate();
		String type = multi.getParameter("type");
		
		MemberVO vo = new MemberVO(id, pw, name, email, nick, filename, date, type);
		
		MemberDAO_1 dao = new MemberDAO_1();
		int cnt = dao.updateMember(vo);
		
		if(cnt > 0) {
			System.out.println("회원정보수정 성공");
			session.setAttribute("loginMember", vo);
			response.sendRedirect("index.jsp");
		}else {
			System.out.println("회원정보수정 실패");
			response.sendRedirect("update.jsp");
		}
	}
}
