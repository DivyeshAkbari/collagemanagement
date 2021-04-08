package com.collagemanagement.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import com.collagemanagement.bean.Semester;
import com.collagemanagement.bean.Stream;
import com.collagemanagement.bean.User;
import com.collagemanagement.dao.impl.Collagedaoimpl;
import com.collagemanagement.dao1.CollageDao;
import com.collagemanagement.service1.Collageservice;

//Pull 
public class Collageserviceimpl  implements Collageservice
{
	
	CollageDao dao=new Collagedaoimpl();
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

	public String saveuserdetails(User u1)
	{
		String messgae=null;
		try(Connection connection=getconnection();
			  )
		{
			 int count=dao.insertuserdetails(connection,u1);
			 System.out.println("Count is "+count);
			 if(count>0)
			 {
				 
				 messgae="Registrationsuccess";
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
	public User fetchlogindetails(User user)
	{
		try(Connection connection =getconnection();
			 )
		{
			return dao.getlogindetails(connection,user);
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public String getemail(String id)
	{
		try(Connection connection =getconnection();
			  )
		{
			 return dao.fetchemail(connection,id);
		}
		catch (SQLException e)
		{
			
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public User getfirstname(String username) 
	{
		try(Connection connection =getconnection();
			  )
		{
		 User u1=dao.fetchfname(connection,username);
		 System.out.println("Service layer called");
		 System.out.println("And value is "+u1.getMiddlename());
		
		 return u1;
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public String Updatepassword(User user)
	{
		try(Connection connection=getconnection();
			 )
		{	
			int i1=dao.Changepassword(connection,user);
			
			if(i1>0)
			{
				return "Password Update Successfully";
			}
			else
			{
				return "Password Not Updated Successfully";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<User> getuserdetails(String email)
	{
		List<User> user=null;
		try(Connection connection=getconnection();
			)
		{
			user=dao.fetchuserdetails(connection,email);
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	public String updatestudentdetails(User u1, String email)
	{
		try(Connection connection=getconnection();
			  )
		{
				int i1=dao.changestudentdetails(connection,u1,email);
				if(i1>0)
				{
					return"Updated";
				}
				else
				{
					return"not";
				}
		} 
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public List<Stream> fetchstreamdetails()
	{
		try(Connection connection=getconnection();
			  )
		{
			return dao.getstreamdetais(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public String activateaccount(String email, String hash)
	{
		
		try(Connection connection=getconnection();
			  )
		{
			int i1=dao.sendaccountactivatedmail(connection,email,hash); 
			
			if(i1>0)
			{
				return "success";
			}
			else
			{
				return "not";
			}
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


	public List<User> getstudentdetails()
	{
		List<User> user=null;
		try(Connection connection=getconnection();
			  )
		{
				user=dao.fetchstudentdetails(connection);
				System.out.println("Service in the action");
				System.out.println(user);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}


	public String deletstudentdetails(String id)
	{
		try(Connection connection=getconnection();
			  )
		{
				int i1=dao.removestudentdetails(connection,id);
				if(i1>0)
				{
					return "deleted";
				}
				else
				{
					return "not";
				}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


	public List<User> getFacultydetails()
	{
		List<User> user=null;
		try(Connection connection=getconnection();
			  )
		{
				user=dao.fetchfacultydetails(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}


	public String deletfacultydetails(String id)
	{
		try(Connection connection=getconnection();
				  )
			{
					int i1=dao.removefacultydetails(connection,id);
					if(i1>0)
					{
						return "deleted";
					}
					else
					{
						return "not";
					}
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return null;
	}


	public List<Semester> fetchSemDetails() 
	{
		try(Connection connection=getconnection();
			  )
		{
			return dao.getSemDetais(connection);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


	@Override
	public List<User> fetchStudentDetails(String streamid)
	{
		try(Connection c1=getconnection();
			 )
		{
			return dao.selectStudentDetails(c1,streamid);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


	@Override
	public String updateStudentStatus(String id)
	{
		try(Connection c1=getconnection();
			  )
		{
			int i1=dao.changeStudentStatus(c1,id);
			if(i1>0)
			{
				return "success";
			}
			else
			{
				return "not";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


	@Override
	public String deletStudentPermanently(String id) 
	{
		try(Connection c1=getconnection();
			  )
		{
			int i1=dao.deletStudent(c1,id);
			if(i1>0)
			{
				return "success";
			}
			else
			{
				return "not";
			
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


	@Override
	public int fetchStreamid(String id)
	{
		try(Connection c1=getconnection();
			  )
		{
			return dao.selectStreamid(c1,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}


	public String validEmail(String str) 
	{
		try(Connection c1=getconnection();
			 )
		{
			return dao.checkEmail(c1,str);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}


	@Override
	public String insertdate(String username,int i) {
		// TODO Auto-generated method stub
		
		try(Connection connection = getconnection())
		{
			return dao.updateloginuserdate(connection,username,i);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
}
