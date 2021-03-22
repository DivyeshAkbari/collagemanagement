package utils;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collagemanagement.bean.FeesDetails;
import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.FeesPaymentServiceImpl;
import com.collagemanagement.service1.FeesPaymentService;

/**
 * Servlet implementation class InsertFeesDetails
 */
public class InsertFeesDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	FeesPaymentService feespaymentservice=new FeesPaymentServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertFeesDetails() {
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
		
		
		HttpSession h1=request.getSession(false);
		User u1=(User) h1.getAttribute("uname");
		
		int id=u1.getId();
		String remark=request.getParameter("remarkid");
		String orderid=request.getParameter("orderid");
		String amout=request.getParameter("amout");
		
		FeesDetails fees=new FeesDetails();
		fees.setUser_id(id);
		fees.setRemark(remark);
		fees.setOrderid(orderid);
		fees.setAmount(amout);
		System.out.println("Remark is "+remark);
		System.out.println("Orderid is "+orderid);
		System.out.println("Amout is "+amout);
		
		
		String message=feespaymentservice.insertFeeDetails(fees);
		System.out.println(message);
		
	}

}
