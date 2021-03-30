package com.collagemanagement.dao1;

import java.sql.Connection;
import java.util.List;

import com.collagemanagement.bean.FeesDetails;
import com.collagemanagement.bean.User;

public interface FeesPaymentDao 
{

	String getStreamname(Connection connection, int id);

	int getamount(Connection connection, int id, int semesterid);

	int getSemValue(Connection c1, int semesterid, int id);

	int UpdateFeesPaymentDetails(Connection c1, FeesDetails fees);

	int insertFee(Connection c1, FeesDetails fees);

	FeesDetails selectinvoiceDetails(Connection connection, int id);

	List<User> fetchFeesPaystudentdetails(Connection connection);

	int removeOrder(Connection c1, FeesDetails fees);
  
}
