package com.collagemanagement.service1;

import java.util.List;

import com.collagemanagement.bean.Assignment;
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


}
