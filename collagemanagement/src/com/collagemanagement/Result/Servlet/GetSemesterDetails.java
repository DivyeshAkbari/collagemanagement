package com.collagemanagement.Result.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collagemanagement.bean.Semester;
import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.ResultSectionServiceImpl;
import com.collagemanagement.service1.ResultSectionService;

/**
 * Servlet implementation class GetSemesterDetails
 */
public class GetSemesterDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	ResultSectionService Service=new ResultSectionServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetSemesterDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
			System.out.println("do get");
			HttpSession httpSession = request.getSession(false);
			User user=(User)httpSession.getAttribute("uname");
		 
			int id=user.getId();
		 
			//String streamid=user.getStream();
		 
			List<Semester> semlist=Service.fetchSemvalue(id);
		 
			request.setAttribute("semlist",semlist);
			System.out.println(semlist);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
//		 System.out.println("do get");
//		HttpSession httpSession = request.getSession(false);
//		 User user=(User)httpSession.getAttribute("uname");
//		 
//		 
//		 String streamid=user.getStream();
//		 
//		 List<Semester> semlist=Service.getSemvalue(streamid);
//		 
//		 request.setAttribute("semlist",semlist);
//		 System.out.println(semlist);
	}
}
