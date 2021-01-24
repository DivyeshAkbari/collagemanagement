package com.collagemanagement.dao1;

import java.sql.Connection;
import java.util.List;

import com.collagemanagement.bean.Log;
import com.collagemanagement.bean.Stream;
import com.collagemanagement.bean.User;

public interface CollageDao
{
	public int insertuserdetails(Connection connection, User u1);
	public User getlogindetails(Connection connection, User user);
	public int fetchemail(Connection connection, String str);
	public User fetchfname(Connection connection, String username);
	public int Changepassword(Connection connection, User user);
	public List<User> fetchuserdetails(Connection connection, String email);
	public int changestudentdetails(Connection connection, User u1, String email);
	public List<Stream> getstreamdetais(Connection connection);
	public int sendaccountactivatedmail(Connection connection, String email, String hash);
	public List<User> fetchstudentdetails(Connection connection);
	public int removestudentdetails(Connection connection, String id) ;
	public List<User> fetchfacultydetails(Connection connection);
	public int removefacultydetails(Connection connection, String id);
}
