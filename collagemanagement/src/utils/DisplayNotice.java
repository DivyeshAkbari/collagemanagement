package utils;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.Notice;
import com.collagemanagement.service.impl.AdminPanelServiceImpl;
import com.collagemanagement.service1.AdminPanel;

/**
 * Servlet implementation class DisplayNotice
 */
public class DisplayNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AdminPanel adminpanelService = new AdminPanelServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DisplayNotice() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	System.out.println("Servlet Called");
	
	List<Notice> noticelist = adminpanelService.selectNotice();
	
	request.setAttribute("noticelist",noticelist);
	
	RequestDispatcher dispature = request.getRequestDispatcher("Studentsidenotice.jsp");
	dispature.forward(request, response);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
