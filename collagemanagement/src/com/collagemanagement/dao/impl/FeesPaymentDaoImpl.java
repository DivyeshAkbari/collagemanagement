package com.collagemanagement.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpSession;
import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

import com.collagemanagement.bean.FeesDetails;
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
				+ "c_amount,c_remark,i_user_id,c_order_id) values(?,?,?,?,?)");)
		{
		
			p1.setInt(1, 0);
			p1.setString(2, fees.getAmount());
			p1.setString(3, fees.getRemark());
			p1.setInt(4,fees.getUser_id());
			p1.setString(5, fees.getOrderid());
			
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
		
		try(PreparedStatement p1=c1.prepareStatement("update student_fees_table set i_payment_status=?,d_payment_date=? where c_order_id=?");
			 )
		{
			
			p1.setInt(1, 1);
			p1.setString(2, fees.getPaymentdate());
			p1.setString(3, fees.getOrderid());
			
			return p1.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	   
		return 0;
	}
}
