package com.collagemanagement.addteacher.servlet;

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collagemanagement.bean.Assignment;
import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.TeacherServiceimpl;
import com.collagemanagement.service1.TeacherService;

/**
 * Servlet implementation class FetchSubmittedAssInfo
 */
public class FetchSubmittedAssInfo extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	TeacherService ts = new TeacherServiceimpl();
	//Collageserviceimpl collage =new Collageserviceimpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FetchSubmittedAssInfo() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		HttpSession httpsession = request.getSession(false);
		User u1 = (User) httpsession.getAttribute("uname");
		int userId = u1.getId();
		String subId = request.getParameter("id");
		System.out.println("sub id"+subId);
		
		int semId = ts.fetchSemId(subId);
		System.out.println("sem id1: "+semId);
		
		List<Assignment> facultyAsslist = ts.fetchFacultyAss(subId,userId);
		System.out.println("faculty ass list: "+facultyAsslist);
		List<Integer> facultyAsslistId = facultyAsslist.stream().map(Assignment::getAssId).collect(Collectors.toList());
		System.out.println("facultyAsslistId list: "+facultyAsslistId);
		List<Assignment> userSubmittedAssList = ts.fetchUserAss(subId,userId);
		System.out.println("user submitted ass list: "+userSubmittedAssList);
		List<Integer> assSubmittedUserId = userSubmittedAssList.stream().map(Assignment::getUsesrId).collect(Collectors.toList());
		System.out.println("id list: "+assSubmittedUserId);
		
		List<User> allStudentList = ts.getStudentDetails(semId);
		System.out.println("all students: "+allStudentList);
////		
//		request.setAttribute("facultyAsslist1", facultyAsslist);
//		request.setAttribute("userSubmittedAssList1", userSubmittedAssList);
//		request.setAttribute("assSubmittedUserId1", assSubmittedUserId);
		//request.setAttribute("allStudentList1", allStudentList);
		RequestDispatcher dispatcher = request.getRequestDispatcher("teacher-assignment-info.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//doGet(request, response);
		
	}

}
