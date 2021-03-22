package com.collagemanagement.Result.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.Paper;
import com.collagemanagement.service.impl.ResultSectionServiceImpl;
import com.collagemanagement.service1.ResultSectionService;
import com.google.gson.Gson;

/**
 * Servlet implementation class getpaperinformation
 */
public class getpaperinformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ResultSectionService Service=new ResultSectionServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getpaperinformation() {
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

		String typeofpaper=request.getParameter("typeofpaper");
		System.out.println("typeofpaper is "+typeofpaper);

		String stream=request.getParameter("stream");
		System.out.println("stream is "+stream);
		
		String sem=request.getParameter("sem");
		System.out.println("sem is "+sem);
		
		Paper p1=new Paper();
		p1.setType(typeofpaper);
		p1.setStreamid(Integer.parseInt(stream));
		p1.setSemesterid(Integer.parseInt(sem));
		
		List<Paper> Year=Service.fetchYearDetails(p1);
		System.out.println(Year);
		String Json=new Gson().toJson(Year);
		System.out.println("JSon is "+Json);
		response.getWriter().append(Json);
	}
}
