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
 * Servlet implementation class UpdateAnswerDescription
 */
public class UpdateAnswerDescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	QuoraSessionService quorasessionservice = new QuoraSessionServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAnswerDescription() {
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
		
		int id =  Integer.parseInt( request.getParameter("id"));
	
		String ansdescription = request.getParameter("tdescription");
		System.out.println("Ans"+ansdescription);
		
		Answer answer = new Answer();
		answer.setAnswerdescription(ansdescription);
		answer.setAnswerid(id);
		
		String ModifyAnswer = quorasessionservice.modifyAnswer(answer);
		response.sendRedirect("AnswerofQuestion.jsp");
	}

}
