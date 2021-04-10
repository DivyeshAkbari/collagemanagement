package utils;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.Notice;
import com.collagemanagement.service.impl.AdminPanelServiceImpl;
import com.collagemanagement.service1.AdminPanel;

/**
 * Servlet implementation class InsertNotice
 */
public class InsertNotice extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	AdminPanel adminpanelService = new AdminPanelServiceImpl();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNotice() {
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
		
		Notice notice = new Notice();
		
		String noticetitle = request.getParameter("title");
		String noticedetails = request.getParameter("detail");
		
		notice.setNoticetitle(noticedetails);
		notice.setNoticedetails(noticetitle);
		
		String message = adminpanelService.insertNotice(notice);
		
		System.out.println("Message"+message);
		
		response.sendRedirect("notice-board.jsp");
		
	}
}