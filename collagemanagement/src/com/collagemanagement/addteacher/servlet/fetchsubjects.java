package com.collagemanagement.addteacher.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.Subject;
import com.collagemanagement.service.impl.TeacherServiceimpl;
import com.collagemanagement.service1.TeacherService;
import com.google.gson.Gson;

/**
 * Servlet implementation class fetchsubjects
 */
public class fetchsubjects extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	
	TeacherService ts = new TeacherServiceimpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fetchsubjects() {
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
		
		String semValue = request.getParameter("name1");
		System.out.println("value of semester id is: "+semValue);
		
		int streamId = ts.fetchStreamId(semValue);
		
		List<Subject> sublist = ts.fetchSubject(streamId,semValue);
		
		String json = new Gson().toJson(sublist);
		System.out.println("subList: "+sublist);
		System.out.println("json of semester: "+json);
		
		response.getWriter().append(json);
	}

}
