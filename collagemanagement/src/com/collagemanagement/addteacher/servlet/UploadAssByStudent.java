package com.collagemanagement.addteacher.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.collagemanagement.bean.Assignment;
import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.TeacherServiceimpl;
import com.collagemanagement.service1.TeacherService;

/**
 * Servlet implementation class UploadAssByStudent
 */
public class UploadAssByStudent extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	TeacherService ts = new TeacherServiceimpl();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UploadAssByStudent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		//int studentId = Integer.parseInt(request.getParameter("studentId"));

		HttpSession httpsession = request.getSession(false);
		
		User u1 = (User) httpsession.getAttribute("uname");
		
		int studentId=u1.getId();
		String assid = request.getParameter("name");
		//int facultyId = Integer.parseInt(request.getParameter("facultyId"));
		int assId = Integer.parseInt(request.getParameter("assId"));
		Assignment ass = new Assignment();
		ass.setAssId(assId);
		ass.setUsesrId(studentId);
		System.out.println("ass id is: "+assId);
		System.out.println("student id is: "+studentId);
		
		
		Part part = (Part) request.getPart("assignment");
		
		if(null!=part)
		{
			
				System.out.println("File Name" + part.getSubmittedFileName()); 
				System.out.println(part.getName());
			
			
			
				System.out.println("File Size :: " + part.getSize());
			
		
			
				ass.setAssPDF(part.getInputStream());
			
		}
		String message1 = ts.insertStuAss(ass);
//		String message1 = "true";
		if(message1=="true") {
			int semId = u1.getSemester();
			List<Assignment> asslist = ts.getAllAss(studentId,semId);
			if(!(asslist.isEmpty())){
				httpsession.setAttribute("notification", "May be you do not have submitted some assignment!Kindly check it.");
			}else
				httpsession.setAttribute("notification", null);
		}
		System.out.println(message1+" hii");
		
		httpsession.setAttribute("message", message1);
		RequestDispatcher dispatcher  = request.getRequestDispatcher("student-assignment-subject.jsp");
		dispatcher.forward(request, response);
//		HttpSession h1 = request.getSession(false);
//		h1.setAttribute("message", message);
//		request.getRequestDispatcher("student-assignment-subject.jsp").forward(request, response);
		
//		if(message > 0)
//		{
//			request.setAttribute("message","Submitted ");
//			 request.getRequestDispatcher("student-assignment-subject.jsp").forward(request, response);
//		}
//		else
//		{
//			request.setAttribute("message","not submitted");
//			 request.getRequestDispatcher("student-assignment-subject.jsp").forward(request, response);
//		}
		
	}

}
