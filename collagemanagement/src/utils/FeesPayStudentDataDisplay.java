package utils;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.FeesPaymentServiceImpl;
import com.collagemanagement.service1.FeesPaymentService;

/**
 * Servlet implementation class FeesPayStudentDataDisplay
 */
public class FeesPayStudentDataDisplay extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	FeesPaymentService feespaymentservice=new FeesPaymentServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public FeesPayStudentDataDisplay() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		List<User> user=feespaymentservice.getFeesPaymentstudentdetails();
		request.setAttribute("user",user);
		
		System.out.println("User List "+user);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("FeesPayStudentDataDisplay.jsp");
		dispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
