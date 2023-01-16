package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Getter
@AllArgsConstructor
@RequiredArgsConstructor

	//워크스페이스 VO

public class WorkspaceVO {

	// 워크스페이스 번호 (work_seq, number)
	private BigDecimal work_num;
	
	// ---------------사용 안함------------
//	// 워크 색상 (work_color, varchar2)
//	@NonNull
//	private String work_color;
//	
//	// 작업 우선 순위 (work_priority, number)
//	@NonNull
//	private String work_priority;
	
	// ---------------화면에 드러나는 부분------------
	
	// 워크스페이스 이름 (work_name, varchar2)
	@NonNull
	private String work_name;
	
	// 워크스페이스 상태 (work_status, char1)
	// 계획 중, 진행 중, 완료
	@NonNull
	private String work_status;
	
	// 시작 날짜 (work_s_dt, date)
	private Timestamp work_start_date;
	
	// 마감 날짜 (work_3_dt, date)
	private Timestamp work_end_date;
	
	// 작업 요청자 (work_requester, varchar2)
	@NonNull
	private String work_requester;
	
	// 워크 작성자 (work_requester, varchar2)
	@NonNull
	private String work_writer;
}
