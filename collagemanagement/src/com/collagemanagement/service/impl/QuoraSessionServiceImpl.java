package com.collagemanagement.service.impl;

import java.sql.Connection;

import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import com.collagemanagement.bean.Answer;
import com.collagemanagement.bean.QuoraSession;
import com.collagemanagement.bean.User;
import com.collagemanagement.dao.impl.QuoraSessionImpl;
import com.collagemanagement.dao1.QuoraSessionDao;
import com.collagemanagement.service1.QuoraSessionService;

//Pull 

public class QuoraSessionServiceImpl implements QuoraSessionService {

		QuoraSessionDao quorasessiondao = new QuoraSessionImpl();
		
		public static Connection getconnection()
		{
			Connection c1=null;
			try
			{
				Class.forName("com.mysql.cj.jdbc.Driver");
				c1=DriverManager.getConnection("jdbc:mysql://localhost:3306/educhamp_schema","root","root");
			}
			catch(SQLException  |ClassNotFoundException e)
			{
				e.printStackTrace();
			}
			return c1;
		}

		public static Connection getConnection() 
		{
			Connection conn=null;
			try {
				
				System.out.println("Connecting... ");
				
				Class.forName("com.mysql.jdbc.Driver");
				
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/educhamp_schema", "root", "root");
				System.out.println("Connection Succeeded");
				
			} catch (Exception e) {
				System.out.println(" Error at MySqlConnection.java: " + e);
			}
			
			return conn;
		}
	
	@Override
	public String savequestiondetails(QuoraSession query) {	
		// TODO Auto-generated method stub
		
		String messgae=null;
		try(Connection connection=getconnection();
			  )
		{
			 int count=quorasessiondao.insertquestiondetails(connection,query);
			 System.out.println("Count is "+count);
			 if(count>0)
			 {
				 
				 messgae="QueryInsertedSuccess";
			 }
			 else
			 {
				 messgae= "NotSuccess";
			 }
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return messgae;
		
	}

	@Override
	public List<QuoraSession> fetchquestiondetails() {
		// TODO Auto-generated method stub
		
		try(Connection connection =getconnection();
				 )
			{
				return quorasessiondao.selectquestiondetails(connection);
			}
			catch (SQLException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
	}

	@Override
	public String saveanswerdetails(Answer ans) {
		// TODO Auto-generated method stub
		
		String messgae=null;
		try(Connection connection=getconnection();
			  )
		{
			 int count=quorasessiondao.insertanswerdetails(connection, ans);
			 System.out.println("Count is "+count);
			 if(count>0)
			 {
				 
				 messgae="Answer Inserted Successfully";
			 }
			 else
			 {
				 messgae= "Not Success";
			 }
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return messgae;
	}

	@Override
	public List<Answer> fetchanswer(String id) {
		// TODO Auto-generated method stub
		
		try(Connection connection =getconnection();
				 )
			{
				return quorasessiondao.selectanswer(connection,id);
			}
			catch (SQLException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return null;
	}

	public List<QuoraSession> GetQuestiondetails(String id) 
	{
		List<QuoraSession> query=null;
		try(Connection c1=getconnection();
			  )
		{
		query =  quorasessiondao.getquestiondetails(c1,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return query;
	}


	public List<User> fetchimage() {
		// TODO Auto-generated method stub
		
		try(Connection c1=getconnection();
				  )
			{
				return quorasessiondao.getimage(c1);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
	}

	@Override
	public List<QuoraSession> fetchunanswerquestion() {
		// TODO Auto-generated method stub
		
		try(Connection connection =getconnection();
				 )
			{
				return quorasessiondao.selectunanswerquestion(connection);
			}
			catch (SQLException e) 
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;

	}

	@Override
	public String searchquestion(String question) {
		// TODO Auto-generated method stub
		
		try(Connection  connection = getconnection();
			)
		{
			return quorasessiondao.getsearchtopic(connection,question);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
	
	public String modifyAnswer(Answer answer) {
		// TODO Auto-generated method stub
		String Message = null;
		
		try(Connection  connection = getconnection();
				)
			{
				int updateRecordCount = quorasessiondao.updateAnswer(connection,answer);
				 
				 if(updateRecordCount>0)
					{
						 Message = "Updated Record Successfilly";
					}
					else
					{
						Message = "Record Not Updated";
					}
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return Message;
	}

	@Override
	public Answer getAnswer(String id) {
		// TODO Auto-generated method stub
		
		try(Connection connection = getconnection())
		{
			return quorasessiondao.fetchAnswer(connection,id);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String removeStudentDetails(String id,String userid) {
		// TODO Auto-generated method stub
		String message = null;
		try(Connection connection = getconnection())
		{
			//int ansId = Integer.parseInt(id);
			int deleteRecordId = quorasessiondao.deleteAnswerDescription(connection,id,userid);
			
			if (deleteRecordId > 0) {
				message = "Student deleted Successfully";
			} else {
				message = "Student delete failed";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return message;
	}

	@Override
	public List<QuoraSession> fetchTaglist() {
		// TODO Auto-generated method stub
		
		try(Connection connection = getconnection();)
		{
			return quorasessiondao.getTaglist(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int fetchTagid(String tagname)
	{
		try(Connection c1=getconnection();
			 )
		{
			return quorasessiondao.getTagId(c1,tagname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int insertTagDetails(String tagname) 
	{
		try(Connection c1=getconnection();
			 )
		{
			return quorasessiondao.insertTagDetails(c1,tagname);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<QuoraSession> fetchquestion(String decryptid)
	{
		try(Connection c1=getconnection();
			  )
		{
			return quorasessiondao.getquestion(c1,decryptid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}