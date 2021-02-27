package com.collagemanagement.service1;

import java.util.List;

import com.collagemanagement.bean.Semester1;
import com.collagemanagement.bean.Stream;
import com.collagemanagement.bean.Subject;

public interface TeacherService {

	List<Semester1> fetchSemester(String streamId);

	List<Subject> fetchSubject(int streamId, String semValue);

	int fetchStreamId(String semValue);

	List<Stream> fetchstreamdetails(int userId);

	List<Subject> fetchsubjectdetails(int userId);


}
