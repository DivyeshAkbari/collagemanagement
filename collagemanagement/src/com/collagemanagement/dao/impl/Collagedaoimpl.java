package com.collagemanagement.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.collagemanagement.bean.Stream;
//import com.collagemanagement.bean.Log;
import com.collagemanagement.bean.User;
import com.collagemanagement.dao1.CollageDao;
import com.collagemanagement.encryptpassword.TrippleDes;
import com.collagemanagement.other.SendingEmail;

public class Collagedaoimpl implements CollageDao
{
	public int insertuserdetails(Connection connection, User u1)
	{
		int insertedRaws=0;
		try(PreparedStatement p1=connection.prepareStatement("insert into user_table(c_First_Name,c_middle_name,c_last_name,c_email,c_gender,"
				+"c_contact,c_address,c_password,c_roll,c_stream,i_semester_id,c_division,image,c_qulification,c_hash) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
			)
		{	
			p1.setString(1, u1.getFirstname());
			p1.setString(2, u1.getMiddlename());
			p1.setString(3, u1.getLastname());
			p1.setString(4, u1.getEmail());
			p1.setString(5,u1.getXender());
			p1.setString(6,u1.getContactno());
			p1.setString(7, u1.getAddress());
			p1.setString(8, u1.getPassword());
			p1.setString(9, u1.getRole());
			p1.setString(10, u1.getStream());
			p1.setInt(11 ,u1.getSemester());
			p1.setString(12, u1.getDivision());
			p1.setBlob(13, u1.getUserProfilepicStream());
			p1.setString(14,u1.getQualification());
			p1.setString(15, u1.getMyHash());
			
			
			insertedRaws=p1.executeUpdate();	
			
			if(insertedRaws==1)
			{
				System.out.println("Succesfully created new user.");
				System.out.println("Sending Mail... ");
							
				SendingEmail se = new SendingEmail(u1.getEmail(),u1.getMyHash());
				Thread t1=new Thread(se);
				t1.start();
			}
		}
		
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return insertedRaws;
	}

	public User getlogindetails(Connection connection, User user)
	{
		User u1=null;
		try(PreparedStatement p1=connection.prepareStatement("Select * from user_table where c_email=? AND  c_password=? AND i_status=1 ");	
			  )
		{		
			p1.setString(1, user.getEmail());
			p1.setString(2, user.getPassword());
			try(ResultSet r1=p1.executeQuery();
				 )
			{
				while(r1.next())
				{
					u1 =new User();
					u1.setEmail(r1.getString("c_email"));
					u1.setPassword(r1.getString("c_password"));	
					u1.setMiddlename(r1.getString("c_middle_name"));
					u1.setRole(r1.getString("c_roll"));
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u1;
	}

	public int fetchemail(Connection connection, String str)
	{
		String ans=null;
		int i1=0;
		try(PreparedStatement p1=connection.prepareStatement("select *  from user_table where c_email=? ");
			  )
		{
			p1.setString(1, str);
			
			try(ResultSet r1=p1.executeQuery();
				 )
			{
				while(r1.next())
				{
					ans=r1.getString("c_email");
					if(ans.equalsIgnoreCase(str))
					{
						System.out.println("return 1");
						i1=1;
					}		
				}			
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return i1;
	}

	public User fetchfname(Connection connection, String username)
	{
		User u1=new User();
		try(PreparedStatement p1=connection.prepareStatement("Select c_middle_name from user_table where c_email=?");
			  )
		{
			p1.setString(1, username);
			try(ResultSet r1=p1.executeQuery();
				  )
			{
				while(r1.next())
				{
					 u1.setMiddlename(r1.getString("c_middle_name"));
				}
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return u1;
	}

	public int Changepassword(Connection connection, User user)
	{
		try(PreparedStatement p1=connection.prepareStatement("update user_table set c_password=? where c_email=?" );
			  )
		{
			p1.setString(1, user.getConfirm_password());
			p1.setString(2, user.getEmail());
			
			return p1.executeUpdate();
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public List<User> fetchuserdetails(Connection connection, String email)
	{
		List<User> user=new ArrayList<>();
		TrippleDes t1;
		try(PreparedStatement p1=connection.prepareStatement("Select * from user_table where c_email=?");
			 )
		{
			p1.setString(1,email);
			try(ResultSet r1=p1.executeQuery();
				  )
			{
					while(r1.next())
					{
						User u1=new User();
						u1.setFirstname(r1.getString("c_First_Name"));
						u1.setMiddlename(r1.getString("c_middle_name"));
						u1.setLastname(r1.getString("c_last_name"));
						u1.setEmail(r1.getString("c_email"));
						u1.setXender(r1.getString("c_gender"));
						u1.setContactno(r1.getString("c_contact"));
						u1.setAddress(r1.getString("c_address"));
						u1.setStream(r1.getString("c_stream"));
						u1.setSemester(r1.getInt("i_semester_id"));
						u1.setDivision(r1.getString("c_division"));
						String password=r1.getString("c_password");
						
						t1=new TrippleDes();
						String decryptpassword=t1.decrypt(password);
						
						u1.setPassword(decryptpassword);
						u1.setQualification(r1.getString("c_qulification"));
						user.add(u1);
					}
			}
			catch (Exception e)
			{
				e.printStackTrace();
			}
		}
		catch (SQLException e)
		{
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return user;
	}

	public int changestudentdetails(Connection connection, User u1, String email)
	{
		try(PreparedStatement p1=connection.prepareStatement("Update user_table set  c_First_Name=?, c_middle_name=?,c_last_name=?,"
				+ "c_email=?,c_contact=?,c_address=?,c_password=? ,c_stream=?,"
				+ "i_semester_id=?,c_division=?,c_qulification=?  where c_email=? ");
			  )
		{
			p1.setString(1,u1.getFirstname());
			p1.setString(2, u1.getMiddlename());
			p1.setString(3, u1.getLastname());
			p1.setString(4, u1.getEmail());
			p1.setString(5,u1.getContactno());
			p1.setString(6,u1.getAddress());
			p1.setString(7, u1.getPassword());
			p1.setString(8,u1.getStream());
			p1.setInt(9,u1.getSemester());
			p1.setString(10, u1.getDivision());
			p1.setString(11,u1.getQualification());
			p1.setString(12,email);
					
			return p1.executeUpdate();
		} 
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public List<Stream> getstreamdetais(Connection connection) 
	{
		List<Stream> streamlist=new ArrayList<>();
		
		try(PreparedStatement p1=connection.prepareStatement("Select * from stream_table");
				ResultSet r1=p1.executeQuery();
			  )
		{
			while(r1.next())
			{
				Stream stream=new Stream();
				stream.setStreamid(r1.getInt("i_stream_id"));
				stream.setStreamname(r1.getString("c_stream"));
				streamlist.add(stream);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return streamlist;
	}

	public int sendaccountactivatedmail(Connection connection, String email, String hash)
	{
		
		try(PreparedStatement p1=connection.prepareStatement("Select c_email,c_hash,i_status from user_table where c_email=? AND c_hash=? AND i_status=0 ");
			)
		{
			p1.setString(1, email);
			p1.setString(2, hash);
			try(ResultSet rs = p1.executeQuery();
				  )
			{
				if(rs.next())
				{
					try(PreparedStatement p2=connection.prepareStatement("Update user_table  set i_status=1 where c_email=? AND c_hash=? "); 
						  )
					{
						p2.setString(1, email);
						p2.setString(2, hash);
						
						return p2.executeUpdate();
					}
				}
			}
		} 
		
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
	public List<User> fetchstudentdetails(Connection connection)
	{
		String s1="STUDENT";
		List<User> userlist=new ArrayList<>();
		try(PreparedStatement p1=connection.prepareStatement("Select * from user_table where c_roll='"+s1+"' AND i_status=1");
				ResultSet r1=p1.executeQuery();
			  )
		{
			while(r1.next())
			{
				User user=new User();
				user.setId(r1.getInt(1));
				user.setFirstname(r1.getString(2));
				user.setMiddlename(r1.getString(3));
				user.setLastname(r1.getString(4));
				user.setEmail(r1.getString(5));
				user.setXender(r1.getString(6));
				user.setAddress(r1.getString("c_address"));
				user.setStream(r1.getString("c_stream"));
				user.setDivision(r1.getString("c_division"));
				userlist.add(user);		
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userlist;
	}

	public int removestudentdetails(Connection connection, String id) 
	{
		try(PreparedStatement p1=connection.prepareStatement("Update  user_table set i_status=0 where i_user_id='"+id+"' ");	
			)
		{
			return p1.executeUpdate();
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	public List<User> fetchfacultydetails(Connection connection)
	{
		String s1="FACULTY";
		List<User> userlist=new ArrayList<>();
		try(PreparedStatement p1=connection.prepareStatement("Select * from user_table where c_roll='"+s1+"' AND i_status=1");
				ResultSet r1=p1.executeQuery();
			  )
		{
			while(r1.next())
			{
				User user=new User();
				user.setId(r1.getInt(1));
				user.setFirstname(r1.getString(2));
				user.setMiddlename(r1.getString(3));
				user.setLastname(r1.getString(4));
				user.setEmail(r1.getString(5));
				user.setXender(r1.getString(6));
				user.setAddress(r1.getString("c_address"));
				user.setQualification(r1.getString("c_qulification"));
				userlist.add(user);		
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return userlist;
	}

	public int removefacultydetails(Connection connection, String id) 
	{
		try(PreparedStatement p1=connection.prepareStatement("Update  user_table set i_status=0 where i_user_id='"+id+"' ");	
				)
			{
				return p1.executeUpdate();
			}
			catch (SQLException e)
			{
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			return 0;	
		}
}
