package com.collagemanagement.dao1;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.collagemanagement.bean.Assignment;
import com.collagemanagement.bean.Semester;
import com.collagemanagement.bean.Semester1;
import com.collagemanagement.bean.Stream;
import com.collagemanagement.bean.Subject;
import com.collagemanagement.bean.User;

public interface TeacherDao {

	List<Semester1> getSemesters(String streamId, Connection connection) throws Exception;

	List<Subject> getSubjects(int streamId, String semValue, Connection connection) throws  Exception;

	int getStreamId(String semValue, Connection connection) throws Exception;


	List<Stream> getStreamforfaculty(int userId, Connection connection) throws Exception;

	List<Subject> getSubjectIdforfaculty(int userId, Connection connection) throws Exception;

	int setAssDetail(Assignment ass, Connection connection) throws Exception;

	int insertUserDetail(Connection connection, User u1) throws Exception;
	
	int[] insertFacultyStream(Connection connection, List<Stream> streamList, int userid) throws Exception;

	int[] insertFacultySemester(Connection connection, List<Semester> semesterList, int userid) throws SQLException;

	int[] insertFacultySubject(Connection connection, List<Subject> subjectList, int userid) throws SQLException;

//	List<Subject> getSubjectsForFaculty(Connection connection, String streamId) throws Exception;

	List<Subject> getSubjectsForFaculty(Connection connection, String streamId, List<Subject> subjectId) throws Exception;

	User getFacultyDetails(int userId,Connection connection) throws Exception;

	List<Subject> getSubjectforfaculty(int userId, Connection connection) throws Exception;

	List<Semester> getSemesterforfaculty(int userId, Connection connection) throws Exception;

	List<Semester> getAllSemester(Connection connection) throws SQLException;

	List<Stream> getAllStream(Connection connection) throws Exception;

	List<Subject> getAllSubject(Connection connection) throws Exception;

	List<Subject> getSubjectForStudent(Connection connection, User u1) throws Exception;

	List<Assignment> fetchAssignments(Connection connection, String ss) throws Exception;

	List<User> fetchFacultyForAss(Connection connection, List<Integer> userIdList) throws Exception;

	InputStream fetchAssPdf(Connection connection, int id) throws Exception;

	List<Integer> getSelectedSem(Connection connection, int streamId, int userId) throws Exception;

	List<Integer> getSelectedSub(Connection connection, int semesterId, List<Subject> subjectId);

	int updateTeacherDetails(Connection connection, User u1) throws Exception;

	void deleteTeacherStream(Connection connection, int id) throws Exception;

	void deleteTeacherSemester(Connection connection, int id) throws Exception;

	void deleteTeacherSubject(Connection connection, int id) throws Exception;

	List<User> getAllFaculty(Connection connection) throws Exception;

	int deletefaculty(Connection connection, int userId) throws Exception;
	
//	List<Stream> getFacultyStream(Connection connection, int userId);

	

	

	

}
