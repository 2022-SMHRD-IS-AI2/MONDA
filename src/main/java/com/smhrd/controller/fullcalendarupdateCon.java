package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

import com.google.gson.JsonArray;
import com.smhrd.model.fullcalendarDAO;
import com.smhrd.model.fullcalendarupdateVO;

public class fullcalendarupdateCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		int cnt =0;
		String WORK_NAME = null;
		String WORK_S_DT = null;
		String WORK_E_DT = null;
		//효창 -response json으로응답인데 request 해야하는데 잘못적음
		//response.setContentType("application/x-json; charset=UTF-8");

		String data = request.getParameter("jsondata");
		
		System.out.println(data);

		//효창 - JsonArray 이거랑 JSONArray 문법다름 ㅅㅂ gson 문법을 불러오닌깐 계속 오류났던거임 
		JSONArray jarray = new JSONArray(data);
		for (int i = 0; i < jarray.length(); i++) {
		
			System.out.println(jarray.get(i));
			JSONObject jobj = new JSONObject(jarray.get(i).toString());
			//System.out.println(jobj.get("title"));
			//System.out.println(jobj.get("start"));
			//System.out.println(jobj.get("end"));
		
			
			WORK_NAME = String.valueOf(jobj.get("title"));
			WORK_S_DT = String.valueOf(jobj.get("start"));
			//효창 - 2023-01-17T00:00:00.000Z 으로나와서 오라클에서 인식 안됨  그래서 .substring(0,10); 사용하여 자름
			WORK_S_DT = WORK_S_DT.substring(0,10);
			WORK_E_DT = String.valueOf(jobj.get("end"));
			WORK_E_DT = WORK_E_DT.substring(0,10);
			//System.out.println("WORK_E_DT 자르기" + WORK_E_DT);
			
			fullcalendarupdateVO vo = new fullcalendarupdateVO(WORK_NAME, WORK_S_DT, WORK_E_DT);
			cnt = new fullcalendarDAO().upload(vo);
			
		}
		
		

		/* 효창 - split 사용하면 문자열길이가 다르면 잘못나옴
		 * dao vo String[] array = data.split("\""); // for(int i = 0; i < array.length;
		 * i++) { // System.out.print(array[i] + " "); // }
		 * System.out.println(array[3]); System.out.println(array[7]);
		 * System.out.println(array[11]);
		 * 
		 * String WORK_NAME= array[3]; String WORK_STATUS ="a"; String WORK_S_DT=
		 * array[7];
		/* String dateTime = array[11]; */
		// 스트링 데이터 타입포맷팅

		
		/* 효창- 이건 Timestamp 포메팅 인데 나중에는 그냥 string으로 받아서 필요 없어짐
		 * DateTimeFormatter formatDateTime =
		 * DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss"); LocalDateTime
		 * localDateTime = LocalDateTime.from(formatDateTime.parse(dateTime)); Timestamp
		 * ts = Timestamp.valueOf(localDateTime);
		 */


		if (cnt > 0) {
			System.out.println("업로드 성공");
		} else {
			System.out.println("업로드 실패");
		}

		response.sendRedirect("fullcalendar.jsp");

		// data는 string -> gson 사용해서 배열/객체로 변경해서 DB PrintWriter out =
		response.getWriter();

		
		/* 효창 - ㅅㅂ 이거 gson인데 조까튼 계속 json으로 하닌깐 안된거임 
		 * JsonParser parser = new JsonParser();
		 * 
		 * Object obj = parser.parse( data );
		 * 
		 * JsonObject jsonObj = (JsonObject) obj;
		 * 
		 * JsonElement title = jsonObj.get("title"); JsonElement start =
		 * jsonObj.get("start");
		 * System.out.println(""+(i+1)+"번째 멤버의 이름 : "+tempObj.get("name"));
		 */
		
	}
}
