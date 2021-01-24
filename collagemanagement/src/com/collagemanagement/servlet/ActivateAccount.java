package com.collagemanagement.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.encryptpassword.TrippleDes;
import com.collagemanagement.service.impl.Collageserviceimpl;

/**
 * Servlet implementation class ActivateAccount
 */
public class ActivateAccount extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	TrippleDes td;
	
	Collageserviceimpl college =new Collageserviceimpl(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ActivateAccount() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Get Method from Activate Account");
		String email = request.getParameter("key1");
		String hash = request.getParameter("key2");

		
		System.out.println("servlet called AA");
//		try {
//			td=new TrippleDes();
//		} catch (Exception e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
//		
	//	String Decryptedemail=td.decrypt(email);
		String message=college.activateaccount(email,hash);
		
		System.out.println("Activate Account Servlet  Message"+message);
		
		if(message.equals("success"))
		{
			request.setAttribute("message1","Your Account has been verified.");
			response.sendRedirect("login.jsp");
			System.out.println("Account Successfully Verified.");
		}
		else
		{
			response.sendRedirect("register.jsp");
		}	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		doGet(request, response);		
	}
}