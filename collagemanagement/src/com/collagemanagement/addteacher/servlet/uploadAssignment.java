package com.collagemanagement.addteacher.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.collagemanagement.bean.Assignment;
import com.collagemanagement.bean.User;
import com.collagemanagement.emailverification.SendEmail;
import com.collagemanagement.service.impl.TeacherServiceimpl;
import com.collagemanagement.service1.TeacherService;

/**
 * Servlet implementation class uploadAssignment
 */
public class uploadAssignment extends HttpServlet {
	private static final long serialVersionUID = 1L;

	TeacherService ts = new TeacherServiceimpl();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public uploadAssignment() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		///doGet(request, response);
		HttpSession httpsession = request.getSession(false);
		
		User u1 = (User) httpsession.getAttribute("uname");
		
		int userId=u1.getId();
		String facultyName = u1.getFirstname()+ " "+u1.getMiddlename();
		
		
		String streamId = request.getParameter("streamId");
		String subjectId = request.getParameter("subjectId");
		String subjectName = request.getParameter("subjectName11");
		
		String title = request.getParameter("titleOfAss");
		String date = request.getParameter("date");
		String discription = request.getParameter("description");
		
		Assignment ass = new Assignment();
		ass.setStreamId(Integer.parseInt(streamId));
		ass.setSubjectId(Integer.parseInt(subjectId));
		ass.setTitle(title);
		ass.setDate(date);
		ass.setDiscription(discription);
		ass.setUsesrId(userId);
	
		
		Part part = (Part) request.getPart("assignment");
		
		if(null!=part)
		{
			
				System.out.println("File Name" + part.getSubmittedFileName()); 
				System.out.println(part.getName());
			
			
			
				System.out.println("File Size :: " + part.getSize());
			
		
			
				ass.setAssPDF(part.getInputStream());
			
		}
		
		System.out.println(streamId+" "+subjectName+" "+subjectId+" "+title+" "+date+" "+discription+" "+userId);
		
//		int semid = ts.fetchSemId(subjectId);
//		List<User> userlist = ts.getStudentDetails(semid);
//		System.out.println("user lis of sem id "+semid+" is : "+userlist);
		String message = ts.insertAssDetail(ass);
		System.out.println(message);
//		https://www.tutorialspoint.com/java/java_sending_email.htm
		if(message.equals("true")) {
			int semid = ts.fetchSemId(subjectId);
			List<User> userlist = ts.getStudentDetails(semid);
			for(int j=0; j<userlist.size(); j++) {
				String studentMail = userlist.get(j).getEmail();
				String studentName = userlist.get(j).getFirstname() + " "+ userlist.get(j).getMiddlename();
				String code = "<div>"
						+ "<img height=\"63px\" width=\"63px\" src=\"assets/images/Educhamp_logo12.png\" alt=\"logo\">"
						+ "<img height=\"127px\" width=\"127px\" src=\"assets/images/Black.png\" alt=\"logo\">"
						+ "<h3> EduChamp</h3></div>"
						+ "<div>"
						+ "<h3>HI, "
						+ studentName
						+ "</h3>"
						+ "<h3 style=\"font-size: 15px\">"
						+ facultyName 
						+ " have uploaded new assignment of subject "
						+ subjectName
						+ "</h3>"
						+ "Due :"
						+ date 
						+ title
						+ "</div>";
				SendEmail se = new SendEmail(studentMail, code, "Assignment Update");
				Thread t1=new Thread(se);
				t1.start();
			}
		}
		//String message="true";
		httpsession.setAttribute("message", message);
		RequestDispatcher dispatcher  = request.getRequestDispatcher("teacher-upload-assignment.jsp");
		dispatcher.forward(request, response);
	}

}
