package com.collagemanagement.dao1;

import java.sql.Connection;
import java.util.List;

import com.collagemanagement.bean.Answer;
import com.collagemanagement.bean.QuoraSession;
import com.collagemanagement.bean.User;


public interface QuoraSessionDao {
	
	public int insertquestiondetails(Connection connection,QuoraSession query);
	
	public List<QuoraSession> selectquestiondetails(Connection connection);
	
	public int insertanswerdetails(Connection connection,Answer ans);

	public List<QuoraSession> getquestiondetails(Connection  connection, String id);

	public List<Answer> selectanswer(Connection connection, String id);

	public List<User> getimage(Connection c1);

	public List<QuoraSession> selectunanswerquestion(Connection connection);

	public String getsearchtopic(Connection connection, String question);

	public int updateAnswer(Connection connection, String id, Answer ans);

}
