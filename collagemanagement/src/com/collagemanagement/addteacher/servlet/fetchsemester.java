package com.collagemanagement.addteacher.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.Semester1;
import com.collagemanagement.bean.Subject;
import com.collagemanagement.service.impl.TeacherServiceimpl;
import com.collagemanagement.service1.TeacherService;
import com.google.gson.Gson;

/**
 * Servlet implementation class fetchsemester
 */
public class fetchsemester extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	TeacherService ts = new TeacherServiceimpl();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fetchsemester() {
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
		///doGet(request, response);
		int cnt=0;
		String semValue;
		//System.out.println("sem value default is: "+semValue);
		cnt++;
		System.out.println("in fetchsem servlet "+cnt);
		
		//String[] streamId = request.getParameterValues("name[]");  //. getClass(). getName()
		
		String streamId = request.getParameter("name");
		
		System.out.println("Stream id is: "+streamId);
		
		List<Semester1> semlist = ts.fetchSemester(streamId);
		
		semValue = request.getParameter("name1");
		System.out.println("value of semester id is: "+semValue);
		
		List<Subject> sublist = ts.fetchSubject(streamId,semValue);
//		System.out.println("subject list is.......");
//		
//		System.out.println(sublist);
		//System.out.println(semlist);
		
		
		String json = new Gson().toJson(semlist);
		System.out.println("semList: "+semlist);
		System.out.println("json of semester: "+json);
		
		response.getWriter().append(json);
		
		String json1 = new Gson().toJson(sublist);
		System.out.println("json of subjects: "+json1);
		
	}

}
