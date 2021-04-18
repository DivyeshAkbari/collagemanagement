package utils;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.service.impl.AdminPanelServiceImpl;
import com.collagemanagement.service1.AdminPanel;

/**
 * Servlet implementation class ExpireEvent
 */
public class ExpireEvent extends HttpServlet {
	private static final long serialVersionUID = 1L;
      
	AdminPanel adminpanelService = new AdminPanelServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ExpireEvent() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String id=request.getParameter("id");
		
		String message=adminpanelService.expireEvent(id);
		System.out.println(message);
		
		System.out.println("Expire Event Servlet");
		request.setAttribute("message", "Event DisActivated");
		request.getRequestDispatcher("all-event.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
