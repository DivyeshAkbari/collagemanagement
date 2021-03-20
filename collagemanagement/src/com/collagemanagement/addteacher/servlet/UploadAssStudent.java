package com.collagemanagement.addteacher.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.RequestDispatcher;
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
 * Servlet implementation class UploadAssStudent
 */
public class UploadAssStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	TeacherService ts = new TeacherServiceimpl();
	
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadAssStudent() {
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
		
		int userId=u1.getId();
		
		// getting value from jsp 
		String ss =request.getParameter("Id");
		String name = request.getParameter("Name");
		
		System.out.println("Id of sub: "+ss);
		List<Assignment> assignmentlist = ts.getAssignments(ss);
		System.out.println("ass list: "+assignmentlist);
		//fetching faculty id by assignment list
		
		List<Integer> userIdList = new ArrayList<>();
		for(Assignment a : assignmentlist) {
			int id = a.getUsesrId();
			userIdList.add(id);
		}
		System.out.println("User id list: "+userIdList);
		//fetching faculty from id which is get from assignmentlist
		List<User> userlist = ts.fetchFacultyForAss(userIdList);
		System.out.println(userlist);
		
		//System.out.println(ss);
		
		request.setAttribute("faculty", userlist);
		request.setAttribute("assignmentlist", assignmentlist);
		request.setAttribute("ss",ss);
		request.setAttribute("name",name);
		RequestDispatcher dispatcher = request.getRequestDispatcher("student-assignment-subject.jsp");
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
