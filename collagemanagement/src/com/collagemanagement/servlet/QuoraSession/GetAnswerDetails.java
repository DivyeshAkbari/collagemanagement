package com.collagemanagement.servlet.QuoraSession;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.Answer;
import com.collagemanagement.bean.QuoraSession;
import com.collagemanagement.service.impl.QuoraSessionServiceImpl;
import com.collagemanagement.service1.QuoraSessionService;

/**
 * Servlet implementation class GetAnswerDetails
 */
public class GetAnswerDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	QuoraSessionService quorasessionservice = new QuoraSessionServiceImpl();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetAnswerDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		String id = request.getParameter("id");
		
		request.setAttribute("id",id);
		
		List<QuoraSession> questionlist = quorasessionservice.GetQuestiondetails(id);
		
		List<Answer> answerlist = quorasessionservice.fetchanswer(id);
		
		request.setAttribute("questionlist", questionlist);
		
		request.setAttribute("answerlist", answerlist);
		
		System.out.println(" QUESTION Size"+questionlist.size());
		
		System.out.println("Answer List"+answerlist.size());
		
		RequestDispatcher dispature = request.getRequestDispatcher("AnswerofQuestion.jsp");
		dispature.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}
}
