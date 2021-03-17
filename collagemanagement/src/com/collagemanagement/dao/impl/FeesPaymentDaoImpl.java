package com.collagemanagement.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.swing.text.html.HTMLDocument.HTMLReader.PreAction;

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
}
