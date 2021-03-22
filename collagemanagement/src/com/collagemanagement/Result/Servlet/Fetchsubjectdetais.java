package com.collagemanagement.Result.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.Subject;
import com.collagemanagement.service.impl.ResultSectionServiceImpl;
import com.collagemanagement.service1.ResultSectionService;
import com.google.gson.Gson;

/**
 * Servlet implementation class Fetchsubjectdetais
 */
public class Fetchsubjectdetais extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ResultSectionService Service=new ResultSectionServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetchsubjectdetais() {
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
		
		String sem=request.getParameter("Sem");

		int streamid=Service.fetchStreamId(sem);

		String finalstreamid=Integer.toString(streamid);
		System.out.println("Sem is "+sem);
		System.out.println("Stream id  is "+streamid);
		request.setAttribute("streamid", streamid);
		
		List<Subject> Subjectlist=Service.fetachSubjectDetails(finalstreamid, sem,1);
		
		System.out.println("Subject List"+Subjectlist);
		String Json=new Gson().toJson(Subjectlist);
		System.out.println("JSon is "+Json);
		response.getWriter().append(Json);	
	}
}
