<%@page import="com.collagemanagement.bean.User"%>
<%@page import="com.collagemanagement.bean.FeesDetails"%>
<%@page import="com.collagemanagement.service.impl.FeesPaymentServiceImpl"%>
<%@page import="com.collagemanagement.service1.FeesPaymentService"%>
 
<%@page import="utils.PaytmConstants"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"  %>
<%@ page import="java.util.*,com.paytm.pg.merchant.CheckSumServiceHelper"%>

 
<%
Enumeration<String> paramNames = request.getParameterNames();
Map<String, String[]> mapData = request.getParameterMap();
TreeMap<String,String> parameters = new TreeMap<String,String>();
String paytmChecksum =  "";
while(paramNames.hasMoreElements()) {
	String paramName = (String)paramNames.nextElement();
	if(paramName.equals("CHECKSUMHASH")){
		paytmChecksum = mapData.get(paramName)[0];
	}else{
		parameters.put(paramName,mapData.get(paramName)[0]);
	}
}
boolean isValideChecksum = false;
String outputHTML="";
try{
	isValideChecksum = CheckSumServiceHelper.getCheckSumServiceHelper().verifycheckSum(PaytmConstants.MERCHANT_KEY,parameters,paytmChecksum);
	if(isValideChecksum && parameters.containsKey("RESPCODE")){
		if(parameters.get("RESPCODE").equals("01")){
			outputHTML = parameters.toString();
		}else{
			outputHTML="<b>Payment Failed.</b>";
		}
	}else{
		outputHTML="<b>Checksum mismatched.</b>";
	}
}catch(Exception e){
	outputHTML=e.toString();
}
%>

<%
	FeesDetails fees = new FeesDetails();
	String str = String.valueOf(parameters); 

	FeesPaymentService feespayment = new FeesPaymentServiceImpl();
	
	String s[] = str.split(",");
	String s1[] = s[5].split("=");
	String s2[]=s[10].split("=");
	String s4[] = s[11].split("=");
	String s8[]=s[10].split("=");
	
	
	
	fees.setOrderid(s1[1]);
	fees.setPaymentdate(s4[1]);
	String responseofpayment=feespayment.UpdatePaymentDetails(fees);
	
	
	
	
	 
	
	

%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%= outputHTML %>
<a href="index.jsp">Back</a>
</body>
</html>