package com.collagemanagement.Result.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.Papertype;
import com.collagemanagement.service.impl.ResultSectionServiceImpl;
import com.collagemanagement.service1.ResultSectionService;
import com.google.gson.Gson;

/**
 * Servlet implementation class getPaperTypeDetails
 */
public class getPaperTypeDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ResultSectionService Service=new ResultSectionServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public getPaperTypeDetails() {
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
		
		List<Papertype> papertypelist=Service.fetchPapertype();
		System.out.println(papertypelist);
		
		
		System.out.println(papertypelist);
		
		String Json=new Gson().toJson(papertypelist);
		System.out.println("JSon is "+Json);
		response.getWriter().append(Json);
	}
}
