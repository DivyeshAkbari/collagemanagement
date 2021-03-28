package utils;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.FeesDetails;
import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.FeesPaymentServiceImpl;
import com.collagemanagement.service1.FeesPaymentService;

/**
 * Servlet implementation class SelectPaymentInvoiceDetails
 */
public class SelectPaymentInvoiceDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	FeesPaymentService feespaymentservice=new FeesPaymentServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SelectPaymentInvoiceDetails() {
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
		
		User user = (User)request.getSession(false).getAttribute("uname");
		
		int id = user.getId();
		
		FeesDetails fees = feespaymentservice.fetchinvoiceDetails(id);
		
		request.getSession(false).setAttribute("fees",fees);
		
		System.out.println("Fee Invoice Value(OBJECT) "+fees);
		
		RequestDispatcher dispatcher = request.getRequestDispatcher("PaymentInvoice.jsp");
		dispatcher.forward(request, response);
	}
}