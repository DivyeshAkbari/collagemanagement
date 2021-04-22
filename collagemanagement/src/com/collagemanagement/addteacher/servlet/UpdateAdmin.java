package com.collagemanagement.addteacher.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.collagemanagement.bean.User;
import com.collagemanagement.encryptpassword.TrippleDes;
import com.collagemanagement.service.impl.Collageserviceimpl;

/**
 * Servlet implementation class UpdateAdmin
 */
public class UpdateAdmin extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Collageserviceimpl collage =new Collageserviceimpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateAdmin() {
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
		//doGet(request, response);
		HttpSession httpsession = request.getSession(false);
		
		User u1 = new User();
		String id=request.getParameter("userID");
		String fname=request.getParameter("firstname");
		String mname=request.getParameter("middlename");
		String lname=request.getParameter("lastname");
		String password=request.getParameter("password");
		String number=request.getParameter("number");
		String address=request.getParameter("address");
		Part part=request.getPart("profile_photo");
		
		if(null!=part && part.getSize()>0) {
			System.out.println("File Name" + part.getName());
			System.out.println("File Name 2" + part.getSubmittedFileName());
			System.out.println("File Size :: " + part.getSize());
			u1.setUserProfilepicStream( part.getInputStream());
		}
		
		TrippleDes td=null;
		try {
			 td=new TrippleDes();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		String encryptedpassword=td.encrypt(password);
		u1.setId(Integer.parseInt(id));
		u1.setFirstname(fname);
		u1.setMiddlename(mname);
		u1.setLastname(lname);
		u1.setPassword(encryptedpassword);
		u1.setContactno(number);
		u1.setAddress(address);
		
		String message = collage.editAdmin(u1);
		System.out.println(message);
		httpsession.setAttribute("ans", message);
		RequestDispatcher dispatcher = request.getRequestDispatcher("edit-admin.jsp");
		dispatcher.forward(request, response);
	}

}
