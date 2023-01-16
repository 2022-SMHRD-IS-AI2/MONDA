package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class fullcalendarDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	
	public List <fullcalendarVO> selectcalendar(fullcalendarVO vo) {

		List <fullcalendarVO> selectMember = null;

		try {

			selectMember = sqlSession.selectList("com.smhrd.model.fullcalendarDAO.calenList", vo);
			// commit / rollback 생략

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return selectMember;
	}
	
	
	/*
	 * public List<fullcalendarVO> selectCalendar(fullcalendarVO vo) {
	 * 
	 * List<fullcalendarVO> list = null;
	 * 
	 * try { list =
	 * sqlSession.selectOne("com.smhrd.model.fullcalendarDAO.calenList",vo);
	 * System.out.println("??"); // commit / rollback 생략 } catch (Exception e) {
	 * e.printStackTrace(); } finally { sqlSession.close(); } return list; }
	 */
}