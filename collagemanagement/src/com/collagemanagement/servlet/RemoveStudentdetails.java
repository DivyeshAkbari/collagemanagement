package com.collagemanagement.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.service.impl.Collageserviceimpl;

/**
 * Servlet implementation class RemoveStudentdetails
 */
public class RemoveStudentdetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Collageserviceimpl collage =new Collageserviceimpl();

    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveStudentdetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id=request.getParameter("id");
		
		String message=collage.deletstudentdetails(id);
		response.sendRedirect("StudentData");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
