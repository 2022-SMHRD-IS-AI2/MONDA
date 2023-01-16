package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class DAO {
// 코드차트 쓰기위한 DAO
	// DAO에서 호출했을 때 바로 DB와 연결할 수 있도록 SqlSessionManager사용
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	// 아래 메소드들에서 사용할 수 있는 sqlSession 생성
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	
	
	public String selectcount(String vo) {
		String count = null;

		try { // 만약 sql문이 잘못됐다거나, url이 잘못되었다던가하면 세션이 잘 생성이 안될 수도 있음

			// insert("실행할 sql 경로 정의", 넘겨줄 값)
			count = sqlSession.selectOne("com.smhrd.model.DAO.selectcount", vo);

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			
		}

		return count;
	}
	
	public int updatecount(VO vo) {
		int cnt = 0;

		try { // 만약 sql문이 잘못됐다거나, url이 잘못되었다던가하면 세션이 잘 생성이 안될 수도 있음

			// insert("실행할 sql 경로 정의", 넘겨줄 값)
			cnt = sqlSession.update("com.smhrd.model.DAO.updatecount", vo);

			if (cnt > 0) {
				sqlSession.commit();
				
			} else {
				sqlSession.rollback();
			}

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			sqlSession.close();
		}
		return cnt;
	}
	
	
	
	public List<VO> selectList() {
		
		List<VO> list = sqlSession.selectList("com.smhrd.model.DAO.selectList");
		sqlSession.close();
		return list;
	}
	
}
