package utils;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collagemanagement.bean.Event;
import com.collagemanagement.service.impl.AdminPanelServiceImpl;
import com.collagemanagement.service1.AdminPanel;

/**
 * Servlet implementation class Fetcheventforuploadimage
 */
public class Fetcheventforuploadimage extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	AdminPanel adminpanelService = new AdminPanelServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Fetcheventforuploadimage() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		List<Event> eventlist=adminpanelService.fetchEvent(2);
		
		System.out.println("admin servlet");
		
		request.setAttribute("eventlist", eventlist);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
