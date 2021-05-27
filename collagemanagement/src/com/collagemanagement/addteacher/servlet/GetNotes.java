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
 * Servlet implementation class GetNotes
 */
public class GetNotes extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	TeacherService ts = new TeacherServiceimpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetNotes() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String id = request.getParameter("subject");
		HttpSession httpsession = request.getSession(false);
		
		User u1 = (User) httpsession.getAttribute("uname");
		int userId = u1.getId();
		List<Assignment> noteslist = ts.getNotes(id);
		List<Assignment> notes = new ArrayList<>();
		for(Assignment a : noteslist) {
			if(a.getUsesrId() == userId) {
				Assignment a1 = new Assignment();
				a1.setAssId(a.getAssId());
				a1.setTitle(a.getTitle());
				a1.setDiscription(a.getDiscription());
				a1.setUploadDate(a.getUploadDate());
				a1.setUsesrId(a.getUsesrId());
				notes.add(a1);
			}
		}
		//request.setAttribute("notes", notes);
		httpsession.setAttribute("notes", notes);
		RequestDispatcher dispatcher = request.getRequestDispatcher("view-material-teacher.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		String id = request.getParameter("subject");
		//int subId = Integer.parseInt(id);
		
		List<Assignment> notes = ts.getNotes(id);
		HttpSession httpsession = request.getSession(false);
		httpsession.setAttribute("notes", notes);
		//request.setAttribute("notes", notes);
		RequestDispatcher dispatcher = request.getRequestDispatcher("manage-material.jsp");
		dispatcher.forward(request, response);
	}

}
