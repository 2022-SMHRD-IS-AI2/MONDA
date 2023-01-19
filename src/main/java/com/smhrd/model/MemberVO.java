package com.smhrd.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

//@Data // 기본생성자, getter, setter, toString, equals...
@AllArgsConstructor // 모든 파라미터를 받는 생성자
@RequiredArgsConstructor // final or @NonNull 파라미터만 받는 생성자
@NoArgsConstructor // 기본생성자
@Getter // getter메소드
@Setter
public class MemberVO {
	
//	private final String email;
//	private final String pw;
	
	@NonNull
	private String m_id;
	@NonNull
	private String m_pw;
	private String m_name;
	private String m_email;
	private String m_nick;
	private String m_profile_img;
	private String m_joindate;
	private String m_type;
	
}