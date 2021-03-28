package com.collagemanagement.dao.impl;

import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Base64;
import java.util.List;

import com.collagemanagement.bean.Assignment;
import com.collagemanagement.bean.Semester;
import com.collagemanagement.bean.Semester1;
import com.collagemanagement.bean.Stream;
import com.collagemanagement.bean.Subject;
import com.collagemanagement.bean.User;
import com.collagemanagement.dao1.TeacherDao;
import com.collagemanagement.encryptpassword.TrippleDes;

import java.time.format.DateTimeFormatter;  
import java.time.LocalDateTime;


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
	public List<Subject> getSubjectIdforfaculty(int userId, Connection connection) throws Exception {
		// TODO Auto-generated method stub
		List<Subject> subjectIdList = new ArrayList<>();
		
		
		String query = "select i_Subject_id from faculty_subject_table where i_user_id = ?";
//		String query = "SELECT subject_table.i_Subject_id, subject_table.c_subject_name\r\n" + 
//				"FROM subject_table\r\n" + 
//				"INNER JOIN faculty_subject_table\r\n" + 
//				"ON faculty_subject_table.i_Subject_id=subject_table.i_Subject_id where i_user_id=?";
		System.out.println("fetch subject for faculty");
		try(PreparedStatement ps = connection.prepareStatement(query);){
				ps.setInt(1, (userId));
				ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Subject s = new Subject();
				s.setSubjectId(rs.getInt("i_Subject_id"));
				//s.setSubjectName(rs.getString("c_subject_name"));
				subjectIdList.add(s);
			}
		}
		
		return subjectIdList;
	
	}

	@Override
	public int setAssDetail(Assignment ass, Connection connection) throws Exception {
		// TODO Auto-generated method stub
		 DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");  
		   LocalDateTime now = LocalDateTime.now();  
		
		String query = "insert into ass_faculty_table(c_title,c_description,d_upload_date,d_due_date,PDF,i_user_id,i_Subject_id)values(?,?,?,?,?,?,?)";
		
		PreparedStatement ps = connection.prepareStatement(query);
		
		ps.setString(1, ass.getTitle());
		ps.setString(2, ass.getDiscription());
		ps.setString(3, dtf.format(now));
		ps.setString(4, ass.getDate());
		ps.setBlob(5, ass.getAssPDF());
		ps.setInt(6, ass.getUsesrId());
		ps.setInt(7, ass.getSubjectId());
		
		
		int insertRecord = ps.executeUpdate();
		
		
		return insertRecord;
	}

	@Override
	public int insertUserDetail(Connection connection, User u1) throws Exception {
		// TODO Auto-generated method stub
		int userRecordId = 0;
		String query = "insert into user_table(c_First_Name,c_middle_name,c_last_name,c_email,"
				+ "c_gender,c_address,c_password,image,c_qulification,c_contact,c_roll) values (?,?,?,?,?,?,?,?,?,?,?)";   
		try (PreparedStatement ps = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS)) {
			
			ps.setString(1, u1.getFirstname());
			ps.setString(2, u1.getMiddlename());
			ps.setString(3, u1.getLastname());
			ps.setString(4, u1.getEmail());
			ps.setString(5, u1.getXender());
			ps.setString(6, u1.getAddress());
			ps.setString(7, u1.getPassword());
			ps.setBlob(8, u1.getUserProfilepicStream());
			ps.setString(9, u1.getQualification());
			ps.setString(10, u1.getContactno());
			ps.setString(11, u1.getRole());
			int i = ps.executeUpdate();
			ResultSet rs = ps.getGeneratedKeys();
			while (rs.next()) {
				userRecordId = rs.getInt(1);
			}
			
			
		}
		return userRecordId;
	}

	@Override
	public int[] insertFacultyStream(Connection connection, List<Stream> streamList, int userid) throws Exception {
		// TODO Auto-generated method stub
		String query = "insert into faculty_stream_table(i_user_id,i_stream_id) values(?,?)";
		try (PreparedStatement ps = connection.prepareStatement(query)) {
			for (Stream s : streamList) {
				ps.setInt(1, userid);
				ps.setInt(2, s.getStreamid());
				ps.addBatch();
			}
			return ps.executeBatch();
		}
		
	}

	@Override
	public int[] insertFacultySemester(Connection connection, List<Semester> semesterList, int userid) throws SQLException {
		// TODO Auto-generated method stub
		String query = "insert into faculty_semester_table(i_user_id,i_Semester_id) values(?,?)";
		try (PreparedStatement ps = connection.prepareStatement(query)) {
			for (Semester s : semesterList) {
				ps.setInt(1, userid);
				ps.setInt(2, s.getSemid());
				ps.addBatch();
			}
			return ps.executeBatch();
		}
	}

	@Override
	public int[] insertFacultySubject(Connection connection, List<Subject> subjectList, int userid) throws SQLException {
		// TODO Auto-generated method stub
		String query = "insert into faculty_subject_table(i_user_id,i_Subject_id) values(?,?)";
		try (PreparedStatement ps = connection.prepareStatement(query)) {
			for (Subject s : subjectList) {
				ps.setInt(1, userid);
				ps.setInt(2,s.getSubjectId());
				ps.addBatch();
			}
			return ps.executeBatch();
		}
	}

	

	@Override
	public List<Subject> getSubjectsForFaculty(Connection connection, String streamId, List<Subject> subjectId) throws Exception {
		// TODO Auto-generated method stub
		List<Subject> subjectList = new ArrayList<>();
		String query = "select i_Subject_id,c_subject_name from subject_table where i_stream_id = ? and i_Subject_id = ?";
		ResultSet rs=null;
		try(PreparedStatement ps = connection.prepareStatement(query);){
			for(Subject s : subjectId) {
				//Subject s = new Subject();
				ps.setInt(1, (Integer.parseInt(streamId)));
				ps.setInt(2, s.getSubjectId());
				System.out.println("id: "+s.getSubjectId());
				//ps.addBatch();
				 rs = ps.executeQuery();
				while(rs.next()) {
					Subject s1 = new Subject();
					s1.setSubjectId(rs.getInt("i_Subject_id"));
					s1.setSubjectName(rs.getString("c_subject_name"));
					subjectList.add(s1);
				}
			}
			
			//ps.setInt(1, (Integer.parseInt(streamId)));
			
		rs.close();
		ps.close();
	}
		return subjectList;
		
	}

	@Override
	public User getFacultyDetails(int userId,Connection connection) throws Exception {
		// TODO Auto-generated method stub
		TrippleDes t1;
		User u1=new User();
		String query = "select * from user_table where i_user_id=?";
		try(PreparedStatement ps = connection.prepareStatement(query);){
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				
				u1.setFirstname(rs.getString("c_First_Name"));
				u1.setMiddlename(rs.getString("c_middle_name"));
				u1.setLastname(rs.getString("c_last_name"));
				u1.setEmail(rs.getString("c_email"));
				u1.setXender(rs.getString("c_gender"));
				u1.setContactno(rs.getString("c_contact"));
				u1.setAddress(rs.getString("c_address"));
				//u1.setStream(rs.getString("c_stream"));
				u1.setSemester(rs.getInt("i_semester_id"));
				//u1.setDivision(rs.getString("c_division"));
				String password=rs.getString("c_password");
				
				t1=new TrippleDes();
				String decryptpassword=t1.decrypt(password);
				
				u1.setPassword(decryptpassword);
				u1.setQualification(rs.getString("c_qulification"));
			}
		}
		return u1;
	}

	@Override
	public List<Subject> getSubjectforfaculty(int userId, Connection connection) throws Exception {
		// TODO Auto-generated method stub
		String query = "select subject_table.i_Subject_id,subject_table.c_subject_name\r\n" + 
				"from subject_table\r\n" + 
				"inner join faculty_subject_table\r\n" + 
				"on faculty_subject_table.i_Subject_id = subject_table.i_Subject_id\r\n" + 
				"where i_user_id=?";
		
		List<Subject> subjectIdList = new ArrayList<>();
		
		try(PreparedStatement ps = connection.prepareStatement(query);){
				ps.setInt(1, (userId));
				ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Subject s = new Subject();
				s.setSubjectId(rs.getInt("i_Subject_id"));
				s.setSubjectName(rs.getString("c_subject_name"));
				subjectIdList.add(s);
			}
		}
		
		return subjectIdList;
	}

	@Override
	public List<Semester> getSemesterforfaculty(int userId, Connection connection) throws Exception {
		// TODO Auto-generated method stub
		List<Semester> semesterlist = new ArrayList<>();
		String query = "select semester_table.i_Semester_id,semester_table.i_semester_value\r\n" + 
				"from semester_table\r\n" + 
				"inner join faculty_semester_table\r\n" + 
				"on faculty_semester_table.i_Semester_id =semester_table. i_Semester_id\r\n" + 
				"where i_user_id=?";
		try(PreparedStatement ps = connection.prepareStatement(query);){
			ps.setInt(1, (userId));
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Semester s = new Semester();
				s.setSemid(rs.getInt("i_Semester_id"));
				s.setSemvalue(rs.getInt("i_semester_value"));
				semesterlist.add(s);
			}
		}
		return semesterlist;
	}

	@Override
	public List<Semester> getAllSemester(Connection connection) throws SQLException {
		// TODO Auto-generated method stub
		List<Semester> semList = new ArrayList<>();
		String query = "select * from semester_table";
		try(PreparedStatement ps = connection.prepareStatement(query);){
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Semester s = new Semester();
				s.setSemid(rs.getInt("i_Semester_id"));
				s.setSemvalue(rs.getInt("i_semester_value"));
				semList.add(s);
			}
		}
		return semList;
	}

	@Override
	public List<Stream> getAllStream(Connection connection) throws Exception {
		// TODO Auto-generated method stub
		List<Stream> streamlist = new ArrayList<>();
		String query = "select * from stream_table";
		try(PreparedStatement ps = connection.prepareStatement(query);){
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Stream s = new Stream();
				s.setStreamid(rs.getInt("i_stream_id"));
				s.setStreamname(rs.getString("c_stream"));
				streamlist.add(s);
			}
		}
		
		return streamlist;
	}

	@Override
	public List<Subject> getAllSubject(Connection connection) throws Exception {
		// TODO Auto-generated method stub
		List<Subject> subjectlist = new ArrayList<>();
		String query = "select * from subject_table";
		try(PreparedStatement ps = connection.prepareStatement(query);){
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Subject s = new Subject();
				s.setSubjectId(rs.getInt("i_Subject_id"));
				s.setSubjectName(rs.getString("c_subject_name"));
				subjectlist.add(s);
			}
		}
		
		return subjectlist;
	}

	@Override
	public List<Subject> getSubjectForStudent(Connection connection, User u1) throws Exception {
		// TODO Auto-generated method stub
		List<Subject> subjectlist = new ArrayList<>();
		String query = "select i_Subject_id,c_subject_name from subject_table where i_stream_id=? and i_Semester_id=?";
		try(PreparedStatement ps = connection.prepareStatement(query);){
			ps.setInt(1, Integer.parseInt(u1.getStream()));
			ps.setInt(2, u1.getSemester());
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Subject s = new Subject();
				s.setSubjectId(rs.getInt("i_Subject_id"));
				s.setSubjectName(rs.getString("c_subject_name"));
				subjectlist.add(s);
			}
		}
		return subjectlist;
	}

	@Override
	public List<Assignment> fetchAssignments(Connection connection, String ss) throws Exception {
		// TODO Auto-generated method stub
		List<Assignment> asslist = new ArrayList<>();
		String query = "select * from ass_faculty_table where i_Subject_id=?";
		try(PreparedStatement ps = connection.prepareStatement(query);){
			ps.setInt(1, Integer.parseInt(ss));
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Assignment a = new Assignment();
				a.setAssId(rs.getInt("i_ass_faculty_id"));
				a.setTitle(rs.getString("c_title"));
				a.setDiscription(rs.getString("c_description"));
				a.setUploadDate(rs.getString("d_upload_date"));
				a.setDate(rs.getString("d_due_date"));
				byte[] fileData = rs.getBytes("PDF");
				if (null != fileData && fileData.length > 0) {
					String fileString = Base64.getEncoder().encodeToString(fileData);
					a.setAssPDFstring(fileString);
				}
				a.setUsesrId(rs.getInt("i_user_id"));
				a.setSubjectId(rs.getInt("i_Subject_id"));
				
				asslist.add(a);
			}
		}
		return asslist;
	}

	@Override
	public List<User> fetchFacultyForAss(Connection connection, List<Integer> userIdList) throws Exception {
		// TODO Auto-generated method stub
		List<User> faculty = new ArrayList<>();
		String query = "select c_First_Name,c_middle_name from user_table where i_user_id=? and i_status=1";
		ResultSet rs=null;
		try(PreparedStatement ps = connection.prepareStatement(query);){
			for(Integer s : userIdList) {
				ps.setInt(1, s);
				System.out.println("user id: "+s);
				 rs = ps.executeQuery();
				while(rs.next()) {
					User u1 = new User();
					u1.setFirstname(rs.getString("c_First_Name"));
					u1.setMiddlename(rs.getString("c_middle_name"));
					faculty.add(u1);
				}
			}
			
			//ps.setInt(1, (Integer.parseInt(streamId)));
			
		rs.close();
		ps.close();
	}
		return faculty;
	}

	@Override
	public InputStream fetchAssPdf(Connection connection, int id) throws Exception {
		// TODO Auto-generated method stub
		InputStream inputStream=null;
		String query = "select PDF from ass_faculty_table where i_ass_faculty_id=?";
		try(PreparedStatement ps = connection.prepareStatement(query);){
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Blob blob = rs.getBlob("PDF");
				inputStream = blob.getBinaryStream();
			}
			
		}
		return inputStream;
	}

	@Override
	public List<Integer> getSelectedSem(Connection connection, int streamId, int userId) throws Exception {
		// TODO Auto-generated method stub
		List<Integer> semList = new ArrayList<>();
		String query = "select semester_table.i_Semester_id  \r\n" + 
				"from semester_table\r\n" + 
				"inner join faculty_semester_table\r\n" + 
				"on faculty_semester_table.i_Semester_id=semester_table.i_Semester_id\r\n" + 
				"where i_stream_id=? and i_user_id=?";
		try(PreparedStatement ps = connection.prepareStatement(query);){
			ps.setInt(1, streamId);
			ps.setInt(2, userId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				semList.add(rs.getInt("i_Semester_id"));
				
		//		s.setSemvalue(rs.getInt("i_semester_value"));
				
			}
			
		}
		return semList;
	}

	@Override
	public List<Integer> getSelectedSub(Connection connection, int semesterId, List<Subject> subjectId) {
		// TODO Auto-generated method stub
		
		return null;
	}

	@Override
	public int updateTeacherDetails(Connection connection, User u1) throws Exception {
		// TODO Auto-generated method stub
		String query = "update user_table set c_First_Name=?,c_middle_name=?,c_last_name=?,"
				+ "c_contact=?,image=?,c_address=?,c_password=?,c_qulification=? where i_user_id=?";
		
		try(PreparedStatement ps = connection.prepareStatement(query);){
			ps.setString(1, u1.getFirstname());
			ps.setString(2, u1.getMiddlename());
			ps.setString(3, u1.getLastname());
			ps.setString(4, u1.getContactno());
			ps.setBlob(5, u1.getUserProfilepicStream());
			ps.setString(6, u1.getAddress());
			ps.setString(7, u1.getPassword());
			ps.setString(8, u1.getQualification());
			ps.setInt(9, u1.getId());
			return ps.executeUpdate();
		}
		//return 0;
	}

	@Override
	public void deleteTeacherStream(Connection connection, int id) throws Exception {
		// TODO Auto-generated method stub
		String query = "delete from faculty_stream_table where i_user_id=?";
		try(PreparedStatement ps = connection.prepareStatement(query)){
			ps.setInt(1, id);
			ps.executeUpdate();
		}
		
	}

	@Override
	public void deleteTeacherSemester(Connection connection, int id) throws Exception {
		// TODO Auto-generated method stub
		String query = "delete from faculty_semester_table where i_user_id=?";
		try(PreparedStatement ps = connection.prepareStatement(query)){
			ps.setInt(1, id);
			ps.executeUpdate();
		}
		
	}

	@Override
	public void deleteTeacherSubject(Connection connection, int id) throws Exception {
		// TODO Auto-generated method stub
		String query = "delete from faculty_subject_table where i_user_id=?";
		try(PreparedStatement ps = connection.prepareStatement(query)){
			ps.setInt(1, id);
			ps.executeUpdate();
		}
		
	}

	@Override
	public List<User> getAllFaculty(Connection connection) throws Exception {
		// TODO Auto-generated method stub
		List<User> userlist = new ArrayList<>();
		String query = "select * from user_table where c_roll='FACULTY' and i_status=1";
		try(PreparedStatement ps = connection.prepareStatement(query)){
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				User user = new User();
				user.setId(rs.getInt("i_user_id"));
				user.setFirstname(rs.getString("c_First_Name"));
				user.setMiddlename(rs.getString("c_middle_name"));
				user.setLastname(rs.getString("c_last_name"));
				user.setEmail(rs.getString("c_email"));
				user.setXender(rs.getString("c_gender"));
				user.setContactno(rs.getString("c_contact"));
				user.setAddress(rs.getString("c_address"));
				user.setPassword(rs.getString("c_password"));
				user.setQualification(rs.getString("c_qulification"));
				byte[] imagedata = rs.getBytes("image");
				if(null != imagedata && imagedata.length > 0) {
					String imagestr = Base64.getEncoder().encodeToString(imagedata);
					user.setUserProfilepicString(imagestr);
				}
				
//				Blob blob=rs.getBlob("image");
//				byte[] b=blob.getBytes(1,(int)blob.length());
//				user.setImagedata(b);
				userlist.add(user);
			}
			return userlist;
		}
		//return userlist;
	}

	@Override
	public int deletefaculty(Connection connection, int userId) throws Exception {
		// TODO Auto-generated method stub
		String query = "update user_table set i_status=0 where i_user_id=?";
		try(PreparedStatement ps = connection.prepareStatement(query)){
			ps.setInt(1, userId);
			return ps.executeUpdate();
		}
		//return 0;
	}

	
	
}
