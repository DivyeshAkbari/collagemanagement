package com.collagemanagement.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.encryptpassword.TrippleDes;

/**
 * Servlet implementation class GetOTP
 */
public class GetOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	TrippleDes td;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetOTP() {
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
		 
		String otp=request.getParameter("otp");
		String otp1=request.getParameter("otp1");
		String otp2=request.getParameter("otp2");
		String otp3=request.getParameter("otp3");
		System.out.println("otp is "+otp);
		System.out.println("otp1 is "+otp1);
		System.out.println("otp2 is "+otp2);
		System.out.println("otp3 is "+otp3);
		
	
		String Email=request.getParameter("email");
		
		System.out.println("Abhi maza aayega na bhidu "+Email);
		
		 String s5;
		 s5=otp.concat(otp1).concat(otp2).concat(otp3);
		
		System.out.println("Main Otp is "+s5);
		
		String generatedOTP =request.getParameter("GeneratedOTP");
	
		//System.out.println("Resend Otp from  get OTP "+generatedOTP);
		try 
		{
			td=new TrippleDes();
		}
		 catch (Exception e)
		 {
			// TODO Auto-generated catch block
			e.printStackTrace();
		 }
			
	    String DecryptedOTP=td.decrypt(generatedOTP);
	    System.out.println("Resend Otp from  get OTP "+DecryptedOTP);
		if(s5.equalsIgnoreCase(DecryptedOTP))
		{
			request.setAttribute("Emailid", Email);
			RequestDispatcher dispacher=request.getRequestDispatcher("Updatepassword.jsp");
			dispacher.forward(request, response);
		}
		else
		{
			System.out.println("else executed");
			request.setAttribute("message1", "Please Enter Correct Value");
			request.setAttribute("OTPvalue",DecryptedOTP);
			RequestDispatcher dispacher=request.getRequestDispatcher("GenerateOTP.jsp");
			dispacher.forward(request, response);
		}
	}
}