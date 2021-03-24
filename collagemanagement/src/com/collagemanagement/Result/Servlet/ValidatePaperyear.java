package com.collagemanagement.Result.Servlet;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.Paper;
import com.collagemanagement.service.impl.ResultSectionServiceImpl;
import com.collagemanagement.service1.ResultSectionService;

/**
 * Servlet implementation class ValidatePaperyear
 */
public class ValidatePaperyear extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ResultSectionService Service=new ResultSectionServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ValidatePaperyear() {
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
		
		String typepaper=request.getParameter("typepaper1");
		String year=request.getParameter("year1");
		String stream=request.getParameter("stream1");
		String sem=request.getParameter("sem1");
		
		System.out.println("Type of paper is "+typepaper);
		System.out.println("year is "+year);
		System.out.println("stream is "+stream);
		System.out.println("sem "+sem);
		
		Paper paper=new Paper();
		paper.setType(typepaper);
		paper.setYear(Integer.parseInt(year));
		paper.setStreamid(Integer.parseInt(stream));
		paper.setSemesterid(Integer.parseInt(sem));
		
		String message=Service.validatePaperYear(paper);
		response.getWriter().append(message);
	}
}
