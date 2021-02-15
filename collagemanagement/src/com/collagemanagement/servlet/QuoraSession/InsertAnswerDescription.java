package com.collagemanagement.servlet.QuoraSession;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.Answer;
import com.collagemanagement.service.impl.QuoraSessionServiceImpl;
import com.collagemanagement.service1.QuoraSessionService;

/**
 * Servlet implementation class InsertAnswerDescription
 */
public class InsertAnswerDescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	QuoraSessionService quorasessionservice = new QuoraSessionServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertAnswerDescription() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Sevlet called");
		
		String answerdescription = request.getParameter("answerdescription");
		
		System.out.println("Answer Description ->"+answerdescription);
		
		Answer ans = new Answer();
		
		ans.setAnswerdescription(answerdescription);
		
		quorasessionservice.saveanswerdetails(ans);	
		
		response.sendRedirect("AnswerofQuestion.jsp");
		
		response.getWriter().append("Answer Registered Successfully");
		response.getWriter().append("Served at: ").append("InsertAnswerDescription");
		
		
		
	}

}
