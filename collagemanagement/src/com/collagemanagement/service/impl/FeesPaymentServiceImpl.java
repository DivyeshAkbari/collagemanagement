package com.collagemanagement.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.collagemanagement.dao.impl.FeesPaymentDaoImpl;
import com.collagemanagement.dao1.FeesPaymentDao;
import com.collagemanagement.service1.FeesPaymentService;

public class FeesPaymentServiceImpl implements FeesPaymentService {
	
	FeesPaymentDao feespaymentDao = new FeesPaymentDaoImpl();

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
	public String fetchstreamname(int id) {
		// TODO Auto-generated method stub
		
		try(Connection connection = getConnection())
		{
			return feespaymentDao.getStreamname(connection,id);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public int fetchamount(int id, int semesterid) {
		// TODO Auto-generated method stub
		
		try(Connection connection = getConnection())
		{
			System.out.println("Amount From Service");
			return feespaymentDao.getamount(connection,id,semesterid);	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

}
