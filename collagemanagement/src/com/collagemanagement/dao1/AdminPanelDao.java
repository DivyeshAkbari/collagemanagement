package com.collagemanagement.dao1;

import java.sql.Connection;
import java.util.List;

import com.collagemanagement.bean.FeesDetails;
import com.collagemanagement.bean.Notice;
import com.collagemanagement.bean.User;

public interface AdminPanelDao {

	int fetchuserdetails(Connection connection);

	int getTotalStudent(Connection connection);

	int getTotalTeacher(Connection connection);

	int getTotalEarning(Connection connection);

	int getFemaleStudent(Connection connection);

	int getFemaleTeacher(Connection connection);

	int getmaleTeacher(Connection connection);

	List<FeesDetails> fetchSplinechartDetail(Connection connection);

	String addNotice(Connection connection, Notice notice);

}
