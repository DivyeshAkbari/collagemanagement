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
 * Servlet implementation class FetchStudentNotes
 */
public class FetchStudentNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	TeacherService ts = new TeacherServiceimpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FetchStudentNotes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		String ss = request.getParameter("Id");
		String name = request.getParameter("Name");
		
		List<Assignment> noteslist = new ArrayList<>();
		noteslist = ts.getNotes(ss);
		List<Integer> userIdList = new ArrayList<>();
		for (Assignment a : noteslist) {
			int id = a.getUsesrId();
			userIdList.add(id);
		}
		List<User> userlist = ts.fetchFacultyForAss(userIdList);
		HttpSession h1 = request.getSession(false);
		h1.setAttribute("faculty", userlist);
		h1.setAttribute("noteslist", noteslist);
		h1.setAttribute("ss", ss);
		h1.setAttribute("name", name);

		RequestDispatcher dispatcher = request.getRequestDispatcher("student-notes.jsp");
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
