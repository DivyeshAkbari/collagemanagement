package com.collagemanagement.dao.impl;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Base64;
import java.util.List;

import com.collagemanagement.bean.Assignment;
import com.collagemanagement.bean.Image;
import com.collagemanagement.bean.Result;
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
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, Integer.parseInt(streamId));
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
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

		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, streamId);
			ps.setInt(2, Integer.parseInt(semValue));
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
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

		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, Integer.parseInt(semValue));
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
				return rs.getInt("i_stream_id");
			}
		}
		return 0;
	}

	@Override
	public List<Stream> getStreamforfaculty(int userId, Connection connection) throws Exception {
		// TODO Auto-generated method stub
		List<Stream> streamList = new ArrayList<>();

		String query = "SELECT stream_table.i_stream_id, stream_table.c_stream\r\n" + "FROM stream_table\r\n"
				+ "INNER JOIN faculty_stream_table\r\n"
				+ "ON stream_table.i_stream_id=faculty_stream_table.i_stream_id where i_user_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, (userId));
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Stream s = new Stream();
				s.setStreamid(rs.getInt("i_stream_id"));
				s.setStreamname(rs.getString("c_stream"));
				streamList.add(s);
			}
			return streamList;
		}

		//return null;
	}

	@Override
	public List<Subject> getSubjectIdforfaculty(int userId, Connection connection) throws Exception {
		// TODO Auto-generated method stub
		List<Subject> subjectIdList = new ArrayList<>();

		String query = "select i_Subject_id from faculty_subject_table where i_user_id=?";
//		String query = "SELECT subject_table.i_Subject_id, subject_table.c_subject_name\r\n" + 
//				"FROM subject_table\r\n" + 
//				"INNER JOIN faculty_subject_table\r\n" + 
//				"ON faculty_subject_table.i_Subject_id=subject_table.i_Subject_id where i_user_id=?";
		System.out.println("fetch subject for faculty");
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, (userId));
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Subject s = new Subject();
				s.setSubjectId(rs.getInt("i_Subject_id"));
				// s.setSubjectName(rs.getString("c_subject_name"));
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
				+ "c_gender,c_address,c_password,image,c_qulification,c_contact,c_roll,i_status,i_status1) values (?,?,?,?,?,?,?,?,?,?,?,1,1)";
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
	public int[] insertFacultySemester(Connection connection, List<Semester> semesterList, int userid)
			throws SQLException {
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
	public int[] insertFacultySubject(Connection connection, List<Subject> subjectList, int userid)
			throws SQLException {
		// TODO Auto-generated method stub
		String query = "insert into faculty_subject_table(i_user_id,i_Subject_id) values(?,?)";
		try (PreparedStatement ps = connection.prepareStatement(query)) {
			for (Subject s : subjectList) {
				ps.setInt(1, userid);
				ps.setInt(2, s.getSubjectId());
				ps.addBatch();
			}
			return ps.executeBatch();
		}
	}

	@Override
	public List<Subject> getSubjectsForFaculty(Connection connection, String streamId, List<Subject> subjectId)
			throws Exception {
		// TODO Auto-generated method stub
		List<Subject> subjectList = new ArrayList<>();
		String query = "select i_Subject_id,c_subject_name from subject_table where i_stream_id = ? and i_Subject_id = ?";
		ResultSet rs = null;
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			for (Subject s : subjectId) {
				// Subject s = new Subject();
				ps.setInt(1, (Integer.parseInt(streamId)));
				ps.setInt(2, s.getSubjectId());
				System.out.println("id: " + s.getSubjectId());
				// ps.addBatch();
				rs = ps.executeQuery();
				while (rs.next()) {
					Subject s1 = new Subject();
					s1.setSubjectId(rs.getInt("i_Subject_id"));
					s1.setSubjectName(rs.getString("c_subject_name"));
					subjectList.add(s1);
				}
			}

			// ps.setInt(1, (Integer.parseInt(streamId)));

			rs.close();
			ps.close();
		}
		return subjectList;

	}

	@Override
	public User getFacultyDetails(int userId, Connection connection) throws Exception {
		// TODO Auto-generated method stub
		TrippleDes t1;
		User u1 = new User();
		String query = "select * from user_table where i_user_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {

				u1.setFirstname(rs.getString("c_First_Name"));
				u1.setMiddlename(rs.getString("c_middle_name"));
				u1.setLastname(rs.getString("c_last_name"));
				u1.setEmail(rs.getString("c_email"));
				u1.setXender(rs.getString("c_gender"));
				u1.setContactno(rs.getString("c_contact"));
				u1.setAddress(rs.getString("c_address"));
				// u1.setStream(rs.getString("c_stream"));
				u1.setSemester(rs.getInt("i_semester_id"));
				// u1.setDivision(rs.getString("c_division"));
				String password = rs.getString("c_password");
				byte[] imagedata = rs.getBytes("image");
				if (null != imagedata && imagedata.length > 0) {
					String imagestr = Base64.getEncoder().encodeToString(imagedata);
					u1.setUserProfilepicString(imagestr);
				}

				t1 = new TrippleDes();
				String decryptpassword = t1.decrypt(password);

				u1.setPassword(decryptpassword);
				u1.setQualification(rs.getString("c_qulification"));
			}
		}
		return u1;
	}

	@Override
	public List<Subject> getSubjectforfaculty(int userId, Connection connection) throws Exception {
		// TODO Auto-generated method stub
		String query = "select subject_table.i_Subject_id,subject_table.c_subject_name\r\n" + "from subject_table\r\n"
				+ "inner join faculty_subject_table\r\n"
				+ "on faculty_subject_table.i_Subject_id = subject_table.i_Subject_id\r\n" + "where i_user_id=?";

		List<Subject> subjectIdList = new ArrayList<>();

		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, (userId));
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
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
		String query = "select semester_table.i_Semester_id,semester_table.i_semester_value\r\n"
				+ "from semester_table\r\n" + "inner join faculty_semester_table\r\n"
				+ "on faculty_semester_table.i_Semester_id =semester_table. i_Semester_id\r\n" + "where i_user_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, (userId));
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
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
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
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
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
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
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
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
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, Integer.parseInt(u1.getStream()));
			ps.setInt(2, u1.getSemester());
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Subject s = new Subject();
				s.setSubjectId(rs.getInt("i_Subject_id"));
				s.setSubjectName(rs.getString("c_subject_name"));
				subjectlist.add(s);
			}
		}
		return subjectlist;
	}

	@Override
	public List<Assignment> fetchAssignments(Connection connection, String ss,int userid)throws Exception {
		// TODO Auto-generated method stub
		List<Assignment> asslist = new ArrayList<>();
//		(\"+StringUtils.join(submittedassidlist, ',')+\")
		String query = "select * from ass_faculty_table where i_Subject_id=? and i_ass_faculty_id not in (select i_ass_faculty_id from ass_student_table where i_user_id=?) ";
		ResultSet rs = null;
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			//for (Integer i : submittedassidlist) {
				ps.setInt(1, Integer.parseInt(ss));
				ps.setInt(2, userid);
//				System.out.println("i: "+i);
				rs = ps.executeQuery();
				while (rs.next()) {
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
			//}
			rs.close();
			ps.close();
		}
		return asslist;
	}

	@Override
	public List<User> fetchFacultyForAss(Connection connection, List<Integer> userIdList) throws Exception {
		// TODO Auto-generated method stub
		List<User> faculty = new ArrayList<>();
		String query = "select i_user_id,c_First_Name,c_middle_name from user_table where i_user_id=? and i_status=1";
		ResultSet rs = null;
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			for (Integer s : userIdList) {
				ps.setInt(1, s);
				System.out.println("user id: " + s);
				rs = ps.executeQuery();
				while (rs.next()) {
					User u1 = new User();
					u1.setId(rs.getInt("i_user_id"));
					u1.setFirstname(rs.getString("c_First_Name"));
					u1.setMiddlename(rs.getString("c_middle_name"));
					faculty.add(u1);
				}
			}

			// ps.setInt(1, (Integer.parseInt(streamId)));

			rs.close();
			ps.close();
		}
		return faculty;
	}

	@Override
	public InputStream fetchAssPdf(Connection connection, int id) throws Exception {
		// TODO Auto-generated method stub
		InputStream inputStream = null;
		String query="";
			query = "select PDF from ass_faculty_table where i_ass_faculty_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
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
		String query = "select semester_table.i_Semester_id  \r\n" + "from semester_table\r\n"
				+ "inner join faculty_semester_table\r\n"
				+ "on faculty_semester_table.i_Semester_id=semester_table.i_Semester_id\r\n"
				+ "where i_stream_id=? and i_user_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, streamId);
			ps.setInt(2, userId);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				semList.add(rs.getInt("i_Semester_id"));

				// s.setSemvalue(rs.getInt("i_semester_value"));

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
				+ "c_contact=?,image=COALESCE(?,image),c_address=?,c_password=?,c_qulification=? where i_user_id=?";

		try (PreparedStatement ps = connection.prepareStatement(query);) {
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
		// return 0;
	}

	@Override
	public void deleteTeacherStream(Connection connection, int id) throws Exception {
		// TODO Auto-generated method stub
		String query = "delete from faculty_stream_table where i_user_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query)) {
			ps.setInt(1, id);
			ps.executeUpdate();
		}

	}

	@Override
	public void deleteTeacherSemester(Connection connection, int id) throws Exception {
		// TODO Auto-generated method stub
		String query = "delete from faculty_semester_table where i_user_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query)) {
			ps.setInt(1, id);
			ps.executeUpdate();
		}

	}

	@Override
	public void deleteTeacherSubject(Connection connection, int id) throws Exception {
		// TODO Auto-generated method stub
		String query = "delete from faculty_subject_table where i_user_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query)) {
			ps.setInt(1, id);
			ps.executeUpdate();
		}

	}

	@Override
	public List<User> getAllFaculty(Connection connection) throws Exception {
		// TODO Auto-generated method stub
		List<User> userlist = new ArrayList<>();
		String query = "select * from user_table where c_roll='FACULTY' and i_status=1";
		try (PreparedStatement ps = connection.prepareStatement(query)) {
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
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
				if (null != imagedata && imagedata.length > 0) {
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
		// return userlist;
	}

	@Override
	public int deletefaculty(Connection connection, int userId) throws Exception {
		// TODO Auto-generated method stub
		String query = "update user_table set i_status=0 where i_user_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query)) {
			ps.setInt(1, userId);
			return ps.executeUpdate();
		}
		// return 0;
	}

	@Override
	public int submitAssignment(Connection connection, Assignment ass) throws Exception {
		// TODO Auto-generated method stub
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();

		// String query = "insert into ass_student_table
		// i_ass_faculty_id=?,i_user_id=?,PDF=?,d_upload_date=?";
		String query = "insert into ass_student_table(i_ass_faculty_id,i_user_id,PDF,d_upload_date)values(?,?,?,?)";
		try (PreparedStatement ps = connection.prepareStatement(query)) {

			ps.setInt(1, ass.getAssId());
			ps.setInt(2, ass.getUsesrId());
			ps.setBlob(3, ass.getAssPDF());
			ps.setString(4, dtf.format(now));

			int insertRecord = ps.executeUpdate();
			System.out.println("insert record: " + insertRecord);

			return insertRecord;
		}

	}

	@Override
	public List<Assignment> fetchSubmittedAss(Connection connection, String ss,  int userid) throws Exception {
		// TODO Auto-generated method stub
		List<Assignment> asslist = new ArrayList<>();
		String query = "select i_ass_faculty_id,c_title,c_description,d_upload_date,d_due_date,i_user_id,"
				+ "i_Subject_id from ass_faculty_table where i_Subject_id=? and i_ass_faculty_id in "
				+ "(select i_ass_faculty_id from ass_student_table where i_user_id=?) ";
		ResultSet rs = null;
		try (PreparedStatement ps = connection.prepareStatement(query);) {
				ps.setInt(1, Integer.parseInt(ss));
				ps.setInt(2, userid);
				rs = ps.executeQuery();
				while (rs.next()) {
					Assignment a = new Assignment();
					a.setAssId(rs.getInt("i_ass_faculty_id"));
					a.setTitle(rs.getString("c_title"));
					a.setDiscription(rs.getString("c_description"));
					a.setUploadDate(rs.getString("d_upload_date"));
					a.setDate(rs.getString("d_due_date"));
				
					a.setUsesrId(rs.getInt("i_user_id"));
					a.setSubjectId(rs.getInt("i_Subject_id"));

					asslist.add(a);
				}
			//}
			rs.close();
			ps.close();
		}
		return asslist;
	}

	@Override
	public int deleteSubmittedAss(Connection connection, String assid, int userId) throws Exception {
		// TODO Auto-generated method stub
		String query = "delete from ass_student_table where i_ass_faculty_id=? and i_user_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1,Integer.parseInt(assid));
			ps.setInt(2, userId);
			return ps.executeUpdate();
		}
		//return 0;
	}

	@Override
	public List<Assignment> getFacultyAss(Connection connection, String subId, int userId) throws Exception {
		// TODO Auto-generated method stub
		List<Assignment> facultyAss = new ArrayList<>();
		String query = "select * from ass_faculty_table where i_user_id=? and i_Subject_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, userId);
			ps.setInt(2, Integer.parseInt(subId));
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Assignment a = new Assignment();
				a.setDiscription(rs.getString("c_description"));
				a.setTitle(rs.getString("c_title"));
				a.setAssId(rs.getInt("i_ass_faculty_id"));
				a.setUploadDate(rs.getString("d_upload_date"));
				a.setDate(rs.getString("d_due_date"));
				facultyAss.add(a);
			}
			return facultyAss;
			
		}
		//return null;
	}

	@Override
	public List<Assignment> getStudentsAssList(Connection connection, String subId, int userId, int assId) throws Exception {
		// TODO Auto-generated method stub
		List<Assignment> studentSubmiitedAss = new ArrayList<>();
//		i_ass_student_id,i_user_id,PDF,d_upload_date
//		String query = "select * from ass_student_table"
//				+ "where i_ass_faculty_id in"
//				+ "(select i_ass_faculty_id from ass_faculty_table where i_user_id=? and i_Subject_id=?)";
//		String query = "select i_ass_student_id,i_user_id,d_upload_date from ass_student_table\r\n" + 
//				"where i_ass_faculty_id in\r\n" + 
//				"(select i_ass_faculty_id from ass_faculty_table where i_user_id=? and i_Subject_id=?)";
		String query = "select ass_student_table.i_ass_student_id,ass_student_table.i_user_id,ass_student_table.d_upload_date,ass_faculty_table.c_title,ass_faculty_table.d_due_date\r\n" + 
				"from ass_student_table\r\n" + 
				"inner join ass_faculty_table\r\n" + 
				"on ass_faculty_table.i_ass_faculty_id=ass_student_table.i_ass_faculty_id\r\n" + 
				"where ass_faculty_table.i_ass_faculty_id in \r\n" + 
				"(select i_ass_faculty_id from ass_faculty_table where i_user_id=? and i_Subject_id=?) and ass_faculty_table.i_ass_faculty_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, userId);
			ps.setInt(2, Integer.parseInt(subId));
			ps.setInt(3, assId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Assignment a = new Assignment();
				a.setAssId(rs.getInt("i_ass_student_id"));
				a.setUsesrId(rs.getInt("i_user_id"));
//				byte[] fileData = rs.getBytes("PDF");
//				if (null != fileData && fileData.length > 0) {
//					String fileString = Base64.getEncoder().encodeToString(fileData);
//					a.setAssPDFstring(fileString);
//				}
				a.setTitle(rs.getString("c_title"));
				a.setDate(rs.getString("d_due_date"));
				a.setUploadDate(rs.getString("d_upload_date"));
				studentSubmiitedAss.add(a);
			}
			return studentSubmiitedAss;
		}
		//return null;
	}

	@Override
	public int getSemId(Connection connection, String subId) throws Exception {
		// TODO Auto-generated method stub
		String query = "select i_Semester_id from subject_table where i_Subject_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, Integer.parseInt(subId));
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				return rs.getInt("i_Semester_id");
			}
		}
		return 0;
	}

	@Override
	public List<User> fetchStudentDetails(Connection connection, int semId) throws Exception {
		// TODO Auto-generated method stub
		List<User> userlist1=new ArrayList<>();
		String query = "select * from user_table where c_roll='STUDENT'  and i_status=1 and i_status1=1 and i_semester_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, semId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				User u1=new User();
				u1.setId(rs.getInt(1));
				u1.setFirstname(rs.getString(2));
				u1.setMiddlename(rs.getString(3));
				u1.setLastname(rs.getString(4));
				u1.setEmail(rs.getString(5));
				u1.setXender(rs.getString(6));
				u1.setAddress(rs.getString("c_address"));
//				byte[] imagedata = rs.getBytes("image");
//				 if(null!=imagedata && imagedata.length>0)
//				 {
//					 String imagestr = Base64.getEncoder().encodeToString(imagedata);
//					 u1.setUserProfilepicString(imagestr);
//				 }
				int streamid=rs.getInt("i_stream_id");
				int semid = rs.getInt("i_semester_id");
				System.out.println("sem id in impl: "+semid);
				try (PreparedStatement p3 = connection.prepareStatement("select i_semester_value from semester_table where i_Semester_id=?");) {
				p3.setInt(1, semid);
				ResultSet r3 =p3.executeQuery();
					if(r3.next()) {
						System.out.println("sem value in impl: "+r3.getInt("i_semester_value"));
						u1.setSemester(r3.getInt("i_semester_value"));
					}
				
				
			}
			
			try (PreparedStatement p2 = connection.prepareStatement("select c_stream from stream_table where i_stream_id=?");) {
				p2.setInt(1, streamid);
				ResultSet r2 =p2.executeQuery();
			
					if(r2.next())
					{
						u1.setStream(r2.getString("c_stream"));
					}
				
			}
				u1.setDivision(rs.getString("c_division"));
				userlist1.add(u1);
			}
			System.out.println("user list in dao impl: "+userlist1);
			return userlist1;
		}
