package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
@AllArgsConstructor 
@RequiredArgsConstructor
@NoArgsConstructor 
@Getter
public class fullcalendarVO {
	
	/*
	 * public fullcalendarVO(String WORK_NAME, String WORK_STATUS, String WORK_S_DT,
	 * String WORK_E_DT, String WORK_REQUESTER, String WORK_WRT, String WORK_COLOR)
	 * { // TODO Auto-generated constructor stub }
	 */
		private BigDecimal WORK_SEQ;//워크 순번
		@NonNull
		private String WORK_NAME;//워크 네임
		private String WORK_STATUS;//워크 상태
		@NonNull
		private String WORK_S_DT;//시작 날짜
		private String WORK_E_DT;//마감 날짜
		
		private String WORK_REQUESTER;//작업 요청자
		
		private String WORK_WRT;
		private int WORK_PRIORITY;//작업 우선순위
	    /*set/get메서드*/
	    
		
		
}
