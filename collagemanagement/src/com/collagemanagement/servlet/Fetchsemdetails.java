package com.collagemanagement.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.Semester;
import com.collagemanagement.bean.Stream;
import com.collagemanagement.service.impl.Collageserviceimpl;

/**
 * Servlet implementation class Fetchsemdetails
 */
public class Fetchsemdetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	Collageserviceimpl collage =new Collageserviceimpl(); 
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetchsemdetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Semester> semlist=collage.fetchSemDetails();
		request.setAttribute("SemList",semlist);	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
