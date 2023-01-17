package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.WorkspaceDAO;
import com.smhrd.model.WorkspaceVO;

public class WorkspaceCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// 인코딩
		request.setCharacterEncoding("UTF-8");
		
		String project_name = request.getParameter("project_name");//프로젝트 이름
		String work_name = request.getParameter("work_name");// 워크스페이스 이름
		String work_s = request.getParameter("work_s");// 워크스페이스 시작
		String work_e = request.getParameter("work_e");// 워크스페이스 끝 
		String work_text = request.getParameter("work_text");// 텍스트
		
		System.out.println("프로젝트 이름 : " + project_name);
		System.out.println("워크스페이스 이름 : " + work_name);
		System.out.println("워크스페이스 시작 : " + work_s);
		System.out.println("워크스페이스 끝 : " + work_e);
		System.out.println("텍스트 : " + work_text);
		
		WorkspaceVO vo = new WorkspaceVO(project_name, work_name, work_s, work_e, work_text);
		
		WorkspaceDAO dao = new WorkspaceDAO();
		int cnt = dao.upload(vo);
		
		if(cnt>0) {
			System.out.println("업로드 성공");
			response.sendRedirect("workspace.jsp");
		}else {
			System.out.println("업로드 실패");
		}
				

	}
}
