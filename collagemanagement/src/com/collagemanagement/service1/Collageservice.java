package com.collagemanagement.service1;

import java.util.List;

import com.collagemanagement.bean.Feedback;
import com.collagemanagement.bean.Log;
import com.collagemanagement.bean.Stream;
import com.collagemanagement.bean.User;
import com.collagemanagement.bean.Semester;
public interface Collageservice 
{
	public String saveuserdetails(User u1);

	public User fetchlogindetails(User u1);
	
	public String getemail(String str);

	public User getfirstname(String username);
	
	public String Updatepassword(User user);
	
	public User getuserdetails(int userid);
	
	public String updatestudentdetails(User u1);
	
	public List<Stream> fetchstreamdetails();
	
	public String activateaccount(String email, String hash);
	
	public List<User> getstudentdetails();
	
	public String deletstudentdetails(String id);
	
	public List<User> getFacultydetails();
	
	public String deletfacultydetails(String id);

	public List<User> fetchStudentDetails(String streamid);

	public String updateStudentStatus(String id);

	public String deletStudentPermanently(String id);

	public int fetchStreamid(String id);

	public String validEmail(String str);

	public String insertdate(String username, int i);

	public String saveFeedbackDetails(Feedback f1);

	
}
//Pull 
