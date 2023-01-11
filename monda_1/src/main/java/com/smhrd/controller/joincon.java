package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.MemberDAO_1;
import com.smhrd.model.MemberVO;

public class joincon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	request.setCharacterEncoding("UTF-8");
		// index.html 에서 값 가져오기
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String name = request.getParameter("name");
		String nick = request.getParameter("nick");
		String email = request.getParameter("email");
	
		String filename = null;
		String joindate = null;
		String type = null;
	
	// 가져온 값 vo로 넣어주기
	MemberVO vo = new MemberVO(id,pw,name,nick,email,filename,joindate,type);
	
	// vo값 dao로 전송
	MemberDAO_1 dao = new MemberDAO_1();
	int cnt = dao.insert(vo);
	
	if(cnt > 0) {
		System.out.println("회원가입 성공");
		response.sendRedirect("index.jsp");
		
		
	}else {
		System.out.println("회원가입 실패");
		response.sendRedirect("index.jsp");
	}
	}

}
