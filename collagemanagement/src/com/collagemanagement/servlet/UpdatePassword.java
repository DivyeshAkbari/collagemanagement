package com.collagemanagement.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.User;
import com.collagemanagement.encryptpassword.TrippleDes;
import com.collagemanagement.service.impl.Collageserviceimpl;

/**
 * Servlet implementation class UpdatePassword
 */
public class UpdatePassword extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	Collageserviceimpl collage =new Collageserviceimpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePassword() {
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
		doGet(request, response);
		
		
		User user=new User();
		TrippleDes t1=null;
		
		String Emailid=request.getParameter("email");
		
		String password=request.getParameter("password");
		String confirm_password=request.getParameter("psw");
		
		try {
			 t1=new TrippleDes();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		String encrypt_password=t1.encrypt(confirm_password);
		
		user.setPassword(password);
		user.setConfirm_password(encrypt_password);
		user.setEmail(Emailid);
		
		if(password.equals(confirm_password))
		{
			String message=collage.Updatepassword(user);
			System.out.println(message);
			request.setAttribute("message","Your Password Updated Successfully now You can Login With Your Updated Password");
			RequestDispatcher d1=request.getRequestDispatcher("Updatedpassword.jsp");
			d1.forward(request,response);			
		}
		else
		{
			request.setAttribute("Message", "Please Enter Both The values Right");
			RequestDispatcher d1=request.getRequestDispatcher("Updatepassword.jsp");
			d1.forward(request,response);
		}	
	}
}
