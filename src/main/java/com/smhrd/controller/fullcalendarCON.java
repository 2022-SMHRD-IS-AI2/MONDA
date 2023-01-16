package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.smhrd.model.fullcalendarDAO;
import com.smhrd.model.fullcalendarVO;

public class fullcalendarCON extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");

		/*
		 * String WORK_NAME = request.getParameter("WORK_NAME"); String WORK_S_DT =
		 * request.getParameter("WORK_S_DT"); System.out.println(WORK_NAME + "," +
		 * WORK_S_DT);
		 */

		//int WORK_S_DT2 = Integer.parseInt(WORK_S_DT);
		fullcalendarVO vo = new fullcalendarVO();

		fullcalendarDAO dao = new fullcalendarDAO();
		
		List<fullcalendarVO> list = dao.selectcalendar(vo);
		
		JsonArray arr = new JsonArray();
		
		for(int i=0; i<list.size(); i++) {
			//title(WORK_NAME),start(WORK_S_DT)로 데이터 키를 변경하는 로직 구현
			JsonObject obj = new JsonObject();
			obj.addProperty("title", list.get(i).getWORK_NAME());
			obj.addProperty("start", list.get(i).getWORK_S_DT());
			//{title: 파일명, start:2023-01-11}
			
			arr.add(obj);
			//[{title: 파일명, start:2023-01-11}]
		}
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		out.println(arr.toString());
		
		System.out.println(arr.toString());
		
		Gson gson =new Gson();
		
		String json = gson.toJson(list);
		
		System.out.println(json);
		
		/*
		 * if (list != null) { // 로그인 성공 System.out.println("조회 성공");
		 * 
		 * HttpSession session = request.getSession();
		 * session.setAttribute("selectAllMember", checkcalendar); //
		 * response.sendRedirect("main.jsp");
		 * 
		 * } else { // 로그인 실패 System.out.println("조회 실패"); //
		 * response.sendRedirect("main.jsp");
		 * 
		 * }
		 */

	}
}
