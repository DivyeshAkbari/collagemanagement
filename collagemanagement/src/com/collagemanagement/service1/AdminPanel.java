package com.collagemanagement.service1;

import java.util.List;

import com.collagemanagement.bean.FeesDetails;
import com.collagemanagement.bean.Notice;
import com.collagemanagement.bean.User;

public interface AdminPanel {
	
	public int fetchStudent();
	
	public int fetchfemaleStudent();
	
	public int fetchTotalStudent();
	
	public int fetchTotalTeacher();
	
	public int fetchTotalEarning();
	
	public int fetchfemaleTeacher();
	
	public int fetchmaleTeacher();

	public List<FeesDetails> getSplineAreaChartDetail();

	public String insertNotice(Notice notice);
	
	
	
}