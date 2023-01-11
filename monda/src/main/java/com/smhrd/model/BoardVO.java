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
public class BoardVO {
	
	private BigDecimal FILE_SEQ;
	private BigDecimal WORK_SEQ;
	
	@NonNull
	private String FILE_NAME;
	@NonNull
	private String REAL_FILE_NAME;
	@NonNull
	private String EXT;
	@NonNull
	private BigDecimal FILE_SIZE;
	@NonNull
	private String FILE_MEMO;
	
//	private BigDecimal num;
//	@NonNull
//	private String title;
//	@NonNull
//	private String writer;
//	@NonNull
//	private String filename;
//	@NonNull
//	private String content;
//	private Timestamp b_date;
	
}
