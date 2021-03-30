package com.collagemanagement.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import com.collagemanagement.bean.FeesDetails;
import com.collagemanagement.bean.User;
import com.collagemanagement.dao1.FeesPaymentDao;
import com.mysql.cj.xdevapi.Result;

public class FeesPaymentDaoImpl implements FeesPaymentDao {

	@Override
	public String getStreamname(Connection connection, int id) {
		// TODO Auto-generated method stub
		
		try(PreparedStatement preparedStatement = connection.prepareStatement("select c_stream from stream_table where i_stream_id=?");)
		{
			preparedStatement.setInt(1, id);
			
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				if(resultSet.next())
				{
					return resultSet.getString("c_stream"); 
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public int getamount(Connection connection, int id, int semesterid) {
		// TODO Auto-generated method stub
		
		try(PreparedStatement preparedStatement = connection.prepareStatement("select c_fees_amount from fees_details_table where i_Semester_id=? AND i_stream_id=?");)
		{
			preparedStatement.setInt(1, semesterid);
			preparedStatement.setInt(2, id);
			
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				if(resultSet.next())
				{
					System.out.println("Amount From Dao");
					return resultSet.getInt("c_fees_amount");
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int getSemValue(Connection c1, int semesterid, int id) 
	{
		try(PreparedStatement p1=c1.prepareStatement("Select i_semester_value from semester_table where i_Semester_id=? AND i_stream_id=?");
			 )
		{  
			p1.setInt(1, semesterid);
			p1.setInt(2, id);
			
			try(ResultSet r1=p1.executeQuery();
				)
			{
				if(r1.next())
				{
					return r1.getInt("i_semester_value");
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int insertFee(Connection c1,FeesDetails fees)
	{
		try(PreparedStatement p1=c1.prepareStatement("insert into student_fees_table (i_payment_status,"
				+ "c_amount,c_remark,i_user_id,c_order_id,c_contact,c_email,c_Name,c_stream) values(?,?,?,?,?,?,?,?,?)");)
		{
		
			p1.setInt(1, 0);
			p1.setString(2, fees.getAmount());
			p1.setString(3, fees.getRemark());
			p1.setInt(4,fees.getUser_id());
			p1.setString(5,fees.getOrderid());
			p1.setString(6,fees.getContactno());
			p1.setString(7,fees.getEmail());
			p1.setString(8,fees.getUsername());
			p1.setString(9,fees.getStream());
			
			return p1.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int UpdateFeesPaymentDetails(Connection c1, FeesDetails fees)
	{
		int update=0;
		String updatequery = "update student_fees_table set i_payment_status=?,d_payment_date=? where c_order_id=?";
		
	//	String updatequery = "update student_fees_table set student_fees_table.i_payment_status=? = u.i_payment_status=? from student_fees_table s inner join user_table u on s.i_student_fees_id = u.i_user_id where c_order_id=?";
				
		try(PreparedStatement p1=c1.prepareStatement(updatequery);
			 )
		{
			
			p1.setInt(1, 1);
			p1.setString(2, fees.getPaymentdate());
			p1.setString(3, fees.getOrderid());
			
			update = p1.executeUpdate();
			
			int userid = 0;
			
			
			try(PreparedStatement preparedStatement = c1.prepareStatement("select i_user_id from student_fees_table where c_order_id=?");
				  )
			{
				preparedStatement.setString(1,fees.getOrderid());
				try (ResultSet r1 = preparedStatement.executeQuery();)
				{
					if(r1.next())
					{
						userid  = r1.getInt(1);
						System.out.println("userid ->"+userid);
					}
				}
			}catch (SQLException e)
			{
				e.printStackTrace();
			}
				
		
						try(PreparedStatement p2=c1.prepareStatement("Update user_table set i_payment_status=1 where i_user_id=?"); 
							  )
						{		
							p2.setInt(1, userid);
						    p2.executeUpdate();
						}
						catch (SQLException e)
						{
							e.printStackTrace();
						}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	   
		return update;
	}

	@Override
	public FeesDetails selectinvoiceDetails(Connection connection,int id) {
		
		try(PreparedStatement preparedStatement = connection.prepareStatement("select c_order_id,c_amount,d_payment_date,c_contact,c_email,c_Name,c_stream from student_fees_table where i_user_id=?");)
		{			
			preparedStatement.setInt(1,id);
			
			try(ResultSet resultSet = preparedStatement.executeQuery())
			{
				if(resultSet.next())
				{
					FeesDetails fees1 = new FeesDetails();
					
					fees1.setOrderid(resultSet.getString("c_order_id"));
					fees1.setAmount(resultSet.getString("c_amount"));
					fees1.setPaymentdate(resultSet.getString("d_payment_date"));
					fees1.setContactno(resultSet.getString("c_contact"));
					fees1.setEmail(resultSet.getString("c_email"));
					fees1.setUsername(resultSet.getString("c_Name"));
					fees1.setStream(resultSet.getString("c_stream"));
					
					System.out.println("Orderid " +resultSet.getString("c_order_id"));
					System.out.println("Amount " +resultSet.getString("c_amount"));
					System.out.println("Payment Date " +resultSet.getString("d_payment_date"));
					System.out.println("Contact No " +resultSet.getString("c_contact"));
					System.out.println("Email " +resultSet.getString("c_email"));
					System.out.println("User Name " +resultSet.getString("c_Name"));
					System.out.println("Stream " +resultSet.getString("c_stream"));
					
					return fees1;
				}
			}
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}

	@Override
	public List<User> fetchFeesPaystudentdetails(Connection connection) {
		// TODO Auto-generated method stub
		
		String s1="STUDENT";
		List<User> userlist = new ArrayList<>();
		
		try(PreparedStatement p1=connection.prepareStatement("Select * from user_table where c_roll='"+s1+"'");
				ResultSet r1=p1.executeQuery();
			  )
		{
			while(r1.next())
			{
				User user = new User();
				
				user.setId(r1.getInt(1));
				user.setFirstname(r1.getString(2));
				user.setMiddlename(r1.getString(3));
				user.setLastname(r1.getString(4));
				user.setEmail(r1.getString(5));
				user.setXender(r1.getString(6));
				user.setDivision(r1.getString("c_division"));
				
				int Streamid = r1.getInt("c_stream");
				
				try(PreparedStatement p2 = connection.prepareStatement("select c_stream from stream_table where i_stream_id=?");
					)
				{
					p2.setInt(1,Streamid);
					
					try(ResultSet resultSet = p2.executeQuery())
					{
						if(resultSet.next())
						{
							user.setStream(resultSet.getString("c_stream"));
						}
					}
				}
				
				int Semid = r1.getInt("i_semester_id");
				
				try(PreparedStatement p3 = connection.prepareStatement("select i_semester_value from semester_table where i_Semester_id=? AND i_stream_id=?");)
				{
					p3.setInt(1,Semid);
					p3.setInt(2,Streamid);
					
					try(ResultSet r3 = p3.executeQuery())
					{
						if(r3.next())
						{
							user.setSemester(r3.getInt("i_semester_value"));
						}
					}
				}
				
				int paymentstatus = r1.getInt("i_payment_status");
				
				if(paymentstatus==0)
				{
					user.setPaymentstatus("Unpaid");
				}
				else
				{
					user.setPaymentstatus("Paid");
				}
				
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

	@Override
	public int removeOrder(Connection c1, FeesDetails fees)
	{
		try(PreparedStatement p1=c1.prepareStatement("Delete  from student_fees_table where c_order_id=?");
			 )
		{
			p1.setString(1, fees.getOrderid());
			
			return p1.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}
}