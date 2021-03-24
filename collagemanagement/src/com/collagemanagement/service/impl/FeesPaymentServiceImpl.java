package com.collagemanagement.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

import com.collagemanagement.bean.FeesDetails;
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

	@Override
	public int fetchSemValue(int semesterid, int id) 
	{
		
		try(Connection c1=getConnection();)
		{
			return feespaymentDao.getSemValue(c1,semesterid,id);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public String insertFeeDetails(FeesDetails fees)
	{
	
		try(Connection c1 = getConnection();
			  )
		{
			
			int i1=feespaymentDao.insertFee(c1,fees);
			
			if(i1>0)
			{
				return "Inserted Successfully";
			}
			else
			{
				return "Not Inserted Successfully ";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String UpdatePaymentDetails(FeesDetails fees)
	{
		try(Connection c1=getConnection();
			  )
		{
			
			int i1=feespaymentDao.UpdateFeesPaymentDetails(c1,fees);
			if(i1>0)
			{
				return "Yepooo";
			}
			else
			{
				return "Nope";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

}
