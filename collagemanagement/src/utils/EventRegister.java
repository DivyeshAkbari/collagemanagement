package utils;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.Event;
import com.collagemanagement.service.impl.AdminPanelServiceImpl;
import com.collagemanagement.service1.AdminPanel;

/**
 * Servlet implementation class EventRegister
 */
public class EventRegister extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AdminPanel adminpanelService = new AdminPanelServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EventRegister() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		System.out.println("EventRegister Servlet Called..");
		
		Event event = new Event();
		
		String eventname = request.getParameter("eventtitle");
		String eventDetails = request.getParameter("eventDetails");
		
		System.out.println("Event Name >"+eventname);
		System.out.println("Event Description >"+eventDetails);
		
		event.setEventname(eventname);
		event.setEventDescription(eventDetails);
				
		adminpanelService.insertEvent(event);
		
		
		//Yeh,It's been exited to held the Education Autumn tour in 2021 in The Campus of Gujarat University.
	}

}
