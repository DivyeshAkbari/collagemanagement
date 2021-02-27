package com.collagemanagement.addteacher.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collagemanagement.bean.Stream;
import com.collagemanagement.bean.Subject;
import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.TeacherServiceimpl;
import com.collagemanagement.service1.TeacherService;
import com.google.gson.Gson;

/**
 * Servlet implementation class fetchsubjectforfaculty
 */
public class fetchsubjectforfaculty extends HttpServlet {
	private static final long serialVersionUID = 1L;
     
	TeacherService ts = new TeacherServiceimpl();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fetchsubjectforfaculty() {
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
		//doGet(request, response);
		HttpSession httpsession = request.getSession(false);
		
		User u1 = (User) httpsession.getAttribute("uname");
		
		int userId=u1.getId();
		
		List<Subject> subjectlist=ts.fetchsubjectdetails(userId);
		
		System.out.println(subjectlist);
		
		String json = new Gson().toJson(subjectlist);
		System.out.println("json of semester: "+json);
		
		response.getWriter().append(json);
	}

}
