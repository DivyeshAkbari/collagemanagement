package com.collagemanagement.dao1;

import java.io.InputStream;
import java.sql.Connection;
import java.util.List;

import com.collagemanagement.bean.Marks;
import com.collagemanagement.bean.Paper;
import com.collagemanagement.bean.Papertype;
import com.collagemanagement.bean.Result;
import com.collagemanagement.bean.Semester;
import com.collagemanagement.bean.Subject;
import com.collagemanagement.bean.User;

public interface ResultSectionDao
{

	public List<Subject> getSubjectDetails(Connection c1, String streamid, String semid, int i);

	public List<Marks> getMarksDetails(Connection c1, int id,  String semid);

	public List<Semester> fetchSemvalue(Connection c1, int id);

	public User getEmailid(Connection c1, User u1);

	public Result getStatusDetails(Connection c1, int id, String semid);

	public int getStreamId(Connection c1, String sem);

	public List<Subject> GetSubjectDetails(Connection c1, String sem);

	public int setPaperDetails(Connection c1, Paper p1);

	public List<Semester> getSemvalue(Connection c1, int id);

	public List<Paper> getYearDetails(Connection c1, Paper p1);

	public int getPaperID(Connection c1, Paper paper);

	public List<Papertype> getPapertype(Connection c1);

	public InputStream fetchPaper(Connection c1, int id);

	public int validatePaper(Connection c1, Paper paper);

}
