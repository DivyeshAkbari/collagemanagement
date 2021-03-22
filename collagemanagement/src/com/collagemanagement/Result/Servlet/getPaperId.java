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
 * Servlet implementation class getPaperId
 */
public class getPaperId extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ResultSectionService Service=new ResultSectionServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getPaperId() {
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
	
		
		String typeofpaper1=request.getParameter("typeofpaper1");
		System.out.println("typeofpaper is "+typeofpaper1);
		
		String stream1=request.getParameter("stream1");
		System.out.println("stream  is "+stream1);
		
		String sem1=request.getParameter("sem1");
		System.out.println("Sem is "+sem1);
		
		String year=request.getParameter("year");
		System.out.println("Year is "+year);
		
		
		Paper paper=new Paper();
		paper.setType(typeofpaper1);
		paper.setStreamid(Integer.parseInt(stream1));
		paper.setSemesterid(Integer.parseInt(sem1));
		paper.setYear(Integer.parseInt(year));
		
		int paperID=Service.fetchPaperID(paper);
		String id=Integer.toString(paperID);
		
		System.out.println("Paper id is "+paperID);
		response.getWriter().append(id);
	}
}
