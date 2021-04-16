package com.collagemanagement.servlet.QuoraSession;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.service.impl.QuoraSessionServiceImpl;
import com.collagemanagement.service1.QuoraSessionService;

/**
 * Servlet implementation class RemoveAnswerDescription
 */
public class RemoveAnswerDescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	QuoraSessionService quorasessionservice = new QuoraSessionServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveAnswerDescription() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		String userid = request.getParameter("userid");
		
		System.out.println("Answer id is "+id);
		System.out.println("User id is "+userid);
		
		String removeStudentMessage = quorasessionservice.removeStudentDetails(id,userid);
		System.out.println(removeStudentMessage);
		response.sendRedirect("AnswerofQuestion.jsp");
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
