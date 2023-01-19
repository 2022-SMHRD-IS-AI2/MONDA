package com.smhrd.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.smhrd.model.fullcalendarDAO;
import com.smhrd.model.fullcalendarVO;
import com.smhrd.model.fullcalendardeleteVO;
import com.smhrd.model.fullcalendarupdateVO;

public class fullcalendardeleteCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String WORK_NAME = null;
		int cnt =0;
		request.setCharacterEncoding("UTF-8");
		
		
		String data = request.getParameter("jsondata");
		//System.out.println(data);
		
		JSONArray jarray = new JSONArray(data);
		
		
		for (int i = 0; i < jarray.length(); i++) {
			System.out.println(jarray.get(i));
			JSONObject jobj = new JSONObject(jarray.get(i).toString());
			System.out.println(jobj.get("title"));
			//System.out.println(jobj.get("start"));
			//System.out.println(jobj.get("end"));
		
			//효창 - 어차피 하나의 값만 있으면 오라클에서 그값에 해당하는 열 전체 삭제 해줘서 하나만 사용함
			WORK_NAME = String.valueOf(jobj.get("title"));
		
			fullcalendardeleteVO vo = new fullcalendardeleteVO(WORK_NAME);
			
			fullcalendarDAO dao = new fullcalendarDAO();

			
			cnt = new fullcalendarDAO().calendelete(WORK_NAME);
			
		}
		
		
		//fullcalendarVO vo =new fullcalendarVO();
		
		
		
		
		if(cnt > 1) {
	    	System.out.println(cnt);
	    	System.out.println("삭제 성공");
            //response.sendRedirect("select.jsp");	    
	    }else {
	    	System.out.println("삭제 실패");
	    	//response.sendRedirect("select.jsp");
	    }

		//효창 -  오 response이게 마지막으로 두는줄 알았는데 위에 둬도 코드아래께 인식이 되네?
		response.setContentType("application/x-json; charset=UTF-8");


	}

}
