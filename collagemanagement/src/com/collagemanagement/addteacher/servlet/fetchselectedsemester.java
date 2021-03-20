package com.collagemanagement.addteacher.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.collagemanagement.bean.Semester;
import com.collagemanagement.bean.Semester1;
import com.collagemanagement.bean.User;
import com.collagemanagement.service.impl.TeacherServiceimpl;
import com.collagemanagement.service1.TeacherService;
import com.google.gson.Gson;

/**
 * Servlet implementation class fetchselectedsemester
 */
public class fetchselectedsemester extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	TeacherService ts = new TeacherServiceimpl();
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public fetchselectedsemester() {
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
		
		int userId=u1.getId();
		
		int streamId = Integer.parseInt(request.getParameter("name"));
		
		System.out.println("User id is: "+userId+" and stream id is: "+streamId);
		
		List<Integer> selectedsemlist = ts.fetchSelectedSemester(streamId,userId);
		String streamId1 = Integer.toString(streamId);
		List<Semester1> allsemlist = ts.fetchSemester(streamId1);
		
		
		//String json1 = new Gson().toJson(selectedsemlist);
		String json2 = new Gson().toJson(allsemlist);
		System.out.println("All semList: "+allsemlist);
		
		System.out.println("json of all semester: "+json2);
		int cnt=0;
		int r[] = new int[selectedsemlist.size()];
		for(int i=0; i< allsemlist.size(); i++) {
			Semester1 s= allsemlist.get(i);
			if(selectedsemlist.contains(s.getSemId())) {
				r[cnt] = s.getSemId();
				cnt++;
			}
		}
		String json1 = new Gson().toJson(r);
		System.out.println("Array: "+Arrays.toString(r));
		System.out.println("json of selected semester: "+json1);
		String bothJson = "["+json1+","+json2+"]"; // both objects in an array of 2 elements
		response.getWriter().write(bothJson);
		
		//response.getWriter().append(json1);
	}

}
