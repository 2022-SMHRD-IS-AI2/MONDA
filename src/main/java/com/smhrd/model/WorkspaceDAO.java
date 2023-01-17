package com.smhrd.model;


import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import com.smhrd.database.SqlSessionManager;

public class WorkspaceDAO {
	
	//DAO 호출 시 DB연결
	SqlSessionFactory sqlSessionFactory = SqlSessionManager.getSqlSession();
	
	//autocommit
	SqlSession sqlSession = sqlSessionFactory.openSession(true);
	
	//SELSET * FROM T_WORKSPACE where WORK_WRT=(현재 접속한 사람);
	//INSERT INTO T_WORKSPACE VALUES (work_name, work_status, work_s_dt, work_e_dt, work_requester, work_wrt)
	
	// 워크스페이스 작성
	public int upload(WorkspaceVO vo) {
		int cnt = sqlSession.insert("upload", vo);
		sqlSession.close();
		
		return cnt;
	}

	// 워크스페이스 조회
	public List<WorkspaceVO> showworkspace(){
		List<WorkspaceVO> vo = sqlSession.selectList("com.smhrd.model.WorkspaceDAO.showworkspace");
		sqlSession.close();
		return vo;
	}
}
