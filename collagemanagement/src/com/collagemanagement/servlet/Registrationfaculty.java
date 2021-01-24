package com.collagemanagement.servlet;

import java.io.IOException;
import java.util.Random;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class Registrationfaculty
 */
public class Registrationfaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Collageserviceimpl collage =new Collageserviceimpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registrationfaculty() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String str=request.getParameter("email");
		
		System.out.println("Email id :- "+str);		
		String  got= collage.getemail(str);
		
		
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
		doGet(request, response);
		
		User u1=new User();
		SendEmail m1=new SendEmail();
		
		String role=request.getParameter("role");
		String fname=request.getParameter("firstname");
		String mname=request.getParameter("middlename");
		String lname=request.getParameter("lastname");
		String stream=request.getParameter("stream");
		String xender=request.getParameter("gender");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String number=request.getParameter("number");
		String address=request.getParameter("address");
		Part part=request.getPart("profile_photo");
		String qualification=request.getParameter("qualification");
		
		
		Random theRandom = new Random();
		theRandom.nextInt(999999);
		String myHash = DigestUtils.md5Hex("" +	theRandom);
		
		
		if(null!=part) {
			System.out.println("File Name" + part.getName());
			System.out.println("File Name 2" + part.getSubmittedFileName());
			System.out.println("File Size :: " + part.getSize());
			u1.setUserProfilepicStream( part.getInputStream());
		}
		
		TrippleDes td=null;
		try {
			 td=new TrippleDes();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		String encryptedpassword=td.encrypt(password);
		
		System.out.println("Registered User is "+role);
		System.out.println("First Name is "+fname);
		System.out.println("Middle Name is "+mname);
		System.out.println("Last Name is "+lname);
		System.out.println("stream is "+stream);
		System.out.println("xender "+xender);
		System.out.println("email is "+email);
		System.out.println("encryptedpassword is "+encryptedpassword);
		String de=td.decrypt(encryptedpassword);
		System.out.println("Depassword is "+de);
		System.out.println("Number is "+number);
		System.out.println("address is "+address);
		System.out.println("qualification is"+qualification);
		
		u1.setFirstname(fname);
		u1.setMiddlename(mname);
		u1.setLastname(lname);
		u1.setStream(stream);
		u1.setXender(xender);
		u1.setEmail(email);
		u1.setPassword(encryptedpassword);
		u1.setContactno(number);
		u1.setAddress(address);
		u1.setRole(role);
		u1.setQualification(qualification);
		u1.setMyHash(myHash);
		
		String url= request.getRequestURI();
		u1.setURL(url);
		
		System.out.println("URL is "+url);
		String message=collage.saveuserdetails(u1);		
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