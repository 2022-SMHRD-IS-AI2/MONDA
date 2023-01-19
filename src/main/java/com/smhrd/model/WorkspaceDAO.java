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
	public int workload(WorkspaceVO vo) {
		int cnt = sqlSession.insert("WSupload", vo);
		sqlSession.close();
		
		return cnt;
	}

	// 워크스페이스 조회
	// 계획 중
	public List<WorkspaceVO> showWorkspace_1(String id){	
		// vo의 일부... work_wrt = getid로 변경해야함
		//System.out.println(vo.getWork_wrt()+" : 아이디");
		List<WorkspaceVO> listvo = sqlSession.selectList("showWorkspace_1", id);
		sqlSession.close();
		
		return listvo;
	}
	
		// 계획 중
	public List<WorkspaceVO> showWorkspace_2(String id){
		List<WorkspaceVO> listvo = sqlSession.selectList("showWorkspace_2", id);
		sqlSession.close();
		
		return listvo;
	}
	
		// 종료
	public List<WorkspaceVO> showWorkspace_3(String id){
		List<WorkspaceVO> listvo = sqlSession.selectList("showWorkspace_3", id);
		sqlSession.close();
		
		return listvo;
	}
}
