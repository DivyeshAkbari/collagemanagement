package com.collagemanagement.servlet.QuoraSession;

import java.io.ByteArrayInputStream;
import java.io.IOException;
import java.io.InputStream;

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
 * Servlet implementation class PostQuery
 */
public class PostQuery extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	QuoraSessionService quorasessionservice = new QuoraSessionServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostQuery() {
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
		QuoraSession query = new QuoraSession();
		
		HttpSession httpSession = request.getSession(false);
		User user = (User) httpSession.getAttribute("uname");
		String finalestring ;
		String fname = user.getFirstname();
		String mname = user.getMiddlename();
		
		byte [] image=user.getImagedata();
		
		InputStream myInputStream = new ByteArrayInputStream(image);
		System.out.println("Firstname ->"+fname );
		System.out.println("SurName ->"+ mname);
		
		
		finalestring = fname.concat(" "+ mname);
		
		String topicname = request.getParameter("topicname");
		String ctype = request.getParameter("ctype");
		String tdescription = request.getParameter("tdescription");
		String tagname = request.getParameter("tagname");
		
		query.setTopicname(topicname);
		query.setCtype(ctype);
		query.setTdescription(tdescription);
		query.setUsername(finalestring);
		query.setUserid(user.getId());
		query.setUserProfilepicStream(myInputStream);
		
		
		System.out.println("Topic Name ->"+topicname);
		System.out.println("Topic Category Type ->"+ctype);
		System.out.println("Topic Description ->"+tdescription);
		System.out.println("Tag ->"+tagname);
	
		int tagid=quorasessionservice.fetchTagid(tagname);
		 int tagid1;
		System.out.println("Existing  id is "+tagid);
		
		if(tagid==0)
		{
			 tagid1=quorasessionservice.insertTagDetails(tagname);
			System.out.println("new taginserted successfully");
			System.out.println("New tagid is "+tagid1);
			query.setTagid(tagid1);
			quorasessionservice.savequestiondetails(query);
		}
		else
		{
			query.setTagid(tagid);
			quorasessionservice.savequestiondetails(query);
		}
	
		response.sendRedirect("QuestionDetails.jsp");
	}
}
