package com.collagemanagement.servlet.QuoraSession;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collagemanagement.bean.Answer;
import com.collagemanagement.bean.User;
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
		
		response.getWriter().append("Served at: ").append("Hello");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession httpSession = request.getSession(false);
		User user = (User) httpSession.getAttribute("uname");
		String finalestring ;
		String fname = user.getFirstname();
		String mname = user.getMiddlename();
		
		System.out.println("Firstname"+fname );
		System.out.println("SurName"+ mname);
		
		finalestring = fname.concat(" "+ mname);
		
		String answerdescription = request.getParameter("answerdescription");
		String id  = request.getParameter("id");
		
		System.out.println("Answer Description ->"+answerdescription);
		System.out.println(" id ->"+id);
		
		Answer ans = new Answer();
		
		ans.setAnswerdescription(answerdescription);
		ans.setUsername(finalestring);
		ans.setUserid(user.getId());
		ans.setQueryId(Integer.parseInt(id));
	
		quorasessionservice.saveanswerdetails(ans);	
		
		RequestDispatcher dispacher=request.getRequestDispatcher("AnswerofQuestion.jsp");
		dispacher.forward(request, response);
		
		
	}

}
