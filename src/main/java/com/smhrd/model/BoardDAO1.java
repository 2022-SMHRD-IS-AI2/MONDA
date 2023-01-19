package com.smhrd.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;


public class BoardDAO1 {

	   // DAO 에서 호출했을 때 바로 DB 와 연결할 수 있도록 SqlSessionManager 사용
	   SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	   // 아래 메소드들에서 사용할 수 있는 sqlSession 생성
	   // true 넣으면 auto commit
	   SqlSession sqlSession = sqlSessionFactory.openSession(true);
	    
	   public int upload(BoardVO vo) {
	       int cnt = sqlSession.insert("upload", vo);
		   sqlSession.close();
		   
		   return cnt;
	   }
	   
	   public List<BoardVO> showBoard() {
		   
		   List<BoardVO> vo = sqlSession.selectList("com.smhrd.model.BoardDAO.showBoard");
		   return vo;
	   }
	   
	   public BoardVO detailBoard(int FILE_SEQ) {
		   
		   
		   BoardVO vo =  sqlSession.selectOne("com.smhrd.model.BoardDAO.detailBoard",FILE_SEQ);
           sqlSession.close();
		   
           return vo;
		   
	   }
	   
	   public int updatSize(MemberVO vo) {

			int cnt = 0;

			try { // 만약 sql문이 잘못됐다거나, url이 잘못되었다던가하면 세션이 잘 생성이 안될 수도 있음

				// insert("실행할 sql 경로 정의", 넘겨줄 값)
				cnt = sqlSession.update("com.smhrd.model.boardDAO1.updateboard", vo);

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
