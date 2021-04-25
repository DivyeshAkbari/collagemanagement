package com.collagemanagement.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collagemanagement.encryptpassword.TrippleDes;
import com.collagemanagement.service.impl.Collageserviceimpl;
import com.collagemanagement.service.impl.TeacherServiceimpl;
import com.collagemanagement.service1.Collageservice;
import com.collagemanagement.service1.TeacherService;
import com.collagemanagement.bean.Assignment;
import com.collagemanagement.bean.Log;
import com.collagemanagement.bean.User;

/**
 * Servlet implementation class Login
 */
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Collageservice collage=new Collageserviceimpl();
	TeacherService ts = new TeacherServiceimpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		 String username=request.getParameter("email");
		 String password=request.getParameter("password");
			 
		 System.out.println("email is "+username);
		 System.out.println("password is "+password);
		 	
		 
		 System.out.println("This is login serverlet");
		 
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
		
		
		String  encryptedpassword=td.encrypt(password);
		System.out.println("Encryped password is "+encryptedpassword);
		
		
		//Log login =new Log();
		u1.setEmail(username);
		u1.setPassword(encryptedpassword);
		
		System.out.println("U1 is "+u1);
		 User user=new User();
		 user=collage.fetchlogindetails(u1);
		 	
		 
		if(user==null)
		{
			 request.setAttribute("message","please enter correct value");
			 request.getRequestDispatcher("login.jsp").forward(request, response);
		}
		else
		{
			String message = collage.insertdate(username,0);
			
			System.out.println("Password is "+user.getPassword());
			HttpSession httpSession=request.getSession();
			httpSession.setAttribute("uname",user);
			request.getRequestDispatcher("index.jsp").forward(request, response);
			
			//getting assignment for notification
			User u2 = (User) httpSession.getAttribute("uname");
			if(u2.getRole().equalsIgnoreCase("STUDENT")) {
				int userId = u2.getId();
				int semId = u2.getSemester();
				int flag1=0;
				List<Assignment> asslist = ts.getAllAss(userId,semId);
				if(!(asslist.isEmpty())){
					flag1=1;
				}
				if(flag1==1) {
					httpSession.setAttribute("notification", "May be you do not have submitted some assignment!Kindly check it.");
				}else
					httpSession.setAttribute("notification", null);
			}
			
		}
		
	}
}
