package com.smhrd.model;

import java.math.BigDecimal;
import java.sql.Date;
import java.sql.Timestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@AllArgsConstructor
@RequiredArgsConstructor
@NoArgsConstructor
	//워크스페이스 VO
public class WorkspaceVO {
	// 워크스페이스 번호 (work_seq, number)
	// private BigDecimal work_num;
	
	// ---------------화면에 드러나는 부분------------
	// 소속 프로젝트 (work_project, varchar2)
	@NonNull
	private String work_project;
	
	// 워크스페이스 이름 (work_name, varchar2)
	@NonNull
	private String work_name;

	// 시작 날짜 (work_s_dt, date)
	private Date work_s_dt;
	
	// 마감 날짜 (work_e_dt, date)
	private Date work_e_dt;
	
	// 워크스페이스 상태 (work_status, char1)
	// 계획 중, 진행 중, 완료
	private String work_status;
	
	// 워크 작성자 (work_wrt, varchar2)
	@NonNull
	private String work_wrt;

	// 작업 요청자 (work_requester, varchar2)
	@NonNull
	private String work_requester;
	
	// 워크 내용 (work_text, varchar2 4000)
	@NonNull
	private String work_text;
}
