package com.collagemanagement.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import com.collagemanagement.bean.Answer;
import com.collagemanagement.bean.QuoraSession;
import com.collagemanagement.dao.impl.QuoraSessionImpl;
import com.collagemanagement.dao1.QuoraSessionDao;
import com.collagemanagement.service1.QuoraSessionService;


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
				
				// Database link, username and password
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
	public List<Answer> Getanswerdetails(String id) {
		// TODO Auto-generated method stub
	
		try(Connection connection=getconnection();
				  )
			{
				return  quorasessiondao.fetchansdetails( connection,id);
				
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
		
	}


	@Override
	public List<QuoraSession> GetQuestiondetails(String id) 
	{
		try(Connection c1=getconnection();
			  )
		{
			return quorasessiondao.getquestiondetails(c1,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}
}
