package com.collagemanagement.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collagemanagement.bean.QuoraSession;
import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.QuoraSessionServiceImpl;
import com.collagemanagement.service1.QuoraSessionService;

/**
 * Servlet implementation class AddQuestion
 */
public class AddQuestion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	QuoraSessionService quorasessionservice = new QuoraSessionServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddQuestion() {
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
	

		HttpSession httpSession = request.getSession(false);
		User user = (User) httpSession.getAttribute("uname");
		String finalestring ;
		String fname = user.getFirstname();
		String mname = user.getMiddlename();
		
		System.out.println("Firstname"+fname );
		System.out.println("SurName"+ mname);
		
		finalestring = fname.concat(" "+ mname);
		
		String topicname = request.getParameter("topicname");
		String ctype =request.getParameter("ctype");
		String tdescription =request.getParameter("tdescription");
		
		System.out.println("Topic Name ->"+topicname);
		System.out.println("Topic Category Type ->"+ctype);
		System.out.println("Topic Description ->"+tdescription);
		
		QuoraSession query = new QuoraSession();
		
		query.setTopicname(topicname);
		query.setCtype(ctype);
		query.setTdescription(tdescription);
		query.setUsername(finalestring);
		query.setUserid(user.getId());
		
		quorasessionservice.savequestiondetails(query);
		
		response.sendRedirect("QuestionDetails.jsp");
		
	}

}
