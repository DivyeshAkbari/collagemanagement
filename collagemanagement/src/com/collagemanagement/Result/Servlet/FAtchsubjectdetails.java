package com.collagemanagement.Result.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.Marks;
import com.collagemanagement.bean.Subject;
import com.collagemanagement.service.impl.ResultSectionServiceImpl;
import com.collagemanagement.service1.ResultSectionService;
/**
 * Servlet implementation class FAtchsubjectdetails
 */
public class FAtchsubjectdetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ResultSectionService Service=new ResultSectionServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FAtchsubjectdetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

//		List<Subject> subjectlist=Service.fetachSubjectDetails();
//		System.out.println(subjectlist);
//		
//		request.setAttribute("Sujectlist", subjectlist);
//		
//		List<Marks> markslist=Service.fatchMarksDetails();
//		request.setAttribute("Markslist", markslist);
		
		  
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
