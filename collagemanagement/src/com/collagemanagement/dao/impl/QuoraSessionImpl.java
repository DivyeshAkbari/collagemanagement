package com.collagemanagement.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.collagemanagement.bean.Answer;
import com.collagemanagement.bean.QuoraSession;
import com.collagemanagement.bean.User;
import com.collagemanagement.dao1.QuoraSessionDao;
import com.mysql.cj.protocol.Resultset;   

public class QuoraSessionImpl implements QuoraSessionDao {

	@Override
	public int insertquestiondetails(Connection connection,QuoraSession query) {
		// TODO Auto-generated method stub
		
		int insertedRaws=0;
		try(PreparedStatement p1=connection.prepareStatement("insert into question_table(c_question_topic,c_question_description,c_question_category_type,i_user_id,c_Name,is_active,date,tag) values (?,?,?,?,?,?,?,?)");
				)
		{
			/* System  Date */
			
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
			LocalDateTime now = LocalDateTime.now();  
			System.out.println(dtf.format(now));  
			
			p1.setString(1, query.getTopicname());
			p1.setString(2,query.getTdescription());
			p1.setString(3,query.getCtype());	
			p1.setInt(4,query.getUserid());
			p1.setString(5, query.getUsername());
			p1.setInt(6,query.getIs_active());
			p1.setString(7, dtf.format(now));
			p1.setString(8, query.getTag());
		
			insertedRaws=p1.executeUpdate();	
			
			if(insertedRaws==1)
			{
				System.out.println("Query Registered Successfully");
			}
		}catch (SQLException e)
		{
			e.printStackTrace();
		}
			
		return insertedRaws;
	}

