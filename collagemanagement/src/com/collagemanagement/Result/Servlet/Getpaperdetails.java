package com.collagemanagement.Result.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.collagemanagement.bean.Paper;
import com.collagemanagement.service.impl.ResultSectionServiceImpl;
import com.collagemanagement.service1.ResultSectionService;

/**
 * Servlet implementation class Getpaperdetails
 */
public class Getpaperdetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ResultSectionService Service=new ResultSectionServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Getpaperdetails() {
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
		
		Paper p1=new Paper();
		String Streamid=request.getParameter("stream");
		String Semesterid=request.getParameter("semester");
	//	String Subjectid=request.getParameter("subject");
		String Year=request.getParameter("year123");
		String Type=request.getParameter("type");
		
		System.out.println("Stream id is "+Streamid);
		System.out.println("Semester id is "+Semesterid);
	//	System.out.println("Subject id is "+Subjectid);
		System.out.println("Year is "+Year);
		
		
		Part part=request.getPart("paper");
		
		if(null!=part)
		{
			System.out.println("File Name" + part.getName());
			System.out.println("File Name 2" + part.getSubmittedFileName());
			System.out.println("File Size :: " + part.getSize());
			p1.setPDF(part.getInputStream());
		}
		
		p1.setStreamid(Integer.parseInt(Streamid));
		p1.setSemesterid(Integer.parseInt(Semesterid));
	//	p1.setSubjectid(Integer.parseInt(Subjectid));
		p1.setYear(Integer.parseInt(Year));
		p1.setType(Type);
		
		String Message=Service.InsertPaperDetails(p1);
		System.out.println(Message);
		  
		response.sendRedirect("manage-papers.jsp?");
	}
}
