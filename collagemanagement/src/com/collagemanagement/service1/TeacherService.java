package com.collagemanagement.service1;

import java.util.List;

import com.collagemanagement.bean.Semester1;

public interface TeacherService {

	List<Semester1> fetchSemester(String streamId);

}
