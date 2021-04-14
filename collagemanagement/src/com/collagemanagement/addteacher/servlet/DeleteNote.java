package com.collagemanagement.addteacher.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.service.impl.TeacherServiceimpl;
import com.collagemanagement.service1.TeacherService;

/**
 * Servlet implementation class DeleteNote
 */
public class DeleteNote extends HttpServlet {
	private static final long serialVersionUID = 1L;
	TeacherService ts = new TeacherServiceimpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DeleteNote() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String assid = request.getParameter("assid");
		String userid = request.getParameter("userid");
		
		String message = ts.deleteNote(assid,userid);
		System.out.println(message);
		
		response.sendRedirect("manage-material.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
