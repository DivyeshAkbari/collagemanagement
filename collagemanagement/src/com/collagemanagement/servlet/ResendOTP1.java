package com.collagemanagement.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.emailverification.SendEmail;
import com.collagemanagement.other.GenerateOTP;

/**
 * Servlet implementation class ResendOTP1
 */
public class ResendOTP1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	//SendEmail m1= new SendEmail();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public ResendOTP1() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Resend OTP Called");
		ServletContext Email=getServletContext();
		String mail=(String) Email.getAttribute("emailvalue");
		
		
		String otp=GenerateOTP.generateOTP();
		ServletContext OTP=getServletContext();
		OTP.setAttribute("OPTnewvalue", otp);
		
		//m1.sendmail(mail,"OTP is "+otp);
		
		ServletContext Value=getServletContext();
		Value.setAttribute("value",1);
		
		request.setAttribute("NewMessage","New Otp has been sent to your mail id");
		RequestDispatcher dispacher=request.getRequestDispatcher("GenerateOTP.jsp");
		dispacher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		System.out.println("Resend OTP Called");
//		ServletContext Email=getServletContext();
//		String mail=(String) Email.getAttribute("emailvalue");
//		
//		
//		String otp=GenerateOTP.generateOTP();
//		ServletContext OTP=getServletContext();
//		OTP.setAttribute("OPTnewvalue", otp);
//		
//		m1.sendmail(mail,"OTP is "+otp);
//		
//		ServletContext Value=getServletContext();
//		Value.setAttribute("value",1);
//		
//		request.setAttribute("NewMessage","New Otp has been sent to your mail id");
//		RequestDispatcher dispacher=request.getRequestDispatcher("GenerateOTP.jsp");
//		dispacher.forward(request, response);
	}
}
