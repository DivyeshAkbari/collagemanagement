package com.collagemanagement.dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.collagemanagement.bean.Semester1;
import com.collagemanagement.bean.Stream;
import com.collagemanagement.bean.Subject;
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

	public List<Subject> getSubjects(int streamId, String semValue, Connection connection) throws Exception {
		// TODO Auto-generated method stub
		
		List<Subject> subList = new ArrayList<>();
		
		String query = "select * from subject_table where i_stream_id=? and i_Semester_id=?";
		
		try(PreparedStatement ps = connection.prepareStatement(query);){
			ps.setInt(1, streamId);
			ps.setInt(2, Integer.parseInt(semValue));
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Subject s = new Subject();
				s.setSubjectId(rs.getInt("i_Subject_id"));
				s.setSubjectName(rs.getString("c_subject_name"));
				subList.add(s);
			}
		}
		return subList;
	}

	@Override
	public int getStreamId(String semValue, Connection connection) throws Exception {
		// TODO Auto-generated method stub
		String query = "select i_stream_id from semester_table where i_Semester_id=?";
		
		try(PreparedStatement ps = connection.prepareStatement(query);){
			ps.setInt(1, Integer.parseInt(semValue));
			ResultSet rs = ps.executeQuery();
			if(rs.next()) {
				return rs.getInt("i_stream_id");
			}
		}
		return 0;
	}

	@Override
	public List<Stream> getStreamforfaculty(int userId, Connection connection) throws Exception {
		// TODO Auto-generated method stub
		List<Stream> streamList = new ArrayList<>();
		
		
		String query = "SELECT stream_table.i_stream_id, stream_table.c_stream\r\n" + 
				"FROM stream_table\r\n" + 
				"INNER JOIN faculty_stream_table\r\n" + 
				"ON stream_table.i_stream_id=faculty_stream_table.i_stream_id where i_user_id=?";
		try(PreparedStatement ps = connection.prepareStatement(query);){
				ps.setInt(1, (userId));
				ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Stream s  = new Stream();
				s.setStreamid(rs.getInt("i_stream_id"));
				s.setStreamname(rs.getString("c_stream"));
				streamList.add(s);
			}
		}
		
		return streamList;
	}

	@Override
	public List<Subject> getSubjectforfaculty(int userId, Connection connection) throws Exception {
		// TODO Auto-generated method stub
		List<Subject> subjectList = new ArrayList<>();
		
		
		String query = "SELECT subject_table.i_Subject_id, subject_table.c_subject_name\r\n" + 
				"FROM subject_table\r\n" + 
				"INNER JOIN faculty_subject_table\r\n" + 
				"ON faculty_subject_table.i_Subject_id=subject_table.i_Subject_id where i_user_id=?";
		try(PreparedStatement ps = connection.prepareStatement(query);){
				ps.setInt(1, (userId));
				ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Subject s = new Subject();
				s.setSubjectId(rs.getInt("i_Subject_id"));
				s.setSubjectName(rs.getString("c_subject_name"));
				subjectList.add(s);
			}
		}
		
		return subjectList;
	
	}

	
}
