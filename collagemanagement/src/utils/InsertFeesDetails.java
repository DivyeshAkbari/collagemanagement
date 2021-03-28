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
		
		FeesDetails fees=new FeesDetails();
		
		HttpSession h1=request.getSession(false);
		User u1=(User) h1.getAttribute("uname");
		
		String finalestring ;
		String fname = u1.getFirstname();
		String mname = u1.getMiddlename();
			
		System.out.println("Firstname ->"+fname);
		System.out.println("SurName ->"+ mname);
		
		finalestring = fname.concat(" "+ mname);
		
		int id=u1.getId();
		String remark=request.getParameter("remarkid");
		String orderid=request.getParameter("orderid");
		String amout=request.getParameter("amout");
		String phone=request.getParameter("contactnoid");
		String email=request.getParameter("emailid");
		String stream=request.getParameter("streamid");
	
		fees.setUser_id(id);
		fees.setRemark(remark);
		fees.setOrderid(orderid);
		fees.setAmount(amout);
		fees.setContactno(phone);
		fees.setEmail(email);
		fees.setUsername(finalestring);
		fees.setStream(stream);
		
		System.out.println("Remark is "+remark);
		System.out.println("Orderid is "+orderid);
		System.out.println("Amout is "+amout);
		System.out.println("Phone Number is "+phone);
		System.out.println("Email is "+email);
		System.out.println("Username is "+finalestring);
		System.out.println("Stream is "+stream);
			
		String message=feespaymentservice.insertFeeDetails(fees);
		System.out.println(message);
		
	}
}