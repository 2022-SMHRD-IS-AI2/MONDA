package com.smhrd.model;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class fullcalendarDAO {
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
				//효창- 처음 조회 할때 배열이닌깐 List <fullcalendarVO> 형태로 해야하는데
					 //string 형태로 하닌깐 값이 안불러짐
	public List <fullcalendarVO> selectcalendar(fullcalendarVO vo) {

		List <fullcalendarVO> selectMember = null;

		try {
												//효창 - com.smhrd.model.fullcalendarDAO.calenList이건 경로를 더정확하게 입력해주는거임
													  // 아무래도 여기는  Mepper에 resultType을써서 가능한듯 찾아보닌깐
			
													// resultType : select 된 데이터를 반환할 (그릇)을 정해주는것 위의 
													// 코드같은경우엔 StockNewsVO 객체에 담긴다
			
													// parameterType : 자바에서 String 값이 들어올거란걸 인지시켜주고 , 
													// 쿼리에서 자바에서 보낸 stk_nm을 사용한다
			selectMember = sqlSession.selectList("com.smhrd.model.fullcalendarDAO.calenList", vo);
			// commit / rollback 생략

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return selectMember;
	}
	
	public int upload(fullcalendarupdateVO vo) {
	       int cnt = sqlSession.insert("calenInsert", vo);
		   sqlSession.close();
		   
		   return cnt;
	   }
	
	public int calendelete(String WORK_NAME) {

		int cnt = 0;
		
		try {
									//효창- selectList 경로비슷하게"com.smhrd.model.fullcalendarDAO.calendelete" 사용하닌깐 오류남
										 //fullcalendarMapper.xml 삭제 ID 값인 calendelete 사용 후 고침
			cnt = sqlSession.delete("calendelete",WORK_NAME);
			if(cnt > 0) {
				sqlSession.commit();
			}else {
				sqlSession.rollback();
			}
			
			// commit / rollback 생략
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
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
