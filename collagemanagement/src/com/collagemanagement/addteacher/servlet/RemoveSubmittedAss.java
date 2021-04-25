package com.collagemanagement.addteacher.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collagemanagement.bean.Assignment;
import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.TeacherServiceimpl;
import com.collagemanagement.service1.TeacherService;

/**
 * Servlet implementation class RemoveSubmittedAss
 */
public class RemoveSubmittedAss extends HttpServlet {
	private static final long serialVersionUID = 1L;

	TeacherService ts = new TeacherServiceimpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public RemoveSubmittedAss() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// response.getWriter().append("Served at: ").append(request.getContextPath());
//		HttpSession httpsession = request.getSession(false);
//		User u1 = (User) httpsession.getAttribute("uname");
//		int userId = u1.getId();
//
//		String assid = request.getParameter("id");
//		
//		String ans = ts.removeSubmittedAss(assid,userId);
//		System.out.println("answer is: "+ans);
//		
//		HttpSession h1 = request.getSession(false);
//		h1.setAttribute("ans", ans);
//		request.getRequestDispatcher("student-subassignment-subject.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		// doGet(request, response);
		HttpSession httpsession = request.getSession(false);
		User u1 = (User) httpsession.getAttribute("uname");
		int userId = u1.getId();
		String assid = request.getParameter("name");

		int ans = ts.removeSubmittedAss(assid, userId);
		System.out.println("answer is: " + ans);
		int semId = u1.getSemester();
		List<Assignment> asslist = ts.getAllAss(userId,semId);
		//httpsession.setAttribute("notification", "May be you do not have submitted some assignment!Kindly check it.");
		if(!(asslist.isEmpty())){
			httpsession.setAttribute("notification", "May be you do not have submitted some assignment!Kindly check it.");
		}

		// response.setContentType("text/plain");
		// response.getWriter().write(ans);
		if (ans > 0)
			response.getWriter().append("true");
		else
			response.getWriter().append("false");
	}

}
