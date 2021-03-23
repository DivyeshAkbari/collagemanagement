package com.collagemanagement.Result.Servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;



/**
 * Servlet implementation class Readexcelfile
 */
public class Readexcelfile extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Readexcelfile() {
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
		System.out.println("post");
		Part part=request.getPart("excelfile");
		
		if(part.getSize()>0)
		{
			System.out.println("File Name" + part.getName());
			System.out.println("File Name 2" + part.getSubmittedFileName());
			System.out.println("File Size :: " + part.getSize());
		}
		
		ReadExcelFileDemo1 r1=new ReadExcelFileDemo1(part.getInputStream());
		Thread t1=new Thread(r1);
		t1.start();
	}
}
