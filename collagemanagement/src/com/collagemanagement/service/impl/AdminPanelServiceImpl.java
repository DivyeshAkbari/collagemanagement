package com.collagemanagement.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import com.collagemanagement.bean.FeesDetails;
import com.collagemanagement.bean.Notice;
import com.collagemanagement.bean.User;
import com.collagemanagement.dao.impl.AdminPanelDaoImpl;
import com.collagemanagement.dao1.AdminPanelDao;
import com.collagemanagement.service1.AdminPanel;

public class AdminPanelServiceImpl implements AdminPanel {
	
	AdminPanelDao adminPanelDao = new AdminPanelDaoImpl();
	
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
	public int fetchStudent() {
		// TODO Auto-generated method stub
	
		try(Connection connection = getConnection();
		   )
		{
			return adminPanelDao.fetchuserdetails(connection);
		}
		catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int fetchTotalStudent() {
		
		try(Connection connection = getConnection())
		{
			System.out.println("Total Student From Service");
			return adminPanelDao.getTotalStudent(connection);	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return 0;
	}

	@Override
	public int fetchTotalTeacher() {
		// TODO Auto-generated method stub
		
		try(Connection connection = getConnection())
		{
			System.out.println("Total Teacher From Service");
			return adminPanelDao.getTotalTeacher(connection);	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int fetchTotalEarning() {
		// TODO Auto-generated method stub
		
		try(Connection connection = getConnection())
		{
			System.out.println("Total Earning From Service");
			return adminPanelDao.getTotalEarning(connection);	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int fetchfemaleStudent() {
		// TODO Auto-generated method stub
		
		try(Connection connection = getConnection())
		{
			System.out.println("Total Female Student From Service");
			return adminPanelDao.getFemaleStudent(connection);	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int fetchfemaleTeacher() {
		// TODO Auto-generated method stub
		
		try(Connection connection = getConnection())
		{
			System.out.println("Total Female Teacher From Service");
			return adminPanelDao.getFemaleTeacher(connection);	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public int fetchmaleTeacher() {
		// TODO Auto-generated method stub
		
		try(Connection connection = getConnection())
		{
			System.out.println("Total male Teacher From Service");
			return adminPanelDao.getmaleTeacher(connection);	
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<FeesDetails> getSplineAreaChartDetail() {
		// TODO Auto-generated method stub
		
		try(Connection connection = getConnection())
		{
			System.out.println("Year FROM service");
			return adminPanelDao.fetchSplinechartDetail(connection);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String insertNotice(Notice notice) {
		// TODO Auto-generated method stub
		

		try(Connection connection = getConnection())
		{
			return adminPanelDao.addNotice(connection,notice);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return null;
	}
}
//hi