package com.collagemanagement.service1;

import java.util.List;
import com.collagemanagement.bean.Event;
import com.collagemanagement.bean.FeesDetails;
import com.collagemanagement.bean.Notice;
import com.collagemanagement.bean.Stream;
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

	public List<Notice> selectNotice();

	public String removenotice(String noticeid);

	public List<Stream> fetchCourse();

	public String insertEvent(Event event);

	public List<Event> fetchEvent(int i);

	public String activateEvent(String id);

	public String expireEvent(String id);
	
	public int fetchactivemaleStudent();
	
	public int fetchactivefemaleStudent();

}