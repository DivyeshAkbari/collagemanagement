package com.collagemanagement.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.Collageserviceimpl;
import com.collagemanagement.service1.Collageservice;

/**
 * Servlet implementation class fetchstudentinformation
 */
public class fetchstudentinformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Collageservice collage= new Collageserviceimpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fetchstudentinformation() {
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
		
		String streamid=request.getParameter("stream");
		
		List<User> Studentlist=collage.fetchStudentDetails(streamid);
		
		HttpSession h1=request.getSession(false);
		h1.setAttribute("Studentlist", Studentlist);
//		h1.setAttribute("Streamid",streamid);
		request.getRequestDispatcher("ViewPendingRequest.jsp").forward(request, response);
	}

}