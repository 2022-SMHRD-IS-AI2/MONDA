package com.smhrd.model;

import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
@AllArgsConstructor 
@RequiredArgsConstructor
@NoArgsConstructor 
@Getter
public class fullcalendarupdateVO {

	private BigDecimal WORK_SEQ;//워크 순번
	@NonNull
	private String WORK_NAME;//워크 네임
	private String WORK_STATUS;//워크 상태
	@NonNull
	private String WORK_S_DT;//시작 날짜
	@NonNull
	private String WORK_E_DT;//마감 날짜
	private String WORK_REQUESTER;//작업 요청자
	private String WORK_WRT;
	private String WORK_PROJECT;//작업 우선순위
	private String WORK_TEXT;
}
