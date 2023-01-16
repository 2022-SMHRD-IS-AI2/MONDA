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
	
	//select * from T_WORKSPACE where (접속한 사람 id)
	
}
