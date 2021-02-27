package com.collagemanagement.dao1;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;

import com.collagemanagement.bean.Semester1;
import com.collagemanagement.bean.Stream;
import com.collagemanagement.bean.Subject;

public interface TeacherDao {

	List<Semester1> getSemesters(String streamId, Connection connection) throws Exception;

	List<Subject> getSubjects(int streamId, String semValue, Connection connection) throws  Exception;

	int getStreamId(String semValue, Connection connection) throws Exception;


	List<Stream> getStreamforfaculty(int userId, Connection connection) throws Exception;

	List<Subject> getSubjectforfaculty(int userId, Connection connection) throws Exception;

	

	

	

}
