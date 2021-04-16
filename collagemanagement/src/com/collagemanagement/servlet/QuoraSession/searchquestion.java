package com.collagemanagement.servlet.QuoraSession;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.QuoraSession;
import com.collagemanagement.service.impl.QuoraSessionServiceImpl;
import com.collagemanagement.service1.QuoraSessionService;

/**
 * Servlet implementation class searchquestion
 */
public class searchquestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	QuoraSessionService quorasessionservice = new QuoraSessionServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public searchquestion() {
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
	
		
		String question = request.getParameter("id");
		String searchvalue = quorasessionservice.searchquestion(question);
		
		if(searchvalue==null)
		{
			response.getWriter().append("Search Not found");
		}
		else
		{
			if(searchvalue.equalsIgnoreCase(question))
			{
			//	int id=quorasessionservice.fetchQuestionId(searchvalue);
			//	response.getWriter().append(searchvalue+" "+id);
			//	System.out.println("Id is "+id);
			}
			System.out.println("Search Value -> "+question);
		}
	}
}