//		for(int i=0;i<20;i++) {
//			User user = new User();
//			user.setId(i);
//			user.setContactno(""+i);
//			userlist1.add(user);
//		}
		//return userlist1;
		
//		System.out.println("In dao");
		//String query = "Select * from user_table where c_roll='STUDENT' and i_status=1 and i_status1=1 and i_semester_id=? and i_user_id=51";
//		try (PreparedStatement ps = connection.prepareStatement(query);) {
//			//ps.setString(1, "STUDENT");
////			ps.setInt(1, semId);
//			
//			
//			ResultSet rs = ps.executeQuery();
//			while(rs.next()) {
//				User u1=new User();
//				u1.setId(rs.getInt(1));
//				u1.setFirstname(rs.getString(2));
//				u1.setMiddlename(rs.getString(3));
//				u1.setLastname(rs.getString(4));
//				u1.setEmail(rs.getString(5));
//				u1.setXender(rs.getString(6));
//				u1.setAddress(rs.getString("c_address"));
//				byte[] imagedata = rs.getBytes("image");
//				if (null != imagedata && imagedata.length > 0) {
//					String imagestr = Base64.getEncoder().encodeToString(imagedata);
//					u1.setUserProfilepicString(imagestr);
//				}
//				int streamid=rs.getInt("i_stream_id");
//				int semid = rs.getInt("i_semester_id");
//				System.out.println("sem id in impl: "+semid);
//				
////				try (PreparedStatement p3 = connection.prepareStatement("select i_semester_value from semester_table where i_Semester_id=?");) {
////					p3.setInt(1, semid);
////					ResultSet r3 =p3.executeQuery();
////						if(r3.next()) {
////							System.out.println("sem value in impl: "+r3.getInt("i_semester_value"));
////							u1.setSemester(r3.getInt("i_semester_value"));
////						}
////					
////					
////				}
////				
////				try (PreparedStatement p2 = connection.prepareStatement("select c_stream from stream_table where i_stream_id=?");) {
////					p2.setInt(1, streamid);
////					ResultSet r2 =p2.executeQuery();
////				
////						if(r2.next())
////						{
////							u1.setStream(r2.getString("c_stream"));
////						}
////					
////				}
//				u1.setDivision(rs.getString("c_division"));
//				userlist1.add(u1);	
//				System.out.println("user list in while: "+userlist1);
//				System.out.println("user .. "+u1);
//			}
//			
//		}
//		System.out.println("user list in dao impl: "+userlist1);
//		return userlist1;
		
	}

	@Override
	public int insertNote(Assignment ass, Connection connection) throws Exception {
		// TODO Auto-generated method stub
		DateTimeFormatter dtf = DateTimeFormatter.ofPattern("yyyy/MM/dd HH:mm:ss");
		LocalDateTime now = LocalDateTime.now();

//		insert into ass_faculty_table(c_title,c_description,d_upload_date,d_due_date,PDF,i_user_id,i_Subject_id)values(?,?,?,?,?,?,?)
		String query = "insert into faculty_notes_table(c_title,c_description,d_upload_date,PDF,i_user_id,i_Subject_id)values(?,?,?,?,?,?) ";

		PreparedStatement ps = connection.prepareStatement(query);

		ps.setString(1, ass.getTitle());
		ps.setString(2, ass.getDiscription());
		ps.setString(3, dtf.format(now));
		ps.setBlob(4, ass.getAssPDF());
		ps.setInt(5, ass.getUsesrId());
		ps.setInt(6, ass.getSubjectId());

		int insertRecord = ps.executeUpdate();

		return insertRecord;
	}

	@Override
	public List<Assignment> fetchNotes(String ss, Connection connection) throws Exception {
		// TODO Auto-generated method stub
		String query = "select * from faculty_notes_table where i_Subject_id=?";
		List<Assignment> notes = new ArrayList<>();
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, Integer.parseInt(ss));
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Assignment a = new Assignment();
				a.setAssId(rs.getInt("i_faculty_notes_id"));
				a.setTitle(rs.getString("c_title"));
				a.setDiscription(rs.getString("c_description"));
				a.setUploadDate(rs.getString("d_upload_date"));
				a.setUsesrId(rs.getInt("i_user_id"));
				int userId = rs.getInt("i_user_id");
				System.out.println("user id is: "+userId);
				try (PreparedStatement ps1 = connection.prepareStatement("select c_First_Name,c_middle_name from user_table where i_user_id=?");) {
					ps1.setInt(1, userId);
					ResultSet r2 =ps1.executeQuery();
				
						if(r2.next())
						{
							a.setUserFirstName(r2.getString("c_First_Name"));
							a.setUserLastName(r2.getString("c_middle_name"));
						}
					
				}
				
				notes.add(a);
			}
			return notes;
		}
		//return null;
	}

	@Override
	public InputStream fetchNotesPdf(Connection connection, int id) throws Exception {
		// TODO Auto-generated method stub
		InputStream inputStream = null;
		String query = "select PDF from faculty_notes_table where i_faculty_notes_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Blob blob = rs.getBlob("PDF");
				inputStream = blob.getBinaryStream();
			}

		}
		return inputStream;
	}

	@Override
	public InputStream fetchStudentAss(Connection connection, int id) throws Exception {
		// TODO Auto-generated method stub
		InputStream inputStream = null;
		String query="";
			query = "select PDF from ass_student_table where i_ass_student_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, id);
			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				Blob blob = rs.getBlob("PDF");
				inputStream = blob.getBinaryStream();
			}

		}
		return inputStream;
	}

	@Override
	public int removeNote(String assid, Connection connection, String userid) throws Exception {
		// TODO Auto-generated method stub
		String query = "delete from faculty_notes_table where i_user_id=? and i_Subject_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, Integer.parseInt(userid));
			ps.setInt(2, Integer.parseInt(assid));
			return ps.executeUpdate();
		}
		//return 0;
	}

	@Override
	public int deleteAssFaculty(Connection connection, int userId, String assid) throws Exception {
		// TODO Auto-generated method stub
		String query = "delete from ass_faculty_table where i_ass_faculty_id=? and i_user_id=?";
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, Integer.parseInt(assid));
			ps.setInt(2, userId);
			return ps.executeUpdate();
		}
		//return 0;
	}

	@Override
	public List<Image> fetchStudentProfilePics(int semId, Connection connection) throws Exception {
		// TODO Auto-generated method stub
		String query = "select image from user_table where c_roll='STUDENT' and i_status=1 and i_status1=1 and  i_semester_id=?";
		List<Image> imagelist =  new ArrayList<>();
		try (PreparedStatement ps = connection.prepareStatement(query);) {
			ps.setInt(1, semId);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				Image i1 = new Image();
//				Blob imageBlob = rs.getBlob("image");
//				InputStream binaryStream = imageBlob.getBinaryStream(0, imageBlob.length());
//				ByteArrayOutputStream outputStream = new ByteArrayOutputStream();
//				i1.setUserProfilepicStream(binaryStream);
//				byte[] buffer = new byte[4096];
//				int bytesRead = -1;
//				 
//				while ((bytesRead = binaryStream.read(buffer)) != -1) {
//				    outputStream.write(buffer, 0, bytesRead);
//				}
//				 
//				byte[] imageBytes = outputStream.toByteArray();
//				 
//				String base64Image = Base64.getEncoder().encodeToString(imageBytes);
//				i1.setUserProfilepicString(base64Image);
				byte[] imagedata = rs.getBytes("image");
				 if(null!=imagedata && imagedata.length>0)
				 {
					 String imagestr = Base64.getEncoder().encodeToString(imagedata);
					 i1.setUserProfilepicString(imagestr);
				 }
				 imagelist.add(i1);
			}
		}
		return imagelist;
	}

}
