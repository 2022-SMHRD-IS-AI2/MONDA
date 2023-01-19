package com.smhrd.controller;

import java.io.IOException;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.smhrd.model.MemberVO;
import com.smhrd.model.WorkspaceDAO;
import com.smhrd.model.WorkspaceVO;

public class WorkspaceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		//세션에서 로그인 값을 가져오기 위해 가져옴
		HttpSession session = request.getSession();
		MemberVO loginMember = (MemberVO) session.getAttribute("loginMember");
		
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		String work_project = request.getParameter("project_name");//프로젝트 이름
		String work_name = request.getParameter("work_name");// 워크스페이스 이름
		
		String work_s_dt = request.getParameter("work_s");// 워크스페이스 시작
		String work_e_dt = request.getParameter("work_e");// 워크스페이스 끝 
		//Date로 변환
		SimpleDateFormat formatter = new SimpleDateFormat("yyyy-mm-dd");
		Date work_s_d = java.sql.Date.valueOf(work_s_dt);
		Date work_e_d = java.sql.Date.valueOf(work_e_dt);
		
//		String work_wrt = mvo.getM_id(); // 접속한 사람 아이디 가져오기 -> null
//		String work_wrt = request.getParameter("id"); -> null

		String work_wrt = loginMember.getM_name(); // 작성자 이름
		
		String work_requester= request.getParameter("requester"); // 요청자 이름
		
		String work_status = request.getParameter("work_status"); //워크 상태
		
		String work_text = request.getParameter("work_text"); // 텍스트
		
		System.out.println("프로젝트 이름 : " + work_project);
		System.out.println("워크스페이스 이름 : " + work_name);
		System.out.println("워크스페이스 상태 : " + work_status);
		System.out.println("워크스페이스 시작 : " + work_s_d);
		System.out.println("워크스페이스 끝 : " + work_e_d);
		System.out.println("로그인한 사람 아이디 : " + work_wrt);
		System.out.println("요청자 이름 : " + work_requester);
		System.out.println("텍스트 : " + work_text);
		
		WorkspaceVO vo = new WorkspaceVO(work_project, work_name, work_s_d, work_e_d, work_status, work_wrt, work_requester, work_text);
		
		WorkspaceDAO dao = new WorkspaceDAO();
		int cnt = dao.workload(vo);
		
		if(cnt>0) {
			System.out.println("업로드 성공");
			response.sendRedirect("workspace.jsp");
		}else {
			System.out.println("업로드 실패");
		}
	}
}
