package com.collagemanagement.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.collagemanagement.bean.Feedback;
import com.collagemanagement.bean.Semester;
import com.collagemanagement.bean.Stream;
//import com.collagemanagement.bean.Log;
import com.collagemanagement.bean.User;
import com.collagemanagement.dao1.CollageDao;
import com.collagemanagement.encryptpassword.TrippleDes;
import com.collagemanagement.other.SendingEmail;

//Pull 

public class Collagedaoimpl implements CollageDao
{
	public int insertuserdetails(Connection connection, User u1)
	{
		int insertedRaws=0;
		try(PreparedStatement p1=connection.prepareStatement("insert into user_table(c_First_Name,c_middle_name,c_last_name,c_email,c_gender,"
				+"c_contact,c_address,c_password,c_roll,i_stream_id,i_semester_id,c_division,image,c_qulification,c_hash,i_status1) values (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)");
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
			p1.setInt(16,0);
			insertedRaws=p1.executeUpdate();	
			
			if(insertedRaws==1)
			{
				System.out.println("Succesfully created new user.");
				System.out.println("Sending Mail... ");
							
				SendingEmail se = new SendingEmail(u1.getEmail(),u1.getMyHash(),0);
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
		
		try(PreparedStatement p1=connection.prepareStatement("Select * from user_table where c_email=? AND  c_password=? AND i_status=1 AND i_status1=1 ");	
			  )
		{		
			p1.setString(1, user.getEmail());
			p1.setString(2, user.getPassword());
			
			try(ResultSet r1=p1.executeQuery();
				 )
			{
				System.out.println("Result set is "+r1);
				if(r1==null)
				{
					System.out.println("heybku");
				}
				else
				{
					while(r1.next())
					{
						u1 =new User();
						u1.setEmail(r1.getString("c_email"));
						u1.setPassword(r1.getString("c_password"));	
						u1.setMiddlename(r1.getString("c_middle_name"));
						u1.setRole(r1.getString("c_roll"));
						String role = r1.getString("c_roll");
						u1.setSemester(r1.getInt("i_semester_id"));
						
						u1.setId(r1.getInt("i_user_id"));
						u1.setFirstname(r1.getString("c_First_Name"));
						u1.setStream(r1.getString("i_stream_id"));
						
						u1.setAddress(r1.getString("c_address"));
						u1.setContactno(r1.getString("c_contact"));
						u1.setDivision(r1.getString("c_division"));
						u1.setLastname(r1.getString("c_last_name"));
						u1.setXender(r1.getString("c_gender"));
						
						//getting sem value from sem id
						//System.out.println("sem id is: "+semid);
						if(role.equalsIgnoreCase("STUDENT")) {
							int semid = r1.getInt("i_semester_id");
							int stream = Integer.parseInt(r1.getString("i_stream_id"));	
						try(PreparedStatement p2 = connection.prepareStatement("select i_semester_value from semester_table where i_Semester_id=? and i_stream_id=?")){
							
							p2.setInt(1, semid);
							p2.setInt(2, stream);
							try(ResultSet r2 = p2.executeQuery()){
								while(r2.next()) {
									u1.setSemValue(r2.getInt("i_semester_value"));
								}
							}
						}
						try(PreparedStatement p3 = connection.prepareStatement("select c_stream from stream_table where i_stream_id=?")){
							p3.setInt(1, stream);
							try(ResultSet r3 = p3.executeQuery()){
								while(r3.next()) {
									//u1.setStreamValue(r3.getInt("c_stream"));
									u1.setStream(r3.getString("c_stream"));
								}
							}
						}
						}
						
						byte[] imagedata = r1.getBytes("image");
						if(imagedata!=null && imagedata.length>0)
						{
								String imagestring = Base64.getEncoder().encodeToString(imagedata);
								u1.setUserProfilepicString(imagestring);
								
								u1.setImagedata(imagedata);
						}
					}
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

	public String fetchemail(Connection connection, String str)
	{
		
		int i1=0;
		try(PreparedStatement p1=connection.prepareStatement("select c_email from user_table where i_user_id=? ");
			  )
		{
			p1.setInt(1,Integer.parseInt(str));
			
			try(ResultSet r1=p1.executeQuery();
				 )
			{
				if(r1.next())
				{
					return r1.getString("c_email");
				}
			}			
			
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
		return null;
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

	public User fetchuserdetails(Connection connection, int userid)
	{
		//List<User> user=new ArrayList<>();
		User u1=new User();
		TrippleDes t1;
		try(PreparedStatement p1=connection.prepareStatement("Select * from user_table where i_user_id=?");
			 )
		{
			p1.setInt(1,userid);
			try(ResultSet r1=p1.executeQuery();
				  )
			{
					while(r1.next())
					{
						
						u1.setId(r1.getInt(1));
						u1.setFirstname(r1.getString("c_First_Name"));
						u1.setMiddlename(r1.getString("c_middle_name"));
						u1.setLastname(r1.getString("c_last_name"));
						
						u1.setContactno(r1.getString("c_contact"));
						u1.setAddress(r1.getString("c_address"));
						String password=r1.getString("c_password");
						t1=new TrippleDes();
						String decryptpassword=t1.decrypt(password);
						u1.setPassword(decryptpassword);
						byte[] imagedata = r1.getBytes("image");
						if (null != imagedata && imagedata.length > 0) {
							System.out.println("in image if");
							String imagestr = Base64.getEncoder().encodeToString(imagedata);
							u1.setUserProfilepicString(imagestr);
						}
						
					//	user.add(u1);
					}
					return u1;
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
		return u1;
	}

	public int changestudentdetails(Connection connection, User u1)
	{
		try(PreparedStatement p1=connection.prepareStatement("Update user_table set  c_First_Name=?, c_middle_name=?,c_last_name=?,"
				+ "c_contact=?,c_address=?,c_password=? ,image=COALESCE(?,image)"
				+ "where i_user_id=? ");
			  )
		{
			p1.setString(1,u1.getFirstname());
			p1.setString(2, u1.getMiddlename());
			p1.setString(3, u1.getLastname());
			
			p1.setString(4,u1.getContactno());
			p1.setString(5,u1.getAddress());
			p1.setString(6, u1.getPassword());
			p1.setBlob(7, u1.getUserProfilepicStream());
			p1.setInt(8, u1.getId());
					
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
		System.out.println("Method ma aaya ");
		String s1="STUDENT";
		List<User> userlist=new ArrayList<>();
		try(PreparedStatement p1=connection.prepareStatement("Select * from user_table where c_roll='"+s1+"' AND i_status=1 AND i_status1=1");
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
				int streamid=r1.getInt("i_stream_id");
				
				 byte [] imagedata=r1.getBytes("image");
					
					if(null!=imagedata && imagedata.length>0)
					{
						String imagestr=Base64.getEncoder().encodeToString(imagedata);
						user.setUserProfilepicString(imagestr);
					}
				
				try(PreparedStatement p2=connection.prepareStatement("select c_stream from stream_table where i_stream_id=?");
					  )
				{
					System.out.println("Biji var aaya ");
					p2.setInt(1, streamid);
					try(ResultSet r2 =p2.executeQuery();
						  )
					{
						if(r2.next())
						{
							user.setStream(r2.getString("c_stream"));
							System.out.println(r2.getString("c_stream"));
							System.out.println("Yeee");
						}
					}
				}
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

	public List<Semester> getSemDetais(Connection connection)
	{
		List<Semester> semlist=new ArrayList<>();
		
		try(PreparedStatement p1=connection.prepareStatement("Select i_Semester_id,i_semester_value from semester_table");
				ResultSet r1=p1.executeQuery();
			  )
		{
			while(r1.next())
			{
				Semester sem=new Semester();
				sem.setSemid(r1.getInt(1));
				sem.setSemvalue(r1.getInt(2));
				semlist.add(sem);
			}
		}
		catch (SQLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return semlist;
	}

	@Override
	public List<User> selectStudentDetails(Connection c1, String streamid)
	{
		List<User> studentList=new ArrayList<>();
		
		try(PreparedStatement p1=c1.prepareStatement("Select * from user_table where i_status1=? AND i_stream_id=?  AND c_roll=?");
			 )
		{
			p1.setInt(1, 0);
			p1.setInt(2, Integer.parseInt(streamid));
			p1.setString(3, "STUDENT");
			
			try(ResultSet r1=p1.executeQuery();
				  )
			{
				while(r1.next())
				{
					User u1=new User();
					u1.setId(r1.getInt("i_user_id"));
					u1.setFirstname(r1.getString("c_First_Name"));
					u1.setMiddlename(r1.getString("c_middle_name"));
					u1.setLastname(r1.getString("c_last_name"));
					u1.setEmail(r1.getString("c_email"));
					u1.setXender(r1.getString("c_gender"));
					u1.setDivision(r1.getString("c_division"));
					int semesterid=r1.getInt("i_semester_id");
					int semvalue=0;
					try(PreparedStatement p2=c1.prepareStatement("Select i_semester_value from semester_table where i_Semester_id=? AND i_stream_id=?");
						  )
					{
						p2.setInt(1, semesterid);
						p2.setInt(2, Integer.parseInt(streamid));
						
						
						try(ResultSet r2=p2.executeQuery();
							  )
						{
							if(r2.next())
							{
								semvalue=r2.getInt("i_semester_value");
								u1.setSemester(semvalue);
							}
						}
					}
					studentList.add(u1);
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return studentList;
	}

	@Override
	public int changeStudentStatus(Connection c1, String id)
	{
		try(PreparedStatement p1=c1.prepareStatement("update user_table set i_status1=? where i_user_id=?");
			  )
		{
			p1.setInt(1, 1);
			p1.setInt(2,Integer.parseInt(id));
			
			return p1.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int deletStudent(Connection c1, String id) 
	{
		try(PreparedStatement p1=c1.prepareStatement("Delete from user_table where i_user_id=?");
			  )
		{
			p1.setInt(1, Integer.parseInt(id));
			 return p1.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int selectStreamid(Connection c1, String id)
	{
		try(PreparedStatement p1=c1.prepareStatement("Select i_stream_id from user_table where i_user_id=?");
			  )
		{
			p1.setInt(1, Integer.parseInt(id));
			
			try(ResultSet r1=p1.executeQuery();
				  )
			{
				if(r1.next())
				{
					return r1.getInt("i_stream_id");
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public String checkEmail(Connection c1, String str) 
	{
		try(PreparedStatement p1=c1.prepareStatement("Select c_email from user_table where c_email=? ");
			  )
		{
			p1.setString(1, str);
			
			try(ResultSet r1=p1.executeQuery();
				 )
			{
				if(r1.next())
				{
					if(str.equals(r1.getString("c_email")))
					{
						System.out.println("yahhoo");
						return "found";
					}
				}
			}
		}
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String updateloginuserdate(Connection connection, String username, int i) {
		// TODO Auto-generated method stub
		
		int insertedRaws = 0;
		PreparedStatement preparedStatement = null;
		
		try
		{
			if(i==0)
			{
				preparedStatement = connection.prepareStatement("update user_table set login_timeanddate=? where c_email=?");
			}
			else if(i==1)
			{
				preparedStatement = connection.prepareStatement("update user_table set logout_timeanddate=? where c_email=?");
			}
			
			/* System  Date */
			
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
			LocalDateTime now = LocalDateTime.now();  
			System.out.println(dtf.format(now)); 
			
			
			preparedStatement.setString(1,dtf.format(now));
			preparedStatement.setString(2,username);
			
			insertedRaws = preparedStatement.executeUpdate();
			
		
			if(insertedRaws>0)
			{
				return "Date inserted Successfully";
			}
			else
			{
				return "Date inserted Failed";
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int inserFeedBackDetails(Connection c1, Feedback f1)
	{
		
		try(PreparedStatement p1=c1.prepareStatement("insert into feedback_table (c_description,c_date,i_user_id,c_roll,c_subject,c_email,c_name,c_contact) values(?,?,?,?,?,?,?,?)");
			  )
		{
			
			DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
			LocalDateTime now = LocalDateTime.now();  
			System.out.println(dtf.format(now));
			
			p1.setString(1, f1.getDescription());
			p1.setString(2, dtf.format(now));
			p1.setInt(3, f1.getUserid());
			p1.setString(4, f1.getRoll());
			p1.setString(5, f1.getSubject());
			p1.setString(6, f1.getEmail());
			p1.setString(7, f1.getName());
			p1.setString(8, f1.getContact());
			
			return p1.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public User getAdminDetails(int userid, Connection c1) throws Exception {
		// TODO Auto-generated method stub
//		String query = "update user_table set c_First_Name=?,c_middle_name=?,c_last_name=?,c_contact=?,image=COALESCE(?,image),"
//				+ "c_address=?,c_password=? where i_user_id=?";
		String query = "select i_user_id,c_First_Name,c_middle_name,c_last_name,c_contact,image,c_address,"
				+ "c_password from user_table where i_user_id=?";
		TrippleDes t1;
		User user = new User();
		try(PreparedStatement p1=c1.prepareStatement(query);){
			p1.setInt(1, userid);
			ResultSet rs = p1.executeQuery();
			while(rs.next()) {
				user.setId(rs.getInt(1));
				user.setFirstname(rs.getString(2));
				user.setMiddlename(rs.getString(3));
				user.setLastname(rs.getString(4));
				user.setContactno(rs.getString("c_contact"));
				user.setAddress(rs.getString("c_address"));
				//user.setPassword(rs.getString(10));
				byte[] imagedata = rs.getBytes("image");
				if (null != imagedata && imagedata.length > 0) {
					String imagestr = Base64.getEncoder().encodeToString(imagedata);
					user.setUserProfilepicString(imagestr);
				}
				String password = rs.getString("c_password");
				t1 = new TrippleDes();
				String decryptpassword = t1.decrypt(password);
				user.setPassword(decryptpassword);
			}
		}
		return user;
	}

	@Override
	public int updateAdmin(User u1, Connection c1) throws Exception {
		// TODO Auto-generated method stub
		String query = "update user_table set c_First_Name=?,c_middle_name=?,c_last_name=?,c_contact=?,image=COALESCE(?,image),"
				+ "c_address=?,c_password=? where i_user_id=?";
		try(PreparedStatement p1=c1.prepareStatement(query);){
			p1.setInt(8, u1.getId());
			p1.setString(1, u1.getFirstname());
			p1.setString(2, u1.getMiddlename());
			p1.setString(3, u1.getLastname());
			p1.setString(4, u1.getContactno());
			p1.setBlob(5, u1.getUserProfilepicStream());
			p1.setString(6, u1.getAddress());
			p1.setString(7, u1.getPassword());
			
			return p1.executeUpdate();
		}
		//return 0;
	}	      
}
