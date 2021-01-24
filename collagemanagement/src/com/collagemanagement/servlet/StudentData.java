package com.collagemanagement.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;
import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.Collageserviceimpl;


/**
 * Servlet implementation class StudentData
 */
public class StudentData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	Collageserviceimpl college =new Collageserviceimpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StudentData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		List<User> user=college.getstudentdetails();
		request.setAttribute("user",user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("StudentDataDisplay.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
