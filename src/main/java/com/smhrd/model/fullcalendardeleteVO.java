package com.smhrd.model;


import java.math.BigDecimal;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
@AllArgsConstructor 
@Getter
//효창-@NoArgsConstructor 이것만 생성 하닌깐 기본값 생성자로 con 함수 구성할때 충돌났음 그래서 @AllArgsConstructor이걸로 바꿈 

public class fullcalendardeleteVO {

	
	
	@NonNull
	private String WORK_NAME;//워크 네임
	
	
	// 삭제할때 하나의 데이터만 있으면 열데이터 전체삭제 할 수 있어서 나머지 필요없음
	/*private BigDecimal WORK_SEQ;//워크 순번
	 * private String WORK_STATUS;//워크 상태 private String WORK_S_DT;//시작 날짜 private
	 * String WORK_E_DT;//마감 날짜 private String WORK_REQUESTER;//작업 요청자 private
	 * String WORK_WRT; private String WORK_PROJECT;//작업 우선순위 private String
	 * WORK_TEXT;
	 */
}
