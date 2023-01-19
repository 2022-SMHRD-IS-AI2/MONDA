package com.smhrd.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;

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
		response.setContentType("application/x-json; charset=UTF-8");

		String data = request.getParameter("jsondata");
		System.out.println(data);

		JSONArray jarray = new JSONArray(data);
		for (int i = 0; i < jarray.length(); i++) {
		
			System.out.println(jarray.get(i));
			JSONObject jobj = new JSONObject(jarray.get(i).toString());
			//System.out.println(jobj.get("title"));
			//System.out.println(jobj.get("start"));
			//System.out.println(jobj.get("end"));
		
			
			WORK_NAME = String.valueOf(jobj.get("title"));
			WORK_S_DT = String.valueOf(jobj.get("start"));
			WORK_S_DT = WORK_S_DT.substring(0,10);
			WORK_E_DT = String.valueOf(jobj.get("end"));
			WORK_E_DT = WORK_E_DT.substring(0,10);
			//System.out.println("WORK_E_DT 자르기" + WORK_E_DT);
			
			fullcalendarupdateVO vo = new fullcalendarupdateVO(WORK_NAME, WORK_S_DT, WORK_E_DT);
			cnt = new fullcalendarDAO().upload(vo);
			
		}
		
		

		/* split 사용하면 문자열이 다르면 잘못나옴
		 * dao vo String[] array = data.split("\""); // for(int i = 0; i < array.length;
		 * i++) { // System.out.print(array[i] + " "); // }
		 * System.out.println(array[3]); System.out.println(array[7]);
		 * System.out.println(array[11]);
		 * 
		 * String WORK_NAME= array[3]; String WORK_STATUS ="a"; String WORK_S_DT=
		 * array[7];
		 /
		/* String dateTime = array[11]; */
		// 스트링 데이터 타입포맷팅

		/*
		 * DateTimeFormatter formatDateTime =
		 * DateTimeFormatter.ofPattern("dd/MM/yyyy HH:mm:ss"); LocalDateTime
		 * localDateTime = LocalDateTime.from(formatDateTime.parse(dateTime)); Timestamp
		 * ts = Timestamp.valueOf(localDateTime);
		 */

		/*
		 * String WORK_REQUESTER = "a"; String WORK_WRT = "a"; String WORK_PROJECT =
		 * "a"; String WORK_TEXT = "a";
		 */

		/*
		 * fullcalendarupdateVO vo = new fullcalendarupdateVO(WORK_NAME, WORK_STATUS,
		 * WORK_S_DT, WORK_E_DT, WORK_REQUESTER, WORK_WRT, WORK_PROJECT, WORK_TEXT);
		 */

		

		if (cnt > 0) {
			System.out.println("업로드 성공");
		} else {
			System.out.println("업로드 실패");
		}

		response.sendRedirect("fullcalendar.jsp");

		// data는 string -> gson 사용해서 배열/객체로 변경해서 DB PrintWriter out =
		response.getWriter();

		/*
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

		/*
		 * //문자열 배열로 변경 String[] strToStrArray = data.split(",");
		 * 
		 * for (int i=0; i < strToStrArray.length; i++)
		 * System.out.println("strToStrArray[" + i+ "]=" + strToStrArray[i]);
		 */

		/*
		 * // 문자열 parsing JsonElement element = JsonParser.parseString(data);
		 * System.out.println("data"+data);
		 * 
		 * // element가 Object 타입인 경우 JsonObject 타입으로 변환 JsonObject object =
		 * element.getAsJsonObject();
		 */

		/*
		 * // title 값 확인 (배열) JsonArray titles = object.get("title").getAsJsonArray();
		 * JsonArray starts = object.get("start").getAsJsonArray(); JsonArray ends =
		 * object.get("end").getAsJsonArray();
		 * 
		 * for (int i = 0; i < titles.size(); i++) { String title =
		 * titles.get(i).getAsString(); String start = starts.get(i).getAsString();
		 * String end = ends.get(i).getAsString(); System.out.println("title[" + i +
		 * "] : " + title); System.out.println("title[" + i + "] : " + start);
		 * System.out.println("title[" + i + "] : " + end);
		 */

	}

	/*
	 * // id 값 확인 (primitive type) String title = object.get("title").getAsString();
	 * System.out.println("title : " + title); // id : 1
	 * 
	 * int row = 1; if (row > 0) { out.print("성공"); } else { out.print("실패"); }
	 */

	/*
	 * // // PrintWriter out = response.getWriter();
	 * 
	 * gson 사용해서 배열/객체로 변경해서 DB에 값 넣고 값 넣기 성공했을 때 ㄱ
	 * 
	 * 
	 * 
	 * JsonArray up = new JsonArray();
	 * 
	 * for (int i = 0; i < list.size(); i++) {
	 * 
	 * String WORK_NAME = (String) list.get(i).get("title"); String WORK_S_DT =
	 * (String) list.get(i).get("start"); String WORK_E_DT = (String)
	 * list.get(i).get("end");
	 * 
	 * System.out.print( up.add(WORK_NAME)); up.add(WORK_NAME); up.add(WORK_S_DT);
	 * up.add(WORK_E_DT);
	 * 
	 * 
	 * } }
	 */
}
