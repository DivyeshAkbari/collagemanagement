package com.collagemanagement.service1;

import java.io.InputStream;
import java.util.List;

import com.collagemanagement.bean.Marks;
import com.collagemanagement.bean.Paper;
import com.collagemanagement.bean.Papertype;
import com.collagemanagement.bean.Result;
import com.collagemanagement.bean.Semester;
import com.collagemanagement.bean.Subject;
import com.collagemanagement.bean.User;

public interface ResultSectionService 
{

	public List<Subject> fetachSubjectDetails(String streamid, String semid, int i);

	public List<Marks> fatchMarksDetails(int id, String semid);

	public List<Semester> getSemvalue(int id);

	public User fetchEmailid(User u1);

	public Result fetchStatusDetails(int id, String semid);

	public int fetchStreamId(String sem);

	public List<Subject> fetchSubjectDetails(String sem);

	public String InsertPaperDetails(Paper p1);

	public List<Semester> fetchSemvalue(int id);

	public List<Paper> fetchYearDetails(Paper p1);

	public int fetchPaperID(Paper paper);

	public List<Papertype> fetchPapertype();

	public InputStream getPDf(int id);

	public String validatePaperYear(Paper paper);

	

}
