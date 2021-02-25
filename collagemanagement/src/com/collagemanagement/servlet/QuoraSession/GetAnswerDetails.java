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
		
		request.setAttribute("answerlist12", questionlist);
		
		request.setAttribute("answerlist", answerlist);
	
		RequestDispatcher d1 = request.getRequestDispatcher("AnswerofQuestion.jsp");
		d1.forward(request, response);
		
		response.getWriter().append("Served at: ").append("GetAnswerDetails");
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		

	}

}
