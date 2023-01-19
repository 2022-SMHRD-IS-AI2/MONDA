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


		fullcalendarVO vo = new fullcalendarVO();

		fullcalendarDAO dao = new fullcalendarDAO();
		
		//vo에 들어있는 값에 맞쳐서 dao 에 있는 리스트문법 불러 오기 
		List<fullcalendarVO> list = dao.selectcalendar(vo);
		//json 배열 함수생성호출
		JsonArray arr = new JsonArray();
		
		for(int i=0; i<list.size(); i++) {
			//title(WORK_NAME),start(WORK_S_DT)로 데이터 키를 변경하는 로직 구현
			JsonObject obj = new JsonObject();// json식 객체 전환
			obj.addProperty("title", list.get(i).getWORK_NAME());
			obj.addProperty("start", list.get(i).getWORK_S_DT());
			obj.addProperty("end", list.get(i).getWORK_E_DT());
			//{title: 파일명, start:2023-01-11}
			//System.out.println("json식 객체"+obj);
			arr.add(obj);
			//[{title: 파일명, start:2023-01-11}]
		}
		
		response.setContentType("application/json; charset=utf-8");
		PrintWriter out = response.getWriter();
		//jsp에 응답으로 보내기
		//효창-키벨류값 스트링 형태로 jsp 받는형식에 맞게.toString 써서 보냄
		out.println(arr.toString());
		//System.out.println(+arr.toString());
		
		
		
		//gson으로 사용할려다가 여러선생님들 피드백으로 꼬여서 결국 gson 은 사용 않함
		//Gson gson =new Gson();
		
		//String json = gson.toJson(list);
		//System.out.println("이게뭐로"+json);

	}
}
