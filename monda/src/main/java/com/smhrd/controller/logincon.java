package com.smhrd.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberDAO_1;
import com.smhrd.model.MemberVO;

public class logincon extends HttpServlet {

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		
		MemberVO vo = new MemberVO(id, pw);
		MemberDAO_1 dao = new MemberDAO_1();
		MemberVO loginMember = dao.selectMember(vo);
		
		if(loginMember != null) { // 로그인 성공
			System.out.println("로그인 성공");
			
			HttpSession session = request.getSession();
			session.setAttribute("loginMember", loginMember);
			response.sendRedirect("index.jsp");
			
		}else { // 로그인 실패
			System.out.println("로그인 실패");
			response.sendRedirect("index.jsp");
		}
		

}
}
