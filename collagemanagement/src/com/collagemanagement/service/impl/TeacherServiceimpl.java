package com.collagemanagement.service.impl;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.List;

import com.collagemanagement.bean.Semester;
import com.collagemanagement.bean.Semester1;
import com.collagemanagement.bean.Stream;
import com.collagemanagement.bean.Subject;
import com.collagemanagement.dao.impl.TeacherDaoImpl;
import com.collagemanagement.dao1.TeacherDao;
import com.collagemanagement.service1.TeacherService;


public class TeacherServiceimpl implements TeacherService {

	TeacherDao teacherdao = new TeacherDaoImpl();
	
	public List<Semester1> fetchSemester(String streamId) {
		// TODO Auto-generated method stub
		List<Semester1> semesterlist = null;
		try(Connection connection = getConnection();){
			
		//	semesterlist = 
			
			return teacherdao.getSemesters(streamId,connection);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return semesterlist;
	}
	
	public static Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
		}
		
		String url = "jdbc:mysql://localhost:3306/educhamp_schema";
		String username = "root";
		String password = "root";
		
		return DriverManager.getConnection(url,username, password);
	}

	public List<Subject> fetchSubject(int streamId, String semValue) {
		// TODO Auto-generated method stub
		List<Subject> subjectList = null;
		try(Connection connection = getConnection();){
			
			//	semesterlist = 
			System.out.println("Stream id in service impl: "+streamId+" and sem value is: "+semValue);
				
				return teacherdao.getSubjects(streamId,semValue,connection);
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return subjectList;
	}

	public int fetchStreamId(String semValue) {
		// TODO Auto-generated method stub
		try(Connection connection = getConnection();){
			
			return teacherdao.getStreamId(semValue,connection);
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<Stream> fetchstreamdetails(int userId) {
		// TODO Auto-generated method stub
		List<Stream> streamlist = null;
		try(Connection connection = getConnection();){
			
		//	semesterlist = 
			
			return teacherdao.getStreamforfaculty(userId,connection);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return streamlist;
	}

	@Override
	public List<Subject> fetchsubjectdetails(int userId) {
		// TODO Auto-generated method stub
		List<Subject> subjectlist = null;
		try(Connection connection = getConnection();){
			
		//	semesterlist = 
			
			return teacherdao.getSubjectforfaculty(userId,connection);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return subjectlist;
		
	}
}
