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
	    
	   //select * from web_board;
	   //insert into web_board values(num_board.nextval,title,writer,filename,content,sysdate) 
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
}
