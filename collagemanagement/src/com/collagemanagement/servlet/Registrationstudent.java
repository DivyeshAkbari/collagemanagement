package com.collagemanagement.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.apache.commons.codec.digest.DigestUtils;

import com.collagemanagement.bean.User;
import com.collagemanagement.emailverification.SendEmail;
import com.collagemanagement.encryptpassword.TrippleDes;
import com.collagemanagement.service.impl.Collageserviceimpl;

/**
 * Servlet implementation class Registrationstudent
 */
public class Registrationstudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	Collageserviceimpl college =new Collageserviceimpl(); 
	
	SendEmail m1=new SendEmail();
	String message=null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registrationstudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String str=request.getParameter("email");
		
		System.out.println("Email id :- "+str);		
		String  got= college.getemail(str);
		
		
		System.out.println("Valu "+got);
		if(got.equalsIgnoreCase("found"))
		{ 
			response.getWriter().append("true");
		}
		else
		{
			response.getWriter().append("false");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		User u1=new User();
		
		String role=request.getParameter("role");
		String fname=request.getParameter("firstname");
		String mname=request.getParameter("middlename");
		String lname=request.getParameter("lastname");
		String stream=request.getParameter("stream");
		String sem=request.getParameter("semester");
		String div=request.getParameter("division");
		String xender=request.getParameter("gender");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String number=request.getParameter("number");
		String address=request.getParameter("address");
		Part part=request.getPart("profile_photo");
		
		if(null!=part)
		{
			System.out.println("File Name" + part.getName());
			System.out.println("File Name 2" + part.getSubmittedFileName());
			System.out.println("File Size :: " + part.getSize());
			u1.setUserProfilepicStream( part.getInputStream());
		}
		
		// Generate Hash Code which helps in creating Activation Link
		Random theRandom = new Random();
		theRandom.nextInt(999999);
		String myHash = DigestUtils.md5Hex("" +	theRandom);
		
		
     	TrippleDes td=null;
		try 
		{
			 td=new TrippleDes();
		} 
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
			
		String encryptedpassword=td.encrypt(password);
		
		System.out.println("Registered User is "+role);
		System.out.println("First Name is "+fname);
		System.out.println("Middle Name is "+mname);
		System.out.println("Last Name is "+lname);
		System.out.println("stream is "+stream);
		System.out.println("sem "+sem);
		System.out.println("div "+div);
		System.out.println("xender "+xender);
		System.out.println("email is "+email);
		System.out.println("encryptedpassword is "+encryptedpassword);
		String de=td.decrypt(encryptedpassword);
		System.out.println("Depassword is "+de);
		System.out.println("Number is "+number);
		System.out.println("address is "+address);
	//	System.out.println("qualification is"+qualification);
		
		u1.setFirstname(fname);
		u1.setMiddlename(mname);
		u1.setLastname(lname);
		u1.setStream(stream);
		u1.setSemester(Integer.parseInt(sem));
		u1.setDivision(div);
		u1.setXender(xender);
		u1.setEmail(email);
		u1.setPassword(encryptedpassword);
		u1.setContactno(number);
		u1.setAddress(address);
		u1.setRole(role);
		u1.setMyHash(myHash);
	//	u1.setQualification(qualification);
		
		
		message=college.saveuserdetails(u1);		
		System.out.println(message);
		
		if(message.equals("Registrationsuccess"))
		{
			response.sendRedirect("verify.jsp");
		}
		else
		{
			response.sendRedirect("register.jsp");
		}
	}
}

