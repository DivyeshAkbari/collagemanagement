package com.collagemanagement.addteacher.servlet;

import java.io.IOException;



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
 * Servlet implementation class uploadAssignment
 */
public class uploadAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	TeacherService ts = new TeacherServiceimpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public uploadAssignment() {
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
			HttpSession httpsession = request.getSession(false);
		
		User u1 = (User) httpsession.getAttribute("uname");
		
		int userId=u1.getId();
		
		String streamId = request.getParameter("streamId");
		String subjectId = request.getParameter("subjectId");
		String title = request.getParameter("titleOfAss");
		String date = request.getParameter("date");
		String discription = request.getParameter("description");
		
		Assignment ass = new Assignment();
		ass.setStreamId(Integer.parseInt(streamId));
		ass.setSubjectId(Integer.parseInt(subjectId));
		ass.setTitle(title);
		ass.setDate(date);
		ass.setDiscription(discription);
		ass.setUsesrId(userId);
	
		
		Part part = (Part) request.getPart("assignment");
		
		if(null!=part)
		{
			
				System.out.println("File Name" + part.getSubmittedFileName()); 
				System.out.println(part.getName());
			
			
			
				System.out.println("File Size :: " + part.getSize());
			
		
			
				ass.setAssPDF(part.getInputStream());
			
		}
		
		System.out.println(streamId+" "+subjectId+" "+title+" "+date+" "+discription+" "+userId);
		
		String message = ts.insertAssDetail(ass);
		//System.out.println(message);
	}

}
