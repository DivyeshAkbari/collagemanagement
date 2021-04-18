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
import com.collagemanagement.bean.Image;
import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.TeacherServiceimpl;
import com.collagemanagement.service1.TeacherService;

/**
 * Servlet implementation class FetchSubmittedAssInfo1
 */
public class FetchSubmittedAssInfo1 extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	TeacherService ts = new TeacherServiceimpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FetchSubmittedAssInfo1() {
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
		//doGet(request, response);
		String assId1=request.getParameter("assId");
		int assId = Integer.parseInt(assId1);
		String subId = request.getParameter("subid");
		//int subId = Integer.parseInt(subId1);
		
		HttpSession httpsession = request.getSession(false);
		User u1 = (User) httpsession.getAttribute("uname");
		int userId = u1.getId();
		
		int semId = ts.fetchSemId(subId);
		System.out.println("sem id1: "+semId);
		
		List<Assignment> facultyAsslist = ts.fetchFacultyAss(subId,userId);
		System.out.println("faculty ass list: "+facultyAsslist);
		List<Integer> facultyAsslistId = facultyAsslist.stream().map(Assignment::getAssId).collect(Collectors.toList());
		System.out.println("facultyAsslistId list: "+facultyAsslistId);
		
		List<Assignment> userSubmittedAssList = ts.fetchUserAss(subId, userId, assId);
		System.out.println("user submitted ass list: "+userSubmittedAssList);
		List<Integer> assSubmittedUserId = userSubmittedAssList.stream().map(Assignment::getUsesrId).collect(Collectors.toList());
		System.out.println("id list: "+assSubmittedUserId);
		
		List<User> allStudentList = ts.getStudentDetails(semId);
		
		List<Image> profilepiclist = ts.getStudentProfilePic(semId);
		System.out.println("images: "+profilepiclist);
		System.out.println("all students: "+allStudentList);
//		List<Integer> allStudentId = allStudentList.stream().map(User::getId).collect(Collectors.toList());
		
		
		request.setAttribute("facultyAsslist1", facultyAsslist);
		request.setAttribute("facultyAsslistId1", facultyAsslistId);
		request.setAttribute("userSubmittedAssList1", userSubmittedAssList);
		request.setAttribute("assSubmittedUserId1", assSubmittedUserId);
		request.setAttribute("allStudentList1", allStudentList);
		request.setAttribute("profilepiclist1", profilepiclist);
		request.setAttribute("assid", assId1);
		RequestDispatcher dispatcher = request.getRequestDispatcher("teacher-assignment-info.jsp");
		dispatcher.forward(request, response);
	}

}
