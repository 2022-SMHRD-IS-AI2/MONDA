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
	
	// ---------------화면에 드러나는 부분------------
	// 워크스페이스 이름 (work_name, varchar2)
	@NonNull
	private String work_name;

	// 워크스페이스 상태 (work_status, char1)
	// 계획 중, 진행 중, 완료
	private String work_status;

	// 시작 날짜 (work_s_dt, date)
	private String work_s;
	
	// 마감 날짜 (work_e_dt, date)
	private String work_e;
	
	// 작업 요청자 (work_requester, varchar2)
	@NonNull
	private String work_requester;
	
	// 워크 작성자 (work_wrt, varchar2)
	@NonNull
	private String work_wrt;
	
	// 소속 프로젝트 (work_project, varchar2)
	@NonNull
	private String project_name;
	
	// 워크 내용 (work_text, varchar2 4000)
	@NonNull
	private String work_text;
}
