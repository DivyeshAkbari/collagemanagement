package com.collagemanagement.Result.Servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collagemanagement.bean.Marks;
import com.collagemanagement.bean.Result;
import com.collagemanagement.bean.Subject;
import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.ResultSectionServiceImpl;
import com.collagemanagement.service1.ResultSectionService;

/**
 * Servlet implementation class GetResultinformation
 */
public class GetResultinformation extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	ResultSectionService Service=new ResultSectionServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetResultinformation() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("do get");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession httpSession = request.getSession(false);
		User user=(User)httpSession.getAttribute("uname");
		 
		String streamid=user.getStream();
		String Semid=request.getParameter("semester");
		int id=user.getId();
		//u1.setEmail(email);
		
		System.out.println("Stream id is "+streamid);
		System.out.println("Sem id is "+Semid);
	    System.out.println("Id is "+id);
	    
	    
//		//User user=new User();
//		user= Service.fetchEmailid(u1);
		
		if(user!=null)
		{
			System.out.println("Hass if ma to aave 6");
			
			System.out.println("id is "+user.getId());
			
			Result r1=new Result();
			r1=Service.fetchStatusDetails(id,Semid);
			
			String Status =r1.getStatus();
			
			System.out.println("Status is "+Status);
			
			List<Subject> subjectlist=Service.fetachSubjectDetails(streamid,Semid,2);
			System.out.println("Subject list is "+subjectlist.size());
			List<Marks> markslist=Service.fatchMarksDetails(id,Semid);
			
			if(subjectlist.size()>0 && markslist.size()>0)
			{
				System.out.println("barobar thay 6 ");
				request.setAttribute("Subjectlist", subjectlist);
				System.out.println(subjectlist);
			
				System.out.println("Marks list is "+markslist);
				request.setAttribute("Markslist", markslist);
				request.setAttribute("Status", Status);
				RequestDispatcher dispatcher = request.getRequestDispatcher("NewFile.jsp");
				dispatcher.forward(request, response);
			}
			else
			{
				request.setAttribute("message","please enter correct value");
				request.getRequestDispatcher("student-result.jsp").forward(request, response);
			}
		}
	}
}
