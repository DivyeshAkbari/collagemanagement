package com.collagemanagement.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.Collageserviceimpl;

/**
 * Servlet implementation class EditAdminDetails
 */
public class EditAdminDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Collageserviceimpl collage =new Collageserviceimpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAdminDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession httpsession = request.getSession(false);
		
		User u1 = (User) httpsession.getAttribute("uname");
		int userid = u1.getId();
		User user = collage.fetchAdminDetails(userid);
		httpsession.setAttribute("user", user);
		//request.setAttribute("user", user);
		RequestDispatcher dispatcher = request.getRequestDispatcher("edit-admin.jsp");
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
