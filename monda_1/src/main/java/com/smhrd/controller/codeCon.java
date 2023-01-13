package com.smhrd.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.smhrd.model.DAO;
import com.smhrd.model.VO;

public class codeCon extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Date nowDate = new Date();
		
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yy/MM/dd");
		String codedate = simpleDateFormat.format(nowDate); 
		
	
		DAO dao = new DAO();
		int count =Integer.parseInt(dao.selectcount(codedate));
		 
		VO vo = new VO(count, codedate);
		int cnt = dao.updatecount(vo);
		if(cnt > 0) {
			System.out.println("수정완료");
		}else {
			System.out.println("수정실패");
		}
		response.sendRedirect("codechart.jsp");
	}

}
