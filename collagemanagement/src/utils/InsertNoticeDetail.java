package utils;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.collagemanagement.bean.Notice;
import com.collagemanagement.service.impl.AdminPanelServiceImpl;
import com.collagemanagement.service1.AdminPanel;

/**
 * Servlet implementation class InsertNoticeDetail
 */
public class InsertNoticeDetail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	AdminPanel adminpanelService = new AdminPanelServiceImpl();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InsertNoticeDetail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		
		List<Notice> noticelist = adminpanelService.selectNotice();
		
		request.setAttribute("noticelist",noticelist);
		
		RequestDispatcher requestDispatcher = request.getRequestDispatcher("notice-board.jsp");
		requestDispatcher.forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		

		System.out.println("Servlet Called..");
		
		Notice notice = new Notice();
		
		String noticetitle = request.getParameter("title");
		String noticedetails = request.getParameter("detail");
		
		System.out.println("Notice Title "+noticetitle);
		System.out.println("NoticeDetails "+noticedetails);
	
		notice.setNoticetitle(noticetitle);
		notice.setNoticedetails(noticedetails);

		adminpanelService.insertNotice(notice);
	
	}

}