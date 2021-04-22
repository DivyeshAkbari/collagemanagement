package com.collagemanagement.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.Collageserviceimpl;

/**
 * Servlet implementation class EditFacultyDetails
 */
public class EditFacultyDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	Collageserviceimpl collage =new Collageserviceimpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditFacultyDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		ServletContext Email=getServletContext();
		String email=(String) Email.getAttribute("email");
		
		System.out.println("Updated Email is "+email);
		
		//java.util.List<User> user=collage.getuserdetails(email);
		
		
		System.out.println("editable Student No badho data niche 6");
		//System.out.println(user);
		//request.setAttribute("user",user);
		//RequestDispatcher dispatcher = request.getRequestDispatcher("editfacultydetails.jsp");
		//dispatcher.forward(request, response);		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
