package com.collagemanagement.addteacher.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.collagemanagement.bean.Semester;
import com.collagemanagement.bean.Stream;
import com.collagemanagement.bean.Subject;
import com.collagemanagement.bean.User;
import com.collagemanagement.encryptpassword.TrippleDes;
import com.collagemanagement.service.impl.TeacherServiceimpl;
import com.collagemanagement.service1.TeacherService;

/**
 * Servlet implementation class UpdateTeacher
 */
public class UpdateTeacher extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
	TeacherService ts = new TeacherServiceimpl();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdateTeacher() {
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
		
		User u1 = (User) httpsession.getAttribute("uname");

		String userRole = u1.getRole();
			
			if(userRole.equalsIgnoreCase("ADMIN")) {
			
			// Storing streamList of faculty
			System.out.println("Stream.....");
			String streamArray = request.getParameter("streamInputArray");
			System.out.println(streamArray);
			String[] streamArray1 = streamArray.split(",");
			List<Stream> streamList = new ArrayList<>();
			for(String a : streamArray1) {
				Stream s = new Stream();
				s.setStreamid(Integer.parseInt(a));
				streamList.add(s);
				//System.out.println(a);
			}
			// Storing Semester
			System.out.println("Semester.....");
			String semesterArray = request.getParameter("semesterInputArray");
			System.out.println(semesterArray);
			String[] semesterArray1 = semesterArray.split(",");
			List<Semester> semesterList = new ArrayList<>();
			for(String a : semesterArray1) {
				Semester s1 = new Semester();
				s1.setSemid(Integer.parseInt(a));
				semesterList.add(s1);
			}
			//subject
			System.out.println("Subject.....");
			String subjectArray = request.getParameter("subjectInputArray");
			System.out.println(subjectArray);
			String[] subjectArray1 = subjectArray.split(",");
			List<Subject> subjectList = new ArrayList<>();
			for(String a : subjectArray1) {
				Subject s2 = new Subject();
				s2.setSubjectId(Integer.parseInt(a));
				subjectList.add(s2);
			}
			u1.setStreamList(streamList);
			u1.setSemesterList(semesterList);
			u1.setSubjectList(subjectList);
			
			String id = request.getParameter("userID");
			String fname=request.getParameter("firstname");
			String mname=request.getParameter("middlename");
			String lname=request.getParameter("lastname");
		
			String xender=request.getParameter("gender");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String number=request.getParameter("number");
			String address=request.getParameter("address");
			Part part=request.getPart("profile_photo");
			String qualification=request.getParameter("qualification");
		
		
	
		if(null!=part) {
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
		
		System.out.println("User id; "+id);
		//System.out.println("Registered User is "+role);
		System.out.println("First Name is "+fname);
		System.out.println("Middle Name is "+mname);
		System.out.println("Last Name is "+lname);
		//System.out.println("stream is "+stream);
	//	System.out.println("Gender "+xender);
		System.out.println("email is "+email);
		System.out.println("encryptedpassword is "+encryptedpassword);
		String de=td.decrypt(encryptedpassword);
		System.out.println("Depassword is "+de);
		System.out.println("Number is "+number);
		System.out.println("address is "+address);
		System.out.println("qualification is"+qualification);
		
		u1.setId(Integer.parseInt(id));
		u1.setFirstname(fname);
		u1.setMiddlename(mname);
		u1.setLastname(lname);
		
		u1.setXender(xender);
		u1.setEmail(email);
		u1.setPassword(encryptedpassword);
		u1.setContactno(number);
		u1.setAddress(address);
		//u1.setRole(role);
		u1.setQualification(qualification);
		
		String message = ts.modifyTeacherDetails(u1);
		System.out.println(message);
			
		}else if(userRole.equalsIgnoreCase("FACULTY")) {
			
			//String id = request.getParameter("userID");
			String fname=request.getParameter("firstname");
			String mname=request.getParameter("middlename");
			String lname=request.getParameter("lastname");
		
			String xender=request.getParameter("gender");
			String email=request.getParameter("email");
			String password=request.getParameter("password");
			String number=request.getParameter("number");
			String address=request.getParameter("address");
			Part part=request.getPart("profile_photo");
			String qualification=request.getParameter("qualification");
		
		
	
		if(null!=part) {
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
		
		System.out.println("User id; "+u1.getId());
		//System.out.println("Registered User is "+role);
		System.out.println("First Name is "+fname);
		System.out.println("Middle Name is "+mname);
		System.out.println("Last Name is "+lname);
		//System.out.println("stream is "+stream);
	//	System.out.println("Gender "+xender);
		System.out.println("email is "+email);
		System.out.println("encryptedpassword is "+encryptedpassword);
		String de=td.decrypt(encryptedpassword);
		System.out.println("Depassword is "+de);
		System.out.println("Number is "+number);
		System.out.println("address is "+address);
		System.out.println("qualification is"+qualification);
		
		u1.setId(u1.getId());
		u1.setFirstname(fname);
		u1.setMiddlename(mname);
		u1.setLastname(lname);
		
		u1.setXender(xender);
		u1.setEmail(email);
		u1.setPassword(encryptedpassword);
		u1.setContactno(number);
		u1.setAddress(address);
		//u1.setRole(role);
		u1.setQualification(qualification);
		
		String message = ts.modifyTeacherDetails(u1);
		System.out.println(message);
		}
		
		
	}

}
