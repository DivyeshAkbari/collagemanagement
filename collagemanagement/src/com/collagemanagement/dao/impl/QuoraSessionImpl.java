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
	public int insertquestiondetails(Connection connection,QuoraSession query) 
	{
		// TODO Auto-generated method stub
		
		int insertedRaws=0;
		try(PreparedStatement p1=connection.prepareStatement("insert into question_table(c_question_topic,c_question_description,c_question_category_type,i_user_id,c_Name,is_active,date,image,i_tag_id) values (?,?,?,?,?,?,?,?,?)");
				)
		{
			/* System  Date **/
			
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
			p1.setBlob(8, query.getUserProfilepicStream());
			p1.setInt(9, query.getTagid());
			insertedRaws=p1.executeUpdate();				
			
			if(insertedRaws==1)
			{
				System.out.println("Query Registered Successfully");
			}
				
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return insertedRaws;
	}
	
//
	@Override
	public List<QuoraSession> selectquestiondetails(Connection connection) {
		// TODO Auto-generated method stub
		
		List<QuoraSession> querylist = new ArrayList<>();
		
		
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
					
					byte [] imagedata=r1.getBytes("image");
					
					if(null!=imagedata && imagedata.length>0)
					{
						String imagestr=Base64.getEncoder().encodeToString(imagedata);
						q1.setUserProfilepic(imagestr);
					}
					
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
		try(PreparedStatement p1=connection.prepareStatement("insert into answer_table(c_answer_description,i_user_id,c_Name,i_question_id,"
				+ "date,user_image) values (?,?,?,?,?,?)",Statement.RETURN_GENERATED_KEYS);
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
			p1.setString(5, dtf.format(now));
			p1.setBlob(6, ans.getUserProfilepicStream());
			
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
		try(PreparedStatement p1= connection.prepareStatement("Select c_question_topic,c_question_description,c_Name,i_question_id,image  from question_table where i_question_id =?");
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
						
						byte [] imagedata=r1.getBytes("image");
						
						if(null!=imagedata && imagedata.length>0)
						{
							String imagestr=Base64.getEncoder().encodeToString(imagedata);
							q1.setUserProfilepic(imagestr);
						}
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
		//,c_Name kadhelu 6 pa6i add kari devu
		try(PreparedStatement p1=connection.prepareStatement("Select c_answer_description,i_answer_id,c_Name,user_image,i_user_id "
				+ " from answer_table where i_question_id =?");
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
					    ans.setAnswerid(r1.getInt("i_answer_id"));
					    ans.setUserid(r1.getInt("i_user_id"));
					    byte [] imagedata=r1.getBytes("user_image");
						
						if(null!=imagedata && imagedata.length>0)
						{
							String imagestr=Base64.getEncoder().encodeToString(imagedata);
							ans.setUserProfilepic(imagestr);
						}
					    
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
					
					 byte[] imagedata = r1.getBytes("image");
					 if(null!=imagedata && imagedata.length>0)
					 {
						 String imagestr = Base64.getEncoder().encodeToString(imagedata);
						 q1.setUserProfilepic(imagestr);
					 }
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
	
	public int updateAnswer(Connection connection, Answer answer) {
		// TODO Auto-generated method stub
		
		String updateQuery ="update answer_table set c_answer_description = ? where i_answer_id = ?";
		
		try(PreparedStatement preparedStatement = connection.prepareStatement(updateQuery))
		{
			preparedStatement.setString(1,answer.getAnswerdescription());
			preparedStatement.setInt(2, answer.getAnswerid());
			
			return preparedStatement.executeUpdate();
			
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public Answer fetchAnswer(Connection connection, String id) {
		// TODO Auto-generated method stub
		
		Answer answer = new Answer();
		
		try(PreparedStatement p1 = connection.prepareStatement("select c_answer_description from answer_table where i_answer_id=?");)
		{
			p1.setInt(1, Integer.parseInt(id));
			
			
			try(ResultSet r1 =  p1.executeQuery())
			{
					while(r1.next())
				{
					answer.setAnswerdescription(r1.getString("c_answer_description"));
					
//					String value = r1.getString("c_answer_description");
//					return value;
				}	
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return answer;
	}

	@Override
	public int deleteAnswerDescription(Connection connection, String ansId,String userid) {
		// TODO Auto-generated method stub
		try(PreparedStatement preparedStatement = connection.prepareStatement("delete * from answer_table where  i_answer_id= ? AND i_user_id=?"))
		{
			preparedStatement.setInt(1, Integer.parseInt(ansId));
			preparedStatement.setInt(2, Integer.parseInt(userid));
			return preparedStatement.executeUpdate();
		}catch(Exception exception) {
			exception.printStackTrace();
		}	
		return 0;
	}
	@Override
	public List<QuoraSession> getTaglist(Connection connection) {
		// TODO Auto-generated method stub
		
		List<QuoraSession> taglist = new ArrayList<>();
				
		try(PreparedStatement p1 = connection.prepareStatement("select c_tag_name,i_tag_id from tag_table");)
		{
			try(ResultSet resultSet = p1.executeQuery())
			{
				while(resultSet.next())
				{
					int counter=0;
					QuoraSession query = new QuoraSession();
					
					int tagid=resultSet.getInt("i_tag_id");
					
					try(PreparedStatement p2=connection.prepareStatement("select i_question_id from question_table  where i_tag_id=?");
						  )
					{
						p2.setInt(1, tagid);
						
						try(ResultSet r1=p2.executeQuery(); 
							  )
						{
								while(r1.next())
								{
									counter++;
									if(counter==3)
									{
										break;
									}
								}
							}
						}
					
					if(counter==3)
					{
						query.setTagid(resultSet.getInt("i_tag_id"));
						query.setTagname(resultSet.getString("c_tag_name"));
						taglist.add(query);
					}	
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return taglist;
	}
	@Override
	public int getTagId(Connection c1, String tagname)
	{
		
		try(PreparedStatement p1=c1.prepareStatement("Select i_tag_id from tag_table where c_tag_name=?");
			  )
		{
			p1.setString(1, tagname);
			try(ResultSet r1=p1.executeQuery(); 
				  )
			{
				if(r1.next())
				{
					return r1.getInt(1);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	@Override
	public int insertTagDetails(Connection c1, String tagname) 
	{
		try(PreparedStatement p1=c1.prepareStatement("insert into tag_table (c_tag_name) values(?)",Statement.RETURN_GENERATED_KEYS);
			 )
		{
			p1.setString(1, tagname);
			
			int insertedraw=p1.executeUpdate();
			
			if(insertedraw>0)
			{
				try(ResultSet r1=p1.getGeneratedKeys(); 
					  )
				{
					if(r1.next())
					{
						return  r1.getInt(1);
					}
				}
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<QuoraSession> getquestion(Connection c1, String decryptid) 
	{
		List<QuoraSession> questionlist=new ArrayList<>();
		try(PreparedStatement p1=c1.prepareStatement("select * from question_table where i_tag_id=?");
			  )
		{
			p1.setInt(1, Integer.parseInt(decryptid));
			try(ResultSet r1=p1.executeQuery();
				  )
			{
				while(r1.next())
				{
					QuoraSession q1=new QuoraSession();
					q1.setQueryId(r1.getInt("i_question_id"));
					q1.setTopicname(r1.getString("c_question_topic"));
					q1.setUsername(r1.getString("c_Name"));
					
					byte b1[]=r1.getBytes("image");
					 if(null!=b1 && b1.length>0)
					 {
						 String imagestr = Base64.getEncoder().encodeToString(b1);
						 q1.setUserProfilepic(imagestr);
					 }
					
					questionlist.add(q1);
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return questionlist;
	}
}