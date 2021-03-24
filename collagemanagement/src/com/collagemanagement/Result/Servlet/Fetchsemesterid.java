package com.collagemanagement.Result.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.etsi.uri.x01903.v13.ResponderIDType;

import com.collagemanagement.bean.Semester;
import com.collagemanagement.service.impl.ResultSectionServiceImpl;
import com.collagemanagement.service1.ResultSectionService;
import com.google.gson.Gson;

/**
 * Servlet implementation class Fetchsemesterid
 */
public class Fetchsemesterid extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	ResultSectionService Service=new ResultSectionServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetchsemesterid() {
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
		String Streamid=request.getParameter("id");
		
		int id=Integer.parseInt(Streamid);
		List<Semester> semlist=Service.getSemvalue(id);
		
		
		System.out.println(semlist);
		
		String Json=new Gson().toJson(semlist);
		System.out.println("JSon is "+Json);
		response.getWriter().append(Json);
		
		
		
		
	}
}
