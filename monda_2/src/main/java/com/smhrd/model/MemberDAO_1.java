package com.smhrd.model;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;



public class MemberDAO_1 {

	
	// DAO에서 호출했을 때 바로 DB와 연결할 수 있도록 SqlSessionManager사용
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	// 아래 메소드들에서 사용할 수 있는 sqlSession 생성
	SqlSession sqlSession = sqlSessionFactory.openSession();
	
	
	public int insert(MemberVO vo) {
		int cnt = 0;

		try { // 만약 sql문이 잘못됐다거나, url이 잘못되었다던가하면 세션이 잘 생성이 안될 수도 있음

			// insert("실행할 sql 경로 정의", 넘겨줄 값)
			cnt = sqlSession.insert("com.smhrd.model.MemberDAO_1.insert", vo);

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
	
	public MemberVO selectMember(MemberVO vo) {
		MemberVO loginMember = null;
		try {
			loginMember = sqlSession.selectOne("com.smhrd.model.MemberDAO_1.selectOne", vo);
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			sqlSession.close();
		}
		
		return loginMember;
	}
	
	public int updateMember(MemberVO vo) {
		int cnt = 0;

		try { // 만약 sql문이 잘못됐다거나, url이 잘못되었다던가하면 세션이 잘 생성이 안될 수도 있음

			// insert("실행할 sql 경로 정의", 넘겨줄 값)
			cnt = sqlSession.update("com.smhrd.model.MemberDAO_1.updateMember", vo);

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
	
	
	
	
	
	
}