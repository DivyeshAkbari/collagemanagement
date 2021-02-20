package com.collagemanagement.dao1;

import java.sql.Connection;
import java.util.List;

import com.collagemanagement.bean.Semester1;

public interface TeacherDao {

	List<Semester1> getSemesters(String streamId, Connection connection) throws Exception;


	

}