	@Override
	public List<QuoraSession> selectquestiondetails(Connection connection) {
		// TODO Auto-generated method stub
		
		List<QuoraSession> querylist = new ArrayList<>();
		
		//Select c_email,c_hash,i_status from user_table where c_email=? AND c_hash=? AND i_status=0
		try(PreparedStatement p1=connection.prepareStatement("Select * from question_table");
			  )
		{
				try(ResultSet r1=p1.executeQuery();
				  )
			{
				while(r1.next())
				{
					QuoraSession q1 = new QuoraSession();
					
					q1.setQueryId(r1.getInt("i_question_id"));
					q1.setTopicname(r1.getString("c_question_topic"));
					q1.setTdescription(r1.getString("c_question_description"));
					q1.setCtype(r1.getString("c_question_category_type"));
					q1.setUsername(r1.getString("c_Name"));
					
					querylist.add(q1);
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return querylist;
	}

	@Override
	public int insertanswerdetails(Connection connection, Answer ans) {
		// TODO Auto-generated method stub
		
		int insertedRaws=0;
		try(PreparedStatement p1=connection.prepareStatement("insert into answer_table(c_answer_description,i_user_id,c_Name,i_question_id,date) values (?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
				)
		{ 
			
			/* System  Date */
			
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
			LocalDateTime now = LocalDateTime.now();  
			System.out.println(dtf.format(now));  
			
			p1.setString(1, ans.getAnswerdescription());
			p1.setInt(2,ans.getUserid());
			p1.setString(3, ans.getUsername());
			p1.setInt(4, ans.getQueryId());
//			p1.setBlob(5, ans.getUserProfilepicStream());
			p1.setString(5, dtf.format(now));
			
			insertedRaws = p1.executeUpdate();
			int id = 0;
			
			
			if(insertedRaws>0)
			{
				try(	ResultSet r1 = p1.getGeneratedKeys();)
				{
					if(r1.next()) {
						
						System.out.println("If Executed");
						id = r1.getInt(1);
						System.out.println("Answerid is->"+id);
					}
				}
			}
			
			int questionid = 0 ;
			
			try(PreparedStatement preparedStatement = connection.prepareStatement("select i_question_id from  answer_table where i_answer_id=?");
				  )
			{
				preparedStatement.setInt(1, id);
				try (ResultSet r1 = preparedStatement.executeQuery();)
				{
					if(r1.next())
					{
						questionid  = r1.getInt(1);
						System.out.println("Questionid ->"+questionid);
					}
				}
			}catch (SQLException e)
			{
				e.printStackTrace();
			}
				
		
						try(PreparedStatement p2=connection.prepareStatement("Update question_table set is_active=1 where i_question_id=?"); 
							  )
						{		
							p2.setInt(1, questionid);
						    p2.executeUpdate();
						}
						catch (SQLException e)
						{
							e.printStackTrace();
						}
		
			if(insertedRaws==1)
			{
				System.out.println("Answer Registered Successfully");
			}
		}
		
		catch (SQLException e)
		{
			e.printStackTrace();
		}
			
		return insertedRaws;
	
	}

	@Override
	public List<QuoraSession> getquestiondetails(Connection  connection, String id)
	{
		List<QuoraSession> querylist = new ArrayList<>();
		try(PreparedStatement p1= connection.prepareStatement("Select c_question_topic,c_question_description,c_Name,i_question_id  from question_table where i_question_id =?");
				  )
			{
				p1.setInt(1,Integer.parseInt(id));
					try(ResultSet r1=p1.executeQuery();
					  )
				{
					while(r1.next())
					{
						QuoraSession q1 = new QuoraSession();
						q1.setTopicname(r1.getString("c_question_topic"));
						q1.setTdescription(r1.getString("c_question_description"));
						q1.setUsername(r1.getString("c_Name"));
						q1.setQueryId(r1.getInt("i_question_id"));
				//		q1.setUserProfilepic(r1.getString("image"));
						querylist.add(q1);
					}
				}
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

			return querylist;
	}

	@Override
	public List<Answer> selectanswer(Connection connection,String id) {
		// TODO Auto-generated method stub
		
		List<Answer> anslist = new ArrayList<>();
		try(PreparedStatement p1=connection.prepareStatement("Select c_answer_description,c_Name  from answer_table where i_question_id =?");
				  )
			{
					p1.setInt(1, Integer.parseInt(id));
					try(ResultSet r1=p1.executeQuery();
					  )
				{
					while(r1.next())
					{
						
						Answer ans = new Answer();
					
						ans.setAnswerdescription(r1.getString("c_answer_description"));
						ans.setUsername(r1.getString("c_Name"));
				
						anslist.add(ans);
					}
				}
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return anslist;
	}

	@Override
	public List<User> getimage(Connection c1) {
		// TODO Auto-generated method stub
		
		List<User> imagelist = new ArrayList<>();
		try(PreparedStatement p1=c1.prepareStatement("Select *  from user_table ");
				  )
			{
			
					try(ResultSet r1=p1.executeQuery();
					  )
				{
					while(r1.next())
					{
						User user = new User();
						user.setId(r1.getInt("i_user_id"));
						
					 byte[] imagedata = r1.getBytes("image");
					 if(null!=imagedata && imagedata.length>0)
					 {
						 String imagestr = Base64.getEncoder().encodeToString(imagedata);
						 user.setUserProfilepicString(imagestr);
					 }
					 	imagelist.add(user);
					}
				}
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return imagelist;
	
	}

	@Override
	public List<QuoraSession> selectunanswerquestion(Connection connection) {
		// TODO Auto-generated method stub
		
		List<QuoraSession> unanswerlist = new ArrayList<>();
		
		//Select c_email,c_hash,i_status from user_table where c_email=? AND c_hash=? AND i_status=0
		try(PreparedStatement p1=connection.prepareStatement("Select * from question_table where is_active=0");
			  )
		{
				try(ResultSet r1=p1.executeQuery();
				  )
			{
				while(r1.next())
				{
					QuoraSession q1 = new QuoraSession();
					
					q1.setQueryId(r1.getInt("i_question_id"));
					q1.setTopicname(r1.getString("c_question_topic"));
					q1.setUsername(r1.getString("c_Name"));
					
					unanswerlist.add(q1);
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return unanswerlist;
		
	}

	@Override
	public String getsearchtopic(Connection connection,String question) {
		// TODO Auto-generated method stub
		
		try(PreparedStatement p1 = connection.prepareStatement("select c_question_topic from question_table where c_question_topic=?");
			)
		{
			p1.setString(1,question);
			try(ResultSet resultset = p1.executeQuery();)
			{
				if(resultset.next())
				{
					String value = resultset.getString("c_question_topic");
					return value;
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	@Override
	public int updateAnswer(Connection connection, String id, Answer ans) {
		// TODO Auto-generated method stub
		
		String updateQuery ="update answer_table set c_answer_description = ? where i_answer_id = ? and i_question_id = ? and i_user_id = ?";
		
		try(PreparedStatement preparedStatement = connection.prepareStatement(updateQuery))
		{
			preparedStatement.setString(1,ans.getAnswerdescription());
			preparedStatement.setInt(2, ans.getAnswerid());
			preparedStatement.setInt(3, ans.getQueryId());
			preparedStatement.setInt(4, ans.getUserid());
			
			return preparedStatement.executeUpdate();
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return 0;
	}
}