package com.collagemanagement.addteacher.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collagemanagement.bean.Semester;
import com.collagemanagement.bean.Stream;
import com.collagemanagement.bean.Subject;
import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.TeacherServiceimpl;
import com.collagemanagement.service1.TeacherService;

/**
 * Servlet implementation class EditFacultyDetail
 */
public class EditFacultyDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	TeacherService ts = new TeacherServiceimpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditFacultyDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		
		int userId = Integer.parseInt(request.getParameter("id"));
		
			HttpSession httpsession = request.getSession(false);
			
			User u1 = (User) httpsession.getAttribute("uname");
			
			String userRole = u1.getRole();		
		
		
//		List<Semester> semesterlist = ts.fetchAllSemester();
//		List<Stream> streamlist = ts.fetchAllStream();
		List<Subject> subjectlist = ts.fetchAllSubject();
//		request.setAttribute("semesterList", semesterlist);
//		request.setAttribute("streamList", streamlist);
		
		
		User user = ts.fetchUserDetail(userId);
		user.setId(userId);
		httpsession.setAttribute("faculty", user);//faculty
		httpsession.setAttribute("subjectList", subjectlist);
//		request.setAttribute("faculty", user);
//		request.setAttribute("subjectList", subjectlist);
		
		if(userRole.equalsIgnoreCase("ADMIN")) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("editfaculty.jsp");
			requestDispatcher.forward(request, response);
		}
		else if(userRole.equalsIgnoreCase("FACULTY")) {
			RequestDispatcher requestDispatcher = request.getRequestDispatcher("editfacultyside.jsp");
			requestDispatcher.forward(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
