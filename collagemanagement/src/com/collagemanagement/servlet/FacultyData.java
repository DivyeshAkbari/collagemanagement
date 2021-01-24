package com.collagemanagement.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.Collageserviceimpl;

/**
 * Servlet implementation class FacultyData
 */
public class FacultyData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	Collageserviceimpl college =new Collageserviceimpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FacultyData() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		List<User> facultylist=college.getFacultydetails();
		request.setAttribute("user",facultylist);
		RequestDispatcher dispatcher = request.getRequestDispatcher("FaclutyDataDisplay.jsp");
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
