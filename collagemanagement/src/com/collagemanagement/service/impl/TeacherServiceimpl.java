package com.collagemanagement.service.impl;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.collagemanagement.bean.Assignment;
import com.collagemanagement.bean.Semester;
import com.collagemanagement.bean.Semester1;
import com.collagemanagement.bean.Stream;
import com.collagemanagement.bean.Subject;
import com.collagemanagement.bean.User;
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

	

	public String insertAssDetail(Assignment ass) {
		// TODO Auto-generated method stub
		try(Connection connection = getConnection();){
			
			int i1 = teacherdao.setAssDetail(ass,connection);
				
				
				
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		return null;
	}

	@Override
	public String saveuserdetails(User u1) {
		// TODO Auto-generated method stub
		String message = null;
		try(Connection connection = getConnection();){
			int userid = teacherdao.insertUserDetail(connection,u1);
			
			List<Stream> streamList = u1.getStreamList();
			List<Semester> semesterList = u1.getSemesterList();
			List<Subject> subjectList = u1.getSubjectList();
			int [] insertStream = teacherdao.insertFacultyStream(connection,streamList,userid);
			int [] insertSemester = teacherdao.insertFacultySemester(connection,semesterList,userid);
			int [] insertSubject = teacherdao.insertFacultySubject(connection,subjectList,userid);
			
			if(userid > 0)
				message= "Faculty registration success";
			else
				message="Faculty registration not success";
				
				
				
		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}

	@Override
	public List<Subject> fetchsubjectdetails(int userId, String streamId) {
		// TODO Auto-generated method stub
		List<Subject> subjectlist = null;
		try(Connection connection = getConnection();){
			
		//	semesterlist = 
			
			List<Subject> subjectId =  teacherdao.getSubjectIdforfaculty(userId,connection);
			
			 subjectlist = teacherdao.getSubjectsForFaculty(connection,streamId,subjectId);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return subjectlist;
	}

	@Override
	public User fetchUserDetail(int userId) {
		// TODO Auto-generated method stub
		User user = null;
		try(Connection connection = getConnection();){
			
			user = teacherdao.getFacultyDetails(userId,connection);
			
			List<Stream> streamList = teacherdao.getStreamforfaculty(userId,connection);
			List<Subject> subjectList = teacherdao.getSubjectforfaculty(userId,connection);
			List<Semester> semesterList = teacherdao.getSemesterforfaculty(userId,connection);
			
			user.setStreamList(streamList);
			user.setSubjectList(subjectList);
			user.setSemesterList(semesterList);
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public List<Semester> fetchAllSemester() {
		// TODO Auto-generated method stub
		List<Semester> semesterlist = new ArrayList<>();
		
		try(Connection connection = getConnection();){
			
			semesterlist = teacherdao.getAllSemester(connection);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return semesterlist;
	}

	@Override
	public List<Stream> fetchAllStream() {
		// TODO Auto-generated method stub
		List<Stream> streamlist = new ArrayList<>();
		
		try(Connection connection = getConnection();){
			
			streamlist = teacherdao.getAllStream(connection);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return streamlist;
	}

	@Override
	public List<Subject> fetchAllSubject() {
		// TODO Auto-generated method stub
		List<Subject> subjectlist = new ArrayList<>();
		
		try(Connection connection = getConnection();){
			
			subjectlist = teacherdao.getAllSubject(connection);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return subjectlist;
	}

	@Override
	public List<Subject> fetchSubjectForStudent(User u1) {
		// TODO Auto-generated method stub
		List<Subject> subjectlist = new ArrayList<>();
		
		try(Connection connection = getConnection();){
			
			subjectlist = teacherdao.getSubjectForStudent(connection,u1);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return subjectlist;
	}

	@Override
	public List<Assignment> getAssignments(String ss) {
		// TODO Auto-generated method stub
		List<Assignment> asslist = new ArrayList<>();
		try(Connection connection = getConnection();){
			
			asslist = teacherdao.fetchAssignments(connection,ss);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return asslist;
	}

	@Override
	public List<User> fetchFacultyForAss(List<Integer> userIdList) {
		// TODO Auto-generated method stub
		List<User> faculty = new ArrayList<>();
		try(Connection connection = getConnection();){
			
			faculty = teacherdao.fetchFacultyForAss(connection,userIdList);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return faculty;
	}

	@Override
	public InputStream getPDf(int id) {
		// TODO Auto-generated method stub
		try(Connection connection = getConnection();){
			
			return teacherdao.fetchAssPdf(connection,id);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Integer> fetchSelectedSemester(int streamId, int userId) {
		// TODO Auto-generated method stub
		List<Integer> selectedSemList = new ArrayList<>();
		try(Connection connection = getConnection();){
			
			selectedSemList = teacherdao.getSelectedSem(connection,streamId,userId);
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return selectedSemList;
	}

	@Override
	public List<Integer> fetchSelectedSubject(int userId, int semesterId) {
		// TODO Auto-generated method stub
		List<Integer> selectedSubList = null;
		try(Connection connection = getConnection();){
			
			List<Subject> subjectId =  teacherdao.getSubjectIdforfaculty(userId,connection);
			
			selectedSubList = teacherdao.getSelectedSub(connection,semesterId,subjectId);
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return selectedSubList;
	}
	
}
