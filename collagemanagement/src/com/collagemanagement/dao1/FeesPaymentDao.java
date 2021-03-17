package com.collagemanagement.dao1;

import java.sql.Connection;

public interface FeesPaymentDao {

	String getStreamname(Connection connection, int id);

	int getamount(Connection connection, int id, int semesterid);

}
