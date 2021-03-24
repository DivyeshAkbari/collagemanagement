package com.collagemanagement.service1;

import com.collagemanagement.bean.FeesDetails;

public interface FeesPaymentService {
	
	public String fetchstreamname(int id);
	
	public int fetchamount(int id,int semesterid);
	public int fetchSemValue(int semesterid,int id);
   

	public String UpdatePaymentDetails(FeesDetails fees);

	String insertFeeDetails(FeesDetails fees);
}
