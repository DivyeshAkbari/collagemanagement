package utils;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.service.impl.AdminPanelServiceImpl;
import com.collagemanagement.service1.AdminPanel;

/**
 * Servlet implementation class RemoveNotice
 */
public class RemoveNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AdminPanel adminpanelService = new AdminPanelServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public RemoveNotice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String noticeid = request.getParameter("noticeId");
		
		System.out.println("Notice Id >"+noticeid);
		
		String removenoticemessage = adminpanelService.removenotice(noticeid);
		
		response.sendRedirect("Studentsidenotice.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
