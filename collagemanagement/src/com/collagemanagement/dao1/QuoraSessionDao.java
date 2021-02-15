package com.collagemanagement.dao1;

import java.sql.Connection;
import java.util.List;

import com.collagemanagement.bean.Answer;
import com.collagemanagement.bean.QuoraSession;


public interface QuoraSessionDao {
	
	public int insertquestiondetails(Connection connection,QuoraSession query);
	
	public List<QuoraSession> selectquestiondetails(Connection connection);
	
	public int insertanswerdetails(Connection connection,Answer ans);

	public List<Answer> fetchansdetails(Connection connection, String id);

	public List<QuoraSession> getquestiondetails(Connection c1, String id);

}
