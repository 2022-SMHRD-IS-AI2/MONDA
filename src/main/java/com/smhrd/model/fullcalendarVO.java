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
	
		private BigDecimal WORK_SEQ;//워크 순번
		@NonNull
		private String WORK_NAME;//워크 네임
		private String WORK_STATUS;//워크 상태
		@NonNull
		private String WORK_S_DT;//시작 날짜
		private Timestamp WORK_E_DT;//마감 날짜
		
		private String WORK_REQUESTER;//작업 요청자
		
		private String WORK_COLOR;//워크 칼라
		private int WORK_PRIORITY;//작업 우선순위
	    /*set/get메서드*/
	    
		
}
