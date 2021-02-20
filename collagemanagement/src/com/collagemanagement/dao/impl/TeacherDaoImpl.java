package com.collagemanagement.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.collagemanagement.bean.Semester1;
import com.collagemanagement.dao1.TeacherDao;

public class TeacherDaoImpl implements TeacherDao {

	@Override
	public List<Semester1> getSemesters(String streamId, Connection connection) throws Exception {
		// TODO Auto-generated method stub
		
		List<Semester1> semList = new ArrayList<>();
		
		String query = "select * from semester_table where i_stream_id=?";
		try(PreparedStatement ps = connection.prepareStatement(query);){
				ps.setInt(1, Integer.parseInt(streamId));
				ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Semester1 s = new Semester1();
				s.setSemId(rs.getInt("i_Semester_id"));
				s.setSemValue(rs.getInt("i_semester_value"));
				semList.add(s);
			}
		}
		
		return semList;
	}

	
}
