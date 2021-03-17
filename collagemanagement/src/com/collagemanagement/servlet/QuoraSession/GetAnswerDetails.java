package com.collagemanagement.servlet.QuoraSession;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map.Entry;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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

	
		String id = request.getParameter("id");
		
		request.setAttribute("id",id);
		
		List<QuoraSession> questionlist = quorasessionservice.GetQuestiondetails(id);
		
		List<Answer> answerlist = quorasessionservice.fetchanswer(id);
		
//		HashMap<Integer, Answer> map = new HashMap<Integer, Answer>();
//		
//		for(Answer ans : answerlist)
//		{
//			map.put(ans.getAnswerid(), ans);
//		}
//		
//		for(Entry<Integer, Answer> m:map.entrySet())
//		{  
//			   System.out.println(m.getKey()+" "+m.getValue());  
//		}  

		request.setAttribute("questionlist", questionlist);
		
		HttpSession httpSession = request.getSession(false);
		httpSession.setAttribute("questionlist", questionlist);
		httpSession.setAttribute("answerlist", answerlist);
		
		request.setAttribute("answerlist", answerlist);
		
		System.out.println(" Question List Size >"+questionlist.size());
		
		System.out.println("Answer List Size >"+answerlist.size());
		
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
