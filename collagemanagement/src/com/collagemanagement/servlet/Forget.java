package com.collagemanagement.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.emailverification.SendEmail;
import com.collagemanagement.encryptpassword.TrippleDes;
import com.collagemanagement.other.GenerateOTP;
import com.collagemanagement.service.impl.Collageserviceimpl;

/**
 * Servlet implementation class Forget
 */
public class Forget extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	String email;
	Collageserviceimpl collage =new Collageserviceimpl();
	TrippleDes td;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Forget() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//System.out.println("Do Get");
		
         email=request.getParameter("email");
		
		 String  message=collage.getemail(email);

		if(message.equalsIgnoreCase("found"))
		{ 
			response.getWriter().append("true");
		}
		else
		{
			System.out.println("Else");
			response.getWriter().append("false");
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		// TODO Auto-generated method stub
	
		String email=request.getParameter("email");
		System.out.println("Email is "+email);
		request.setAttribute("message","otp has been sent to your email id go and check your email");
		String otp=GenerateOTP.generateOTP();
		SendEmail m1=new SendEmail(email,"Your Otp is "+otp);
		Thread t1=new Thread(m1);
		t1.start();
		
		
		System.out.println("Resend Pela no otp "+otp);
		request.setAttribute("emailid",email);
			
		try 
		{
			 td=new TrippleDes();
		}
		catch (Exception e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String EncryptedOTP=td.encrypt(otp);
		
		request.setAttribute("OTPvalue", EncryptedOTP);
				
		RequestDispatcher dispacher=request.getRequestDispatcher("GenerateOTP.jsp");
		dispacher.forward(request, response);
	}
}
