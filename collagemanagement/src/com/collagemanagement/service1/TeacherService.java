package com.collagemanagement.service1;

import java.io.InputStream;
import java.util.List;

import com.collagemanagement.bean.Assignment;
import com.collagemanagement.bean.Semester;
import com.collagemanagement.bean.Semester1;
import com.collagemanagement.bean.Stream;
import com.collagemanagement.bean.Subject;
import com.collagemanagement.bean.User;

public interface TeacherService {

	List<Semester1> fetchSemester(String streamId);

	List<Subject> fetchSubject(int streamId, String semValue);

	int fetchStreamId(String semValue);

	List<Stream> fetchstreamdetails(int userId);

//	List<Subject> fetchsubjectdetails(int userId);

	String insertAssDetail(Assignment ass);

	String saveuserdetails(User u1);

	List<Subject> fetchsubjectdetails(int userId, String streamId);

	User fetchUserDetail(int userId);

	List<Semester> fetchAllSemester();

	List<Stream> fetchAllStream();

	List<Subject> fetchAllSubject();

	List<Subject> fetchSubjectForStudent(User u1);

	List<Assignment> getAssignments(String ss);

	List<User> fetchFacultyForAss(List<Integer> userIdList);

	InputStream getPDf(int id);

	List<Integer> fetchSelectedSemester(int streamId, int userId);

	List<Integer> fetchSelectedSubject(int userId, int semesterId);

	String modifyTeacherDetails(User u1);

	List<User> fetchFacultyDetail();

	String removeFaculty(int userId);


}
