package com.collagemanagement.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.emailverification.SendEmail;
import com.collagemanagement.encryptpassword.TrippleDes;
import com.collagemanagement.other.GenerateOTP;
/**
 * Servlet implementation class ResendOTP
 */
public class ResendOTP extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	
	SendEmail m1=new SendEmail();
	TrippleDes td;
	//SendEmail m1= new SendEmail();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResendOTP() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		
		String Email=request.getParameter("email");
		
		System.out.println("Resend Email is "+Email);	
		
		String otp=GenerateOTP.generateOTP();
		m1.sendmail(Email, "Your Opt is "+otp);
		
		System.out.println("Resend OTP is "+otp);
		request.setAttribute("NewMessage","New  opt has been sent to your email id");
		
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
	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub	
		doGet(request, response);
	}
}
