package com.collagemanagement.service1;

import java.util.List;

import com.collagemanagement.bean.FeesDetails;
import com.collagemanagement.bean.User;

public interface FeesPaymentService {
	
	public String fetchstreamname(int id);
	
	public int fetchamount(int id,int semesterid);
	
	public int fetchSemValue(int semesterid,int id);
   
	public String UpdatePaymentDetails(FeesDetails fees);

	String insertFeeDetails(FeesDetails fees);

	public FeesDetails fetchinvoiceDetails(int id);

	public List<User> getFeesPaymentstudentdetails();
	
	 String DeletOrder(FeesDetails fees);
}
