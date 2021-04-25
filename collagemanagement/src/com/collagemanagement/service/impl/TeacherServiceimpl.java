package com.collagemanagement.service.impl;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.http.HttpSession;

import com.collagemanagement.bean.Assignment;
import com.collagemanagement.bean.Image;
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
		try (Connection connection = getConnection();) {

			// semesterlist =

			return teacherdao.getSemesters(streamId, connection);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return semesterlist;
	}

	public static Connection getConnection() throws SQLException {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}

		String url = "jdbc:mysql://localhost:3306/educhamp_schema";
		String username = "root";
		String password = "root";

		return DriverManager.getConnection(url, username, password);
	}

	public List<Subject> fetchSubject(int streamId, String semValue) {
		// TODO Auto-generated method stub
		List<Subject> subjectList = null;

		try (Connection connection = getConnection();) {

			System.out.println("Stream id in service impl: " + streamId + " and sem value is: " + semValue);

			return teacherdao.getSubjects(streamId, semValue, connection);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return subjectList;
	}

	public int fetchStreamId(String semValue) {
		// TODO Auto-generated method stub
		try (Connection connection = getConnection();) {

			return teacherdao.getStreamId(semValue, connection);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<Stream> fetchstreamdetails(int userId) {
		// TODO Auto-generated method stub
		List<Stream> streamlist = null;
		try (Connection connection = getConnection();) {

			

			return teacherdao.getStreamforfaculty(userId, connection);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return streamlist;
	}

	public String insertAssDetail(Assignment ass) {
		// TODO Auto-generated method stub
		try (Connection connection = getConnection();) {

			int i1 = teacherdao.setAssDetail(ass, connection);
			if (i1 > 0)
				return "true";
			else
				return "false";

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
		try (Connection connection = getConnection();) {
			int userid = teacherdao.insertUserDetail(connection, u1);

			List<Stream> streamList = u1.getStreamList();
			List<Semester> semesterList = u1.getSemesterList();
			List<Subject> subjectList = u1.getSubjectList();
			int[] insertStream = teacherdao.insertFacultyStream(connection, streamList, userid);
			int[] insertSemester = teacherdao.insertFacultySemester(connection, semesterList, userid);
			int[] insertSubject = teacherdao.insertFacultySubject(connection, subjectList, userid);

			if (userid > 0)
				message = "Faculty registration success";
			else
				message = "Faculty registration not success";

		} catch (Exception e) {
			e.printStackTrace();
		}
		return message;
	}

	@Override
	public List<Subject> fetchsubjectdetails(int userId, String streamId) {
		// TODO Auto-generated method stub
		List<Subject> subjectlist = null;
		try (Connection connection = getConnection();) {

			List<Subject> subjectId = teacherdao.getSubjectIdforfaculty(userId, connection);

			subjectlist = teacherdao.getSubjectsForFaculty(connection, streamId, subjectId);

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
		try (Connection connection = getConnection();) {

			user = teacherdao.getFacultyDetails(userId, connection);

			List<Stream> streamList = fetchAllStream();
			// List<Stream> streamList = teacherdao.getStreamforfaculty(userId,connection);
			List<Semester> semesterList = teacherdao.getSemesterforfaculty(userId, connection);
			List<Subject> subjectList = teacherdao.getSubjectforfaculty(userId, connection);

			System.out.println("Semester list : " + semesterList);
			List<Integer> semesterId = semesterList.stream().map(Semester::getSemid).collect(Collectors.toList());
			System.out.println("Semester id list : " + semesterId);

			List<Integer> subjectsId = subjectList.stream().map(Subject::getSubjectId).collect(Collectors.toList());
			System.out.println("hiiiii Selected sub id list : " + subjectsId);
			// int cntloop=0;
			for (Stream s : streamList) {

				List<Semester1> allsemlist = fetchSemester(String.valueOf(s.getStreamid()));
				for (Semester1 s1 : allsemlist) {

					// System.out.println("cnt: "+cntloop++);
					if (semesterId.contains(s1.getSemId())) {
						System.out.println("In if condition" + s1.getSemId());
						s1.setSelected(true);
						// System.out.println("Stream id is is: "+s.getStreamid()+"Semester id:
						// "+String.valueOf(s1.getSemId()));
						List<Subject> allsublist = fetchSubject(s.getStreamid(), String.valueOf(s1.getSemId()));
						// System.out.println("Alllll sub list: "+allsublist);
						for (Subject s2 : allsublist) {
							if (subjectsId.contains(s2.getSubjectId())) {
								System.out.println("In if condition" + s2.getSubjectId());
								s2.setSelected(true);
							}
						}

						// System.out.println("allsublist: "+allsublist);
						s1.setSubjects(allsublist);
					} else {
						System.out.println("In else");
					}

				} // semester loop
				System.out.println("allsemlist: " + allsemlist);
				s.setSemesters(allsemlist);
//				 Semester1 james = allsemlist.stream()
//               		  .filter(ss -> true==(ss.isSelected()))
//               		  .findAny()
//               		  .orElse(null);
				List<Boolean> blist = allsemlist.stream().map(Semester1::isSelected).collect(Collectors.toList());
				boolean check = blist.contains(true);
				s.setStreamCheck(check);

			}

			user.setStreamList(streamList);
			user.setSubjectList(subjectList);
			user.setSemesterList(semesterList);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return user;
	}

	@Override
	public List<Semester> fetchAllSemester() {
		// TODO Auto-generated method stub
		List<Semester> semesterlist = new ArrayList<>();

		try (Connection connection = getConnection();) {

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

		try (Connection connection = getConnection();) {

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

		try (Connection connection = getConnection();) {

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

		try (Connection connection = getConnection();) {

			subjectlist = teacherdao.getSubjectForStudent(connection, u1);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return subjectlist;
	}

	public List<Assignment> getAssignments(String ss, int userid) {
		// TODO Auto-generated method stub
		List<Assignment> asslist = new ArrayList<>();
		// List<Integer> submittedassidlist = new ArrayList<>();
		try (Connection connection = getConnection();) {

			// asslist = teacherdao.fetchSubmittedAss(connection, ss, userid);

			asslist = teacherdao.fetchAssignments(connection, ss, userid);

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
		try (Connection connection = getConnection();) {

			faculty = teacherdao.fetchFacultyForAss(connection, userIdList);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return faculty;
	}

	@Override
	public InputStream getPDf(int id) {
		// TODO Auto-generated method stub
		try (Connection connection = getConnection();) {

			return teacherdao.fetchAssPdf(connection, id);

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
		try (Connection connection = getConnection();) {

			selectedSemList = teacherdao.getSelectedSem(connection, streamId, userId);

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
		try (Connection connection = getConnection();) {

			List<Subject> subjectId = teacherdao.getSubjectIdforfaculty(userId, connection);

			selectedSubList = teacherdao.getSelectedSub(connection, semesterId, subjectId);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return selectedSubList;
	}

	@Override
	public String modifyTeacherDetails(User u1) {
		// TODO Auto-generated method stub
		int updateRecord = 0;
		try (Connection connection = getConnection();) {

			String role = u1.getRole();
			System.out.println("role is: " + role);
			if (role.equalsIgnoreCase("FACULTY"))
				updateRecord = teacherdao.updateTeacherDetails(connection, u1);
			else if (role.equalsIgnoreCase("ADMIN")) {
				updateRecord = teacherdao.updateTeacherDetails(connection, u1);
				teacherdao.deleteTeacherStream(connection, u1.getId());
				teacherdao.deleteTeacherSemester(connection, u1.getId());
				teacherdao.deleteTeacherSubject(connection, u1.getId());

				List<Stream> streamList = u1.getStreamList();
				List<Semester> semesterList = u1.getSemesterList();
				List<Subject> subjectList = u1.getSubjectList();
				// System.out.println("uid in service impl: "+u1.getId());
				int[] insertStream = teacherdao.insertFacultyStream(connection, streamList, u1.getId());
				int[] insertSemester = teacherdao.insertFacultySemester(connection, semesterList, u1.getId());
				int[] insertSubject = teacherdao.insertFacultySubject(connection, subjectList, u1.getId());

			}

			if (updateRecord > 0) {
				return "record updated successfully";
			}else
				return "record can't be updated.. try again";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	@Override
	public List<User> fetchFacultyDetail() {
		// TODO Auto-generated method stub
		try (Connection connection = getConnection();) {

			return teacherdao.getAllFaculty(connection);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String removeFaculty(int userId) {
		// TODO Auto-generated method stub
		try (Connection connection = getConnection();) {

			int updateRecord = teacherdao.deletefaculty(connection, userId);
//			teacherdao.deleteTeacherStream(connection,userId);
//			teacherdao.deleteTeacherSemester(connection,userId);
//			teacherdao.deleteTeacherSubject(connection,userId);

			if (updateRecord > 0)
				return "record deleted successfully";
			else
				return "record can not deleted successfully";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;

	}

	@Override
	public String insertStuAss(Assignment ass) {
		// TODO Auto-generated method stub
		try (Connection connection = getConnection();) {

			int i1 =  teacherdao.submitAssignment(connection, ass);
			System.out.println("i1 is: " + i1);
			if (i1 > 0)
				return "true";
			else
				return "false";

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
		//return 0;
	}

	@Override
	public List<Assignment> getSubmittedAss(String ss, int userId) {
		// TODO Auto-generated method stub
		List<Assignment> asslist = new ArrayList<>();
		try (Connection connection = getConnection();) {

			asslist = teacherdao.fetchSubmittedAss(connection, ss, userId);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return asslist;
	}

	@Override
	public int removeSubmittedAss(String assid,int userId) {
		// TODO Auto-generated method stub
		try (Connection connection = getConnection();) {

			return teacherdao.deleteSubmittedAss(connection,assid,userId);
//			if(ans > 0)
//				return "1";
//			else
//				return "0";
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		//return null;
		return 0;
	}

	@Override
	public List<Assignment> fetchFacultyAss(String subId, int userId) {
		// TODO Auto-generated method stub
		List<Assignment> facultyAss = new ArrayList<>();
		try (Connection connection = getConnection();) {
			return teacherdao.getFacultyAss(connection,subId,userId);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return facultyAss;
	}

	@Override
	public List<Assignment> fetchUserAss(String subId, int userId, int assId) {
		List<Assignment> userass = new ArrayList<>();
		try (Connection connection = getConnection();) {
			userass =  teacherdao.getStudentsAssList(connection,subId,userId,assId);
			return userass;
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// TODO Auto-generated method stub
		return userass;
	}

	@Override
	public int fetchSemId(String subId) {
		// TODO Auto-generated method stub
		try (Connection connection = getConnection();) {
			return teacherdao.getSemId(connection,subId);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return 0;
	}

	@Override
	public List<User> getStudentDetails(int semId) {
		//List<User> studentlist = new ArrayList<>();
		// TODO Auto-generated method stub
		try (Connection connection = getConnection();) {
			System.out.println("service start.");
			return teacherdao.fetchStudentDetails(connection,semId);
			
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String insertNote(Assignment ass) {
		// TODO Auto-generated method stub
		try (Connection connection = getConnection();) {

			int i1 = teacherdao.insertNote(ass, connection);
			if (i1 > 0)
				return "true";
			else
				return "false";

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Assignment> getNotes(String ss) {
		// TODO Auto-generated method stub
		try (Connection connection = getConnection();) {
			return teacherdao.fetchNotes(ss,connection);
			
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public InputStream getNotesPDf(int id) {
		// TODO Auto-generated method stub
		try (Connection connection = getConnection();) {
			return teacherdao.fetchNotesPdf(connection, id);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public InputStream getStudentAss(int id) {
		// TODO Auto-generated method stub
		try (Connection connection = getConnection();) {

			return teacherdao.fetchStudentAss(connection, id);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String deleteNote(String assid, String userid) {
		// TODO Auto-generated method stub
		try (Connection connection = getConnection();) {
			int i = teacherdao.removeNote(assid,connection,userid);
			if(i > 0)
				return "true";
			else
				return "false";
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public String removeAssFaculty(int userId, String assid) {
		// TODO Auto-generated method stub
		try (Connection connection = getConnection();) {
			int i1 = teacherdao.deleteAssFaculty(connection,userId,assid);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Image> getStudentProfilePic(int semId) {
		// TODO Auto-generated method stub
		try (Connection connection = getConnection();) {
			return teacherdao.fetchStudentProfilePics(semId,connection);
		}catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	@Override
	public List<Assignment> getAllAss(int userId, int semId) {
		// TODO Auto-generated method stub
		List<Assignment> asslist = new ArrayList<>();
		// List<Integer> submittedassidlist = new ArrayList<>();
		try (Connection connection = getConnection();) {

			// asslist = teacherdao.fetchSubmittedAss(connection, ss, userid);

			asslist = teacherdao.fetchAllAss(connection,userId,semId);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return asslist;
	}

}
