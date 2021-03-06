package com.collagemanagement.servlet.QuoraSession;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.Answer;
import com.collagemanagement.dao1.QuoraSessionDao;
import com.collagemanagement.service.impl.QuoraSessionServiceImpl;
import com.collagemanagement.service1.QuoraSessionService;

/**
 * Servlet implementation class EditAnswerDescription
 */
public class EditAnswerDescription extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	QuoraSessionService quorasessionservice = new QuoraSessionServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditAnswerDescription() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id = request.getParameter("id");
		request.setAttribute("id", id);
		
		Answer ans = quorasessionservice.getAnswer(id);
		
		System.out.println("Answer ->"+ans);
		
		request.setAttribute("answer", ans);
	
   	    RequestDispatcher requestDispatcher = request.getRequestDispatcher("EditAnswer.jsp");
		requestDispatcher.forward(request, response);

//	  	response.sendRedirect("EditAnswer.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
}
//https://www.tutorialrepublic.com/codelab.php?topic=faq&file=show-bootstrap-modal-on-page-load
//https://stackoverflow.com/questions/6660232/jquery-autocomplete
//allowCasualMultipartParsing="true"
//https://stackoverflow.com/questions/15029629/how-to-display-text-in-the-same-format-as-added-in-mysql-text-field-using-php-ec