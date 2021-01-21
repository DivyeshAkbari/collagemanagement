package com.collagemanagement.servlet;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.User;
import com.collagemanagement.emailverification.SendEmail;
import com.collagemanagement.encryptpassword.TrippleDes;
import com.collagemanagement.service.impl.Collageserviceimpl;

/**
 * Servlet implementation class UpdateStudentDetails
 */
public class UpdateStudentDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	Collageserviceimpl collage =new Collageserviceimpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateStudentDetails() {
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
		
		System.out.println(email);
		
		String fname=request.getParameter("firstname");
		String mname=request.getParameter("middlename");
		String lname=request.getParameter("lastname");
		String stream=request.getParameter("stream");
		String sem=request.getParameter("semester");
		String div=request.getParameter("division");
		String xender=request.getParameter("gender");
		String emaill=request.getParameter("email");
		String password=request.getParameter("password");
		String number=request.getParameter("number");
		String address=request.getParameter("address");
			
		
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

		String encrypt=td.encrypt(password);
	
		u1.setFirstname(fname);
		u1.setMiddlename(mname);
		u1.setLastname(lname);
		u1.setStream(stream);
		u1.setSemester(Integer.parseInt(sem));
		u1.setDivision(div);
		//u1.setXender(xender);
		u1.setEmail(emaill);
		u1.setPassword(encrypt);
		u1.setContactno(number);
		u1.setAddress(address);
		
		
		System.out.println("First Name is "+fname);
		System.out.println("Middle Name is "+mname);
		System.out.println("Last Name is "+lname);
		System.out.println("stream is "+stream);
		System.out.println("sem "+sem);
		System.out.println("div "+div);
	//	System.out.println("xender "+xender);
		System.out.println("email is "+emaill);
		System.out.println("Number is "+number);
		System.out.println("address is "+address);
		
		String message=collage.updatestudentdetails(u1,email);
		
		System.out.println("Message is "+message);
		if(message.equals("Updated"))
		{
			response.sendRedirect("login.jsp");
		}
	}
}
