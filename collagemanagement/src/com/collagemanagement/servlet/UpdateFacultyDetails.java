package com.collagemanagement.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.collagemanagement.bean.User;
import com.collagemanagement.emailverification.SendEmail;
import com.collagemanagement.encryptpassword.TrippleDes;
import com.collagemanagement.service.impl.Collageserviceimpl;

/**
 * Servlet implementation class UpdateFacultyDetails
 */
public class UpdateFacultyDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	Collageserviceimpl collage =new Collageserviceimpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateFacultyDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		
		User u1=new User();
		
		
		ServletContext Email=getServletContext();
		String email=(String) Email.getAttribute("email");
		
		String role=request.getParameter("role");
		String fname=request.getParameter("firstname");
		String mname=request.getParameter("middlename");
		String lname=request.getParameter("lastname");
		String stream=request.getParameter("stream");
		String xender=request.getParameter("gender");
		String emaill=request.getParameter("email");
		String password=request.getParameter("password");
		String number=request.getParameter("number");
		String address=request.getParameter("address");
		Part part=request.getPart("profile_photo");
		String qualification=request.getParameter("qualification");
		
		
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
		u1.setEmail(emaill);
		u1.setPassword(encryptedpassword);
		u1.setContactno(number);
		u1.setAddress(address);
		u1.setRole(role);
		u1.setQualification(qualification);
		
		String message=collage.updatestudentdetails(u1, email);
		
		System.out.println(message);
		if(message.equals("Updated"))
		{
			response.sendRedirect("login.jsp");
		}
	}
}
