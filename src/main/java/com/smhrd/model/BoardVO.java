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
	
		
		// @NonNull 값인것만 사용하기에 VO로 불러올때 이렇게 구성됨
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
		private Timestamp T_UPLOADDAY;
		
		
}
